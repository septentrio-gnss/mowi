EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "mowi"
Date "2021-08-10"
Rev "v1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4000 1000 3800 1000
Wire Wire Line
	4000 2600 3850 2600
Text HLabel 3800 1000 0    50   Input ~ 0
VDD_3V3
Text HLabel 3850 2600 0    50   Input ~ 0
VDD_BAT
Wire Wire Line
	7950 1100 8150 1100
Text HLabel 8150 1100 2    50   Input ~ 0
REF_I
Wire Wire Line
	7950 1200 8150 1200
Wire Wire Line
	8150 1300 7950 1300
Wire Wire Line
	7950 1400 8150 1400
Wire Wire Line
	8050 1500 7950 1500
Wire Wire Line
	7950 1600 8050 1600
Wire Wire Line
	8150 1700 7950 1700
Wire Wire Line
	7950 1800 8150 1800
Wire Wire Line
	9950 1000 10150 1000
Wire Wire Line
	10150 1100 9950 1100
Wire Wire Line
	10150 1200 9950 1200
Wire Wire Line
	9950 1300 10150 1300
Wire Wire Line
	7950 2450 8150 2450
Wire Wire Line
	8150 2550 7950 2550
Wire Wire Line
	8150 2650 7950 2650
Wire Wire Line
	7950 2750 8150 2750
Wire Wire Line
	9950 2950 10150 2950
Wire Wire Line
	10150 3050 9950 3050
Wire Wire Line
	10150 3150 9950 3150
Wire Wire Line
	9950 3250 10150 3250
Wire Wire Line
	9950 3350 10150 3350
Wire Wire Line
	10150 3450 9950 3450
Wire Wire Line
	10150 3550 9950 3550
Wire Wire Line
	9950 3650 10150 3650
Wire Wire Line
	9950 3750 10150 3750
Wire Wire Line
	10150 3850 9950 3850
Wire Wire Line
	10150 3950 9950 3950
Wire Wire Line
	9950 4050 10150 4050
Wire Wire Line
	9950 4850 10150 4850
Wire Wire Line
	10150 4950 9950 4950
Wire Wire Line
	10150 5050 9950 5050
Wire Wire Line
	9950 5150 10150 5150
Wire Wire Line
	9950 5250 10150 5250
Wire Wire Line
	10150 5350 9950 5350
Wire Wire Line
	10150 5450 9950 5450
Wire Wire Line
	9950 5550 10150 5550
Wire Wire Line
	7900 5050 8100 5050
Wire Wire Line
	8100 5150 7900 5150
Wire Wire Line
	8100 5250 7900 5250
Wire Wire Line
	7900 5350 8100 5350
Wire Wire Line
	7950 3500 8150 3500
Wire Wire Line
	8150 3600 7950 3600
Wire Wire Line
	10150 5650 9950 5650
Wire Wire Line
	9950 5750 10150 5750
Wire Wire Line
	9950 5850 10150 5850
Wire Wire Line
	9950 4250 10150 4250
Wire Wire Line
	9950 4150 10150 4150
Wire Wire Line
	9950 1500 10150 1500
Wire Wire Line
	9950 1400 10150 1400
Wire Wire Line
	9950 2100 10150 2100
Wire Wire Line
	9950 2300 10150 2300
Wire Wire Line
	9950 2200 10150 2200
Wire Wire Line
	7950 2850 8150 2850
Wire Wire Line
	7950 3700 8150 3700
Wire Wire Line
	7950 4400 8150 4400
Wire Wire Line
	7950 4300 8150 4300
Text HLabel 8150 1200 2    50   Output ~ 0
REF_O
Text HLabel 8150 1300 2    50   Input ~ 0
2V8_IN
Text HLabel 8150 1400 2    50   Output ~ 0
2V8_OUT
Text HLabel 8150 1550 2    50   Input ~ 0
VANT
Wire Wire Line
	8150 1550 8050 1550
Wire Wire Line
	8050 1550 8050 1500
Wire Wire Line
	8050 1600 8050 1550
Connection ~ 8050 1550
Wire Wire Line
	6000 1000 6000 1100
Wire Wire Line
	4000 3000 4000 3100
$Comp
L Septentrio_Modules:mosaic U23
U 1 1 60FD3685
P 5000 4150
F 0 "U23" H 2000 3500 50  0000 C CNN
F 1 "mosaic X5/Sx/T/H" H 2000 3350 50  0000 C CNN
F 2 "Septentrio_Modules:Sep_mosaic_239LGA_31.0x31.0x4.17mm" H -8700 15350 50  0001 C CNN
F 3 "" H -8700 15350 50  0001 C CNN
	1    5000 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1700 4000 1800
Wire Wire Line
	6000 1100 6000 1200
Connection ~ 6000 1100
Connection ~ 6000 1200
Wire Wire Line
	6000 1200 6000 1300
Connection ~ 6000 1300
Wire Wire Line
	6000 1300 6000 1400
Connection ~ 6000 1400
Wire Wire Line
	6000 1400 6000 1500
Connection ~ 6000 1500
Wire Wire Line
	6000 1500 6000 1600
Connection ~ 6000 1600
Wire Wire Line
	6000 1600 6000 1700
Connection ~ 6000 1700
Wire Wire Line
	6000 1700 6000 1800
Connection ~ 6000 1800
Wire Wire Line
	6000 1800 6000 1900
Connection ~ 6000 1900
Wire Wire Line
	6000 1900 6000 2000
Connection ~ 6000 2000
Wire Wire Line
	6000 2000 6000 2100
Connection ~ 6000 2100
Wire Wire Line
	6000 2100 6000 2200
Connection ~ 6000 2200
Wire Wire Line
	6000 2200 6000 2300
Connection ~ 6000 2300
Wire Wire Line
	6000 2300 6000 2400
Connection ~ 6000 2400
Wire Wire Line
	6000 2400 6000 2500
Connection ~ 6000 2500
Wire Wire Line
	6000 2500 6000 2600
Connection ~ 6000 2600
Wire Wire Line
	6000 2600 6000 2700
Connection ~ 6000 2700
Wire Wire Line
	6000 2700 6000 2800
Connection ~ 6000 2800
Wire Wire Line
	6000 2800 6000 2900
Connection ~ 6000 2900
Wire Wire Line
	6000 2900 6000 3000
Connection ~ 6000 3000
Wire Wire Line
	6000 3000 6000 3100
Connection ~ 6000 3100
Wire Wire Line
	6000 3100 6000 3200
Connection ~ 6000 3200
Wire Wire Line
	6000 3200 6000 3300
Connection ~ 6000 3300
Wire Wire Line
	6000 3300 6000 3400
Connection ~ 6000 3400
Wire Wire Line
	6000 3400 6000 3500
Connection ~ 6000 3500
Wire Wire Line
	6000 3500 6000 3600
Connection ~ 6000 3600
Wire Wire Line
	6000 3600 6000 3700
Connection ~ 6000 3700
Wire Wire Line
	6000 3700 6000 3800
Connection ~ 6000 3800
Wire Wire Line
	6000 3800 6000 3900
Connection ~ 6000 3900
Wire Wire Line
	6000 3900 6000 4000
Connection ~ 6000 4000
Wire Wire Line
	6000 4000 6000 4100
Connection ~ 6000 4100
Wire Wire Line
	6000 4100 6000 4200
Connection ~ 6000 4200
Wire Wire Line
	6000 4200 6000 4300
Connection ~ 6000 4300
Wire Wire Line
	6000 4300 6000 4400
Connection ~ 6000 4400
Wire Wire Line
	6000 4400 6000 4500
Connection ~ 6000 4500
Wire Wire Line
	6000 4500 6000 4600
Connection ~ 6000 4600
Wire Wire Line
	6000 4600 6000 4700
Connection ~ 6000 4700
Wire Wire Line
	6000 4700 6000 4800
Connection ~ 6000 4800
Wire Wire Line
	6000 4800 6000 4900
Connection ~ 6000 4900
Wire Wire Line
	6000 4900 6000 5000
Connection ~ 6000 5000
Wire Wire Line
	6000 5000 6000 5100
Connection ~ 6000 5100
Wire Wire Line
	6000 5100 6000 5200
Connection ~ 6000 5200
Wire Wire Line
	6000 5200 6000 5300
Connection ~ 6000 5300
Wire Wire Line
	6000 5300 6000 5400
Connection ~ 6000 5400
Wire Wire Line
	6000 5400 6000 5500
Connection ~ 6000 5500
Wire Wire Line
	6000 5500 6000 5600
Connection ~ 6000 5600
Wire Wire Line
	6000 5600 6000 5700
Connection ~ 6000 5700
Wire Wire Line
	6000 5700 6000 5800
Connection ~ 6000 5800
Wire Wire Line
	6000 5800 6000 5900
Connection ~ 6000 5900
Wire Wire Line
	6000 5900 6000 6000
Connection ~ 6000 6000
Wire Wire Line
	6000 6000 6000 6100
Connection ~ 6000 6100
Wire Wire Line
	6000 6100 6000 6200
Connection ~ 6000 6200
Wire Wire Line
	6000 6200 6000 6300
Connection ~ 6000 6300
Wire Wire Line
	6000 6300 6000 6400
Connection ~ 6000 6400
Wire Wire Line
	6000 6400 6000 6500
Connection ~ 6000 6500
Wire Wire Line
	6000 6500 6000 6600
Connection ~ 6000 6600
Wire Wire Line
	6000 6600 6000 6700
Connection ~ 6000 6700
Wire Wire Line
	6000 6700 6000 6800
Connection ~ 6000 6800
Wire Wire Line
	6000 6800 6000 6900
Connection ~ 6000 6900
Wire Wire Line
	6000 6900 6000 7000
Connection ~ 6000 7000
Wire Wire Line
	6000 7000 6000 7100
Connection ~ 6000 7100
Wire Wire Line
	6000 7100 6000 7200
Connection ~ 6000 7200
Wire Wire Line
	6000 7200 6000 7300
Connection ~ 6000 7300
Wire Wire Line
	6000 7300 6000 7400
Connection ~ 6000 7400
Wire Wire Line
	6000 7400 6000 7500
Wire Wire Line
	4000 7400 4000 7300
Connection ~ 4000 3100
Connection ~ 4000 3200
Wire Wire Line
	4000 3200 4000 3100
Connection ~ 4000 3300
Wire Wire Line
	4000 3300 4000 3200
Connection ~ 4000 3400
Wire Wire Line
	4000 3400 4000 3300
Connection ~ 4000 3500
Wire Wire Line
	4000 3500 4000 3400
Connection ~ 4000 3600
Wire Wire Line
	4000 3600 4000 3500
Connection ~ 4000 3700
Wire Wire Line
	4000 3700 4000 3600
Connection ~ 4000 3800
Wire Wire Line
	4000 3800 4000 3700
Connection ~ 4000 3900
Wire Wire Line
	4000 3900 4000 3800
Connection ~ 4000 4000
Wire Wire Line
	4000 4000 4000 3900
Connection ~ 4000 4100
Wire Wire Line
	4000 4100 4000 4000
Connection ~ 4000 4200
Wire Wire Line
	4000 4200 4000 4100
Connection ~ 4000 4300
Wire Wire Line
	4000 4300 4000 4200
Connection ~ 4000 4400
Wire Wire Line
	4000 4400 4000 4300
Connection ~ 4000 4500
Wire Wire Line
	4000 4500 4000 4400
Connection ~ 4000 4600
Wire Wire Line
	4000 4600 4000 4500
Connection ~ 4000 4700
Wire Wire Line
	4000 4700 4000 4600
Connection ~ 4000 4800
Wire Wire Line
	4000 4800 4000 4700
Connection ~ 4000 4900
Wire Wire Line
	4000 4900 4000 4800
Connection ~ 4000 5000
Wire Wire Line
	4000 5000 4000 4900
Connection ~ 4000 5100
Wire Wire Line
	4000 5100 4000 5000
Connection ~ 4000 5200
Wire Wire Line
	4000 5200 4000 5100
Connection ~ 4000 5300
Wire Wire Line
	4000 5300 4000 5200
Connection ~ 4000 5400
Wire Wire Line
	4000 5400 4000 5300
Connection ~ 4000 5500
Wire Wire Line
	4000 5500 4000 5400
Connection ~ 4000 5600
Wire Wire Line
	4000 5600 4000 5500
Connection ~ 4000 5700
Wire Wire Line
	4000 5700 4000 5600
Connection ~ 4000 5800
Wire Wire Line
	4000 5800 4000 5700
Connection ~ 4000 5900
Wire Wire Line
	4000 5900 4000 5800
Connection ~ 4000 6000
Wire Wire Line
	4000 6000 4000 5900
Connection ~ 4000 6100
Wire Wire Line
	4000 6100 4000 6000
Connection ~ 4000 6200
Wire Wire Line
	4000 6200 4000 6100
Connection ~ 4000 6300
Wire Wire Line
	4000 6300 4000 6200
Connection ~ 4000 6400
Wire Wire Line
	4000 6400 4000 6300
Connection ~ 4000 6500
Wire Wire Line
	4000 6500 4000 6400
Connection ~ 4000 6600
Wire Wire Line
	4000 6600 4000 6500
Connection ~ 4000 6700
Wire Wire Line
	4000 6700 4000 6600
Connection ~ 4000 6800
Wire Wire Line
	4000 6800 4000 6700
Connection ~ 4000 6900
Wire Wire Line
	4000 6900 4000 6800
Connection ~ 4000 7000
Wire Wire Line
	4000 7000 4000 6900
Connection ~ 4000 7100
Wire Wire Line
	4000 7100 4000 7000
Connection ~ 4000 7200
Wire Wire Line
	4000 7200 4000 7100
Connection ~ 4000 7300
Wire Wire Line
	4000 7300 4000 7200
Wire Wire Line
	4000 1000 4000 1100
Connection ~ 4000 1000
Connection ~ 4000 1700
Connection ~ 4000 1100
Wire Wire Line
	4000 1100 4000 1200
Connection ~ 4000 1200
Wire Wire Line
	4000 1200 4000 1300
Connection ~ 4000 1300
Wire Wire Line
	4000 1300 4000 1400
Connection ~ 4000 1400
Wire Wire Line
	4000 1400 4000 1500
Connection ~ 4000 1500
Wire Wire Line
	4000 1500 4000 1600
Connection ~ 4000 1600
Wire Wire Line
	4000 1600 4000 1700
Text HLabel 8150 1700 2    50   Input ~ 0
ANT_2
Text HLabel 8150 1800 2    50   Input ~ 0
ANT_1
Text HLabel 8150 2450 2    50   Output ~ 0
RTC_XTALO
Text HLabel 8150 2550 2    50   Input ~ 0
RTX_XTALI
Text HLabel 8150 2650 2    50   Output ~ 0
PMIC_ON_REQ
Text HLabel 8150 2750 2    50   Input ~ 0
ONOFF
Text HLabel 8150 2850 2    50   Input ~ 0
~RST~_IN
Text HLabel 8150 3500 2    50   BiDi ~ 0
SD_DATA
Text HLabel 8150 3600 2    50   Output ~ 0
SD_CMD
Text HLabel 8150 3700 2    50   Output ~ 0
SD_CLK
Text HLabel 8150 4300 2    50   Output ~ 0
GPLED
Text HLabel 8100 5050 2    50   Output ~ 0
LOGLED
Text HLabel 8100 5150 2    50   Input ~ 0
LOGBUTTON
Text HLabel 8100 5250 2    50   Output ~ 0
GP2
Text HLabel 8100 5350 2    50   Output ~ 0
GP1
Text HLabel 10150 1000 2    50   Output ~ 0
1V8_OUT
Text HLabel 10150 1100 2    50   Input ~ 0
SYNC
Text HLabel 10150 1200 2    50   Output ~ 0
PPSO
Wire Wire Line
	6000 1000 6200 1000
Connection ~ 6000 1000
Text HLabel 10150 1400 2    50   Input ~ 0
EVENTB
Text HLabel 10150 1500 2    50   Input ~ 0
EVENTA
Text HLabel 8150 4400 2    50   Output ~ 0
MODULE_RDY
Text HLabel 10150 2100 2    50   Input ~ 0
USB_VBUS
Text HLabel 10150 2200 2    50   BiDi ~ 0
USB_DEV_P
Text HLabel 10150 2300 2    50   BiDi ~ 0
USB_DEV_N
Text HLabel 10150 2950 2    50   Input ~ 0
COM4_RX
Text HLabel 10150 3050 2    50   Output ~ 0
COM4_TX
Text HLabel 10150 3150 2    50   Output ~ 0
COM1_RTS
Text HLabel 10150 3250 2    50   Input ~ 0
COM1_CTS
Text HLabel 10150 3350 2    50   Input ~ 0
COM1_RX
Text HLabel 10150 3450 2    50   Output ~ 0
COM1_TX
Text HLabel 10150 3550 2    50   Output ~ 0
COM2_RTS
Text HLabel 10150 3650 2    50   Input ~ 0
COM2_CTS
Text HLabel 10150 4150 2    50   Input ~ 0
COM3_RX
Text HLabel 10150 3750 2    50   Input ~ 0
COM2_RX
Text HLabel 10150 3850 2    50   Output ~ 0
COM2_TX
Text HLabel 10150 3950 2    50   Output ~ 0
COM3_RTS
Text HLabel 10150 4050 2    50   Input ~ 0
COM3_CTS
Text HLabel 10150 4250 2    50   Output ~ 0
COM3_TX
Text HLabel 10150 4850 2    50   Input ~ 0
~RST~_LAN
Text HLabel 10150 4950 2    50   Input ~ 0
RMII_CRSDV
Text HLabel 10150 5050 2    50   Input ~ 0
RMII_RXER
Text HLabel 10150 5150 2    50   Input ~ 0
RMII_RXD1
Text HLabel 10150 5250 2    50   Input ~ 0
RMII_RXD0
Text HLabel 10150 5350 2    50   Output ~ 0
RMII_CLK
Text HLabel 10150 5450 2    50   Output ~ 0
RMII_TXEN
Text HLabel 10150 5550 2    50   Output ~ 0
RMII_TXD1
Text HLabel 10150 5650 2    50   Output ~ 0
RMII_TXD0
Text HLabel 10150 5750 2    50   BiDi ~ 0
MDIO
Text HLabel 10150 5850 2    50   Output ~ 0
MDC
Wire Notes Line
	1500 4700 2500 4700
Wire Notes Line
	2500 4700 2500 5050
Wire Notes Line
	2500 5050 1500 5050
Wire Notes Line
	1500 5050 1500 4700
$Comp
L power:GND #PWR0259
U 1 1 611FDF4F
P 3850 3000
F 0 "#PWR0259" H 3850 2750 50  0001 C CNN
F 1 "GND" V 3855 2872 50  0000 R CNN
F 2 "" H 3850 3000 50  0001 C CNN
F 3 "" H 3850 3000 50  0001 C CNN
	1    3850 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	4000 3000 3850 3000
Connection ~ 4000 3000
$Comp
L power:GND #PWR0260
U 1 1 61208B20
P 6200 1000
F 0 "#PWR0260" H 6200 750 50  0001 C CNN
F 1 "GND" V 6205 872 50  0000 R CNN
F 2 "" H 6200 1000 50  0001 C CNN
F 3 "" H 6200 1000 50  0001 C CNN
	1    6200 1000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0261
U 1 1 61208DCD
P 10150 1300
F 0 "#PWR0261" H 10150 1050 50  0001 C CNN
F 1 "GND" V 10155 1172 50  0000 R CNN
F 2 "" H 10150 1300 50  0001 C CNN
F 3 "" H 10150 1300 50  0001 C CNN
	1    10150 1300
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
