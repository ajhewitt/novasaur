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
L 74xx:74LS32 U?
U 5 1 5D1D2709
P 7950 1400
AR Path="/5CDEEC9F/5D1D2709" Ref="U?"  Part="5" 
AR Path="/5D1D2709" Ref="U?"  Part="5" 
F 0 "U?" H 7850 1450 50  0000 L CNN
F 1 "74F32" H 7800 1350 50  0000 L CNN
F 2 "" H 7950 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7950 1400 50  0001 C CNN
	5    7950 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_MountingPin J?
U 1 1 5D1D270F
P 950 1350
AR Path="/5D1D270F" Ref="J?"  Part="1" 
AR Path="/5CDEEC9F/5D1D270F" Ref="J?"  Part="1" 
F 0 "J?" H 1007 1667 50  0000 C CNN
F 1 "PWR IN" H 1007 1576 50  0000 C CNN
F 2 "" H 1000 1310 50  0001 C CNN
F 3 "~" H 1000 1310 50  0001 C CNN
	1    950  1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1900 9800 1900
Connection ~ 9450 1900
Wire Wire Line
	9450 1800 9450 1900
Wire Wire Line
	9450 1500 9450 1400
Connection ~ 9450 1400
Wire Wire Line
	9350 1400 9450 1400
Wire Wire Line
	950  1900 950  1650
Wire Wire Line
	1350 900  1350 1250
Wire Wire Line
	1350 1900 950  1900
Connection ~ 1350 1900
Wire Wire Line
	1350 1900 1350 1450
Wire Wire Line
	8950 1000 8950 900 
Wire Wire Line
	9800 1900 9800 1850
Wire Wire Line
	8950 1900 9450 1900
Connection ~ 8950 1900
Wire Wire Line
	8950 1900 8950 1800
Wire Wire Line
	9450 1400 9800 1400
Wire Wire Line
	9800 1400 10050 1400
Connection ~ 9800 1400
Wire Wire Line
	9800 1450 9800 1400
$Comp
L power:VCC #PWR?
U 1 1 5D1D272B
P 1350 900
AR Path="/5D1D272B" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5D1D272B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1350 750 50  0001 C CNN
F 1 "VCC" H 1367 1073 50  0000 C CNN
F 2 "" H 1350 900 50  0001 C CNN
F 3 "" H 1350 900 50  0001 C CNN
	1    1350 900 
	1    0    0    -1  
$EndComp
Connection ~ 950  1900
$Comp
L power:GNDD #PWR?
U 1 1 5D1D2732
P 950 1900
AR Path="/5D1D2732" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5D1D2732" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 950 1650 50  0001 C CNN
F 1 "GNDD" H 954 1745 50  0000 C CNN
F 2 "" H 950 1900 50  0001 C CNN
F 3 "" H 950 1900 50  0001 C CNN
	1    950  1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1250 1350 1250
Wire Wire Line
	1350 1450 1250 1450
Text GLabel 10050 1400 2    50   Output ~ 0
~rst
$Comp
L Switch:SW_Push SW?
U 1 1 5D1D273B
P 9800 1650
AR Path="/5D1D273B" Ref="SW?"  Part="1" 
AR Path="/5CDEEC9F/5D1D273B" Ref="SW?"  Part="1" 
F 0 "SW?" V 9754 1798 50  0000 L CNN
F 1 "RESET" V 9845 1798 50  0000 L CNN
F 2 "" H 9800 1850 50  0001 C CNN
F 3 "~" H 9800 1850 50  0001 C CNN
	1    9800 1650
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5D1D2741
P 9450 1650
AR Path="/5D1D2741" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D1D2741" Ref="C?"  Part="1" 
F 0 "C?" H 9565 1696 50  0000 L CNN
F 1 "100p" H 9565 1605 50  0000 L CNN
F 2 "" H 9488 1500 50  0001 C CNN
F 3 "~" H 9450 1650 50  0001 C CNN
	1    9450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 900  8500 900 
$Comp
L 74xx:74LS04 U?
U 7 1 5D1D2753
P 8500 1400
AR Path="/5D1D2753" Ref="U?"  Part="7" 
AR Path="/5CDEEC9F/5D1D2753" Ref="U?"  Part="7" 
F 0 "U?" H 8400 1450 50  0000 L CNN
F 1 "74F04" H 8350 1350 50  0000 L CNN
F 2 "" H 8500 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 8500 1400 50  0001 C CNN
	7    8500 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 5 1 5D1D2759
P 6850 1400
AR Path="/5CDEEC9F/5D1D2759" Ref="U?"  Part="5" 
AR Path="/5D1D2759" Ref="U?"  Part="5" 
F 0 "U?" H 6750 1450 50  0000 L CNN
F 1 "74F08" H 6700 1350 50  0000 L CNN
F 2 "" H 6850 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6850 1400 50  0001 C CNN
	5    6850 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 5 1 5D1D275F
P 7400 1400
AR Path="/5CDEEC9F/5D1D275F" Ref="U?"  Part="5" 
AR Path="/5D1D275F" Ref="U?"  Part="5" 
F 0 "U?" H 7300 1450 50  0000 L CNN
F 1 "74F00" H 7250 1350 50  0000 L CNN
F 2 "" H 7400 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7400 1400 50  0001 C CNN
	5    7400 1400
	1    0    0    -1  
$EndComp
Connection ~ 5750 900 
Connection ~ 5750 1900
Wire Wire Line
	5750 900  6300 900 
Wire Wire Line
	5750 1900 6300 1900
$Comp
L 74xx:74LS139 U?
U 3 1 5D21ACBA
P 6300 1400
F 0 "U?" H 6200 1450 50  0000 L CNN
F 1 "74F139" H 6150 1350 50  0000 L CNN
F 2 "" H 6300 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6300 1400 50  0001 C CNN
	3    6300 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 5 1 5D22FF55
P 5750 1400
F 0 "U?" H 5650 1450 50  0000 L CNN
F 1 "74F32" H 5600 1350 50  0000 L CNN
F 2 "" H 5750 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5750 1400 50  0001 C CNN
	5    5750 1400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5CDF2407
P 3500 5700
F 0 "#PWR?" H 3500 5550 50  0001 C CNN
F 1 "VCC" H 3517 5873 50  0000 C CNN
F 2 "" H 3500 5700 50  0001 C CNN
F 3 "" H 3500 5700 50  0001 C CNN
	1    3500 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 6800 3000 6800
$Comp
L 74xx:74LS175 U?
U 1 1 5CDF2414
P 3500 6400
F 0 "U?" H 3500 6400 50  0000 C CNN
F 1 "74F175" H 3500 6300 50  0000 C CNN
F 2 "" H 3500 6400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 3500 6400 50  0001 C CNN
	1    3500 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 6950 1800 6950
Wire Wire Line
	1100 6950 1300 6950
Wire Wire Line
	1100 6000 1100 6450
Wire Wire Line
	1150 6000 1100 6000
Wire Wire Line
	1100 6450 1300 6450
Wire Wire Line
	1600 6450 1800 6450
Wire Wire Line
	1800 6000 1850 6000
Connection ~ 1800 6000
Wire Wire Line
	1750 6000 1800 6000
Text GLabel 2450 6900 0    50   Input ~ 0
~rst
Text GLabel 2650 5600 2    50   Output ~ 0
cclk
Text GLabel 2650 5800 2    50   Output ~ 0
dclk
Wire Wire Line
	4350 6100 4450 6100
Wire Wire Line
	2650 6000 3000 6000
Wire Wire Line
	2650 7750 2650 6000
Wire Wire Line
	4350 7750 2650 7750
Wire Wire Line
	4350 6100 4350 7750
Wire Wire Line
	4200 6400 4450 6400
Wire Wire Line
	2800 6600 3000 6600
Wire Wire Line
	2800 7600 2800 6600
Wire Wire Line
	4200 7600 2800 7600
Wire Wire Line
	4200 6400 4200 7600
Wire Wire Line
	2950 6400 2950 6200
Wire Wire Line
	3000 6400 2950 6400
Wire Wire Line
	4050 6700 4450 6700
Wire Wire Line
	2950 6200 3000 6200
Connection ~ 2950 6400
Wire Wire Line
	2950 7450 2950 6400
Wire Wire Line
	4050 7450 2950 7450
Wire Wire Line
	4050 6700 4050 7450
Connection ~ 4050 6700
Wire Wire Line
	4000 6700 4050 6700
Wire Wire Line
	4000 6200 4450 6200
Connection ~ 4350 6100
Wire Wire Line
	4000 6100 4350 6100
Wire Wire Line
	4000 6600 4450 6600
Wire Wire Line
	4000 6500 4450 6500
Connection ~ 4200 6400
Wire Wire Line
	4000 6400 4200 6400
Wire Wire Line
	4000 6300 4450 6300
Wire Wire Line
	4000 6000 4450 6000
$Comp
L power:GNDD #PWR?
U 1 1 5CDF2449
P 3500 7200
F 0 "#PWR?" H 3500 6950 50  0001 C CNN
F 1 "GNDD" H 3504 7045 50  0000 C CNN
F 2 "" H 3500 7200 50  0001 C CNN
F 3 "" H 3500 7200 50  0001 C CNN
	1    3500 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5CDF244F
P 1800 7350
AR Path="/5CDF244F" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5CDF244F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1800 7100 50  0001 C CNN
F 1 "GNDD" H 1804 7195 50  0000 C CNN
F 2 "" H 1800 7350 50  0001 C CNN
F 3 "" H 1800 7350 50  0001 C CNN
	1    1800 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5CDF2455
P 1100 7350
AR Path="/5CDF2455" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1100 7100 50  0001 C CNN
F 1 "GNDD" H 1104 7195 50  0000 C CNN
F 2 "" H 1100 7350 50  0001 C CNN
F 3 "" H 1100 7350 50  0001 C CNN
	1    1100 7350
	1    0    0    -1  
$EndComp
Connection ~ 1800 6450
Wire Wire Line
	1800 6550 1800 6450
Connection ~ 1100 6450
Wire Wire Line
	1100 6450 1100 6950
Connection ~ 1100 6950
Wire Wire Line
	1100 7050 1100 6950
Wire Wire Line
	1800 6950 1800 6850
Connection ~ 1800 6950
Wire Wire Line
	1800 7050 1800 6950
$Comp
L Device:R R?
U 1 1 5CDF2464
P 1450 6450
AR Path="/5CDF2464" Ref="R?"  Part="1" 
AR Path="/5CDEEC9F/5CDF2464" Ref="R?"  Part="1" 
F 0 "R?" V 1657 6450 50  0000 C CNN
F 1 "1k" V 1566 6450 50  0000 C CNN
F 2 "" V 1380 6450 50  0001 C CNN
F 3 "~" H 1450 6450 50  0001 C CNN
	1    1450 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 5CDF246A
P 1800 6700
AR Path="/5CDF246A" Ref="R?"  Part="1" 
AR Path="/5CDEEC9F/5CDF246A" Ref="R?"  Part="1" 
F 0 "R?" H 1870 6746 50  0000 L CNN
F 1 "270" H 1870 6655 50  0000 L CNN
F 2 "" V 1730 6700 50  0001 C CNN
F 3 "~" H 1800 6700 50  0001 C CNN
	1    1800 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5CDF2470
P 1800 7200
AR Path="/5CDF2470" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C?" H 1915 7246 50  0000 L CNN
F 1 "22p" H 1915 7155 50  0000 L CNN
F 2 "" H 1838 7050 50  0001 C CNN
F 3 "~" H 1800 7200 50  0001 C CNN
	1    1800 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5CDF2476
P 1100 7200
AR Path="/5CDF2476" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C?" H 1215 7246 50  0000 L CNN
F 1 "22p" H 1215 7155 50  0000 L CNN
F 2 "" H 1138 7050 50  0001 C CNN
F 3 "~" H 1100 7200 50  0001 C CNN
	1    1100 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5CDF247C
P 1450 6950
AR Path="/5CDF247C" Ref="Y?"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y?" H 1450 7218 50  0000 C CNN
F 1 "30.875" H 1450 7127 50  0000 C CNN
F 2 "" H 1450 6950 50  0001 C CNN
F 3 "~" H 1450 6950 50  0001 C CNN
	1    1450 6950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 2 1 5CDF2482
P 2150 6000
AR Path="/5CDF2482" Ref="U?"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U?" H 2100 6000 50  0000 C CNN
F 1 "74F04" H 2200 5850 50  0001 C CNN
F 2 "" H 2150 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2150 6000 50  0001 C CNN
	2    2150 6000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 1 1 5CDF2488
P 1450 6000
AR Path="/5CDF2488" Ref="U?"  Part="1" 
AR Path="/5CDEEC9F/5CDF2488" Ref="U?"  Part="1" 
F 0 "U?" H 1400 6000 50  0000 C CNN
F 1 "74F04" H 1500 5850 50  0001 C CNN
F 2 "" H 1450 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1450 6000 50  0001 C CNN
	1    1450 6000
	1    0    0    -1  
$EndComp
Text GLabel 4450 6100 2    50   Output ~ 0
nclk
Text GLabel 4450 6000 2    50   Output ~ 0
mclk
Text GLabel 4450 6700 2    50   Output ~ 0
sclk
Text GLabel 4450 6600 2    50   Output ~ 0
rclk
Text GLabel 4450 6500 2    50   Output ~ 0
qclk2
Text GLabel 4450 6400 2    50   Output ~ 0
pclk2
Text GLabel 4450 6300 2    50   Output ~ 0
qclk1
Text GLabel 4450 6200 2    50   Output ~ 0
pclk1
Wire Wire Line
	1800 6000 1800 6450
Wire Wire Line
	2500 6800 2500 6000
Wire Wire Line
	2500 6000 2450 6000
Wire Wire Line
	2650 5800 2500 5800
Wire Wire Line
	2500 5800 2500 6000
Connection ~ 2500 6000
Wire Wire Line
	3000 6900 2450 6900
$Sheet
S 8500 6100 600  550 
U 5DAA3954
F0 "GPU" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
$Sheet
S 7400 6100 600  550 
U 5DAA5CD8
F0 "ECU" 50
F1 "YATAC-ECU.sch" 50
$EndSheet
Connection ~ 8500 900 
Connection ~ 8500 1900
Wire Wire Line
	8500 1900 8950 1900
Connection ~ 7950 900 
Wire Wire Line
	7950 900  7400 900 
Connection ~ 7950 1900
Wire Wire Line
	7950 1900 7400 1900
Connection ~ 7400 900 
Connection ~ 7400 1900
Connection ~ 6850 900 
Connection ~ 6850 1900
Connection ~ 6300 900 
Connection ~ 6300 1900
Wire Wire Line
	6300 900  6850 900 
Wire Wire Line
	6300 1900 6850 1900
Wire Wire Line
	6850 1900 7400 1900
Wire Wire Line
	6850 900  7400 900 
Wire Wire Line
	7950 1900 8500 1900
Wire Wire Line
	7950 900  8500 900 
$Sheet
S 6300 6100 600  550 
U 5DAA19D5
F0 "CPU" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Wire Wire Line
	1800 6000 1800 5600
Wire Wire Line
	1800 5600 2650 5600
$Comp
L 74xx:74LS11 U?
U 4 1 5E535AF8
P 5200 1400
F 0 "U?" H 5100 1450 50  0000 L CNN
F 1 "74F11" H 5050 1350 50  0000 L CNN
F 2 "" H 5200 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS11" H 5200 1400 50  0001 C CNN
	4    5200 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 5 1 5E567DAD
P 4650 1400
F 0 "U?" H 4550 1450 50  0000 L CNN
F 1 "74F32" H 4500 1350 50  0000 L CNN
F 2 "" H 4650 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4650 1400 50  0001 C CNN
	5    4650 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 5 1 5E7267F8
P 4100 1400
F 0 "U?" H 4000 1450 50  0000 L CNN
F 1 "74F00" H 3950 1350 50  0000 L CNN
F 2 "" H 4100 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 4100 1400 50  0001 C CNN
	5    4100 1400
	1    0    0    -1  
$EndComp
Connection ~ 5200 900 
Wire Wire Line
	5200 900  5750 900 
Connection ~ 5200 1900
Wire Wire Line
	5200 1900 5750 1900
Connection ~ 4650 900 
Connection ~ 4650 1900
Connection ~ 4100 1900
Connection ~ 4100 900 
Connection ~ 1350 900 
Wire Wire Line
	1350 900  4100 900 
Wire Wire Line
	1350 1900 4100 1900
Wire Wire Line
	4100 1900 4650 1900
Wire Wire Line
	4100 900  4650 900 
Wire Wire Line
	4650 900  5200 900 
Wire Wire Line
	4650 1900 5200 1900
$Comp
L Power_Supervisor:TCM809 U?
U 1 1 5D1D2747
P 9050 1400
AR Path="/5D1D2747" Ref="U?"  Part="1" 
AR Path="/5CDEEC9F/5D1D2747" Ref="U?"  Part="1" 
F 0 "U?" H 9150 1550 50  0000 R CNN
F 1 "1233" H 9200 1300 50  0000 R CNN
F 2 "" H 8650 1550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 8750 1650 50  0001 C CNN
	1    9050 1400
	1    0    0    -1  
$EndComp
$Sheet
S 9600 6100 550  550 
U 626DA08C
F0 "CONN" 50
F1 "YATAC-CONN.sch" 50
$EndSheet
$EndSCHEMATC
