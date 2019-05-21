EESchema Schematic File Version 4
LIBS:YATAC1-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
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
L 74xx:74LS139 U?
U 2 1 5DB93139
P 4050 3150
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U6"  Part="2" 
F 0 "U6" H 4050 3150 50  0000 C CNN
F 1 "74ALS139" H 4000 3050 50  0000 C CNN
F 2 "" H 4050 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4050 3150 50  0001 C CNN
	2    4050 3150
	1    0    0    -1  
$EndComp
Text GLabel 5700 1800 0    50   Input ~ 0
qclk1
Text GLabel 6300 1700 2    50   Output ~ 0
~pgle
Text GLabel 5550 1300 2    50   Output ~ 0
~pcle
Text GLabel 6900 1300 2    50   Output ~ 0
~pcclr
Wire Wire Line
	4600 3450 4600 3350
Wire Wire Line
	4600 3350 4550 3350
Wire Wire Line
	4550 3050 4600 3050
Wire Wire Line
	4600 2900 4600 3050
$Comp
L 74xx:74LS574 U?
U 1 1 5DB93147
P 2450 6450
AR Path="/5CDEEC9F/5DB93147" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93147" Ref="U18"  Part="1" 
F 0 "U18" H 2450 6250 50  0000 C CNN
F 1 "74F574" H 2450 6150 50  0000 C CNN
F 2 "" H 2450 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2450 6450 50  0001 C CNN
	1    2450 6450
	1    0    0    -1  
$EndComp
Text GLabel 9350 2300 0    50   Input ~ 0
dclk
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 8650 1400
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U4"  Part="1" 
F 0 "U4" H 8650 1400 50  0000 C CNN
F 1 "74F32" H 8650 1200 50  0001 C CNN
F 2 "" H 8650 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8650 1400 50  0001 C CNN
	1    8650 1400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 7950 2100
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U4"  Part="3" 
F 0 "U4" H 7950 2100 50  0000 C CNN
F 1 "74F32" H 7950 1900 50  0001 C CNN
F 2 "" H 7950 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7950 2100 50  0001 C CNN
	3    7950 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DB9315A
P 7950 1500
AR Path="/5CDEEC9F/5DB9315A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9315A" Ref="U2"  Part="1" 
F 0 "U2" H 7950 1500 50  0000 C CNN
F 1 "74F00" H 7950 1300 50  0001 C CNN
F 2 "" H 7950 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7950 1500 50  0001 C CNN
	1    7950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1800 7550 1800
Connection ~ 7550 1800
Wire Wire Line
	7550 1800 7550 2000
Wire Wire Line
	7550 1800 7550 1600
Wire Wire Line
	7550 2000 7650 2000
Wire Wire Line
	7550 1600 7650 1600
Wire Wire Line
	8300 1800 8300 2100
Connection ~ 8300 2100
Wire Wire Line
	8300 2100 8350 2100
Wire Wire Line
	8250 2100 8300 2100
Wire Wire Line
	8250 1500 8300 1500
Connection ~ 8300 1500
Wire Wire Line
	8300 1500 8350 1500
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9850 2700
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9850 2450 50  0001 C CNN
F 1 "GNDD" H 9854 2545 50  0000 C CNN
F 2 "" H 9850 2700 50  0001 C CNN
F 3 "" H 9850 2700 50  0001 C CNN
	1    9850 2700
	1    0    0    -1  
$EndComp
Text GLabel 7650 1400 0    50   Input ~ 0
rclk
Text GLabel 7650 2200 0    50   Input ~ 0
sclk
Text GLabel 9350 2400 0    50   Input ~ 0
0
Wire Wire Line
	8300 2300 8350 2300
$Comp
L power:GNDD #PWR?
U 1 1 5DB93177
P 2300 2900
AR Path="/5CDEEC9F/5DB93177" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB93177" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 2300 2650 50  0001 C CNN
F 1 "GNDD" H 2304 2745 50  0000 C CNN
F 2 "" H 2300 2900 50  0001 C CNN
F 3 "" H 2300 2900 50  0001 C CNN
	1    2300 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 4 1 5DB9317D
P 5000 3950
AR Path="/5CDEEC9F/5DB9317D" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB9317D" Ref="U8"  Part="4" 
F 0 "U8" H 4950 3950 50  0000 C CNN
F 1 "74F04" H 5000 4176 50  0001 C CNN
F 2 "" H 5000 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5000 3950 50  0001 C CNN
	4    5000 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 1500 8300 1700
Wire Wire Line
	8950 2200 9000 2200
Wire Wire Line
	9000 2200 9000 1900
Wire Wire Line
	9000 1600 9000 1400
Wire Wire Line
	9000 1400 8950 1400
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 5050 1400
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U6"  Part="1" 
F 0 "U6" H 5050 1400 50  0000 C CNN
F 1 "74ALS139" H 5000 1300 50  0000 C CNN
F 2 "" H 5050 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 1300 8300 1300
Text GLabel 9350 2000 0    50   Input ~ 0
sclk
$Comp
L 74xx:74LS157 U?
U 1 1 5DB93191
P 2300 1900
AR Path="/5CDEEC9F/5DB93191" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93191" Ref="U12"  Part="1" 
F 0 "U12" H 2300 1800 50  0000 C CNN
F 1 "74F157" H 2300 1700 50  0000 C CNN
F 2 "" H 2300 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2300 1900 50  0001 C CNN
	1    2300 1900
	1    0    0    -1  
$EndComp
Connection ~ 4600 2900
Wire Wire Line
	3500 3350 3550 3350
Wire Wire Line
	3500 2700 3500 2550
Wire Wire Line
	3500 2550 3600 2550
Text GLabel 4800 2450 2    50   Output ~ 0
I3+4
Wire Wire Line
	4600 2300 4600 2900
Wire Wire Line
	4500 1650 4500 1300
Wire Wire Line
	4500 1300 4550 1300
Wire Wire Line
	4200 2450 4400 2450
Wire Wire Line
	4400 2250 4400 2450
Connection ~ 4400 2450
Wire Wire Line
	4400 2450 4800 2450
Wire Wire Line
	4600 2300 4600 2250
Connection ~ 4600 2300
Text GLabel 6200 2800 2    50   Output ~ 0
~zpage
Entry Wire Line
	3250 3450 3350 3350
Entry Wire Line
	3250 3150 3350 3050
Entry Wire Line
	3250 3250 3350 3150
Entry Wire Line
	3250 2650 3350 2550
Entry Wire Line
	3250 2450 3350 2350
Wire Wire Line
	3350 2350 3500 2350
Wire Wire Line
	3350 2550 3500 2550
Connection ~ 3500 2550
Wire Wire Line
	3350 3050 3550 3050
Wire Wire Line
	3350 3150 3550 3150
Wire Wire Line
	3350 3350 3500 3350
Connection ~ 3500 3350
Wire Wire Line
	3500 2350 3500 1400
Wire Wire Line
	3500 1400 4550 1400
Connection ~ 3500 2350
Wire Wire Line
	3500 2350 3600 2350
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2300 5050
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2300 4800 50  0001 C CNN
F 1 "GNDD" H 2304 4895 50  0000 C CNN
F 2 "" H 2300 5050 50  0001 C CNN
F 3 "" H 2300 5050 50  0001 C CNN
	1    2300 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C1
P 4050 6550
AR Path="/5CDEEC9F/5DB931C1" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C1" Ref="U13"  Part="1" 
F 0 "U13" H 4050 6600 50  0000 C CNN
F 1 "74F138" H 4000 6500 50  0000 C CNN
F 2 "" H 4050 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4050 6550 50  0001 C CNN
	1    4050 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 9950 4650
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U14"  Part="1" 
F 0 "U14" H 9950 4700 50  0000 C CNN
F 1 "74F138" H 9900 4600 50  0000 C CNN
F 2 "" H 9950 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 9950 4650 50  0001 C CNN
	1    9950 4650
	1    0    0    -1  
$EndComp
Entry Wire Line
	3150 3250 3250 3350
Wire Wire Line
	1450 3250 1450 2300
Wire Wire Line
	1450 2300 1800 2300
Wire Wire Line
	1800 3950 1300 3950
Wire Wire Line
	1300 3950 1300 2000
Wire Wire Line
	1300 2000 1800 2000
Text GLabel 2800 3850 2    50   Input ~ 0
sclk
Text GLabel 2800 4750 2    50   Input ~ 0
0
Text GLabel 2800 4250 2    50   Input ~ 0
I3+4
Text GLabel 1800 3850 0    50   Input ~ 0
pclk1
Text GLabel 1800 4550 0    50   Input ~ 0
~rst
Text GLabel 1800 4450 0    50   Output ~ 0
pcent
Text GLabel 1250 4350 0    50   Output ~ 0
~inst
Text GLabel 1800 4250 0    50   Output ~ 0
hsel
Text GLabel 1800 4150 0    50   Output ~ 0
boot
NoConn ~ 1800 4050
Text GLabel 2800 2200 2    50   Output ~ 0
DA16
Text GLabel 2800 1900 2    50   Output ~ 0
PA16
Text GLabel 9350 2100 0    50   Input ~ 0
~inst
Wire Wire Line
	10400 850  10400 1400
Wire Wire Line
	10400 1400 10350 1400
Wire Wire Line
	9000 1600 9350 1600
Wire Wire Line
	9350 1400 9150 1400
Wire Wire Line
	9150 1400 9150 850 
Wire Wire Line
	9350 1500 9300 1500
Wire Wire Line
	9300 1500 9300 850 
Wire Wire Line
	9300 850  10400 850 
Wire Wire Line
	8300 1700 9350 1700
Wire Wire Line
	8300 1800 9350 1800
Wire Wire Line
	9350 1900 9000 1900
Wire Wire Line
	9150 850  3250 850 
Wire Wire Line
	3250 850  3250 1300
Wire Wire Line
	2800 4550 3150 4550
Wire Wire Line
	2800 4450 3150 4450
Wire Wire Line
	2800 4350 3150 4350
Wire Wire Line
	2800 4150 3150 4150
Wire Wire Line
	2800 4050 3150 4050
Wire Wire Line
	2800 3950 3150 3950
Wire Wire Line
	1450 3250 3150 3250
Wire Wire Line
	2800 1300 3250 1300
Text GLabel 1800 1400 0    50   Input ~ 0
~zpage
Text GLabel 1800 1300 0    50   Input ~ 0
1
Text GLabel 1800 1600 0    50   Input ~ 0
1
Text GLabel 1800 1900 0    50   Input ~ 0
hblank
Text GLabel 1800 2200 0    50   Input ~ 0
1
Text GLabel 1800 2500 0    50   Input ~ 0
pclk1
Text GLabel 1800 2600 0    50   Input ~ 0
0
Text GLabel 8200 1050 0    50   Input ~ 0
boot
Wire Wire Line
	8200 1050 8300 1050
Wire Wire Line
	8300 1050 8300 1300
Wire Wire Line
	8300 2500 8300 2300
Text GLabel 6900 1700 0    50   Input ~ 0
~inst
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 3500 5150
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U3"  Part="2" 
F 0 "U3" H 3500 5150 50  0000 C CNN
F 1 "74F08" H 3500 5350 50  0001 C CNN
F 2 "" H 3500 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3500 5150 50  0001 C CNN
	2    3500 5150
	0    1    1    0   
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 7000 5850
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U4"  Part="4" 
F 0 "U4" H 7000 5850 50  0000 C CNN
F 1 "74F32" H 7000 5650 50  0001 C CNN
F 2 "" H 7000 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7000 5850 50  0001 C CNN
	4    7000 5850
	1    0    0    -1  
$EndComp
Entry Wire Line
	3350 4800 3250 4700
Entry Wire Line
	3250 4450 3350 4350
Text GLabel 4350 1300 0    50   Output ~ 0
~jmp
Wire Wire Line
	4500 1300 4350 1300
Connection ~ 4500 1300
Wire Wire Line
	2800 1600 4550 1600
Wire Wire Line
	3550 6450 3500 6450
Entry Wire Line
	3250 4550 3350 4450
Text GLabel 3550 6750 0    50   Input ~ 0
~jmp
Text GLabel 3550 6950 0    50   Input ~ 0
pclk1
Text GLabel 3550 6850 0    50   Input ~ 0
0
Text GLabel 9450 4850 0    50   Input ~ 0
~jmp
Text GLabel 9450 5050 0    50   Input ~ 0
pclk1
Text GLabel 9450 4950 0    50   Input ~ 0
0
Text GLabel 10350 1500 2    50   Output ~ 0
~xoe
Text GLabel 10350 1600 2    50   Output ~ 0
~pgoe
Text GLabel 10350 1700 2    50   Output ~ 0
~pcoe
Text GLabel 10350 1800 2    50   Output ~ 0
~alue
Text GLabel 10350 1900 2    50   Output ~ 0
~fnoe
Text GLabel 10350 2000 2    50   Output ~ 0
~gcoe
Text GLabel 10450 4350 2    50   Output ~ 0
~vle
Text GLabel 10450 4450 2    50   Output ~ 0
~ele
Text GLabel 10450 4550 2    50   Output ~ 0
~exle
Text GLabel 10450 4650 2    50   Output ~ 0
~eyle
Text GLabel 10450 4750 2    50   Output ~ 0
~xle
Text GLabel 10450 4850 2    50   Output ~ 0
~yle
Text GLabel 10450 4950 2    50   Output ~ 0
~hlle
Text GLabel 10450 5050 2    50   Output ~ 0
~ale
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB9322D
P 4600 6000
AR Path="/5CDEEC9F/5DB9322D" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB9322D" Ref="D2"  Part="1" 
F 0 "D2" V 4700 5950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 4600 6125 50  0001 C CNN
F 2 "" H 4600 6000 50  0001 C CNN
F 3 "~" H 4600 6000 50  0001 C CNN
	1    4600 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93233
P 5000 6000
AR Path="/5CDEEC9F/5DB93233" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93233" Ref="D4"  Part="1" 
F 0 "D4" V 5100 5950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 5000 6125 50  0001 C CNN
F 2 "" H 5000 6000 50  0001 C CNN
F 3 "~" H 5000 6000 50  0001 C CNN
	1    5000 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93239
P 6200 6950
AR Path="/5CDEEC9F/5DB93239" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93239" Ref="D12"  Part="1" 
F 0 "D12" H 6200 7074 50  0000 C CNN
F 1 "D_Schottky_ALT" H 6200 7075 50  0001 C CNN
F 2 "" H 6200 6950 50  0001 C CNN
F 3 "~" H 6200 6950 50  0001 C CNN
	1    6200 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB9323F
P 5400 6000
AR Path="/5CDEEC9F/5DB9323F" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB9323F" Ref="D6"  Part="1" 
F 0 "D6" V 5500 5950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 5400 6125 50  0001 C CNN
F 2 "" H 5400 6000 50  0001 C CNN
F 3 "~" H 5400 6000 50  0001 C CNN
	1    5400 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93245
P 5200 5750
AR Path="/5CDEEC9F/5DB93245" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93245" Ref="D5"  Part="1" 
F 0 "D5" V 5300 5700 50  0000 R CNN
F 1 "D_Schottky_ALT" H 5200 5875 50  0001 C CNN
F 2 "" H 5200 5750 50  0001 C CNN
F 3 "~" H 5200 5750 50  0001 C CNN
	1    5200 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB9324B
P 4800 5750
AR Path="/5CDEEC9F/5DB9324B" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB9324B" Ref="D3"  Part="1" 
F 0 "D3" V 4900 5700 50  0000 R CNN
F 1 "D_Schottky_ALT" H 4800 5875 50  0001 C CNN
F 2 "" H 4800 5750 50  0001 C CNN
F 3 "~" H 4800 5750 50  0001 C CNN
	1    4800 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93251
P 6000 5750
AR Path="/5CDEEC9F/5DB93251" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93251" Ref="D9"  Part="1" 
F 0 "D9" V 6100 5700 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6000 5875 50  0001 C CNN
F 2 "" H 6000 5750 50  0001 C CNN
F 3 "~" H 6000 5750 50  0001 C CNN
	1    6000 5750
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93257
P 6200 6250
AR Path="/5CDEEC9F/5DB93257" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93257" Ref="D10"  Part="1" 
F 0 "D10" H 6200 6374 50  0000 C CNN
F 1 "D_Schottky_ALT" H 6200 6375 50  0001 C CNN
F 2 "" H 6200 6250 50  0001 C CNN
F 3 "~" H 6200 6250 50  0001 C CNN
	1    6200 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB9325D
P 6200 6550
AR Path="/5CDEEC9F/5DB9325D" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB9325D" Ref="D11"  Part="1" 
F 0 "D11" H 6200 6674 50  0000 C CNN
F 1 "D_Schottky_ALT" H 6200 6675 50  0001 C CNN
F 2 "" H 6200 6550 50  0001 C CNN
F 3 "~" H 6200 6550 50  0001 C CNN
	1    6200 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 6350 4800 6350
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93265
P 5800 6000
AR Path="/5CDEEC9F/5DB93265" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93265" Ref="D8"  Part="1" 
F 0 "D8" V 5900 5950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 5800 6125 50  0001 C CNN
F 2 "" H 5800 6000 50  0001 C CNN
F 3 "~" H 5800 6000 50  0001 C CNN
	1    5800 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB9326C
P 8500 5600
AR Path="/5CDEEC9F/5DB9326C" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB9326C" Ref="D14"  Part="1" 
F 0 "D14" V 8500 5521 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8500 5725 50  0001 C CNN
F 2 "" H 8500 5600 50  0001 C CNN
F 3 "~" H 8500 5600 50  0001 C CNN
	1    8500 5600
	0    -1   -1   0   
$EndComp
Text GLabel 8900 4750 2    50   Output ~ 0
~aoe
Text GLabel 8900 4850 2    50   Output ~ 0
~xroe
Text GLabel 8900 4950 2    50   Output ~ 0
~eoe
Text GLabel 8900 5050 2    50   Output ~ 0
~doe
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB93276
P 8700 5300
AR Path="/5CDEEC9F/5DB93276" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB93276" Ref="D13"  Part="1" 
F 0 "D13" V 8700 5221 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8700 5425 50  0001 C CNN
F 2 "" H 8700 5300 50  0001 C CNN
F 3 "~" H 8700 5300 50  0001 C CNN
	1    8700 5300
	0    -1   -1   0   
$EndComp
Text GLabel 8850 5500 2    50   Input ~ 0
qclk1
Text GLabel 8900 5850 2    50   Output ~ 0
~dwe
Wire Wire Line
	8700 5500 8700 5450
Wire Wire Line
	900  7500 900  1700
Wire Wire Line
	900  1700 1800 1700
$Comp
L 74xx:74LS244 U?
U 1 1 5DB93281
P 7900 4850
AR Path="/5CDEEC9F/5DB93281" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93281" Ref="U15"  Part="1" 
F 0 "U15" H 7900 4650 50  0000 C CNN
F 1 "74F244" H 7900 4550 50  0000 C CNN
F 2 "" H 7900 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 7900 4850 50  0001 C CNN
	1    7900 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB93287
P 7900 5650
AR Path="/5CDEEC9F/5DB93287" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB93287" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 7900 5400 50  0001 C CNN
F 1 "GNDD" H 7904 5495 50  0000 C CNN
F 2 "" H 7900 5650 50  0001 C CNN
F 3 "" H 7900 5650 50  0001 C CNN
	1    7900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5850 8500 5850
Wire Wire Line
	6700 5950 6600 5950
Wire Wire Line
	6700 6250 6600 6250
Wire Wire Line
	8700 5050 8700 5150
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DB93291
P 2300 4350
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U16"  Part="1" 
F 0 "U16" H 2300 4400 50  0000 C CNN
F 1 "16R4" H 2300 4300 50  0000 C CNN
F 2 "" H 2300 4350 50  0001 C CNN
F 3 "" H 2300 4350 50  0001 C CNN
	1    2300 4350
	-1   0    0    -1  
$EndComp
Text GLabel 1950 6950 0    50   Input ~ 0
0
Entry Wire Line
	1650 5850 1750 5950
Entry Wire Line
	1650 5950 1750 6050
Entry Wire Line
	1650 6050 1750 6150
Entry Wire Line
	1650 6150 1750 6250
Entry Wire Line
	1650 6250 1750 6350
Entry Wire Line
	1650 6350 1750 6450
Entry Wire Line
	1650 6450 1750 6550
Entry Wire Line
	1650 6550 1750 6650
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A0
P 2450 7250
AR Path="/5CDEEC9F/5DB932A0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2450 7000 50  0001 C CNN
F 1 "GNDD" H 2454 7095 50  0000 C CNN
F 2 "" H 2450 7250 50  0001 C CNN
F 3 "" H 2450 7250 50  0001 C CNN
	1    2450 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A6
P 4050 7250
AR Path="/5CDEEC9F/5DB932A6" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A6" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 4050 7000 50  0001 C CNN
F 1 "GNDD" H 4054 7095 50  0000 C CNN
F 2 "" H 4050 7250 50  0001 C CNN
F 3 "" H 4050 7250 50  0001 C CNN
	1    4050 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932AC
P 9950 5350
AR Path="/5CDEEC9F/5DB932AC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932AC" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 9950 5100 50  0001 C CNN
F 1 "GNDD" H 9954 5195 50  0000 C CNN
F 2 "" H 9950 5350 50  0001 C CNN
F 3 "" H 9950 5350 50  0001 C CNN
	1    9950 5350
	1    0    0    -1  
$EndComp
Entry Wire Line
	3250 6150 3350 6250
Entry Wire Line
	3250 6250 3350 6350
Entry Wire Line
	3150 6050 3250 5950
Entry Wire Line
	3150 6150 3250 6050
Entry Wire Line
	3150 6250 3250 6150
Entry Wire Line
	3150 5950 3250 5850
Wire Wire Line
	3350 6250 3550 6250
Wire Wire Line
	3550 6350 3350 6350
Connection ~ 8800 5050
$Comp
L Device:R_Network08_US RN?
U 1 1 5DB932C3
P 7550 3050
AR Path="/5CDEEC9F/5DB932C3" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DB932C3" Ref="RN4"  Part="1" 
F 0 "RN4" H 7938 3096 50  0000 L CNN
F 1 "680" H 7938 3005 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 8025 3050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7550 3050 50  0001 C CNN
	1    7550 3050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB932C9
P 7150 2850
AR Path="/5CDEEC9F/5DB932C9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932C9" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 7150 2700 50  0001 C CNN
F 1 "VCC" H 7167 3023 50  0000 C CNN
F 2 "" H 7150 2850 50  0001 C CNN
F 3 "" H 7150 2850 50  0001 C CNN
	1    7150 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DB932D0
P 5600 5750
AR Path="/5CDEEC9F/5DB932D0" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DB932D0" Ref="D7"  Part="1" 
F 0 "D7" V 5700 5700 50  0000 R CNN
F 1 "D_Schottky_ALT" H 5600 5875 50  0001 C CNN
F 2 "" H 5600 5750 50  0001 C CNN
F 3 "~" H 5600 5750 50  0001 C CNN
	1    5600 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7300 6250 7350 6250
Wire Wire Line
	7350 6250 7350 5350
Wire Wire Line
	7350 5350 7400 5350
Connection ~ 7350 6250
Connection ~ 8500 4750
Connection ~ 8700 4950
Wire Wire Line
	8700 4950 8900 4950
Wire Wire Line
	8800 5050 8900 5050
Wire Wire Line
	8500 5850 8500 5750
Wire Wire Line
	8500 5450 8500 4750
Connection ~ 8600 4850
Wire Wire Line
	8600 4850 8900 4850
Wire Wire Line
	8500 4750 8600 4750
$Comp
L Device:R_Network04_US RN?
U 1 1 5DB932E4
P 8700 4000
AR Path="/5CDEEC9F/5DB932E4" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DB932E4" Ref="RN5"  Part="1" 
F 0 "RN5" H 8888 4046 50  0000 L CNN
F 1 "680" H 8888 3955 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 8975 4000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 8700 4000 50  0001 C CNN
	1    8700 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4200 8500 4750
Wire Wire Line
	8700 4200 8700 4950
Wire Wire Line
	8800 4200 8800 5050
$Comp
L power:VCC #PWR?
U 1 1 5DB932ED
P 8500 3800
AR Path="/5CDEEC9F/5DB932ED" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932ED" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 8500 3650 50  0001 C CNN
F 1 "VCC" H 8517 3973 50  0000 C CNN
F 2 "" H 8500 3800 50  0001 C CNN
F 3 "" H 8500 3800 50  0001 C CNN
	1    8500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 5850 8500 5850
Connection ~ 8500 5850
NoConn ~ 8400 4650
Wire Wire Line
	7400 4350 3350 4350
Wire Wire Line
	8400 4750 8500 4750
Wire Wire Line
	8400 4850 8600 4850
Wire Wire Line
	8400 4950 8700 4950
Wire Wire Line
	8400 5050 8700 5050
Connection ~ 8700 5050
Wire Wire Line
	8700 5050 8800 5050
Text GLabel 7400 4650 0    50   Input ~ 0
1
Wire Wire Line
	8850 5500 8700 5500
Entry Wire Line
	3250 4650 3350 4550
Text Label 3350 6350 0    50   ~ 0
I4
Text Label 3350 6250 0    50   ~ 0
I3
Text Label 3350 4800 0    50   ~ 0
I5
Text Label 3350 4350 0    50   ~ 0
I0
Text Label 3350 4450 0    50   ~ 0
I1
Text Label 3350 4550 0    50   ~ 0
I2
Text Label 3350 3350 0    50   ~ 0
I7
Text Label 3350 3050 0    50   ~ 0
I6
Text Label 3350 3150 0    50   ~ 0
I5
Text Label 3350 2550 0    50   ~ 0
I4
Text Label 3350 2350 0    50   ~ 0
I3
Text Label 3050 3250 0    50   ~ 0
I0
Text Label 3050 3950 0    50   ~ 0
I0
Text Label 3050 4050 0    50   ~ 0
I1
Text Label 3050 4150 0    50   ~ 0
I2
Text Label 3050 4350 0    50   ~ 0
I5
Text Label 3050 4450 0    50   ~ 0
I6
Text Label 3050 4550 0    50   ~ 0
I7
Text Label 3050 5950 0    50   ~ 0
I0
Text Label 3050 6050 0    50   ~ 0
I1
Text Label 3050 6150 0    50   ~ 0
I2
Text Label 3050 6250 0    50   ~ 0
I3
Text Label 3050 6350 0    50   ~ 0
I4
Text Label 3050 6450 0    50   ~ 0
I5
Text Label 3050 6550 0    50   ~ 0
I6
Text Label 3050 6650 0    50   ~ 0
I7
Wire Wire Line
	1750 5950 1950 5950
Wire Wire Line
	1750 6050 1950 6050
Wire Wire Line
	1750 6150 1950 6150
Wire Wire Line
	1750 6250 1950 6250
Wire Wire Line
	1750 6350 1950 6350
Wire Wire Line
	1750 6450 1950 6450
Wire Wire Line
	1750 6550 1950 6550
Wire Wire Line
	1750 6650 1950 6650
Text Label 1750 5950 0    50   ~ 0
PD0
Text Label 1750 6050 0    50   ~ 0
PD1
Text Label 1750 6150 0    50   ~ 0
PD2
Text Label 1750 6250 0    50   ~ 0
PD3
Text Label 1750 6350 0    50   ~ 0
PD4
Text Label 1750 6450 0    50   ~ 0
PD5
Text Label 1750 6550 0    50   ~ 0
PD6
Text Label 1750 6650 0    50   ~ 0
PD7
Text GLabel 1650 5750 1    50   Input ~ 0
PD[0..7]
Text GLabel 3250 2200 1    50   Output ~ 0
I[0..7]
Wire Wire Line
	7650 3550 7650 3250
Wire Wire Line
	7850 3350 7850 3250
Wire Wire Line
	7750 3450 7750 3250
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9850 1100
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9850 950 50  0001 C CNN
F 1 "VCC" H 9867 1273 50  0000 C CNN
F 2 "" H 9850 1100 50  0001 C CNN
F 3 "" H 9850 1100 50  0001 C CNN
	1    9850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 4550 9350 3350
Connection ~ 9350 4550
Wire Wire Line
	9350 4550 9450 4550
Wire Wire Line
	9250 4450 9250 3450
Connection ~ 9250 4450
Wire Wire Line
	9250 4450 9450 4450
Wire Wire Line
	9150 4350 9150 3550
Connection ~ 9150 4350
Wire Wire Line
	9150 4350 9450 4350
Wire Wire Line
	7650 3550 9150 3550
Wire Wire Line
	8400 4350 9150 4350
Wire Wire Line
	7750 3450 9250 3450
Wire Wire Line
	7850 3350 9350 3350
Wire Wire Line
	8400 4550 9350 4550
Wire Wire Line
	10800 6250 10800 2100
Wire Wire Line
	8400 4450 9250 4450
Wire Wire Line
	10350 2100 10800 2100
Wire Wire Line
	7350 6250 10800 6250
Wire Wire Line
	8600 4750 8900 4750
Text GLabel 6300 1200 0    50   Input ~ 0
~rst
NoConn ~ 5550 1500
NoConn ~ 5550 1600
Wire Wire Line
	5550 1400 5650 1400
Wire Wire Line
	5700 1600 5650 1600
Wire Wire Line
	5650 1600 5650 1400
Connection ~ 5650 1400
Wire Wire Line
	5650 1400 6300 1400
Wire Wire Line
	8600 4200 8600 4850
Wire Wire Line
	1550 4850 1550 4800
Wire Wire Line
	1550 4800 1600 4800
$Comp
L 74xx:74LS32 U?
U 4 1 5DB9335E
P 1450 5150
AR Path="/5CDEEC9F/5DB9335E" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB9335E" Ref="U5"  Part="4" 
F 0 "U5" H 1450 5150 50  0000 C CNN
F 1 "74F32" H 1450 5384 50  0001 C CNN
F 2 "" H 1450 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1450 5150 50  0001 C CNN
	4    1450 5150
	0    1    1    0   
$EndComp
Text GLabel 1600 4800 2    50   Input ~ 0
qclk1
Wire Wire Line
	1450 6850 1450 5450
Wire Wire Line
	1350 4850 1350 4350
Wire Wire Line
	1350 4350 1800 4350
Wire Wire Line
	1350 4350 1250 4350
Connection ~ 1350 4350
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 7200 1800
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U3"  Part="1" 
F 0 "U3" H 7200 1800 50  0000 C CNN
F 1 "74F08" H 7200 1600 50  0001 C CNN
F 2 "" H 7200 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 1800 50  0001 C CNN
	1    7200 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 6600 1300
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U3"  Part="3" 
F 0 "U3" H 6600 1300 50  0000 C CNN
F 1 "74F08" H 6600 1100 50  0001 C CNN
F 2 "" H 6600 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6600 1300 50  0001 C CNN
	3    6600 1300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93377
P 6000 1700
AR Path="/5CDEEC9F/5DB93377" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93377" Ref="U5"  Part="3" 
F 0 "U5" H 6000 1700 50  0000 C CNN
F 1 "74F32" H 6000 1500 50  0001 C CNN
F 2 "" H 6000 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6000 1700 50  0001 C CNN
	3    6000 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB9337D
P 4500 1950
AR Path="/5CDEEC9F/5DB9337D" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB9337D" Ref="U5"  Part="2" 
F 0 "U5" V 4500 1900 50  0000 L CNN
F 1 "74F32" V 4500 1500 50  0001 L CNN
F 2 "" H 4500 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4500 1950 50  0001 C CNN
	2    4500 1950
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB93383
P 3900 2450
AR Path="/5CDEEC9F/5DB93383" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93383" Ref="U5"  Part="1" 
F 0 "U5" H 3900 2450 50  0000 C CNN
F 1 "74F32" H 3900 2700 50  0001 C CNN
F 2 "" H 3900 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3900 2450 50  0001 C CNN
	1    3900 2450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 3 1 5DB93389
P 5900 2800
AR Path="/5CDEEC9F/5DB93389" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93389" Ref="U2"  Part="3" 
F 0 "U2" H 5900 2800 50  0000 C CNN
F 1 "74F00" H 5900 2550 50  0001 C CNN
F 2 "" H 5900 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5900 2800 50  0001 C CNN
	3    5900 2800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 5DB9338F
P 5000 2900
AR Path="/5CDEEC9F/5DB9338F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB9338F" Ref="U8"  Part="3" 
F 0 "U8" H 4950 2900 50  0000 C CNN
F 1 "74F04" H 5100 2750 50  0001 C CNN
F 2 "" H 5000 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5000 2900 50  0001 C CNN
	3    5000 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 2 1 5DB93395
P 5000 3350
AR Path="/5CDEEC9F/5DB93395" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93395" Ref="U2"  Part="2" 
F 0 "U2" H 5000 3350 50  0000 C CNN
F 1 "74F00" H 5150 3150 50  0001 C CNN
F 2 "" H 5000 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5000 3350 50  0001 C CNN
	2    5000 3350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 5 1 5DB9339B
P 7000 6250
AR Path="/5CDEEC9F/5DB9339B" Ref="U?"  Part="5" 
AR Path="/5DAA5CD8/5DB9339B" Ref="U8"  Part="5" 
F 0 "U8" H 6950 6250 50  0000 C CNN
F 1 "74F04" H 7150 6100 50  0001 C CNN
F 2 "" H 7000 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7000 6250 50  0001 C CNN
	5    7000 6250
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS00 U?
U 4 1 5DB933A1
P 5900 4050
AR Path="/5CDEEC9F/5DB933A1" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB933A1" Ref="U2"  Part="4" 
F 0 "U2" H 5900 4050 50  0000 C CNN
F 1 "74F00" H 5900 3800 50  0001 C CNN
F 2 "" H 5900 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5900 4050 50  0001 C CNN
	4    5900 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DB933A7
P 9850 1900
AR Path="/5CDEEC9F/5DB933A7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB933A7" Ref="U17"  Part="1" 
F 0 "U17" H 9850 1700 50  0000 C CNN
F 1 "74F574" H 9850 1600 50  0000 C CNN
F 2 "" H 9850 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9850 1900 50  0001 C CNN
	1    9850 1900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 8650 2200
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U4"  Part="2" 
F 0 "U4" H 8650 2200 50  0000 C CNN
F 1 "74F32" H 8650 2000 50  0001 C CNN
F 2 "" H 8650 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8650 2200 50  0001 C CNN
	2    8650 2200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B3
P 2300 1000
AR Path="/5CDEEC9F/5DB933B3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B3" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2300 850 50  0001 C CNN
F 1 "VCC" H 2317 1173 50  0000 C CNN
F 2 "" H 2300 1000 50  0001 C CNN
F 3 "" H 2300 1000 50  0001 C CNN
	1    2300 1000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 2300 3650
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2300 3500 50  0001 C CNN
F 1 "VCC" H 2317 3823 50  0000 C CNN
F 2 "" H 2300 3650 50  0001 C CNN
F 3 "" H 2300 3650 50  0001 C CNN
	1    2300 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2450 5650
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2450 5500 50  0001 C CNN
F 1 "VCC" H 2467 5823 50  0000 C CNN
F 2 "" H 2450 5650 50  0001 C CNN
F 3 "" H 2450 5650 50  0001 C CNN
	1    2450 5650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933C5
P 4050 5950
AR Path="/5CDEEC9F/5DB933C5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933C5" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 4050 5800 50  0001 C CNN
F 1 "VCC" H 4067 6123 50  0000 C CNN
F 2 "" H 4050 5950 50  0001 C CNN
F 3 "" H 4050 5950 50  0001 C CNN
	1    4050 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933D1
P 9950 4050
AR Path="/5CDEEC9F/5DB933D1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933D1" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 9950 3900 50  0001 C CNN
F 1 "VCC" H 9967 4223 50  0000 C CNN
F 2 "" H 9950 4050 50  0001 C CNN
F 3 "" H 9950 4050 50  0001 C CNN
	1    9950 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3350 3500 3950
Wire Wire Line
	4550 6650 5200 6650
Wire Wire Line
	4550 6450 5600 6450
Wire Wire Line
	6350 6950 6400 6950
Wire Wire Line
	6400 6950 6400 6550
Wire Wire Line
	6400 6550 6350 6550
Wire Wire Line
	6400 6550 6400 6250
Wire Wire Line
	6400 6250 6350 6250
Connection ~ 6400 6550
Wire Wire Line
	6400 6250 6400 5750
Connection ~ 6400 6250
Wire Wire Line
	4550 6850 5400 6850
Wire Wire Line
	4550 6750 5800 6750
Wire Wire Line
	6700 5750 6400 5750
Connection ~ 6400 5750
Wire Wire Line
	6600 7500 6600 6250
Connection ~ 6600 6250
Wire Wire Line
	6600 5950 6600 6250
Wire Wire Line
	900  7500 6600 7500
Entry Wire Line
	3250 4550 3150 4450
Entry Wire Line
	3250 4450 3150 4350
Entry Wire Line
	3250 4650 3150 4550
Entry Wire Line
	3250 4250 3150 4150
Entry Wire Line
	3250 4150 3150 4050
Entry Wire Line
	3250 4050 3150 3950
Entry Wire Line
	3150 6650 3250 6550
Entry Wire Line
	3150 6550 3250 6450
Entry Wire Line
	3150 6450 3250 6350
Entry Wire Line
	3150 6350 3250 6250
Wire Wire Line
	6900 3350 6900 2500
Wire Wire Line
	6900 2500 8300 2500
Wire Wire Line
	6600 1900 6600 2300
Wire Wire Line
	6600 1900 6900 1900
Wire Wire Line
	4600 2300 6600 2300
Wire Wire Line
	5300 3350 6900 3350
Wire Wire Line
	4550 3150 5450 3150
Wire Wire Line
	5450 3150 5450 4150
Wire Wire Line
	5300 3950 5600 3950
Wire Wire Line
	5600 4150 5450 4150
Connection ~ 5450 4150
Wire Wire Line
	5450 4150 5450 4650
Wire Wire Line
	6200 4050 7050 4050
Wire Wire Line
	3500 3950 4700 3950
Wire Wire Line
	4600 3450 4700 3450
Wire Wire Line
	4550 3250 4700 3250
Wire Wire Line
	4600 2900 4700 2900
Wire Wire Line
	5300 2900 5600 2900
Wire Wire Line
	3500 2700 5600 2700
Wire Wire Line
	6400 3500 7150 3500
Wire Wire Line
	6400 3500 6400 5750
Wire Wire Line
	7150 3250 7150 3500
Wire Wire Line
	7250 3250 7250 3600
Wire Wire Line
	7350 3250 7350 3700
Wire Wire Line
	7450 3250 7450 3800
Wire Wire Line
	7550 3250 7550 3900
Wire Wire Line
	6500 3600 6500 4750
Connection ~ 6500 4750
Wire Wire Line
	6500 3600 7250 3600
Wire Wire Line
	6500 4750 7400 4750
Wire Wire Line
	6800 5050 7400 5050
Wire Wire Line
	6700 4950 7400 4950
Wire Wire Line
	6600 4850 7400 4850
Wire Wire Line
	6600 4850 6600 3700
Wire Wire Line
	6600 3700 7350 3700
Wire Wire Line
	6700 4950 6700 3800
Wire Wire Line
	6700 3800 7450 3800
Wire Wire Line
	6800 5050 6800 3900
Wire Wire Line
	6800 3900 7550 3900
Wire Wire Line
	7050 5250 7050 4050
Wire Wire Line
	7050 5250 7400 5250
Wire Wire Line
	3350 4800 3400 4800
Wire Wire Line
	3400 4800 3400 4850
Wire Wire Line
	3500 6450 3500 5450
Wire Wire Line
	2950 5950 3150 5950
Wire Wire Line
	2950 6050 3150 6050
Wire Wire Line
	2950 6150 3150 6150
Wire Wire Line
	2950 6250 3150 6250
Wire Wire Line
	2950 6350 3150 6350
Wire Wire Line
	2950 6450 3150 6450
Wire Wire Line
	2950 6550 3150 6550
Wire Wire Line
	2950 6650 3150 6650
Wire Wire Line
	1450 6850 1950 6850
Entry Wire Line
	3000 4650 3100 4750
Text Label 2850 4650 0    50   ~ 0
DD7
Text GLabel 3100 4850 3    50   Input ~ 0
DD[0..7]
Wire Bus Line
	3100 4850 3100 4750
Wire Wire Line
	2800 4650 3000 4650
Text Notes 8150 7650 0    66   ~ 0
May 19, 2019
Text Notes 7350 7500 0    66   Italic 13
Execution and Control Unit
Wire Wire Line
	3600 4650 3600 4850
Connection ~ 6600 4850
Connection ~ 6700 4950
Connection ~ 6800 5050
Wire Wire Line
	4550 6950 6000 6950
Wire Wire Line
	3350 4450 7400 4450
Wire Wire Line
	3350 4550 7400 4550
Wire Wire Line
	3600 4650 5450 4650
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D19DB0A
P 4300 5450
AR Path="/5CDEEC9F/5D19DB0A" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D19DB0A" Ref="D1"  Part="1" 
F 0 "D1" H 4350 5600 50  0000 R CNN
F 1 "D_Schottky_ALT" H 4300 5575 50  0001 C CNN
F 2 "" H 4300 5450 50  0001 C CNN
F 3 "~" H 4300 5450 50  0001 C CNN
	1    4300 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5900 6000 6950
Connection ~ 6000 6950
Wire Wire Line
	6000 6950 6050 6950
Text GLabel 4100 5450 0    50   Input ~ 0
~jmp
Wire Wire Line
	4150 5450 4100 5450
Wire Wire Line
	4550 6550 5000 6550
Wire Wire Line
	5000 6550 6050 6550
Connection ~ 5000 6550
Wire Wire Line
	4600 6250 6050 6250
Wire Wire Line
	4550 6250 4600 6250
Connection ~ 4600 6250
Wire Wire Line
	6000 5450 5800 5450
Wire Wire Line
	6000 5450 6000 5600
Wire Wire Line
	5800 5850 5800 5450
Wire Wire Line
	4600 6150 4600 6250
Wire Wire Line
	4800 5900 4800 6350
Wire Wire Line
	5000 6150 5000 6550
Wire Wire Line
	5200 5900 5200 6650
Wire Wire Line
	5400 6150 5400 6850
Wire Wire Line
	5600 5900 5600 6450
Wire Wire Line
	5800 6150 5800 6750
Connection ~ 5800 5450
Wire Wire Line
	4450 5450 4600 5450
Wire Wire Line
	6500 4750 5000 4750
Wire Wire Line
	6600 4850 5200 4850
Wire Wire Line
	6700 4950 5400 4950
Wire Wire Line
	6800 5050 5600 5050
Wire Wire Line
	5600 5050 5600 5300
Wire Wire Line
	5000 4750 5000 5150
Wire Wire Line
	5200 4850 5200 5600
Wire Wire Line
	5400 4950 5400 5850
Wire Wire Line
	5800 5450 5800 5300
Wire Wire Line
	5800 5300 5600 5300
Connection ~ 5600 5300
Wire Wire Line
	5600 5300 5600 5600
Wire Wire Line
	4800 5300 4800 5150
Wire Wire Line
	4800 5150 5000 5150
Connection ~ 4800 5300
Connection ~ 5000 5150
Wire Wire Line
	4600 5300 4800 5300
Wire Wire Line
	5000 5150 5000 5850
Wire Wire Line
	4800 5300 4800 5600
Wire Wire Line
	4600 5300 4600 5450
Connection ~ 4600 5450
Wire Wire Line
	4600 5450 4600 5850
$Comp
L power:VCC #PWR0146
U 1 1 5ECE4C75
P 7900 4050
F 0 "#PWR0146" H 7900 3900 50  0001 C CNN
F 1 "VCC" H 7917 4223 50  0000 C CNN
F 2 "" H 7900 4050 50  0001 C CNN
F 3 "" H 7900 4050 50  0001 C CNN
	1    7900 4050
	1    0    0    -1  
$EndComp
Wire Bus Line
	1650 5750 1650 6550
Wire Bus Line
	3250 2200 3250 6550
$EndSCHEMATC
