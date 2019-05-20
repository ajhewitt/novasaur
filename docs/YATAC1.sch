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
$Comp
L power:VCC #PWR0101
U 1 1 5CDF2407
P 3950 4550
F 0 "#PWR0101" H 3950 4400 50  0001 C CNN
F 1 "VCC" H 3967 4723 50  0000 C CNN
F 2 "" H 3950 4550 50  0001 C CNN
F 3 "" H 3950 4550 50  0001 C CNN
	1    3950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5650 3450 5650
$Comp
L 74xx:74LS175 U11
U 1 1 5CDF2414
P 3950 5250
F 0 "U11" H 3950 5250 50  0000 C CNN
F 1 "74F175" H 3950 5150 50  0000 C CNN
F 2 "" H 3950 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 3950 5250 50  0001 C CNN
	1    3950 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 5800 2250 5800
Wire Wire Line
	1550 5800 1750 5800
Wire Wire Line
	1550 4850 1550 5300
Wire Wire Line
	1600 4850 1550 4850
Wire Wire Line
	1550 5300 1750 5300
Wire Wire Line
	2050 5300 2250 5300
Wire Wire Line
	2250 4850 2300 4850
Connection ~ 2250 4850
Wire Wire Line
	2200 4850 2250 4850
Text GLabel 2900 5750 0    50   Input ~ 0
~rst
Text GLabel 3100 4450 2    50   Output ~ 0
cclk
Text GLabel 3100 4650 2    50   Output ~ 0
dclk
Wire Wire Line
	4800 4950 4900 4950
Wire Wire Line
	3100 4850 3450 4850
Wire Wire Line
	3100 6600 3100 4850
Wire Wire Line
	4800 6600 3100 6600
Wire Wire Line
	4800 4950 4800 6600
Wire Wire Line
	4650 5250 4900 5250
Wire Wire Line
	3250 5450 3450 5450
Wire Wire Line
	3250 6450 3250 5450
Wire Wire Line
	4650 6450 3250 6450
Wire Wire Line
	4650 5250 4650 6450
Wire Wire Line
	3400 5250 3400 5050
Wire Wire Line
	3450 5250 3400 5250
Wire Wire Line
	4500 5550 4900 5550
Wire Wire Line
	3400 5050 3450 5050
Connection ~ 3400 5250
Wire Wire Line
	3400 6300 3400 5250
Wire Wire Line
	4500 6300 3400 6300
Wire Wire Line
	4500 5550 4500 6300
Connection ~ 4500 5550
Wire Wire Line
	4450 5550 4500 5550
Connection ~ 4800 4950
Wire Wire Line
	4450 4950 4800 4950
Wire Wire Line
	4450 5450 4900 5450
Wire Wire Line
	4450 5350 4900 5350
Connection ~ 4650 5250
Wire Wire Line
	4450 5250 4650 5250
Wire Wire Line
	4450 5150 4900 5150
Wire Wire Line
	4450 4850 4900 4850
$Comp
L power:GNDD #PWR0103
U 1 1 5CDF244F
P 2250 6200
AR Path="/5CDF244F" Ref="#PWR0103"  Part="1" 
AR Path="/5CDEEC9F/5CDF244F" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 2250 5950 50  0001 C CNN
F 1 "GNDD" H 2254 6045 50  0000 C CNN
F 2 "" H 2250 6200 50  0001 C CNN
F 3 "" H 2250 6200 50  0001 C CNN
	1    2250 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 5CDF2455
P 1550 6200
AR Path="/5CDF2455" Ref="#PWR0104"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 1550 5950 50  0001 C CNN
F 1 "GNDD" H 1554 6045 50  0000 C CNN
F 2 "" H 1550 6200 50  0001 C CNN
F 3 "" H 1550 6200 50  0001 C CNN
	1    1550 6200
	1    0    0    -1  
$EndComp
Connection ~ 2250 5300
Wire Wire Line
	2250 5400 2250 5300
Connection ~ 1550 5300
Wire Wire Line
	1550 5300 1550 5800
Connection ~ 1550 5800
Wire Wire Line
	1550 5900 1550 5800
Wire Wire Line
	2250 5800 2250 5700
Connection ~ 2250 5800
Wire Wire Line
	2250 5900 2250 5800
$Comp
L Device:C C12
U 1 1 5CDF2470
P 2250 6050
AR Path="/5CDF2470" Ref="C12"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C12" H 2365 6096 50  0000 L CNN
F 1 "22p" H 2365 6005 50  0000 L CNN
F 2 "" H 2288 5900 50  0001 C CNN
F 3 "~" H 2250 6050 50  0001 C CNN
	1    2250 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5CDF2476
P 1550 6050
AR Path="/5CDF2476" Ref="C11"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C11" H 1665 6096 50  0000 L CNN
F 1 "22p" H 1665 6005 50  0000 L CNN
F 2 "" H 1588 5900 50  0001 C CNN
F 3 "~" H 1550 6050 50  0001 C CNN
	1    1550 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CDF247C
P 1900 5800
AR Path="/5CDF247C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y1" H 1900 6068 50  0000 C CNN
F 1 "30.875" H 1900 5977 50  0000 C CNN
F 2 "" H 1900 5800 50  0001 C CNN
F 3 "~" H 1900 5800 50  0001 C CNN
	1    1900 5800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 2 1 5CDF2482
P 2600 4850
AR Path="/5CDF2482" Ref="U8"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U8" H 2550 4850 50  0000 C CNN
F 1 "74F04" H 2650 4700 50  0001 C CNN
F 2 "" H 2600 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2600 4850 50  0001 C CNN
	2    2600 4850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U8
U 1 1 5CDF2488
P 1900 4850
AR Path="/5CDF2488" Ref="U8"  Part="1" 
AR Path="/5CDEEC9F/5CDF2488" Ref="U?"  Part="1" 
F 0 "U8" H 1850 4850 50  0000 C CNN
F 1 "74F04" H 1950 4700 50  0001 C CNN
F 2 "" H 1900 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1900 4850 50  0001 C CNN
	1    1900 4850
	1    0    0    -1  
$EndComp
Text GLabel 4900 4950 2    50   Output ~ 0
nclk
Text GLabel 4900 4850 2    50   Output ~ 0
mclk
Text GLabel 4900 5550 2    50   Output ~ 0
sclk
Text GLabel 4900 5450 2    50   Output ~ 0
rclk
Text GLabel 4900 5350 2    50   Output ~ 0
qclk2
Text GLabel 4900 5250 2    50   Output ~ 0
pclk2
Text GLabel 4900 5150 2    50   Output ~ 0
qclk1
Text GLabel 4900 5050 2    50   Output ~ 0
pclk1
Wire Wire Line
	2250 4850 2250 5300
Wire Wire Line
	2950 5650 2950 4850
Wire Wire Line
	2950 4850 2900 4850
Wire Wire Line
	3100 4650 2950 4650
Wire Wire Line
	2950 4650 2950 4850
Connection ~ 2950 4850
Wire Wire Line
	3450 5750 2900 5750
$Sheet
S 3500 7050 600  550 
U 5DAA3954
F0 "GPU" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
$Sheet
S 2300 7050 600  550 
U 5DAA5CD8
F0 "ECU" 50
F1 "YATAC-ECU.sch" 50
$EndSheet
$Sheet
S 1100 7050 600  550 
U 5DAA19D5
F0 "CPU" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Wire Wire Line
	2250 4850 2250 4450
Wire Wire Line
	2250 4450 3100 4450
$Sheet
S 4700 7050 600  550 
U 62D13D9D
F0 "IO" 50
F1 "YATAC-IO.sch" 50
$EndSheet
$Comp
L Device:R_US R?
U 1 1 66F86918
P 1900 5300
AR Path="/62D13D9D/66F86918" Ref="R?"  Part="1" 
AR Path="/66F86918" Ref="R5"  Part="1" 
F 0 "R5" V 2105 5300 50  0000 C CNN
F 1 "1k" V 2014 5300 50  0000 C CNN
F 2 "" V 1940 5290 50  0001 C CNN
F 3 "~" H 1900 5300 50  0001 C CNN
	1    1900 5300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86922
P 2250 5550
AR Path="/62D13D9D/66F86922" Ref="R?"  Part="1" 
AR Path="/66F86922" Ref="R6"  Part="1" 
F 0 "R6" H 2350 5600 50  0000 L CNN
F 1 "270" H 2350 5500 50  0000 L CNN
F 2 "" V 2290 5540 50  0001 C CNN
F 3 "~" H 2250 5550 50  0001 C CNN
	1    2250 5550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 671AAE18
P 3950 6050
F 0 "#PWR0102" H 3950 5800 50  0001 C CNN
F 1 "GNDD" H 3954 5895 50  0000 C CNN
F 2 "" H 3950 6050 50  0001 C CNN
F 3 "" H 3950 6050 50  0001 C CNN
	1    3950 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 5050 4900 5050
Text Notes 7450 7900 0    66   ~ 0
May 19, 2019
Text Notes 6650 7750 0    66   Italic 13
YATAC78 TTL Computer
Text Notes 6350 6900 0    45   ~ 0
Top sheet contains main clock circui and mating connectors to join the CPU and GPU boards.
$EndSCHEMATC
