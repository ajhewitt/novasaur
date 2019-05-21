EESchema Schematic File Version 4
LIBS:YATAC1-cache
EELAYER 29 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2850 6300 3350 6300
$Comp
L 74xx:74LS175 U11
U 1 1 5CDF2414
P 3850 5900
F 0 "U11" H 3850 5900 50  0000 C CNN
F 1 "74F175" H 3850 5800 50  0000 C CNN
F 2 "" H 3850 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 3850 5900 50  0001 C CNN
	1    3850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6450 2150 6450
Wire Wire Line
	1450 6450 1650 6450
Wire Wire Line
	1450 5500 1450 5950
Wire Wire Line
	1500 5500 1450 5500
Wire Wire Line
	1450 5950 1650 5950
Wire Wire Line
	1950 5950 2150 5950
Wire Wire Line
	2150 5500 2200 5500
Connection ~ 2150 5500
Wire Wire Line
	2100 5500 2150 5500
Text GLabel 2800 6400 0    50   Input ~ 0
~rst
Text GLabel 3000 5100 2    50   Output ~ 0
cclk
Text GLabel 3000 5300 2    50   Output ~ 0
dclk
Wire Wire Line
	4700 5600 4800 5600
Wire Wire Line
	3000 5500 3350 5500
Wire Wire Line
	3000 7250 3000 5500
Wire Wire Line
	4700 7250 3000 7250
Wire Wire Line
	4700 5600 4700 7250
Wire Wire Line
	4550 5900 4800 5900
Wire Wire Line
	3150 6100 3350 6100
Wire Wire Line
	3150 7100 3150 6100
Wire Wire Line
	4550 7100 3150 7100
Wire Wire Line
	4550 5900 4550 7100
Wire Wire Line
	3300 5900 3300 5700
Wire Wire Line
	3350 5900 3300 5900
Wire Wire Line
	4400 6200 4800 6200
Wire Wire Line
	3300 5700 3350 5700
Connection ~ 3300 5900
Wire Wire Line
	3300 6950 3300 5900
Wire Wire Line
	4400 6950 3300 6950
Wire Wire Line
	4400 6200 4400 6950
Connection ~ 4400 6200
Wire Wire Line
	4350 6200 4400 6200
Connection ~ 4700 5600
Wire Wire Line
	4350 5600 4700 5600
Wire Wire Line
	4350 6100 4800 6100
Wire Wire Line
	4350 6000 4800 6000
Connection ~ 4550 5900
Wire Wire Line
	4350 5900 4550 5900
Wire Wire Line
	4350 5800 4800 5800
Wire Wire Line
	4350 5500 4800 5500
$Comp
L power:GNDD #PWR0103
U 1 1 5CDF244F
P 2150 6850
AR Path="/5CDF244F" Ref="#PWR0103"  Part="1" 
AR Path="/5CDEEC9F/5CDF244F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 2150 6600 50  0001 C CNN
F 1 "GNDD" H 2154 6695 50  0000 C CNN
F 2 "" H 2150 6850 50  0001 C CNN
F 3 "" H 2150 6850 50  0001 C CNN
	1    2150 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 5CDF2455
P 1450 6850
AR Path="/5CDF2455" Ref="#PWR0104"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 1450 6600 50  0001 C CNN
F 1 "GNDD" H 1454 6695 50  0000 C CNN
F 2 "" H 1450 6850 50  0001 C CNN
F 3 "" H 1450 6850 50  0001 C CNN
	1    1450 6850
	1    0    0    -1  
$EndComp
Connection ~ 2150 5950
Wire Wire Line
	2150 6050 2150 5950
Connection ~ 1450 5950
Wire Wire Line
	1450 5950 1450 6450
Connection ~ 1450 6450
Wire Wire Line
	1450 6550 1450 6450
Wire Wire Line
	2150 6450 2150 6350
Connection ~ 2150 6450
Wire Wire Line
	2150 6550 2150 6450
$Comp
L Device:C C12
U 1 1 5CDF2470
P 2150 6700
AR Path="/5CDF2470" Ref="C12"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C12" H 2265 6746 50  0000 L CNN
F 1 "22p" H 2265 6655 50  0000 L CNN
F 2 "" H 2188 6550 50  0001 C CNN
F 3 "~" H 2150 6700 50  0001 C CNN
	1    2150 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5CDF2476
P 1450 6700
AR Path="/5CDF2476" Ref="C11"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C11" H 1565 6746 50  0000 L CNN
F 1 "22p" H 1565 6655 50  0000 L CNN
F 2 "" H 1488 6550 50  0001 C CNN
F 3 "~" H 1450 6700 50  0001 C CNN
	1    1450 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CDF247C
P 1800 6450
AR Path="/5CDF247C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y1" H 1800 6718 50  0000 C CNN
F 1 "30.875" H 1800 6627 50  0000 C CNN
F 2 "" H 1800 6450 50  0001 C CNN
F 3 "~" H 1800 6450 50  0001 C CNN
	1    1800 6450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 2 1 5CDF2482
P 2500 5500
AR Path="/5CDF2482" Ref="U8"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U8" H 2450 5500 50  0000 C CNN
F 1 "74F04" H 2550 5350 50  0001 C CNN
F 2 "" H 2500 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2500 5500 50  0001 C CNN
	2    2500 5500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 1 1 5CDF2488
P 1800 5500
AR Path="/5CDF2488" Ref="U8"  Part="1" 
AR Path="/5CDEEC9F/5CDF2488" Ref="U?"  Part="1" 
F 0 "U8" H 1750 5500 50  0000 C CNN
F 1 "74F04" H 1850 5350 50  0001 C CNN
F 2 "" H 1800 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1800 5500 50  0001 C CNN
	1    1800 5500
	1    0    0    -1  
$EndComp
Text GLabel 4800 5600 2    50   Output ~ 0
nclk
Text GLabel 4800 5500 2    50   Output ~ 0
mclk
Text GLabel 4800 6200 2    50   Output ~ 0
sclk
Text GLabel 4800 6100 2    50   Output ~ 0
rclk
Text GLabel 4800 6000 2    50   Output ~ 0
qclk2
Text GLabel 4800 5900 2    50   Output ~ 0
pclk2
Text GLabel 4800 5800 2    50   Output ~ 0
qclk1
Text GLabel 4800 5700 2    50   Output ~ 0
pclk1
Wire Wire Line
	2150 5500 2150 5950
Wire Wire Line
	2850 6300 2850 5500
Wire Wire Line
	2850 5500 2800 5500
Wire Wire Line
	3000 5300 2850 5300
Wire Wire Line
	2850 5300 2850 5500
Connection ~ 2850 5500
Wire Wire Line
	3350 6400 2800 6400
$Sheet
S 6300 5950 600  600 
U 5DAA19D5
F0 "CPU" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
$Sheet
S 7400 5950 600  600 
U 5DAA5CD8
F0 "ECU" 50
F1 "YATAC-ECU.sch" 50
$EndSheet
$Sheet
S 8500 5950 600  600 
U 5DAA3954
F0 "GPU" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Wire Wire Line
	2150 5500 2150 5100
Wire Wire Line
	2150 5100 3000 5100
$Sheet
S 9600 5950 600  600 
U 62D13D9D
F0 "IO" 50
F1 "YATAC-IO.sch" 50
$EndSheet
$Comp
L Device:R_US R?
U 1 1 66F86918
P 1800 5950
AR Path="/62D13D9D/66F86918" Ref="R?"  Part="1" 
AR Path="/66F86918" Ref="R5"  Part="1" 
F 0 "R5" V 2005 5950 50  0000 C CNN
F 1 "1k" V 1914 5950 50  0000 C CNN
F 2 "" V 1840 5940 50  0001 C CNN
F 3 "~" H 1800 5950 50  0001 C CNN
	1    1800 5950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86922
P 2150 6200
AR Path="/62D13D9D/66F86922" Ref="R?"  Part="1" 
AR Path="/66F86922" Ref="R6"  Part="1" 
F 0 "R6" H 2250 6250 50  0000 L CNN
F 1 "270" H 2250 6150 50  0000 L CNN
F 2 "" V 2190 6190 50  0001 C CNN
F 3 "~" H 2150 6200 50  0001 C CNN
	1    2150 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 671AAE18
P 3850 6700
F 0 "#PWR0102" H 3850 6450 50  0001 C CNN
F 1 "GNDD" H 3854 6545 50  0000 C CNN
F 2 "" H 3850 6700 50  0001 C CNN
F 3 "" H 3850 6700 50  0001 C CNN
	1    3850 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 5700 4800 5700
Text Notes 7450 7900 0    66   ~ 0
May 19, 2019
Text Notes 6650 7750 0    66   Italic 13
YATAC78 TTL Computer
Text Notes 6350 6900 0    45   ~ 0
Top sheet contains main clock circuit and mating connectors to join the CPU and GPU boards.
$Comp
L power:VCC #PWR0101
U 1 1 5ECE2E58
P 3850 5200
F 0 "#PWR0101" H 3850 5050 50  0001 C CNN
F 1 "VCC" H 3867 5373 50  0000 C CNN
F 2 "" H 3850 5200 50  0001 C CNN
F 3 "" H 3850 5200 50  0001 C CNN
	1    3850 5200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J9
U 1 1 61531B68
P 2100 2450
F 0 "J9" H 2150 3567 50  0000 C CNN
F 1 "GPU0" H 2150 3476 50  0000 C CNN
F 2 "" H 2100 2450 50  0001 C CNN
F 3 "~" H 2100 2450 50  0001 C CNN
	1    2100 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN1
U 1 1 6165F43D
P 6800 4800
F 0 "RN1" H 6700 5100 50  0000 L CNN
F 1 "270" H 6700 5000 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 7275 4800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 6800 4800 50  0001 C CNN
	1    6800 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 616603F5
P 7850 4800
F 0 "RN2" H 7750 5100 50  0000 L CNN
F 1 "270" H 7750 5000 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8325 4800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7850 4800 50  0001 C CNN
	1    7850 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN3
U 1 1 61662F7D
P 8900 4800
F 0 "RN3" H 8800 5100 50  0000 L CNN
F 1 "270" H 8800 5000 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9375 4800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8900 4800 50  0001 C CNN
	1    8900 4800
	1    0    0    -1  
$EndComp
Entry Wire Line
	6400 5300 6500 5200
Entry Wire Line
	6300 5300 6400 5200
Entry Wire Line
	6600 5300 6700 5200
Entry Wire Line
	6500 5300 6600 5200
Entry Wire Line
	6800 5300 6900 5200
Entry Wire Line
	6700 5300 6800 5200
Entry Wire Line
	7000 5300 7100 5200
Entry Wire Line
	6900 5300 7000 5200
Entry Wire Line
	7450 5300 7550 5200
Entry Wire Line
	7350 5300 7450 5200
Entry Wire Line
	7650 5300 7750 5200
Entry Wire Line
	7550 5300 7650 5200
Entry Wire Line
	7850 5300 7950 5200
Entry Wire Line
	7750 5300 7850 5200
Entry Wire Line
	8050 5300 8150 5200
Entry Wire Line
	7950 5300 8050 5200
Entry Wire Line
	8600 5300 8500 5200
Entry Wire Line
	9300 5300 9200 5200
Entry Wire Line
	8800 5300 8700 5200
Entry Wire Line
	8700 5300 8600 5200
Entry Wire Line
	9000 5300 8900 5200
Entry Wire Line
	8900 5300 8800 5200
Entry Wire Line
	9200 5300 9100 5200
Entry Wire Line
	9100 5300 9000 5200
Text GLabel 6200 5300 0    50   Input ~ 0
DA[0..15]
Text GLabel 9400 5300 2    50   Input ~ 0
PA[0..15]
Wire Wire Line
	6400 5200 6400 5000
Wire Wire Line
	6500 5200 6500 5000
Wire Wire Line
	6600 5200 6600 5000
Wire Wire Line
	6700 5200 6700 5000
Wire Wire Line
	6800 5200 6800 5000
Wire Wire Line
	6900 5200 6900 5000
Wire Wire Line
	7000 5200 7000 5000
Wire Wire Line
	7100 5200 7100 5000
Wire Wire Line
	7450 5200 7450 5000
Wire Wire Line
	7550 5200 7550 5000
Wire Wire Line
	7650 5200 7650 5000
Wire Wire Line
	7750 5200 7750 5000
Wire Wire Line
	7850 5200 7850 5000
Wire Wire Line
	7950 5200 7950 5000
Wire Wire Line
	8050 5200 8050 5000
Wire Wire Line
	8150 5200 8150 5000
Text Label 6400 5200 1    50   ~ 0
DA0
Text Label 6500 5200 1    50   ~ 0
DA1
Text Label 6600 5200 1    50   ~ 0
DA2
Text Label 6700 5200 1    50   ~ 0
DA3
Text Label 6800 5200 1    50   ~ 0
DA4
Text Label 6900 5200 1    50   ~ 0
DA5
Text Label 7000 5200 1    50   ~ 0
DA6
Text Label 7100 5200 1    50   ~ 0
DA7
Text Label 7450 5200 1    50   ~ 0
DA8
Text Label 7550 5200 1    50   ~ 0
DA9
Text Label 7650 5200 1    50   ~ 0
DA10
Text Label 7750 5200 1    50   ~ 0
DA11
Text Label 7850 5200 1    50   ~ 0
DA12
Text Label 7950 5200 1    50   ~ 0
DA13
Text Label 8050 5200 1    50   ~ 0
DA14
Text Label 8150 5200 1    50   ~ 0
DA15
Wire Wire Line
	8500 5200 8500 5000
Wire Wire Line
	8600 5200 8600 5000
Wire Wire Line
	8700 5200 8700 5000
Wire Wire Line
	8800 5200 8800 5000
Wire Wire Line
	8900 5200 8900 5000
Wire Wire Line
	9000 5200 9000 5000
Wire Wire Line
	9100 5200 9100 5000
Wire Wire Line
	9200 5200 9200 5000
Text Label 8500 5200 1    50   ~ 0
PA8
Text Label 8600 5200 1    50   ~ 0
PA9
Text Label 8700 5200 1    50   ~ 0
PA10
Text Label 8800 5200 1    50   ~ 0
PA11
Text Label 8900 5200 1    50   ~ 0
PA12
Text Label 9000 5200 1    50   ~ 0
PA13
Text Label 9100 5200 1    50   ~ 0
PA14
Text Label 9200 5200 1    50   ~ 0
PA15
$Comp
L power:VCC #PWR0201
U 1 1 5CEDC305
P 8500 4500
F 0 "#PWR0201" H 8500 4350 50  0001 C CNN
F 1 "VCC" H 8517 4673 50  0000 C CNN
F 2 "" H 8500 4500 50  0001 C CNN
F 3 "" H 8500 4500 50  0001 C CNN
	1    8500 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0207
U 1 1 5CEE61A7
P 2600 1450
F 0 "#PWR0207" H 2600 1300 50  0001 C CNN
F 1 "VCC" H 2617 1623 50  0000 C CNN
F 2 "" H 2600 1450 50  0001 C CNN
F 3 "" H 2600 1450 50  0001 C CNN
	1    2600 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1750 2500 1750
Wire Wire Line
	2400 3250 2500 3250
Connection ~ 2500 3250
Wire Wire Line
	2500 3250 2500 3550
Wire Wire Line
	2400 2750 2500 2750
Connection ~ 2500 2750
Wire Wire Line
	2500 2750 2500 3250
Wire Wire Line
	2400 2250 2500 2250
Connection ~ 2500 2250
Wire Wire Line
	2400 3450 2600 3450
Wire Wire Line
	2600 3450 2600 1550
Wire Wire Line
	2400 1550 2600 1550
Wire Wire Line
	2600 1550 2600 1450
Connection ~ 2600 1550
$Comp
L power:GNDD #PWR0208
U 1 1 5CF27D6C
P 2500 3550
F 0 "#PWR0208" H 2500 3300 50  0001 C CNN
F 1 "GNDD" H 2504 3395 50  0000 C CNN
F 2 "" H 2500 3550 50  0001 C CNN
F 3 "" H 2500 3550 50  0001 C CNN
	1    2500 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	3000 1850 3100 1750
Entry Wire Line
	3000 1950 3100 1850
Entry Wire Line
	3000 2050 3100 1950
Entry Wire Line
	3000 2150 3100 2050
Entry Wire Line
	3000 2350 3100 2250
Entry Wire Line
	3000 2450 3100 2350
Entry Wire Line
	3000 2550 3100 2450
Entry Wire Line
	3000 2650 3100 2550
$Comp
L power:GNDD #PWR0209
U 1 1 5CF61287
P 1800 3550
F 0 "#PWR0209" H 1800 3300 50  0001 C CNN
F 1 "GNDD" H 1804 3395 50  0000 C CNN
F 2 "" H 1800 3550 50  0001 C CNN
F 3 "" H 1800 3550 50  0001 C CNN
	1    1800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3550 1800 3250
Wire Wire Line
	1800 3250 1900 3250
Wire Wire Line
	1800 3250 1800 2750
Wire Wire Line
	1800 2750 1900 2750
Connection ~ 1800 3250
Wire Wire Line
	1800 2250 1900 2250
Connection ~ 1800 2750
Wire Wire Line
	1800 1750 1900 1750
Connection ~ 1800 2250
Wire Wire Line
	1900 3450 1700 3450
$Comp
L power:VCC #PWR0210
U 1 1 5CF7C932
P 1700 1450
F 0 "#PWR0210" H 1700 1300 50  0001 C CNN
F 1 "VCC" H 1717 1623 50  0000 C CNN
F 2 "" H 1700 1450 50  0001 C CNN
F 3 "" H 1700 1450 50  0001 C CNN
	1    1700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 1450 1700 1550
Wire Wire Line
	1700 1550 1900 1550
Connection ~ 1700 1550
Wire Wire Line
	1700 1550 1700 3450
Wire Wire Line
	2400 2850 2700 2850
Wire Wire Line
	2400 2950 2700 2950
Wire Wire Line
	2400 3050 2700 3050
Wire Wire Line
	2400 3150 2700 3150
Wire Wire Line
	1600 2850 1900 2850
Wire Wire Line
	1600 2950 1900 2950
Wire Wire Line
	1600 3050 1900 3050
Wire Wire Line
	1600 3150 1900 3150
Wire Wire Line
	2400 3350 2700 3350
Text GLabel 1600 2850 0    50   Input ~ 0
~vle
Text GLabel 2700 2850 2    50   Input ~ 0
~ele
Text GLabel 1600 2950 0    50   Input ~ 0
~exle
Text GLabel 2700 2950 2    50   Input ~ 0
~eyle
Text GLabel 1600 3050 0    50   Input ~ 0
~xle
Text GLabel 2700 3050 2    50   Input ~ 0
~yle
Text GLabel 1600 3150 0    50   Output ~ 0
pclk1
Text GLabel 2700 3150 2    50   Output ~ 0
qclk1
Text GLabel 2700 3350 2    50   Output ~ 0
mclk
Text GLabel 3100 1450 1    50   Output ~ 0
PA[0..15]
Text Label 2800 1850 0    50   ~ 0
PA8
Text Label 2800 1950 0    50   ~ 0
PA9
Text Label 2800 2050 0    50   ~ 0
PA10
Text Label 2800 2150 0    50   ~ 0
PA11
Text Label 2800 2350 0    50   ~ 0
PA12
Text Label 2800 2450 0    50   ~ 0
PA13
Text Label 2800 2550 0    50   ~ 0
PA14
Text Label 2800 2650 0    50   ~ 0
PA15
Text Label 1300 1850 0    50   ~ 0
DD0
Text Label 1300 1950 0    50   ~ 0
DD1
Text Label 1300 2050 0    50   ~ 0
DD2
Text Label 1300 2150 0    50   ~ 0
DD3
Text Label 1300 2350 0    50   ~ 0
DD4
Text Label 1300 2450 0    50   ~ 0
DD5
Text Label 1300 2550 0    50   ~ 0
DD6
Text Label 1300 2650 0    50   ~ 0
DD7
$Comp
L power:VCC #PWR0211
U 1 1 5D0C6C6F
P 4650 1450
F 0 "#PWR0211" H 4650 1300 50  0001 C CNN
F 1 "VCC" H 4667 1623 50  0000 C CNN
F 2 "" H 4650 1450 50  0001 C CNN
F 3 "" H 4650 1450 50  0001 C CNN
	1    4650 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1750 4550 1750
Wire Wire Line
	4450 3250 4550 3250
Connection ~ 4550 3250
Wire Wire Line
	4550 3250 4550 3550
Wire Wire Line
	4450 2750 4550 2750
Connection ~ 4550 2750
Wire Wire Line
	4550 2750 4550 3250
Wire Wire Line
	4450 2250 4550 2250
Connection ~ 4550 2250
Wire Wire Line
	4450 3450 4650 3450
Wire Wire Line
	4650 3450 4650 1550
Wire Wire Line
	4450 1550 4650 1550
Wire Wire Line
	4650 1550 4650 1450
Connection ~ 4650 1550
$Comp
L power:GNDD #PWR0212
U 1 1 5D0C6C85
P 4550 3550
F 0 "#PWR0212" H 4550 3300 50  0001 C CNN
F 1 "GNDD" H 4554 3395 50  0000 C CNN
F 2 "" H 4550 3550 50  0001 C CNN
F 3 "" H 4550 3550 50  0001 C CNN
	1    4550 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	5050 1850 5150 1750
Entry Wire Line
	5050 1950 5150 1850
Entry Wire Line
	5050 2050 5150 1950
Entry Wire Line
	5050 2150 5150 2050
Entry Wire Line
	5050 2350 5150 2250
Entry Wire Line
	5050 2450 5150 2350
Entry Wire Line
	5050 2550 5150 2450
Entry Wire Line
	5050 2650 5150 2550
Entry Wire Line
	3250 1750 3350 1850
Entry Wire Line
	3250 1850 3350 1950
Entry Wire Line
	3250 1950 3350 2050
Entry Wire Line
	3250 2050 3350 2150
Entry Wire Line
	3250 2250 3350 2350
Entry Wire Line
	3250 2350 3350 2450
Entry Wire Line
	3250 2450 3350 2550
Entry Wire Line
	3250 2550 3350 2650
$Comp
L power:GNDD #PWR0213
U 1 1 5D0C6C9B
P 3850 3550
F 0 "#PWR0213" H 3850 3300 50  0001 C CNN
F 1 "GNDD" H 3854 3395 50  0000 C CNN
F 2 "" H 3850 3550 50  0001 C CNN
F 3 "" H 3850 3550 50  0001 C CNN
	1    3850 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3550 3850 3250
Wire Wire Line
	3850 3250 3950 3250
Wire Wire Line
	3850 3250 3850 2750
Wire Wire Line
	3850 2750 3950 2750
Connection ~ 3850 3250
Wire Wire Line
	3850 2750 3850 2250
Wire Wire Line
	3850 2250 3950 2250
Connection ~ 3850 2750
Wire Wire Line
	3850 2250 3850 1750
Wire Wire Line
	3850 1750 3950 1750
Connection ~ 3850 2250
Wire Wire Line
	3950 3450 3750 3450
$Comp
L power:VCC #PWR0214
U 1 1 5D0C6CAD
P 3750 1450
F 0 "#PWR0214" H 3750 1300 50  0001 C CNN
F 1 "VCC" H 3767 1623 50  0000 C CNN
F 2 "" H 3750 1450 50  0001 C CNN
F 3 "" H 3750 1450 50  0001 C CNN
	1    3750 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1450 3750 1550
Wire Wire Line
	3750 1550 3950 1550
Connection ~ 3750 1550
Wire Wire Line
	3750 1550 3750 3450
Wire Wire Line
	4450 2850 4750 2850
Wire Wire Line
	4450 2950 4750 2950
Wire Wire Line
	4450 3050 4750 3050
Wire Wire Line
	4450 3150 4750 3150
Wire Wire Line
	4450 3350 4750 3350
Text GLabel 4750 2850 2    50   Input ~ 0
~xroe
Text GLabel 4750 2950 2    50   Input ~ 0
~eoe
Text GLabel 4750 3050 2    50   Input ~ 0
~doe
Text GLabel 4750 3150 2    50   Input ~ 0
~dwe
Text GLabel 4750 3350 2    50   Input ~ 0
~xoe
Text GLabel 3250 1450 1    50   Input ~ 0
PD[0..7]
Text GLabel 5150 1450 1    50   Input ~ 0
PA[0..15]
Text Label 4850 1850 0    50   ~ 0
PA0
Text Label 4850 1950 0    50   ~ 0
PA1
Text Label 4850 2050 0    50   ~ 0
PA2
Text Label 4850 2150 0    50   ~ 0
PA3
Text Label 4850 2350 0    50   ~ 0
PA4
Text Label 4850 2450 0    50   ~ 0
PA5
Text Label 4850 2550 0    50   ~ 0
PA6
Text Label 4850 2650 0    50   ~ 0
PA7
Text Label 3350 1850 0    50   ~ 0
PD0
Text Label 3350 1950 0    50   ~ 0
PD1
Text Label 3350 2050 0    50   ~ 0
PD2
Text Label 3350 2150 0    50   ~ 0
PD3
Text Label 3350 2350 0    50   ~ 0
PD4
Text Label 3350 2450 0    50   ~ 0
PD5
Text Label 3350 2550 0    50   ~ 0
PD6
Text Label 3350 2650 0    50   ~ 0
PD7
Entry Wire Line
	3250 2950 3350 2850
Entry Wire Line
	3250 3050 3350 2950
Entry Wire Line
	3250 3150 3350 3050
Entry Wire Line
	3250 3250 3350 3150
Text GLabel 3250 3350 3    50   Input ~ 0
Ei[0..3]
Text Label 3350 2850 0    50   ~ 0
Ei0
Text Label 3350 2950 0    50   ~ 0
Ei1
Text Label 3350 3050 0    50   ~ 0
Ei2
Text Label 3350 3150 0    50   ~ 0
Ei3
Text GLabel 3650 3350 0    50   Input ~ 0
DA16
Wire Wire Line
	3650 3350 3950 3350
Text GLabel 3650 1650 0    50   Input ~ 0
~rst
Text GLabel 1600 3350 0    50   Output ~ 0
mclk
Wire Wire Line
	1900 3350 1600 3350
Wire Wire Line
	8500 4500 8500 4600
$Comp
L power:VCC #PWR0204
U 1 1 5D4B22A2
P 7450 4500
F 0 "#PWR0204" H 7450 4350 50  0001 C CNN
F 1 "VCC" H 7467 4673 50  0000 C CNN
F 2 "" H 7450 4500 50  0001 C CNN
F 3 "" H 7450 4500 50  0001 C CNN
	1    7450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 4500 7450 4600
$Comp
L power:VCC #PWR0205
U 1 1 5D4C867C
P 6400 4500
F 0 "#PWR0205" H 6400 4350 50  0001 C CNN
F 1 "VCC" H 6417 4673 50  0000 C CNN
F 2 "" H 6400 4500 50  0001 C CNN
F 3 "" H 6400 4500 50  0001 C CNN
	1    6400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4500 6400 4600
Text GLabel 1200 1450 1    50   Output ~ 0
DD[0..7]
Entry Wire Line
	1200 2550 1300 2650
Entry Wire Line
	1200 2450 1300 2550
Entry Wire Line
	1200 2350 1300 2450
Entry Wire Line
	1200 2250 1300 2350
Entry Wire Line
	1200 2050 1300 2150
Entry Wire Line
	1200 1950 1300 2050
Entry Wire Line
	1200 1850 1300 1950
Entry Wire Line
	1200 1750 1300 1850
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J10
U 1 1 5D0C6C69
P 4150 2450
F 0 "J10" H 4200 3567 50  0000 C CNN
F 1 "GPU1" H 4200 3476 50  0000 C CNN
F 2 "" H 4150 2450 50  0001 C CNN
F 3 "~" H 4150 2450 50  0001 C CNN
	1    4150 2450
	1    0    0    -1  
$EndComp
Text GLabel 4750 1650 2    50   Input ~ 0
U3Dyi
Wire Wire Line
	4550 1750 4550 2250
Wire Wire Line
	4550 2250 4550 2750
Wire Wire Line
	4750 1650 4450 1650
Wire Wire Line
	2500 1750 2500 2250
Wire Wire Line
	2500 2250 2500 2750
Wire Wire Line
	1800 1750 1800 2250
Wire Wire Line
	1800 2250 1800 2750
Wire Wire Line
	3650 1650 3950 1650
Wire Wire Line
	4450 1850 5050 1850
Wire Wire Line
	4450 1950 5050 1950
Wire Wire Line
	4450 2050 5050 2050
Wire Wire Line
	4450 2150 5050 2150
Wire Wire Line
	4450 2350 5050 2350
Wire Wire Line
	4450 2450 5050 2450
Wire Wire Line
	4450 2550 5050 2550
Wire Wire Line
	4450 2650 5050 2650
Wire Wire Line
	3350 2650 3950 2650
Wire Wire Line
	3350 1850 3950 1850
Wire Wire Line
	3950 1950 3350 1950
Wire Wire Line
	3350 2050 3950 2050
Wire Wire Line
	3950 2150 3350 2150
Wire Wire Line
	3350 2350 3950 2350
Wire Wire Line
	3950 2450 3350 2450
Wire Wire Line
	3350 2550 3950 2550
Wire Wire Line
	2400 1850 3000 1850
Wire Wire Line
	3000 1950 2400 1950
Wire Wire Line
	2400 2050 3000 2050
Wire Wire Line
	2400 2150 3000 2150
Wire Wire Line
	3000 2350 2400 2350
Wire Wire Line
	2400 2450 3000 2450
Wire Wire Line
	3000 2550 2400 2550
Wire Wire Line
	2400 2650 3000 2650
Wire Wire Line
	1300 2650 1900 2650
Wire Wire Line
	1900 2550 1300 2550
Wire Wire Line
	1300 2450 1900 2450
Wire Wire Line
	1300 2350 1900 2350
Wire Wire Line
	1900 2150 1300 2150
Wire Wire Line
	1300 2050 1900 2050
Wire Wire Line
	1900 1950 1300 1950
Wire Wire Line
	1300 1850 1900 1850
Entry Wire Line
	1350 1550 1450 1650
Text Label 1450 1650 0    50   ~ 0
SC0
Wire Bus Line
	1350 1450 1350 1550
Wire Wire Line
	1450 1650 1900 1650
Text GLabel 1350 1450 1    50   Output ~ 0
SC[0..3]
Wire Bus Line
	2950 1450 2950 1550
Text GLabel 2950 1450 1    50   Output ~ 0
SC[0..3]
Entry Wire Line
	2850 1650 2950 1550
Wire Wire Line
	2400 1650 2850 1650
Text Label 2700 1650 0    50   ~ 0
SC1
Wire Wire Line
	3350 2850 3950 2850
Wire Wire Line
	3950 2950 3350 2950
Wire Wire Line
	3350 3050 3950 3050
Wire Wire Line
	3950 3150 3350 3150
Wire Wire Line
	8600 3150 8000 3150
Wire Wire Line
	8000 3050 8600 3050
Wire Wire Line
	8600 2950 8000 2950
Wire Wire Line
	8000 2850 8600 2850
Text Label 7350 1650 0    50   ~ 0
SC1
Wire Wire Line
	7050 1650 7500 1650
Entry Wire Line
	7500 1650 7600 1550
Text GLabel 7600 1450 1    50   Input ~ 0
SC[0..3]
Wire Bus Line
	7600 1450 7600 1550
Text GLabel 6000 1450 1    50   Input ~ 0
SC[0..3]
Wire Wire Line
	6100 1650 6550 1650
Wire Bus Line
	6000 1450 6000 1550
Text Label 6100 1650 0    50   ~ 0
SC0
Entry Wire Line
	6000 1550 6100 1650
Wire Wire Line
	5950 1850 6550 1850
Wire Wire Line
	6550 1950 5950 1950
Wire Wire Line
	5950 2050 6550 2050
Wire Wire Line
	6550 2150 5950 2150
Wire Wire Line
	5950 2350 6550 2350
Wire Wire Line
	5950 2450 6550 2450
Wire Wire Line
	6550 2550 5950 2550
Wire Wire Line
	5950 2650 6550 2650
Wire Wire Line
	7050 2650 7650 2650
Wire Wire Line
	7650 2550 7050 2550
Wire Wire Line
	7050 2450 7650 2450
Wire Wire Line
	7650 2350 7050 2350
Wire Wire Line
	7050 2150 7650 2150
Wire Wire Line
	7050 2050 7650 2050
Wire Wire Line
	7650 1950 7050 1950
Wire Wire Line
	7050 1850 7650 1850
Wire Wire Line
	8000 2550 8600 2550
Wire Wire Line
	8600 2450 8000 2450
Wire Wire Line
	8000 2350 8600 2350
Wire Wire Line
	8600 2150 8000 2150
Wire Wire Line
	8000 2050 8600 2050
Wire Wire Line
	8600 1950 8000 1950
Wire Wire Line
	8000 1850 8600 1850
Wire Wire Line
	8000 2650 8600 2650
Wire Wire Line
	9100 2650 9700 2650
Wire Wire Line
	9100 2550 9700 2550
Wire Wire Line
	9100 2450 9700 2450
Wire Wire Line
	9100 2350 9700 2350
Wire Wire Line
	9100 2150 9700 2150
Wire Wire Line
	9100 2050 9700 2050
Wire Wire Line
	9100 1950 9700 1950
Wire Wire Line
	9100 1850 9700 1850
Wire Wire Line
	8300 1650 8600 1650
Wire Wire Line
	6450 2250 6450 2750
Wire Wire Line
	6450 1750 6450 2250
Wire Wire Line
	7150 2250 7150 2750
Wire Wire Line
	7150 1750 7150 2250
Wire Wire Line
	9400 1650 9100 1650
Wire Wire Line
	9200 2250 9200 2750
Wire Wire Line
	9200 1750 9200 2250
Text GLabel 9400 1650 2    50   Output ~ 0
U3Dyo
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J12
U 1 1 5E6E3DED
P 8800 2450
F 0 "J12" H 8850 3567 50  0000 C CNN
F 1 "CPU1" H 8850 3476 50  0000 C CNN
F 2 "" H 8800 2450 50  0001 C CNN
F 3 "~" H 8800 2450 50  0001 C CNN
	1    8800 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	5850 1750 5950 1850
Entry Wire Line
	5850 1850 5950 1950
Entry Wire Line
	5850 1950 5950 2050
Entry Wire Line
	5850 2050 5950 2150
Entry Wire Line
	5850 2250 5950 2350
Entry Wire Line
	5850 2350 5950 2450
Entry Wire Line
	5850 2450 5950 2550
Entry Wire Line
	5850 2550 5950 2650
Wire Wire Line
	6550 3350 6250 3350
Wire Wire Line
	8300 3350 8600 3350
Text Label 8000 3150 0    50   ~ 0
Ei3
Text Label 8000 3050 0    50   ~ 0
Ei2
Text Label 8000 2950 0    50   ~ 0
Ei1
Text Label 8000 2850 0    50   ~ 0
Ei0
Entry Wire Line
	7900 3250 8000 3150
Entry Wire Line
	7900 3150 8000 3050
Entry Wire Line
	7900 3050 8000 2950
Entry Wire Line
	7900 2950 8000 2850
Text Label 8000 2650 0    50   ~ 0
PD7
Text Label 8000 2550 0    50   ~ 0
PD6
Text Label 8000 2450 0    50   ~ 0
PD5
Text Label 8000 2350 0    50   ~ 0
PD4
Text Label 8000 2150 0    50   ~ 0
PD3
Text Label 8000 2050 0    50   ~ 0
PD2
Text Label 8000 1950 0    50   ~ 0
PD1
Text Label 8000 1850 0    50   ~ 0
PD0
Text Label 9500 2650 0    50   ~ 0
PA7
Text Label 9500 2550 0    50   ~ 0
PA6
Text Label 9500 2450 0    50   ~ 0
PA5
Text Label 9500 2350 0    50   ~ 0
PA4
Text Label 9500 2150 0    50   ~ 0
PA3
Text Label 9500 2050 0    50   ~ 0
PA2
Text Label 9500 1950 0    50   ~ 0
PA1
Text Label 9500 1850 0    50   ~ 0
PA0
Wire Wire Line
	9100 3350 9400 3350
Wire Wire Line
	9100 3150 9400 3150
Wire Wire Line
	9100 3050 9400 3050
Wire Wire Line
	9100 2950 9400 2950
Wire Wire Line
	9100 2850 9400 2850
Wire Wire Line
	8400 1550 8400 3450
Connection ~ 8400 1550
Wire Wire Line
	8400 1550 8600 1550
Wire Wire Line
	8400 1450 8400 1550
$Comp
L power:VCC #PWR?
U 1 1 5E6E3DB0
P 8400 1450
F 0 "#PWR?" H 8400 1300 50  0001 C CNN
F 1 "VCC" H 8417 1623 50  0000 C CNN
F 2 "" H 8400 1450 50  0001 C CNN
F 3 "" H 8400 1450 50  0001 C CNN
	1    8400 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3450 8400 3450
Connection ~ 8500 2250
Wire Wire Line
	8500 1750 8600 1750
Wire Wire Line
	8500 2250 8500 1750
Connection ~ 8500 2750
Wire Wire Line
	8500 2250 8600 2250
Wire Wire Line
	8500 2750 8500 2250
Connection ~ 8500 3250
Wire Wire Line
	8500 2750 8600 2750
Wire Wire Line
	8500 3250 8500 2750
Wire Wire Line
	8500 3250 8600 3250
Wire Wire Line
	8500 3550 8500 3250
$Comp
L power:GNDD #PWR?
U 1 1 5E6E3D9E
P 8500 3550
F 0 "#PWR?" H 8500 3300 50  0001 C CNN
F 1 "GNDD" H 8504 3395 50  0000 C CNN
F 2 "" H 8500 3550 50  0001 C CNN
F 3 "" H 8500 3550 50  0001 C CNN
	1    8500 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	7900 2550 8000 2650
Entry Wire Line
	7900 2450 8000 2550
Entry Wire Line
	7900 2350 8000 2450
Entry Wire Line
	7900 2250 8000 2350
Entry Wire Line
	7900 2050 8000 2150
Entry Wire Line
	7900 1950 8000 2050
Entry Wire Line
	7900 1850 8000 1950
Entry Wire Line
	7900 1750 8000 1850
Entry Wire Line
	9700 2650 9800 2550
Entry Wire Line
	9700 2550 9800 2450
Entry Wire Line
	9700 2450 9800 2350
Entry Wire Line
	9700 2350 9800 2250
Entry Wire Line
	9700 2150 9800 2050
Entry Wire Line
	9700 2050 9800 1950
Entry Wire Line
	9700 1950 9800 1850
Entry Wire Line
	9700 1850 9800 1750
$Comp
L power:GNDD #PWR?
U 1 1 5E6E3D88
P 9200 3550
F 0 "#PWR?" H 9200 3300 50  0001 C CNN
F 1 "GNDD" H 9204 3395 50  0000 C CNN
F 2 "" H 9200 3550 50  0001 C CNN
F 3 "" H 9200 3550 50  0001 C CNN
	1    9200 3550
	1    0    0    -1  
$EndComp
Connection ~ 9300 1550
Wire Wire Line
	9300 1550 9300 1450
Wire Wire Line
	9100 1550 9300 1550
Wire Wire Line
	9300 3450 9300 1550
Wire Wire Line
	9100 3450 9300 3450
Connection ~ 9200 2250
Wire Wire Line
	9100 2250 9200 2250
Wire Wire Line
	9200 2750 9200 3250
Connection ~ 9200 2750
Wire Wire Line
	9100 2750 9200 2750
Wire Wire Line
	9200 3250 9200 3550
Connection ~ 9200 3250
Wire Wire Line
	9100 3250 9200 3250
Wire Wire Line
	9100 1750 9200 1750
$Comp
L power:VCC #PWR?
U 1 1 5E6E3D74
P 9300 1450
F 0 "#PWR?" H 9300 1300 50  0001 C CNN
F 1 "VCC" H 9317 1623 50  0000 C CNN
F 2 "" H 9300 1450 50  0001 C CNN
F 3 "" H 9300 1450 50  0001 C CNN
	1    9300 1450
	1    0    0    -1  
$EndComp
Text Label 5950 2650 0    50   ~ 0
DD7
Text Label 5950 2550 0    50   ~ 0
DD6
Text Label 5950 2450 0    50   ~ 0
DD5
Text Label 5950 2350 0    50   ~ 0
DD4
Text Label 5950 2150 0    50   ~ 0
DD3
Text Label 5950 2050 0    50   ~ 0
DD2
Text Label 5950 1950 0    50   ~ 0
DD1
Text Label 5950 1850 0    50   ~ 0
DD0
Text Label 7450 2650 0    50   ~ 0
PA15
Text Label 7450 2550 0    50   ~ 0
PA14
Text Label 7450 2450 0    50   ~ 0
PA13
Text Label 7450 2350 0    50   ~ 0
PA12
Text Label 7450 2150 0    50   ~ 0
PA11
Text Label 7450 2050 0    50   ~ 0
PA10
Text Label 7450 1950 0    50   ~ 0
PA9
Text Label 7450 1850 0    50   ~ 0
PA8
Wire Wire Line
	7050 3350 7350 3350
Wire Wire Line
	6250 3150 6550 3150
Wire Wire Line
	6250 3050 6550 3050
Wire Wire Line
	6250 2950 6550 2950
Wire Wire Line
	6250 2850 6550 2850
Wire Wire Line
	7050 3150 7350 3150
Wire Wire Line
	7050 3050 7350 3050
Wire Wire Line
	7050 2950 7350 2950
Wire Wire Line
	7050 2850 7350 2850
Wire Wire Line
	6350 1550 6350 3450
Connection ~ 6350 1550
Wire Wire Line
	6350 1550 6550 1550
Wire Wire Line
	6350 1450 6350 1550
$Comp
L power:VCC #PWR?
U 1 1 5E6E3D47
P 6350 1450
F 0 "#PWR?" H 6350 1300 50  0001 C CNN
F 1 "VCC" H 6367 1623 50  0000 C CNN
F 2 "" H 6350 1450 50  0001 C CNN
F 3 "" H 6350 1450 50  0001 C CNN
	1    6350 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3450 6350 3450
Connection ~ 6450 2250
Wire Wire Line
	6450 1750 6550 1750
Connection ~ 6450 2750
Wire Wire Line
	6450 2250 6550 2250
Connection ~ 6450 3250
Wire Wire Line
	6450 2750 6550 2750
Wire Wire Line
	6450 3250 6450 2750
Wire Wire Line
	6450 3250 6550 3250
Wire Wire Line
	6450 3550 6450 3250
$Comp
L power:GNDD #PWR?
U 1 1 5E6E3D37
P 6450 3550
F 0 "#PWR?" H 6450 3300 50  0001 C CNN
F 1 "GNDD" H 6454 3395 50  0000 C CNN
F 2 "" H 6450 3550 50  0001 C CNN
F 3 "" H 6450 3550 50  0001 C CNN
	1    6450 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	7650 2650 7750 2550
Entry Wire Line
	7650 2550 7750 2450
Entry Wire Line
	7650 2450 7750 2350
Entry Wire Line
	7650 2350 7750 2250
Entry Wire Line
	7650 2150 7750 2050
Entry Wire Line
	7650 2050 7750 1950
Entry Wire Line
	7650 1950 7750 1850
Entry Wire Line
	7650 1850 7750 1750
$Comp
L power:GNDD #PWR?
U 1 1 5E6E3D29
P 7150 3550
F 0 "#PWR?" H 7150 3300 50  0001 C CNN
F 1 "GNDD" H 7154 3395 50  0000 C CNN
F 2 "" H 7150 3550 50  0001 C CNN
F 3 "" H 7150 3550 50  0001 C CNN
	1    7150 3550
	1    0    0    -1  
$EndComp
Connection ~ 7250 1550
Wire Wire Line
	7250 1550 7250 1450
Wire Wire Line
	7050 1550 7250 1550
Wire Wire Line
	7250 3450 7250 1550
Wire Wire Line
	7050 3450 7250 3450
Connection ~ 7150 2250
Wire Wire Line
	7050 2250 7150 2250
Wire Wire Line
	7150 2750 7150 3250
Connection ~ 7150 2750
Wire Wire Line
	7050 2750 7150 2750
Wire Wire Line
	7150 3250 7150 3550
Connection ~ 7150 3250
Wire Wire Line
	7050 3250 7150 3250
Wire Wire Line
	7050 1750 7150 1750
$Comp
L power:VCC #PWR?
U 1 1 5E6E3D15
P 7250 1450
F 0 "#PWR?" H 7250 1300 50  0001 C CNN
F 1 "VCC" H 7267 1623 50  0000 C CNN
F 2 "" H 7250 1450 50  0001 C CNN
F 3 "" H 7250 1450 50  0001 C CNN
	1    7250 1450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J11
U 1 1 5E6E3D0F
P 6750 2450
F 0 "J11" H 6800 3567 50  0000 C CNN
F 1 "CPU0" H 6800 3476 50  0000 C CNN
F 2 "" H 6750 2450 50  0001 C CNN
F 3 "~" H 6750 2450 50  0001 C CNN
	1    6750 2450
	1    0    0    -1  
$EndComp
Text GLabel 6250 3350 0    50   Input ~ 0
mclk
Text GLabel 8300 1650 0    50   Output ~ 0
~rst
Text GLabel 8300 3350 0    50   Output ~ 0
DA16
Text GLabel 7900 3350 3    50   Output ~ 0
Ei[0..3]
Text GLabel 9800 1450 1    50   Output ~ 0
PA[0..15]
Text GLabel 7900 1450 1    50   Output ~ 0
PD[0..7]
Text GLabel 9400 3350 2    50   Output ~ 0
~xoe
Text GLabel 9400 3150 2    50   Output ~ 0
~dwe
Text GLabel 9400 3050 2    50   Output ~ 0
~doe
Text GLabel 9400 2950 2    50   Output ~ 0
~eoe
Text GLabel 9400 2850 2    50   Output ~ 0
~xroe
Text GLabel 7750 1450 1    50   Input ~ 0
PA[0..15]
Text GLabel 5850 1450 1    50   Input ~ 0
DD[0..7]
Text GLabel 7350 3350 2    50   Input ~ 0
mclk
Text GLabel 7350 3150 2    50   Input ~ 0
qclk1
Text GLabel 6250 3150 0    50   Input ~ 0
pclk1
Text GLabel 7350 3050 2    50   Output ~ 0
~yle
Text GLabel 6250 3050 0    50   Output ~ 0
~xle
Text GLabel 7350 2950 2    50   Output ~ 0
~eyle
Text GLabel 6250 2950 0    50   Output ~ 0
~exle
Text GLabel 7350 2850 2    50   Output ~ 0
~ele
Text GLabel 6250 2850 0    50   Output ~ 0
~vle
Wire Bus Line
	3250 2950 3250 3350
Wire Bus Line
	7900 2950 7900 3350
Wire Bus Line
	1200 1450 1200 2550
Wire Bus Line
	3250 1450 3250 2550
Wire Bus Line
	5150 1450 5150 2550
Wire Bus Line
	3100 1450 3100 2550
Wire Bus Line
	8600 5300 9400 5300
Wire Bus Line
	5850 1450 5850 2550
Wire Bus Line
	7750 1450 7750 2550
Wire Bus Line
	9800 1450 9800 2550
Wire Bus Line
	7900 1450 7900 2550
Wire Bus Line
	6200 5300 8050 5300
$EndSCHEMATC
