EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "YATAC78 TTL Computer"
Date "2019-05-26"
Rev "0.6"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS175 U11
U 1 1 5CDF2414
P 4700 5750
F 0 "U11" H 4700 5750 50  0000 C CNN
F 1 "74F175" H 4700 5650 50  0000 C CNN
F 2 "" H 4700 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 4700 5750 50  0001 C CNN
	1    4700 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6300 2000 6300
Wire Wire Line
	1300 6300 1500 6300
Wire Wire Line
	1300 5350 1300 5800
Wire Wire Line
	1350 5350 1300 5350
Wire Wire Line
	1300 5800 1500 5800
Wire Wire Line
	1800 5800 2000 5800
Wire Wire Line
	2000 5350 2050 5350
Connection ~ 2000 5350
Wire Wire Line
	1950 5350 2000 5350
Text GLabel 3750 6250 0    50   Input ~ 0
~rst
Text GLabel 3600 4800 2    50   Output ~ 0
cclk
Text GLabel 3600 5000 2    50   Output ~ 0
dclk
Wire Wire Line
	4000 5950 4200 5950
Wire Wire Line
	4000 6950 4000 5950
Wire Wire Line
	5400 6950 4000 6950
Wire Wire Line
	5400 5750 5400 6950
Wire Wire Line
	4150 5750 4150 5550
Wire Wire Line
	4200 5750 4150 5750
Wire Wire Line
	4150 5550 4200 5550
Connection ~ 4150 5750
Wire Wire Line
	4150 6800 4150 5750
Wire Wire Line
	5250 6800 4150 6800
Wire Wire Line
	5250 6050 5250 6800
Wire Wire Line
	5200 6050 5250 6050
Wire Wire Line
	5200 5450 5250 5450
Wire Wire Line
	5200 5750 5400 5750
$Comp
L power:GNDD #PWR0103
U 1 1 5CDF244F
P 2000 6700
AR Path="/5CDF244F" Ref="#PWR0103"  Part="1" 
AR Path="/5CDEEC9F/5CDF244F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 2000 6450 50  0001 C CNN
F 1 "GNDD" H 2004 6545 50  0000 C CNN
F 2 "" H 2000 6700 50  0001 C CNN
F 3 "" H 2000 6700 50  0001 C CNN
	1    2000 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 5CDF2455
P 1300 6700
AR Path="/5CDF2455" Ref="#PWR0104"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 1300 6450 50  0001 C CNN
F 1 "GNDD" H 1304 6545 50  0000 C CNN
F 2 "" H 1300 6700 50  0001 C CNN
F 3 "" H 1300 6700 50  0001 C CNN
	1    1300 6700
	1    0    0    -1  
$EndComp
Connection ~ 2000 5800
Wire Wire Line
	2000 5900 2000 5800
Connection ~ 1300 5800
Wire Wire Line
	1300 5800 1300 6300
Connection ~ 1300 6300
Wire Wire Line
	1300 6400 1300 6300
Wire Wire Line
	2000 6300 2000 6200
Connection ~ 2000 6300
Wire Wire Line
	2000 6400 2000 6300
$Comp
L Device:C C12
U 1 1 5CDF2470
P 2000 6550
AR Path="/5CDF2470" Ref="C12"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C12" H 2115 6596 50  0000 L CNN
F 1 "22p" H 2115 6505 50  0000 L CNN
F 2 "" H 2038 6400 50  0001 C CNN
F 3 "~" H 2000 6550 50  0001 C CNN
	1    2000 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5CDF2476
P 1300 6550
AR Path="/5CDF2476" Ref="C11"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C11" H 1415 6596 50  0000 L CNN
F 1 "22p" H 1415 6505 50  0000 L CNN
F 2 "" H 1338 6400 50  0001 C CNN
F 3 "~" H 1300 6550 50  0001 C CNN
	1    1300 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CDF247C
P 1650 6300
AR Path="/5CDF247C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y1" H 1650 6568 50  0000 C CNN
F 1 "30.875" H 1650 6477 50  0000 C CNN
F 2 "" H 1650 6300 50  0001 C CNN
F 3 "~" H 1650 6300 50  0001 C CNN
	1    1650 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 2 1 5CDF2482
P 2350 5350
AR Path="/5CDF2482" Ref="U8"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U8" H 2300 5350 50  0000 C CNN
F 1 "74F04" H 2400 5200 50  0001 C CNN
F 2 "" H 2350 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2350 5350 50  0001 C CNN
	2    2350 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 1 1 5CDF2488
P 1650 5350
AR Path="/5CDF2488" Ref="U8"  Part="1" 
AR Path="/5CDEEC9F/5CDF2488" Ref="U?"  Part="1" 
F 0 "U8" H 1600 5350 50  0000 C CNN
F 1 "74F04" H 1700 5200 50  0001 C CNN
F 2 "" H 1650 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1650 5350 50  0001 C CNN
	1    1650 5350
	1    0    0    -1  
$EndComp
Text GLabel 5600 5450 2    50   Output ~ 0
nclk
Text GLabel 5600 5350 2    50   Output ~ 0
mclk
Text GLabel 5600 6050 2    50   Output ~ 0
sclk
Text GLabel 5600 5950 2    50   Output ~ 0
rclk
Text GLabel 5600 5850 2    50   Output ~ 0
qclk2
Text GLabel 5600 5750 2    50   Output ~ 0
pclk2
Text GLabel 5600 5650 2    50   Output ~ 0
qclk1
Text GLabel 5600 5550 2    50   Output ~ 0
pclk1
Wire Wire Line
	2000 5350 2000 5800
$Sheet
S 7000 5650 600  600 
U 5DAA19D5
F0 "CPU" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
$Sheet
S 8100 5650 600  600 
U 5DAA5CD8
F0 "ECU" 50
F1 "YATAC-ECU.sch" 50
$EndSheet
$Sheet
S 9200 5650 600  600 
U 5DAA3954
F0 "GPU" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
$Comp
L Device:R_US R?
U 1 1 66F86918
P 1650 5800
AR Path="/62D13D9D/66F86918" Ref="R?"  Part="1" 
AR Path="/66F86918" Ref="R1"  Part="1" 
F 0 "R1" V 1855 5800 50  0000 C CNN
F 1 "1k" V 1764 5800 50  0000 C CNN
F 2 "" V 1690 5790 50  0001 C CNN
F 3 "~" H 1650 5800 50  0001 C CNN
	1    1650 5800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86922
P 2000 6050
AR Path="/62D13D9D/66F86922" Ref="R?"  Part="1" 
AR Path="/66F86922" Ref="R2"  Part="1" 
F 0 "R2" H 2100 6100 50  0000 L CNN
F 1 "270" H 2100 6000 50  0000 L CNN
F 2 "" V 2040 6040 50  0001 C CNN
F 3 "~" H 2000 6050 50  0001 C CNN
	1    2000 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 671AAE18
P 4700 6550
F 0 "#PWR0102" H 4700 6300 50  0001 C CNN
F 1 "GNDD" H 4704 6395 50  0000 C CNN
F 2 "" H 4700 6550 50  0001 C CNN
F 3 "" H 4700 6550 50  0001 C CNN
	1    4700 6550
	1    0    0    -1  
$EndComp
Text Notes 7000 6650 0    45   ~ 0
Top sheet contains main clock circuit and mating connectors to join the CPU and GPU boards.
$Comp
L power:VCC #PWR0101
U 1 1 5ECE2E58
P 4700 5050
F 0 "#PWR0101" H 4700 4900 50  0001 C CNN
F 1 "VCC" H 4717 5223 50  0000 C CNN
F 2 "" H 4700 5050 50  0001 C CNN
F 3 "" H 4700 5050 50  0001 C CNN
	1    4700 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN1
U 1 1 6165F43D
P 7750 4650
F 0 "RN1" H 7650 4950 50  0000 L CNN
F 1 "270" H 7650 4850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8225 4650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7750 4650 50  0001 C CNN
	1    7750 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 616603F5
P 8800 4650
F 0 "RN2" H 8700 4950 50  0000 L CNN
F 1 "270" H 8700 4850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 9275 4650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8800 4650 50  0001 C CNN
	1    8800 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN3
U 1 1 61662F7D
P 9850 4650
F 0 "RN3" H 9750 4950 50  0000 L CNN
F 1 "270" H 9750 4850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10325 4650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9850 4650 50  0001 C CNN
	1    9850 4650
	1    0    0    -1  
$EndComp
Entry Wire Line
	7350 5150 7450 5050
Entry Wire Line
	7250 5150 7350 5050
Entry Wire Line
	7550 5150 7650 5050
Entry Wire Line
	7450 5150 7550 5050
Entry Wire Line
	7750 5150 7850 5050
Entry Wire Line
	7650 5150 7750 5050
Entry Wire Line
	7950 5150 8050 5050
Entry Wire Line
	7850 5150 7950 5050
Entry Wire Line
	8400 5150 8500 5050
Entry Wire Line
	8300 5150 8400 5050
Entry Wire Line
	8600 5150 8700 5050
Entry Wire Line
	8500 5150 8600 5050
Entry Wire Line
	8800 5150 8900 5050
Entry Wire Line
	8700 5150 8800 5050
Entry Wire Line
	9000 5150 9100 5050
Entry Wire Line
	8900 5150 9000 5050
Entry Wire Line
	9550 5150 9450 5050
Entry Wire Line
	10250 5150 10150 5050
Entry Wire Line
	9750 5150 9650 5050
Entry Wire Line
	9650 5150 9550 5050
Entry Wire Line
	9950 5150 9850 5050
Entry Wire Line
	9850 5150 9750 5050
Entry Wire Line
	10150 5150 10050 5050
Entry Wire Line
	10050 5150 9950 5050
Text GLabel 7150 5150 0    50   Input ~ 0
DA[0..15]
Text GLabel 10350 5150 2    50   Input ~ 0
PA[0..15]
Wire Wire Line
	7350 5050 7350 4850
Wire Wire Line
	7450 5050 7450 4850
Wire Wire Line
	7550 5050 7550 4850
Wire Wire Line
	7650 5050 7650 4850
Wire Wire Line
	7750 5050 7750 4850
Wire Wire Line
	7850 5050 7850 4850
Wire Wire Line
	7950 5050 7950 4850
Wire Wire Line
	8050 5050 8050 4850
Wire Wire Line
	8400 5050 8400 4850
Wire Wire Line
	8500 5050 8500 4850
Wire Wire Line
	8600 5050 8600 4850
Wire Wire Line
	8700 5050 8700 4850
Wire Wire Line
	8800 5050 8800 4850
Wire Wire Line
	8900 5050 8900 4850
Wire Wire Line
	9000 5050 9000 4850
Wire Wire Line
	9100 5050 9100 4850
Text Label 7350 5050 1    50   ~ 0
DA0
Text Label 7450 5050 1    50   ~ 0
DA1
Text Label 7550 5050 1    50   ~ 0
DA2
Text Label 7650 5050 1    50   ~ 0
DA3
Text Label 7750 5050 1    50   ~ 0
DA4
Text Label 7850 5050 1    50   ~ 0
DA5
Text Label 7950 5050 1    50   ~ 0
DA6
Text Label 8050 5050 1    50   ~ 0
DA7
Text Label 8400 5050 1    50   ~ 0
DA8
Text Label 8500 5050 1    50   ~ 0
DA9
Text Label 8600 5050 1    50   ~ 0
DA10
Text Label 8700 5050 1    50   ~ 0
DA11
Text Label 8800 5050 1    50   ~ 0
DA12
Text Label 8900 5050 1    50   ~ 0
DA13
Text Label 9000 5050 1    50   ~ 0
DA14
Text Label 9100 5050 1    50   ~ 0
DA15
Wire Wire Line
	9450 5050 9450 4850
Wire Wire Line
	9550 5050 9550 4850
Wire Wire Line
	9650 5050 9650 4850
Wire Wire Line
	9750 5050 9750 4850
Wire Wire Line
	9850 5050 9850 4850
Wire Wire Line
	9950 5050 9950 4850
Wire Wire Line
	10050 5050 10050 4850
Wire Wire Line
	10150 5050 10150 4850
Text Label 9450 5050 1    50   ~ 0
PA8
Text Label 9550 5050 1    50   ~ 0
PA9
Text Label 9650 5050 1    50   ~ 0
PA10
Text Label 9750 5050 1    50   ~ 0
PA11
Text Label 9850 5050 1    50   ~ 0
PA12
Text Label 9950 5050 1    50   ~ 0
PA13
Text Label 10050 5050 1    50   ~ 0
PA14
Text Label 10150 5050 1    50   ~ 0
PA15
$Comp
L power:VCC #PWR0201
U 1 1 5CEDC305
P 9450 4350
F 0 "#PWR0201" H 9450 4200 50  0001 C CNN
F 1 "VCC" H 9467 4523 50  0000 C CNN
F 2 "" H 9450 4350 50  0001 C CNN
F 3 "" H 9450 4350 50  0001 C CNN
	1    9450 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4350 9450 4450
$Comp
L power:VCC #PWR0204
U 1 1 5D4B22A2
P 8400 4350
F 0 "#PWR0204" H 8400 4200 50  0001 C CNN
F 1 "VCC" H 8417 4523 50  0000 C CNN
F 2 "" H 8400 4350 50  0001 C CNN
F 3 "" H 8400 4350 50  0001 C CNN
	1    8400 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4350 8400 4450
$Comp
L power:VCC #PWR0205
U 1 1 5D4C867C
P 7350 4350
F 0 "#PWR0205" H 7350 4200 50  0001 C CNN
F 1 "VCC" H 7367 4523 50  0000 C CNN
F 2 "" H 7350 4350 50  0001 C CNN
F 3 "" H 7350 4350 50  0001 C CNN
	1    7350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4350 7350 4450
$Sheet
S 10300 5650 600  600 
U 62D13D9D
F0 "IO" 50
F1 "YATAC-IO.sch" 50
$EndSheet
$Comp
L power:VCC #PWR0215
U 1 1 5D7870E2
P 2700 1400
F 0 "#PWR0215" H 2700 1250 50  0001 C CNN
F 1 "VCC" H 2717 1573 50  0000 C CNN
F 2 "" H 2700 1400 50  0001 C CNN
F 3 "" H 2700 1400 50  0001 C CNN
	1    2700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0216
U 1 1 5D7870EE
P 2600 3700
F 0 "#PWR0216" H 2600 3450 50  0001 C CNN
F 1 "GNDD" H 2604 3545 50  0000 C CNN
F 2 "" H 2600 3700 50  0001 C CNN
F 3 "" H 2600 3700 50  0001 C CNN
	1    2600 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	3100 1900 3200 1800
Entry Wire Line
	3100 2000 3200 1900
Entry Wire Line
	3100 2100 3200 2000
Entry Wire Line
	3100 2200 3200 2100
Entry Wire Line
	3100 2400 3200 2300
Entry Wire Line
	3100 2500 3200 2400
$Comp
L power:GNDD #PWR0217
U 1 1 5D787100
P 1900 3700
F 0 "#PWR0217" H 1900 3450 50  0001 C CNN
F 1 "GNDD" H 1904 3545 50  0000 C CNN
F 2 "" H 1900 3700 50  0001 C CNN
F 3 "" H 1900 3700 50  0001 C CNN
	1    1900 3700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0218
U 1 1 5D78710A
P 1800 1400
F 0 "#PWR0218" H 1800 1250 50  0001 C CNN
F 1 "VCC" H 1817 1573 50  0000 C CNN
F 2 "" H 1800 1400 50  0001 C CNN
F 3 "" H 1800 1400 50  0001 C CNN
	1    1800 1400
	1    0    0    -1  
$EndComp
Text GLabel 5250 1700 1    50   Input ~ 0
PA[0..15]
Text Label 1400 1900 0    50   ~ 0
PA0
Text Label 1400 2000 0    50   ~ 0
PA1
Text Label 1400 2100 0    50   ~ 0
PA2
Text Label 1400 2200 0    50   ~ 0
PA3
Text Label 1400 2400 0    50   ~ 0
PA4
Text Label 1400 2500 0    50   ~ 0
PA5
Entry Wire Line
	1300 3000 1400 2900
Entry Wire Line
	1300 3100 1400 3000
Entry Wire Line
	1300 3200 1400 3100
Entry Wire Line
	1300 3300 1400 3200
Text GLabel 1300 3400 3    50   Input ~ 0
Ei[0..3]
Text Label 1400 2900 0    50   ~ 0
Ei0
Text Label 1400 3000 0    50   ~ 0
Ei1
Text Label 1400 3100 0    50   ~ 0
Ei2
Text Label 1400 3200 0    50   ~ 0
Ei3
Text GLabel 4850 3400 2    50   Input ~ 0
DA16
Wire Wire Line
	1700 3400 2000 3400
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J9
U 1 1 5D787130
P 2200 2500
F 0 "J9" H 2250 3617 50  0000 C CNN
F 1 "GPU0" H 2250 3526 50  0000 C CNN
F 2 "" H 2200 2500 50  0001 C CNN
F 3 "~" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1700 2500 1700
Wire Wire Line
	2500 1900 3100 1900
Wire Wire Line
	2500 2000 3100 2000
Wire Wire Line
	2500 2100 3100 2100
Wire Wire Line
	2500 2200 3100 2200
Wire Wire Line
	2500 2400 3100 2400
Wire Wire Line
	2500 2500 3100 2500
Wire Wire Line
	1400 2900 2000 2900
Wire Wire Line
	2000 3000 1400 3000
Wire Wire Line
	1400 3100 2000 3100
Wire Wire Line
	2000 3200 1400 3200
Wire Wire Line
	2500 2600 3100 2600
Text Label 1400 2700 0    50   ~ 0
PA7
Text Label 1400 2600 0    50   ~ 0
PA6
Entry Wire Line
	3100 2700 3200 2600
Entry Wire Line
	3100 2600 3200 2500
Wire Wire Line
	2000 2800 1900 2800
Connection ~ 1900 2800
Wire Wire Line
	2000 2300 1900 2300
Connection ~ 1900 2300
Wire Wire Line
	1900 2300 1900 2800
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J10
U 1 1 5D787165
P 4250 2500
F 0 "J10" H 4300 3617 50  0000 C CNN
F 1 "GPU1" H 4300 3526 50  0000 C CNN
F 2 "" H 4250 2500 50  0001 C CNN
F 3 "~" H 4250 2500 50  0001 C CNN
	1    4250 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0219
U 1 1 5D78716B
P 4750 1400
F 0 "#PWR0219" H 4750 1250 50  0001 C CNN
F 1 "VCC" H 4767 1573 50  0000 C CNN
F 2 "" H 4750 1400 50  0001 C CNN
F 3 "" H 4750 1400 50  0001 C CNN
	1    4750 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0220
U 1 1 5D787178
P 4650 3700
F 0 "#PWR0220" H 4650 3450 50  0001 C CNN
F 1 "GNDD" H 4654 3545 50  0000 C CNN
F 2 "" H 4650 3700 50  0001 C CNN
F 3 "" H 4650 3700 50  0001 C CNN
	1    4650 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	5150 1900 5250 1800
Entry Wire Line
	5150 2000 5250 1900
Entry Wire Line
	5150 2100 5250 2000
Entry Wire Line
	5150 2200 5250 2100
Entry Wire Line
	5150 2400 5250 2300
Entry Wire Line
	5150 2500 5250 2400
$Comp
L power:GNDD #PWR0221
U 1 1 5D787184
P 3950 3700
F 0 "#PWR0221" H 3950 3450 50  0001 C CNN
F 1 "GNDD" H 3954 3545 50  0000 C CNN
F 2 "" H 3950 3700 50  0001 C CNN
F 3 "" H 3950 3700 50  0001 C CNN
	1    3950 3700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0222
U 1 1 5D78718E
P 3850 1400
F 0 "#PWR0222" H 3850 1250 50  0001 C CNN
F 1 "VCC" H 3867 1573 50  0000 C CNN
F 2 "" H 3850 1400 50  0001 C CNN
F 3 "" H 3850 1400 50  0001 C CNN
	1    3850 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2900 4850 2900
Wire Wire Line
	4550 3000 4850 3000
Wire Wire Line
	4550 3100 4850 3100
Wire Wire Line
	4550 3200 4850 3200
Wire Wire Line
	3750 2900 4050 2900
Wire Wire Line
	3750 3000 4050 3000
Wire Wire Line
	3750 3100 4050 3100
Wire Wire Line
	3750 3200 4050 3200
Wire Wire Line
	4550 3400 4850 3400
Text GLabel 3750 2900 0    50   Input ~ 0
~vle
Text GLabel 3750 3000 0    50   Input ~ 0
~ele
Text GLabel 3750 3100 0    50   Input ~ 0
~exle
Text GLabel 3750 3200 0    50   Input ~ 0
~xle
Text GLabel 3750 3400 0    50   Input ~ 0
~yle
Text GLabel 1300 1700 1    50   Output ~ 0
PA[0..15]
Text Label 2950 1900 0    50   ~ 0
DD0
Text Label 2950 2000 0    50   ~ 0
DD1
Text Label 2950 2100 0    50   ~ 0
DD2
Text Label 2950 2200 0    50   ~ 0
DD3
Text Label 2950 2400 0    50   ~ 0
DD4
Text Label 2950 2500 0    50   ~ 0
DD5
Text Label 2950 2600 0    50   ~ 0
DD6
Text Label 2950 2700 0    50   ~ 0
DD7
Text GLabel 3200 1700 1    50   Output ~ 0
DD[0..7]
Entry Wire Line
	1300 2600 1400 2700
Entry Wire Line
	1300 2500 1400 2600
Entry Wire Line
	1300 2400 1400 2500
Entry Wire Line
	1300 2300 1400 2400
Entry Wire Line
	1300 2100 1400 2200
Entry Wire Line
	1300 2000 1400 2100
Entry Wire Line
	1300 1900 1400 2000
Entry Wire Line
	1300 1800 1400 1900
Wire Wire Line
	4850 1700 4550 1700
Entry Wire Line
	5150 2700 5250 2600
Entry Wire Line
	5150 2600 5250 2500
Text GLabel 4850 2900 2    50   Input ~ 0
~xroe
Text GLabel 4850 3000 2    50   Input ~ 0
~eoe
Text GLabel 4850 3100 2    50   Input ~ 0
~doe
Text GLabel 4850 3200 2    50   Input ~ 0
~dwe
Text GLabel 4850 1700 2    50   Input ~ 0
~xoe
Text Label 4950 2600 0    50   ~ 0
PA14
Text Label 4950 2700 0    50   ~ 0
PA15
Wire Wire Line
	5150 2600 4550 2600
Wire Wire Line
	4550 2700 5150 2700
Wire Wire Line
	4550 2500 5150 2500
Wire Wire Line
	5150 2400 4550 2400
Wire Wire Line
	4550 2200 5150 2200
Wire Wire Line
	4550 2100 5150 2100
Wire Wire Line
	5150 2000 4550 2000
Wire Wire Line
	4550 1900 5150 1900
Text Label 4950 2500 0    50   ~ 0
PA13
Text Label 4950 2400 0    50   ~ 0
PA12
Text Label 4950 2200 0    50   ~ 0
PA11
Text Label 4950 2100 0    50   ~ 0
PA10
Text Label 4950 2000 0    50   ~ 0
PA9
Text Label 4950 1900 0    50   ~ 0
PA8
Wire Wire Line
	1400 1900 2000 1900
Wire Wire Line
	2000 2000 1400 2000
Wire Wire Line
	1400 2100 2000 2100
Wire Wire Line
	2000 2200 1400 2200
Wire Wire Line
	1400 2400 2000 2400
Wire Wire Line
	1400 2500 2000 2500
Wire Wire Line
	2000 2600 1400 2600
Wire Wire Line
	1400 2700 2000 2700
Text GLabel 3750 1700 0    50   Input ~ 0
~rst
Wire Wire Line
	3450 2600 4050 2600
Wire Wire Line
	3450 2700 4050 2700
Text Label 3450 2700 0    50   ~ 0
PD7
Text Label 3450 2600 0    50   ~ 0
PD6
Entry Wire Line
	3350 2600 3450 2700
Entry Wire Line
	3350 2500 3450 2600
Wire Wire Line
	4050 2500 3450 2500
Wire Wire Line
	3450 2400 4050 2400
Wire Wire Line
	4050 2200 3450 2200
Wire Wire Line
	3450 2100 4050 2100
Wire Wire Line
	4050 2000 3450 2000
Wire Wire Line
	3450 1900 4050 1900
Text Label 3450 2500 0    50   ~ 0
PD5
Text Label 3450 2400 0    50   ~ 0
PD4
Text Label 3450 2200 0    50   ~ 0
PD3
Text Label 3450 2100 0    50   ~ 0
PD2
Text Label 3450 2000 0    50   ~ 0
PD1
Text Label 3450 1900 0    50   ~ 0
PD0
Text GLabel 3350 1700 1    50   Input ~ 0
PD[0..7]
Entry Wire Line
	3350 2400 3450 2500
Entry Wire Line
	3350 2400 3450 2500
Entry Wire Line
	3350 2100 3450 2200
Entry Wire Line
	3350 2000 3450 2100
Entry Wire Line
	3350 1900 3450 2000
Entry Wire Line
	3350 1800 3450 1900
Text GLabel 2800 3100 2    50   Input ~ 0
U2Di
Wire Wire Line
	4750 1400 4750 1600
Wire Wire Line
	3850 1400 3850 1600
Wire Wire Line
	3950 3500 4050 3500
Wire Wire Line
	4650 3500 4650 3700
Wire Wire Line
	2600 3500 2600 3700
Wire Wire Line
	1900 3500 2000 3500
Wire Wire Line
	1800 1400 1800 1600
Wire Wire Line
	2700 1400 2700 1600
Wire Wire Line
	2500 1800 2600 1800
Wire Wire Line
	2500 3300 2600 3300
Wire Wire Line
	4550 3300 4650 3300
Wire Wire Line
	4550 1800 4650 1800
Wire Wire Line
	1900 1800 2000 1800
Wire Wire Line
	1900 3300 2000 3300
Wire Wire Line
	3950 1800 4050 1800
Wire Wire Line
	3950 3300 4050 3300
Wire Wire Line
	1900 2800 1900 3300
Wire Wire Line
	1900 3500 1800 3500
Connection ~ 1900 3300
Connection ~ 1800 1600
Connection ~ 2700 1600
Wire Wire Line
	1900 1800 1900 2300
Wire Wire Line
	1800 1600 2000 1600
Wire Wire Line
	2500 1600 2700 1600
Wire Wire Line
	1800 1600 1800 3500
Connection ~ 2600 3300
Wire Wire Line
	2600 3300 2600 3500
Wire Wire Line
	2700 1600 2700 3500
Wire Wire Line
	1900 3300 1900 3700
Wire Wire Line
	2500 3500 2700 3500
Connection ~ 3850 1600
Connection ~ 4750 1600
Wire Wire Line
	4550 1600 4750 1600
Wire Wire Line
	3850 1600 4050 1600
Wire Wire Line
	3950 3500 3850 3500
Connection ~ 3950 3300
Connection ~ 4650 3300
Wire Wire Line
	4650 3300 4650 3500
Wire Wire Line
	4750 1600 4750 3500
Wire Wire Line
	3850 1600 3850 3500
Wire Wire Line
	3950 3300 3950 3700
Wire Wire Line
	4550 3500 4750 3500
Wire Wire Line
	4650 1800 4650 2300
Wire Wire Line
	4550 2800 4650 2800
Connection ~ 4650 2800
Wire Wire Line
	4650 2800 4650 3300
Wire Wire Line
	4550 2300 4650 2300
Connection ~ 4650 2300
Wire Wire Line
	4650 2300 4650 2800
Text GLabel 1700 3400 0    50   Output ~ 0
pclk1
Entry Wire Line
	3350 2300 3450 2400
Wire Wire Line
	3750 3400 4050 3400
Wire Wire Line
	3950 1800 3950 2300
Wire Wire Line
	4050 2800 3950 2800
Connection ~ 3950 2800
Wire Wire Line
	3950 2800 3950 3300
Wire Wire Line
	4050 2300 3950 2300
Connection ~ 3950 2300
Wire Wire Line
	3950 2300 3950 2800
Wire Wire Line
	3750 1700 4050 1700
Wire Wire Line
	2500 2700 3100 2700
$Comp
L power:VCC #PWR0207
U 1 1 5D1232E9
P 7850 1400
F 0 "#PWR0207" H 7850 1250 50  0001 C CNN
F 1 "VCC" H 7867 1573 50  0000 C CNN
F 2 "" H 7850 1400 50  0001 C CNN
F 3 "" H 7850 1400 50  0001 C CNN
	1    7850 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0208
U 1 1 5D1232EF
P 7750 3700
F 0 "#PWR0208" H 7750 3450 50  0001 C CNN
F 1 "GNDD" H 7754 3545 50  0000 C CNN
F 2 "" H 7750 3700 50  0001 C CNN
F 3 "" H 7750 3700 50  0001 C CNN
	1    7750 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	8250 1900 8350 1800
Entry Wire Line
	8250 2000 8350 1900
Entry Wire Line
	8250 2100 8350 2000
Entry Wire Line
	8250 2200 8350 2100
Entry Wire Line
	8250 2400 8350 2300
Entry Wire Line
	8250 2500 8350 2400
$Comp
L power:GNDD #PWR0209
U 1 1 5D1232FB
P 7050 3700
F 0 "#PWR0209" H 7050 3450 50  0001 C CNN
F 1 "GNDD" H 7054 3545 50  0000 C CNN
F 2 "" H 7050 3700 50  0001 C CNN
F 3 "" H 7050 3700 50  0001 C CNN
	1    7050 3700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0210
U 1 1 5D123301
P 6950 1400
F 0 "#PWR0210" H 6950 1250 50  0001 C CNN
F 1 "VCC" H 6967 1573 50  0000 C CNN
F 2 "" H 6950 1400 50  0001 C CNN
F 3 "" H 6950 1400 50  0001 C CNN
	1    6950 1400
	1    0    0    -1  
$EndComp
Text GLabel 10400 1700 1    50   Output ~ 0
PA[0..15]
Text Label 6550 1900 0    50   ~ 0
PA0
Text Label 6550 2000 0    50   ~ 0
PA1
Text Label 6550 2100 0    50   ~ 0
PA2
Text Label 6550 2200 0    50   ~ 0
PA3
Text Label 6550 2400 0    50   ~ 0
PA4
Text Label 6550 2500 0    50   ~ 0
PA5
Entry Wire Line
	6450 3000 6550 2900
Entry Wire Line
	6450 3100 6550 3000
Entry Wire Line
	6450 3200 6550 3100
Entry Wire Line
	6450 3300 6550 3200
Text GLabel 6450 3400 3    50   Output ~ 0
Ei[0..3]
Text Label 6550 2900 0    50   ~ 0
Ei0
Text Label 6550 3000 0    50   ~ 0
Ei1
Text Label 6550 3100 0    50   ~ 0
Ei2
Text Label 6550 3200 0    50   ~ 0
Ei3
Text GLabel 10000 3400 2    50   Output ~ 0
DA16
Wire Wire Line
	6850 3400 7150 3400
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J11
U 1 1 5D12331E
P 7350 2500
F 0 "J11" H 7400 3617 50  0000 C CNN
F 1 "CPU0" H 7400 3526 50  0000 C CNN
F 2 "" H 7350 2500 50  0001 C CNN
F 3 "~" H 7350 2500 50  0001 C CNN
	1    7350 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1700 7650 1700
Wire Wire Line
	7650 1900 8250 1900
Wire Wire Line
	7650 2000 8250 2000
Wire Wire Line
	7650 2100 8250 2100
Wire Wire Line
	7650 2200 8250 2200
Wire Wire Line
	7650 2400 8250 2400
Wire Wire Line
	7650 2500 8250 2500
Wire Wire Line
	6550 2900 7150 2900
Wire Wire Line
	7150 3000 6550 3000
Wire Wire Line
	6550 3100 7150 3100
Wire Wire Line
	7150 3200 6550 3200
Wire Wire Line
	7650 2600 8250 2600
Text Label 6550 2700 0    50   ~ 0
PA7
Text Label 6550 2600 0    50   ~ 0
PA6
Entry Wire Line
	8250 2700 8350 2600
Entry Wire Line
	8250 2600 8350 2500
Wire Wire Line
	7150 2800 7050 2800
Connection ~ 7050 2800
Wire Wire Line
	7150 2300 7050 2300
Connection ~ 7050 2300
Wire Wire Line
	7050 2300 7050 2800
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J12
U 1 1 5D12333B
P 9400 2500
F 0 "J12" H 9450 3617 50  0000 C CNN
F 1 "CPU1" H 9450 3526 50  0000 C CNN
F 2 "" H 9400 2500 50  0001 C CNN
F 3 "~" H 9400 2500 50  0001 C CNN
	1    9400 2500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0211
U 1 1 5D123341
P 9900 1400
F 0 "#PWR0211" H 9900 1250 50  0001 C CNN
F 1 "VCC" H 9917 1573 50  0000 C CNN
F 2 "" H 9900 1400 50  0001 C CNN
F 3 "" H 9900 1400 50  0001 C CNN
	1    9900 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0212
U 1 1 5D123347
P 9800 3700
F 0 "#PWR0212" H 9800 3450 50  0001 C CNN
F 1 "GNDD" H 9804 3545 50  0000 C CNN
F 2 "" H 9800 3700 50  0001 C CNN
F 3 "" H 9800 3700 50  0001 C CNN
	1    9800 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	10300 1900 10400 1800
Entry Wire Line
	10300 2000 10400 1900
Entry Wire Line
	10300 2100 10400 2000
Entry Wire Line
	10300 2200 10400 2100
Entry Wire Line
	10300 2400 10400 2300
Entry Wire Line
	10300 2500 10400 2400
$Comp
L power:GNDD #PWR0213
U 1 1 5D123353
P 9100 3700
F 0 "#PWR0213" H 9100 3450 50  0001 C CNN
F 1 "GNDD" H 9104 3545 50  0000 C CNN
F 2 "" H 9100 3700 50  0001 C CNN
F 3 "" H 9100 3700 50  0001 C CNN
	1    9100 3700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0214
U 1 1 5D123359
P 9000 1400
F 0 "#PWR0214" H 9000 1250 50  0001 C CNN
F 1 "VCC" H 9017 1573 50  0000 C CNN
F 2 "" H 9000 1400 50  0001 C CNN
F 3 "" H 9000 1400 50  0001 C CNN
	1    9000 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 2900 10000 2900
Wire Wire Line
	9700 3000 10000 3000
Wire Wire Line
	9700 3100 10000 3100
Wire Wire Line
	9700 3200 10000 3200
Wire Wire Line
	8900 2900 9200 2900
Wire Wire Line
	8900 3000 9200 3000
Wire Wire Line
	8900 3100 9200 3100
Wire Wire Line
	8900 3200 9200 3200
Wire Wire Line
	9700 3400 10000 3400
Text GLabel 8900 2900 0    50   Output ~ 0
~vle
Text GLabel 8900 3000 0    50   Output ~ 0
~ele
Text GLabel 8900 3100 0    50   Output ~ 0
~exle
Text GLabel 8900 3200 0    50   Output ~ 0
~xle
Text GLabel 8900 3400 0    50   Output ~ 0
~yle
Text GLabel 6450 1700 1    50   Input ~ 0
PA[0..15]
Text Label 8100 1900 0    50   ~ 0
DD0
Text Label 8100 2000 0    50   ~ 0
DD1
Text Label 8100 2100 0    50   ~ 0
DD2
Text Label 8100 2200 0    50   ~ 0
DD3
Text Label 8100 2400 0    50   ~ 0
DD4
Text Label 8100 2500 0    50   ~ 0
DD5
Text Label 8100 2600 0    50   ~ 0
DD6
Text Label 8100 2700 0    50   ~ 0
DD7
Text GLabel 8350 1700 1    50   Input ~ 0
DD[0..7]
Entry Wire Line
	6450 2600 6550 2700
Entry Wire Line
	6450 2500 6550 2600
Entry Wire Line
	6450 2400 6550 2500
Entry Wire Line
	6450 2300 6550 2400
Entry Wire Line
	6450 2100 6550 2200
Entry Wire Line
	6450 2000 6550 2100
Entry Wire Line
	6450 1900 6550 2000
Entry Wire Line
	6450 1800 6550 1900
Wire Wire Line
	10000 1700 9700 1700
Entry Wire Line
	10300 2700 10400 2600
Entry Wire Line
	10300 2600 10400 2500
Text GLabel 10000 2900 2    50   Output ~ 0
~xroe
Text GLabel 10000 3000 2    50   Output ~ 0
~eoe
Text GLabel 10000 3100 2    50   Output ~ 0
~doe
Text GLabel 10000 3200 2    50   Output ~ 0
~dwe
Text GLabel 10000 1700 2    50   Output ~ 0
~xoe
Text Label 10100 2600 0    50   ~ 0
PA14
Text Label 10100 2700 0    50   ~ 0
PA15
Wire Wire Line
	10300 2600 9700 2600
Wire Wire Line
	9700 2700 10300 2700
Wire Wire Line
	9700 2500 10300 2500
Wire Wire Line
	10300 2400 9700 2400
Wire Wire Line
	9700 2200 10300 2200
Wire Wire Line
	9700 2100 10300 2100
Wire Wire Line
	10300 2000 9700 2000
Wire Wire Line
	9700 1900 10300 1900
Text Label 10100 2500 0    50   ~ 0
PA13
Text Label 10100 2400 0    50   ~ 0
PA12
Text Label 10100 2200 0    50   ~ 0
PA11
Text Label 10100 2100 0    50   ~ 0
PA10
Text Label 10100 2000 0    50   ~ 0
PA9
Text Label 10100 1900 0    50   ~ 0
PA8
Wire Wire Line
	6550 1900 7150 1900
Wire Wire Line
	7150 2000 6550 2000
Wire Wire Line
	6550 2100 7150 2100
Wire Wire Line
	7150 2200 6550 2200
Wire Wire Line
	6550 2400 7150 2400
Wire Wire Line
	6550 2500 7150 2500
Wire Wire Line
	7150 2600 6550 2600
Wire Wire Line
	6550 2700 7150 2700
Text GLabel 8900 1700 0    50   Output ~ 0
~rst
Wire Wire Line
	8600 2600 9200 2600
Wire Wire Line
	8600 2700 9200 2700
Text Label 8600 2700 0    50   ~ 0
PD7
Text Label 8600 2600 0    50   ~ 0
PD6
Entry Wire Line
	8500 2600 8600 2700
Entry Wire Line
	8500 2500 8600 2600
Wire Wire Line
	9200 2500 8600 2500
Wire Wire Line
	8600 2400 9200 2400
Wire Wire Line
	9200 2200 8600 2200
Wire Wire Line
	8600 2100 9200 2100
Wire Wire Line
	9200 2000 8600 2000
Wire Wire Line
	8600 1900 9200 1900
Text Label 8600 2500 0    50   ~ 0
PD5
Text Label 8600 2400 0    50   ~ 0
PD4
Text Label 8600 2200 0    50   ~ 0
PD3
Text Label 8600 2100 0    50   ~ 0
PD2
Text Label 8600 2000 0    50   ~ 0
PD1
Text Label 8600 1900 0    50   ~ 0
PD0
Text GLabel 8500 1700 1    50   Output ~ 0
PD[0..7]
Entry Wire Line
	8500 2400 8600 2500
Entry Wire Line
	8500 2400 8600 2500
Entry Wire Line
	8500 2100 8600 2200
Entry Wire Line
	8500 2000 8600 2100
Entry Wire Line
	8500 1900 8600 2000
Entry Wire Line
	8500 1800 8600 1900
Wire Wire Line
	9900 1400 9900 1600
Wire Wire Line
	9000 1400 9000 1600
Wire Wire Line
	9100 3500 9200 3500
Wire Wire Line
	9800 3500 9800 3700
Wire Wire Line
	7750 3500 7750 3700
Wire Wire Line
	7050 3500 7150 3500
Wire Wire Line
	6950 1400 6950 1600
Wire Wire Line
	7850 1400 7850 1600
Wire Wire Line
	7650 1800 7750 1800
Wire Wire Line
	7650 3300 7750 3300
Wire Wire Line
	9700 3300 9800 3300
Wire Wire Line
	9700 1800 9800 1800
Wire Wire Line
	7050 1800 7150 1800
Wire Wire Line
	7050 3300 7150 3300
Wire Wire Line
	9100 1800 9200 1800
Wire Wire Line
	9100 3300 9200 3300
Wire Wire Line
	7050 2800 7050 3300
Wire Wire Line
	7050 3500 6950 3500
Connection ~ 7050 3300
Connection ~ 6950 1600
Connection ~ 7850 1600
Wire Wire Line
	7050 1800 7050 2300
Wire Wire Line
	6950 1600 7150 1600
Wire Wire Line
	7650 1600 7850 1600
Wire Wire Line
	6950 1600 6950 3500
Connection ~ 7750 3300
Wire Wire Line
	7750 3300 7750 3500
Wire Wire Line
	7850 1600 7850 3500
Wire Wire Line
	7050 3300 7050 3700
Wire Wire Line
	7650 3500 7850 3500
Connection ~ 9000 1600
Connection ~ 9900 1600
Wire Wire Line
	9700 1600 9900 1600
Wire Wire Line
	9000 1600 9200 1600
Wire Wire Line
	9100 3500 9000 3500
Connection ~ 9100 3300
Connection ~ 9800 3300
Wire Wire Line
	9800 3300 9800 3500
Wire Wire Line
	9900 1600 9900 3500
Wire Wire Line
	9000 1600 9000 3500
Wire Wire Line
	9100 3300 9100 3700
Wire Wire Line
	9700 3500 9900 3500
Wire Wire Line
	9800 1800 9800 2300
Wire Wire Line
	9700 2800 9800 2800
Connection ~ 9800 2800
Wire Wire Line
	9800 2800 9800 3300
Wire Wire Line
	9700 2300 9800 2300
Connection ~ 9800 2300
Wire Wire Line
	9800 2300 9800 2800
Text GLabel 6850 3400 0    50   Input ~ 0
pclk1
Entry Wire Line
	8500 2300 8600 2400
Wire Wire Line
	8900 3400 9200 3400
Wire Wire Line
	9100 1800 9100 2300
Wire Wire Line
	9200 2800 9100 2800
Connection ~ 9100 2800
Wire Wire Line
	9100 2800 9100 3300
Wire Wire Line
	9200 2300 9100 2300
Connection ~ 9100 2300
Wire Wire Line
	9100 2300 9100 2800
Wire Wire Line
	8900 1700 9200 1700
Wire Wire Line
	7650 2700 8250 2700
Wire Wire Line
	4150 5350 4150 4750
Wire Wire Line
	4150 4750 5250 4750
Wire Wire Line
	4150 5350 4200 5350
Wire Wire Line
	5250 4750 5250 5450
Wire Wire Line
	5250 6050 5600 6050
Connection ~ 5250 6050
Wire Wire Line
	5200 5950 5600 5950
Wire Wire Line
	5200 5850 5600 5850
Wire Wire Line
	5400 5750 5600 5750
Connection ~ 5400 5750
Wire Wire Line
	5200 5650 5600 5650
Wire Wire Line
	5200 5550 5600 5550
Wire Wire Line
	5250 5450 5600 5450
Connection ~ 5250 5450
Wire Wire Line
	5200 5350 5600 5350
$Comp
L 74xx:74LS04 U?
U 3 1 5D31EE5B
P 3050 5350
AR Path="/5CDEEC9F/5D31EE5B" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5D31EE5B" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5D31EE5B" Ref="U?"  Part="3" 
AR Path="/5D31EE5B" Ref="U8"  Part="3" 
F 0 "U8" H 3000 5350 50  0000 C CNN
F 1 "74F04" H 3150 5200 50  0001 C CNN
F 2 "" H 3050 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3050 5350 50  0001 C CNN
	3    3050 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 5350 2700 5350
Connection ~ 2700 5350
Wire Wire Line
	2700 5350 2750 5350
Wire Wire Line
	3850 6150 3850 5350
Wire Wire Line
	3850 6150 4200 6150
Wire Wire Line
	3350 5350 3400 5350
Wire Wire Line
	3750 6250 4200 6250
Wire Wire Line
	3400 5350 3400 5000
Wire Wire Line
	3400 5000 3600 5000
Connection ~ 3400 5350
Wire Wire Line
	3400 5350 3850 5350
Wire Wire Line
	2700 4800 3600 4800
Wire Wire Line
	2700 4800 2700 5350
Wire Wire Line
	2600 1800 2600 2300
Wire Wire Line
	2500 2300 2600 2300
Connection ~ 2600 2300
Wire Wire Line
	7750 1800 7750 2300
Wire Wire Line
	7650 2300 7750 2300
Connection ~ 7750 2300
Wire Wire Line
	7750 2300 7750 2800
Wire Wire Line
	7650 2800 7750 2800
Connection ~ 7750 2800
Text GLabel 2800 2900 2    50   Output ~ 0
mclk
Text GLabel 2800 3400 2    50   Output ~ 0
qclk1
Wire Wire Line
	2500 3400 2800 3400
Wire Wire Line
	2500 3200 2800 3200
Wire Wire Line
	2500 3100 2800 3100
Text GLabel 7950 3400 2    50   Input ~ 0
qclk1
Text GLabel 7950 2900 2    50   Input ~ 0
mclk
Wire Wire Line
	7750 2800 7750 3300
Wire Wire Line
	7950 2900 7650 2900
Wire Wire Line
	7650 3100 7950 3100
Wire Wire Line
	7650 3200 7950 3200
Wire Wire Line
	7650 3400 7950 3400
Wire Wire Line
	2600 2300 2600 2800
Wire Wire Line
	2500 2800 2600 2800
Connection ~ 2600 2800
Wire Wire Line
	2600 2800 2600 3300
Wire Wire Line
	2500 2900 2800 2900
Text GLabel 2800 3000 2    50   Output ~ 0
U2Do
Wire Wire Line
	2500 3000 2800 3000
Wire Wire Line
	7650 3000 7950 3000
Text GLabel 7950 3100 2    50   Output ~ 0
U2Di
Text GLabel 7950 3000 2    50   Input ~ 0
U2Do
Wire Wire Line
	1700 1700 2000 1700
Wire Wire Line
	6850 1700 7150 1700
Text GLabel 7950 3200 2    50   Input ~ 0
mclk
Text GLabel 7950 1700 2    50   Input ~ 0
qclk1
Text GLabel 6850 1700 0    50   Input ~ 0
pclk1
Text GLabel 2800 3200 2    50   Output ~ 0
mclk
Text GLabel 2800 1700 2    50   Output ~ 0
qclk1
Text GLabel 1700 1700 0    50   Output ~ 0
pclk1
Wire Bus Line
	6450 3000 6450 3400
Wire Bus Line
	1300 3000 1300 3400
Wire Bus Line
	3350 1700 3350 2600
Wire Bus Line
	8500 1700 8500 2600
Wire Bus Line
	6450 1700 6450 2600
Wire Bus Line
	10400 1700 10400 2600
Wire Bus Line
	8350 1700 8350 2600
Wire Bus Line
	1300 1700 1300 2600
Wire Bus Line
	5250 1700 5250 2600
Wire Bus Line
	3200 1700 3200 2600
Wire Bus Line
	9550 5150 10350 5150
Wire Bus Line
	7150 5150 9000 5150
$EndSCHEMATC
