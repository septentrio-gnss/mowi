/* mowi_wifi_basic (WiFi to Ethernet packet forwarding)

   This example code is licensed under CC BY-SA 4.0 and OSHW Definition 1.0.

   For mor information about MOWI visit https://github.com/septentrio-gnss/mowi/.

   This software is based on following ESP-IDF / ESP-IOT-SOLUTION examples:
   https://github.com/espressif/esp-idf/tree/master/examples/ethernet/eth2ap
   https://github.com/espressif/esp-iot-solution/tree/release/v1.1/examples/eth2wifi

   This software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/

#include <stdio.h>
#include <string.h>

#include <sdkconfig.h>
#include <freertos/FreeRTOS.h>
#include <freertos/task.h>
#include <freertos/event_groups.h>

#include <esp_log.h>
#include <esp_wifi.h>
#include <esp_eth.h>
#include <esp_event.h>
#include <nvs_flash.h>

#include <esp_private/wifi.h>
#include <driver/gpio.h>
#include <driver/uart.h>


static const char *TAG = "mowi_wifi_basic";

static esp_eth_handle_t eth_handle = NULL;
static xQueueHandle flow_control_queue = NULL;

static uint8_t eth_mac[6];
static bool eth_mac_is_set = false;
static bool wifi_is_connected = false;

typedef struct {
    void *packet;
    uint16_t length;
} flow_control_msg_t;


/* PACKETS / DATA FORWARDING */

static esp_err_t pkt_wifi2eth(void *buffer, uint16_t len, void *eb)
{
    if (esp_eth_transmit(eth_handle, buffer, len) != ESP_OK) {
        ESP_LOGE(TAG, "Ethernet send packet failed");
    }

    esp_wifi_internal_free_rx_buffer(eb);
    return ESP_OK;
}

static esp_err_t pkt_eth2wifi(esp_eth_handle_t eth_handle, uint8_t *buffer, uint32_t len, void *priv)
{
    esp_err_t ret = ESP_OK;
    flow_control_msg_t msg = {
        .packet = buffer,
        .length = len
    };
    if (xQueueSend(flow_control_queue, &msg, pdMS_TO_TICKS(CONFIG_MOWI_FLOW_CONTROL_QUEUE_TIMEOUT_MS)) != pdTRUE) {
        ESP_LOGE(TAG, "Send flow control message failed or timeout");
        free(buffer);
        ret = ESP_FAIL;
    }
    return ret;
}

static void eth2wifi_flow_control_task(void *args)
{
    flow_control_msg_t msg;
    int res = 0;
    uint32_t timeout = 0;
    while (true) {
        if (xQueueReceive(flow_control_queue, &msg, pdMS_TO_TICKS(CONFIG_MOWI_FLOW_CONTROL_QUEUE_TIMEOUT_MS)) == pdTRUE) {
            timeout = 0;
            if (msg.length) {
                do {
                    if(!eth_mac_is_set) {
                        memcpy(eth_mac, (uint8_t*)msg.packet + 6, sizeof(eth_mac));
                        eth_mac_is_set = true;
                    }

                    vTaskDelay(pdMS_TO_TICKS(timeout));
                    timeout += 2;
                    if(wifi_is_connected) {
                        res = esp_wifi_internal_tx(ESP_IF_WIFI_STA, msg.packet, msg.length);
                    }
                } while (res && timeout < CONFIG_MOWI_FLOW_CONTROL_WIFI_SEND_TIMEOUT_MS);
                if (res != ESP_OK) {
                    ESP_LOGE(TAG, "WiFi send packet failed: %d", res);
                }
            }
            free(msg.packet);
        }
    }
    vTaskDelete(NULL);
}


/* EVENT HANDLERS */

static void eth_event_handler(void *arg, esp_event_base_t event_base, int32_t event_id, void *event_data)
{
    switch (event_id) {
    case ETHERNET_EVENT_CONNECTED:
        ESP_LOGI(TAG, "Ethernet Link Up");
        esp_eth_ioctl(eth_handle, ETH_CMD_G_MAC_ADDR, eth_mac);
        break;

    case ETHERNET_EVENT_DISCONNECTED:
        ESP_LOGI(TAG, "Ethernet Link Down");
        eth_mac_is_set = false;
        break;

    case ETHERNET_EVENT_START:
        ESP_LOGI(TAG, "Ethernet Started");
        break;

    case ETHERNET_EVENT_STOP:
        ESP_LOGI(TAG, "Ethernet Stopped");
        break;

    default:
        break;
    }
}

static void wifi_event_handler(void* arg, esp_event_base_t event_base, int32_t event_id, void* event_data)
{ 
    if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_START) {
        esp_wifi_connect();
    }

    else if (event_base == IP_EVENT && event_id == IP_EVENT_STA_GOT_IP) {
        ip_event_got_ip_t* event = (ip_event_got_ip_t*) event_data;
        ESP_LOGI(TAG, "WiFi connected with IP Address:" IPSTR, IP2STR(&event->ip_info.ip));
        wifi_is_connected = true;
        gpio_set_level(12, true);

        // Start forwarding WiFi and Ethernet data
        esp_wifi_internal_reg_rxcb(ESP_IF_WIFI_STA, pkt_wifi2eth);
    }

    else if (event_base == WIFI_EVENT && event_id == WIFI_EVENT_STA_DISCONNECTED) {
        ESP_LOGI(TAG, "WiFi disconnected");
        wifi_is_connected = false;
        gpio_set_level(12, false);

        // Stop forwarding WiFi and Ethernet data
        esp_wifi_internal_reg_rxcb(ESP_IF_WIFI_STA, NULL);
        esp_wifi_connect();
    }
}


/* INITIALIZATION */

static void initialize_led(void)
{
    // Configure WiFi LED GPIO
    gpio_config_t io_conf;

    // Disable interrupt, set as output mode, disable pull modes
    io_conf.intr_type = GPIO_INTR_DISABLE;
    io_conf.mode = GPIO_MODE_OUTPUT;
    io_conf.pin_bit_mask = 1ULL<<12;
    io_conf.pull_down_en = false;
    io_conf.pull_up_en = false;
    gpio_config(&io_conf);

    // Turn WiFi LED off
    gpio_set_level(12, false);
}

static void initialize_uart(void)
{
    // Configure UART parameters
    uart_config_t uart_param = {
        .baud_rate = 115200,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
        .source_clk = UART_SCLK_APB,
    };

    // Install UART driver, set Tx FIFO to 0 to send data immediately
    ESP_ERROR_CHECK(uart_driver_install(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, CONFIG_MOWI_MOSAIC_UART_BUF_SIZE, 0, 0, NULL, 0));
    ESP_ERROR_CHECK(uart_param_config(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, &uart_param));
    ESP_ERROR_CHECK(uart_set_pin(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, 2, 4, UART_PIN_NO_CHANGE, UART_PIN_NO_CHANGE));

    // Redundant parameters setting - bug in ESP-IDF workaround 
    uart_set_baudrate(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, 115200);
    uart_set_word_length(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, UART_DATA_8_BITS);
    uart_set_parity(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, UART_PARITY_DISABLE); 
    uart_set_stop_bits(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, UART_STOP_BITS_1);
}

static void initialize_ethernet(void)
{
    ESP_ERROR_CHECK(esp_event_handler_register(ETH_EVENT, ESP_EVENT_ANY_ID, &eth_event_handler, NULL));
    eth_mac_config_t mac_config = ETH_MAC_DEFAULT_CONFIG();
    eth_phy_config_t phy_config = ETH_PHY_DEFAULT_CONFIG();
    phy_config.phy_addr = 1;
    phy_config.reset_gpio_num = 5;

    mac_config.smi_mdc_gpio_num = 23;
    mac_config.smi_mdio_gpio_num = 18;
    esp_eth_mac_t *mac = esp_eth_mac_new_esp32(&mac_config);
    esp_eth_phy_t *phy = esp_eth_phy_new_ksz8041(&phy_config);

    esp_eth_config_t config = ETH_DEFAULT_CONFIG(mac, phy);
    config.stack_input = pkt_eth2wifi;
    ESP_ERROR_CHECK(esp_eth_driver_install(&config, &eth_handle));

    bool eth_promiscuous = true;
    esp_eth_ioctl(eth_handle, ETH_CMD_S_PROMISCUOUS, &eth_promiscuous);

    ESP_LOGI(TAG, "Configuring Mosaic Ethernet DHCP");

    // Create a temporary buffer for the incoming data
    uint8_t *uart_buf = (uint8_t *) calloc(CONFIG_MOWI_MOSAIC_UART_BUF_SIZE, sizeof(uint8_t));
    int len = 0;

    // Disable Mosaic Ethernet - iterate to initialize connection
    ESP_ERROR_CHECK(uart_flush_input(CONFIG_MOWI_MOSAIC_UART_PORT_NUM));
    uart_write_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, (char*)"seth,off\n\r", 10);
    len = uart_read_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, uart_buf, 8, 500);
    if(len <= 0 || strncmp((char *)uart_buf, "$R: seth", 8) != 0) {
        ESP_LOGE(TAG, "Disable Mosaic Ethernet responce failed");
        esp_restart();
    }

    // Set Mosaic Ethernet DHCP with MTU
    ESP_ERROR_CHECK(uart_flush_input(CONFIG_MOWI_MOSAIC_UART_PORT_NUM));
    uart_write_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, (char*)"setIPSettings,DHCP,,,,,,,1500\n\r", 31);
    len = uart_read_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, uart_buf, 17, 500);
    if(len <= 0 || strncmp((char *)uart_buf, "$R: setIPSettings", 17) != 0) {
        ESP_LOGE(TAG, "Set Mosaic Ethernet DHCP responce failed");
        esp_restart();
    }

    // Start ESP ethernet
    esp_eth_start(eth_handle);

    // Enable Mosaic Ethernet
    ESP_ERROR_CHECK(uart_flush_input(CONFIG_MOWI_MOSAIC_UART_PORT_NUM));
    uart_write_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, (char*)"seth,on\n\r", 9);
    len = uart_read_bytes(CONFIG_MOWI_MOSAIC_UART_PORT_NUM, uart_buf, 8, 500);
    if(len <= 0 || strncmp((char *)uart_buf, "$R: seth", 8) != 0) {
        ESP_LOGE(TAG, "Enable Mosaic Ethernet responce failed");
        esp_restart();
    }

    // Ethernet configured, temporary buffer no longer needed
    ESP_LOGI(TAG, "Mosaic Ethernet DHCP configured");
    free(uart_buf);

    // Wait for Mosaic to report ist MAC address
    ESP_LOGI(TAG, "Waiting for Mosaic Ethernet MAC address");
    while(!eth_mac_is_set) {
        vTaskDelay(10);
    }
}

static void initialize_wifi(void)
{
    // Initialize TCP/IP
    ESP_ERROR_CHECK(esp_netif_init());

    // Register event handler for WiFi and IP events
    ESP_ERROR_CHECK(esp_event_handler_register(WIFI_EVENT, ESP_EVENT_ANY_ID, &wifi_event_handler, NULL));
    ESP_ERROR_CHECK(esp_event_handler_register(IP_EVENT, IP_EVENT_STA_GOT_IP, &wifi_event_handler, NULL));

    // Initialize WiFi including netif with default config
    esp_netif_create_default_wifi_sta();
    wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
    ESP_ERROR_CHECK(esp_wifi_init(&cfg));
    ESP_ERROR_CHECK(esp_wifi_set_mac(WIFI_IF_STA, eth_mac));

    // Create WiFi config
    wifi_config_t wifi_config = {
        .sta = {
            .ssid = CONFIG_MOWI_WIFI_SSID,
            .password = CONFIG_MOWI_WIFI_PSWD,
        },
    };

    // Set WiFi config and start WiFi station
    ESP_ERROR_CHECK(esp_wifi_set_config(ESP_IF_WIFI_STA, &wifi_config));
    ESP_ERROR_CHECK(esp_wifi_start());
}

static esp_err_t initialize_flow_control(void)
{
    flow_control_queue = xQueueCreate(CONFIG_MOWI_FLOW_CONTROL_QUEUE_LENGTH, sizeof(flow_control_msg_t));
    if (!flow_control_queue) {
        ESP_LOGE(TAG, "create flow control queue failed");
        return ESP_FAIL;
    }

    BaseType_t ret = xTaskCreate(eth2wifi_flow_control_task, "flow_ctl", 2048, NULL, (tskIDLE_PRIORITY + 2), NULL);
    if (ret != pdTRUE) {
        ESP_LOGE(TAG, "create flow control task failed");
        return ESP_FAIL;
    }

    return ESP_OK;
}


/* APPLICATION MAIN */

void app_main(void)
{
    // Initialize NVS partition
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK(nvs_flash_erase());
        ESP_ERROR_CHECK(nvs_flash_init());
    }

    // Initialize auxiliary peripherals
    initialize_led();
    initialize_uart();

    // Initialize event loop
    ESP_ERROR_CHECK(esp_event_loop_create_default());
    ESP_ERROR_CHECK(initialize_flow_control());

    // Initialize main peripherals
    initialize_ethernet();
    initialize_wifi();
}
