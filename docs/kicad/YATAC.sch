EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "YATAC78 TTL Computer"
Date "2019-10-19"
Rev "1.0.9"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2600 2350 0    50   ~ 0
I7
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 1900 3800
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U9"  Part="1" 
F 0 "U9" H 1900 3850 50  0000 C CNN
F 1 "74F138" H 1850 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1900 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1900 3800 50  0001 C CNN
	1    1900 3800
	-1   0    0    -1  
$EndComp
Text GLabel 1400 3800 0    50   Output ~ 0
~vle
Text GLabel 1400 3600 0    50   Output ~ 0
~ele
Text GLabel 1400 4100 0    50   Output ~ 0
~pcle
Text GLabel 1400 3500 0    50   Output ~ 0
~xle
Text GLabel 1400 3900 0    50   Output ~ 0
~yle
Text GLabel 1400 4000 0    50   Output ~ 0
~hlle
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 1900 3200
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 1900 3050 50  0001 C CNN
F 1 "VCC" H 1917 3373 50  0000 C CNN
F 2 "" H 1900 3200 50  0001 C CNN
F 3 "" H 1900 3200 50  0001 C CNN
	1    1900 3200
	1    0    0    -1  
$EndComp
Text GLabel 1400 3700 0    50   Output ~ 0
~sle
Text GLabel 1400 4200 0    50   Output ~ 0
~pgle
Text Label 2900 1950 0    50   ~ 0
DD7
Text Label 2600 4000 0    50   ~ 0
I9
Entry Wire Line
	1200 5250 1100 5150
Entry Wire Line
	1200 5350 1100 5250
Entry Wire Line
	1200 5450 1100 5350
Entry Wire Line
	1200 5550 1100 5450
Entry Wire Line
	1200 5650 1100 5550
Entry Wire Line
	1200 5750 1100 5650
Entry Wire Line
	1200 5850 1100 5750
Entry Wire Line
	1200 5950 1100 5850
Entry Wire Line
	2800 5350 2700 5250
Entry Wire Line
	2800 5450 2700 5350
Entry Wire Line
	2800 5550 2700 5450
Entry Wire Line
	2800 6050 2700 5950
Text Label 2900 5250 0    50   ~ 0
I8
Text Label 2900 5350 0    50   ~ 0
I9
Text Label 2900 5450 0    50   ~ 0
I10
Text Label 2900 5550 0    50   ~ 0
I11
Text Label 2900 5650 0    50   ~ 0
I12
Text Label 2900 5750 0    50   ~ 0
I13
Text Label 2900 5850 0    50   ~ 0
I14
Text Label 2900 5950 0    50   ~ 0
I15
Text Label 1200 5250 0    50   ~ 0
PD0
Text Label 1200 5350 0    50   ~ 0
PD1
Text Label 1200 5450 0    50   ~ 0
PD2
Text Label 1200 5550 0    50   ~ 0
PD3
Text Label 1200 5650 0    50   ~ 0
PD4
Text Label 1200 5750 0    50   ~ 0
PD5
Text Label 1200 5850 0    50   ~ 0
PD6
Text Label 1200 5950 0    50   ~ 0
PD7
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 1900 4950
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1900 4800 50  0001 C CNN
F 1 "VCC" H 1917 5123 50  0000 C CNN
F 2 "" H 1900 4950 50  0001 C CNN
F 3 "" H 1900 4950 50  0001 C CNN
	1    1900 4950
	1    0    0    -1  
$EndComp
Entry Wire Line
	2800 5950 2700 5850
Entry Wire Line
	2800 5850 2700 5750
Entry Wire Line
	2800 5750 2700 5650
Entry Wire Line
	2800 5650 2700 5550
Wire Wire Line
	1200 5250 1400 5250
Wire Wire Line
	1200 5350 1400 5350
Wire Wire Line
	1200 5450 1400 5450
Wire Wire Line
	1200 5550 1400 5550
Wire Wire Line
	1200 5650 1400 5650
Wire Wire Line
	1200 5750 1400 5750
Wire Wire Line
	1200 5850 1400 5850
Wire Wire Line
	1200 5950 1400 5950
Text GLabel 1400 1550 0    50   Output ~ 0
PA17
Text GLabel 1400 2050 0    50   Output ~ 0
fetch
Text GLabel 1400 1950 0    50   Output ~ 0
hsel
Text GLabel 1400 1850 0    50   Output ~ 0
boot
Entry Wire Line
	2700 2150 2800 2250
Text Label 2600 2150 0    50   ~ 0
I5
Entry Wire Line
	2700 2250 2800 2350
Entry Wire Line
	2700 2350 2800 2450
Wire Wire Line
	4200 5950 4400 5950
Wire Wire Line
	4200 5850 4400 5850
Wire Wire Line
	4200 5750 4400 5750
Wire Wire Line
	4200 5650 4400 5650
Wire Wire Line
	4200 5550 4400 5550
Wire Wire Line
	4200 5450 4400 5450
Wire Wire Line
	4200 5350 4400 5350
Wire Wire Line
	4200 5250 4400 5250
Entry Wire Line
	4500 5650 4400 5550
Entry Wire Line
	4500 5750 4400 5650
Entry Wire Line
	4500 5850 4400 5750
Entry Wire Line
	4500 5950 4400 5850
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7C8
P 1900 1300
AR Path="/5CDEEC9F/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7C8" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 1900 1150 50  0001 C CNN
F 1 "VCC" H 1917 1473 50  0000 C CNN
F 2 "" H 1900 1300 50  0001 C CNN
F 3 "" H 1900 1300 50  0001 C CNN
	1    1900 1300
	1    0    0    -1  
$EndComp
Text GLabel 1100 4950 1    50   Input ~ 0
PD[0..7]
Text Label 4250 5950 0    50   ~ 0
PD7
Text Label 4250 5850 0    50   ~ 0
PD6
Text Label 4250 5750 0    50   ~ 0
PD5
Text Label 4250 5650 0    50   ~ 0
PD4
Text Label 4250 5550 0    50   ~ 0
PD3
Text Label 4250 5450 0    50   ~ 0
PD2
Text Label 4250 5350 0    50   ~ 0
PD1
Text Label 4250 5250 0    50   ~ 0
PD0
Text Label 2600 5950 0    50   ~ 0
I7
Text Label 2600 5850 0    50   ~ 0
I6
Text Label 2600 5750 0    50   ~ 0
I5
Text Label 2600 5650 0    50   ~ 0
I4
Text Label 2600 5550 0    50   ~ 0
I3
Text Label 2600 5450 0    50   ~ 0
I2
Text Label 2600 5350 0    50   ~ 0
I1
Text Label 2600 5250 0    50   ~ 0
I0
Entry Wire Line
	4500 6050 4400 5950
Entry Wire Line
	4500 5550 4400 5450
Entry Wire Line
	4500 5450 4400 5350
Entry Wire Line
	4500 5350 4400 5250
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 3700 6550
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3700 6300 50  0001 C CNN
F 1 "GNDD" H 3704 6395 50  0000 C CNN
F 2 "" H 3700 6550 50  0001 C CNN
F 3 "" H 3700 6550 50  0001 C CNN
	1    3700 6550
	1    0    0    -1  
$EndComp
Entry Wire Line
	2800 5950 2900 5850
Entry Wire Line
	2800 5850 2900 5750
Entry Wire Line
	2800 5750 2900 5650
Entry Wire Line
	2800 5650 2900 5550
Entry Wire Line
	2800 5550 2900 5450
Entry Wire Line
	2800 5450 2900 5350
Entry Wire Line
	2800 5350 2900 5250
Entry Wire Line
	2800 6050 2900 5950
Text GLabel 1400 6250 0    50   Input ~ 0
0
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 3700 5750
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U11"  Part="1" 
F 0 "U11" H 3700 5550 50  0000 C CNN
F 1 "74F574" H 3700 5450 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3700 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3700 5750 50  0001 C CNN
	1    3700 5750
	-1   0    0    -1  
$EndComp
Entry Wire Line
	2700 3500 2800 3600
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 3700 4850
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3700 4700 50  0001 C CNN
F 1 "VCC" H 3717 5023 50  0000 C CNN
F 2 "" H 3700 4850 50  0001 C CNN
F 3 "" H 3700 4850 50  0001 C CNN
	1    3700 4850
	1    0    0    -1  
$EndComp
Text GLabel 2800 6350 3    50   Output ~ 0
I[0..15]
Text Label 2600 2250 0    50   ~ 0
I6
Text Label 2600 3700 0    50   ~ 0
I8
Text Label 2600 3600 0    50   ~ 0
I1
Text Label 2600 3500 0    50   ~ 0
I0
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 1900 4500
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 1900 4250 50  0001 C CNN
F 1 "GNDD" H 1904 4345 50  0000 C CNN
F 2 "" H 1900 4500 50  0001 C CNN
F 3 "" H 1900 4500 50  0001 C CNN
	1    1900 4500
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 1900 2050
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U12"  Part="1" 
F 0 "U12" H 1900 1900 50  0000 C CNN
F 1 "PAL16R4" H 1900 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1900 2050 50  0001 C CNN
F 3 "" H 1900 2050 50  0001 C CNN
	1    1900 2050
	-1   0    0    -1  
$EndComp
Entry Wire Line
	2700 3700 2800 3800
Entry Wire Line
	2700 3600 2800 3700
Text GLabel 2400 1850 2    50   Input ~ 0
hblank
Text GLabel 2400 1750 2    50   Input ~ 0
pclk
Text GLabel 2400 2450 2    50   Input ~ 0
0
Text GLabel 2400 1550 2    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 1900 2750
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 1900 2500 50  0001 C CNN
F 1 "GNDD" H 1904 2595 50  0000 C CNN
F 2 "" H 1900 2750 50  0001 C CNN
F 3 "" H 1900 2750 50  0001 C CNN
	1    1900 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 3300 4500
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 3850 4450 50  0000 L CNN
F 1 "270" V 3750 4450 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3775 4500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3300 4500 50  0001 C CNN
	1    3300 4500
	0    1    -1   0   
$EndComp
Wire Wire Line
	4300 6250 4200 6250
Text GLabel 3150 1950 2    50   Input ~ 0
DD[0..7]
Entry Wire Line
	2700 2050 2800 2150
Text Label 2600 2050 0    50   ~ 0
I4
Text Label 2900 2250 0    50   ~ 0
I3
Entry Wire Line
	2900 2250 2800 2350
Text GLabel 1400 2250 0    50   Output ~ 0
pcent
Text GLabel 1400 1650 0    50   Output ~ 0
PA16
Text Label 2900 2050 0    50   ~ 0
I10
Entry Wire Line
	2900 2050 2800 2150
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 1900 6550
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1900 6300 50  0001 C CNN
F 1 "GNDD" H 1904 6395 50  0000 C CNN
F 2 "" H 1900 6550 50  0001 C CNN
F 3 "" H 1900 6550 50  0001 C CNN
	1    1900 6550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 1900 5750
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U10"  Part="1" 
F 0 "U10" H 1900 5550 50  0000 C CNN
F 1 "74F574" H 1900 5450 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1900 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1900 5750 50  0001 C CNN
	1    1900 5750
	1    0    0    -1  
$EndComp
Entry Wire Line
	2700 4000 2800 4100
Text GLabel 2400 4100 2    50   Input ~ 0
~store
Text GLabel 2400 4200 2    50   Input ~ 0
qclk
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 5D9CA9D5
P 7350 5700
F 0 "X1" H 7600 6100 50  0000 L CNN
F 1 "ACH-32M" H 7450 6000 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 7800 5350 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7250 5700 50  0001 C CNN
	1    7350 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D9CBE89
P 7350 6000
AR Path="/5CDEEC9F/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5D9CBE89" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7350 5750 50  0001 C CNN
F 1 "GNDD" H 7354 5845 50  0000 C CNN
F 2 "" H 7350 6000 50  0001 C CNN
F 3 "" H 7350 6000 50  0001 C CNN
	1    7350 6000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0191
U 1 1 5D9DED2A
P 7350 5400
AR Path="/5D9DED2A" Ref="#PWR0191"  Part="1" 
AR Path="/5DAA5CD8/5D9DED2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 7350 5250 50  0001 C CNN
F 1 "VCC" H 7367 5573 50  0000 C CNN
F 2 "" H 7350 5400 50  0001 C CNN
F 3 "" H 7350 5400 50  0001 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
Text Notes 4750 4650 0    150  ~ 0
CPU
$Sheet
S 4700 4250 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Text Notes 5750 4650 0    150  ~ 0
GPU
$Sheet
S 5700 4250 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Text Notes 5800 3750 0    150  ~ 0
I/O
$Sheet
S 5700 3350 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Wire Wire Line
	4200 6150 5000 6150
Text GLabel 5000 5550 0    50   Output ~ 0
~read
Text GLabel 5000 5450 0    50   Output ~ 0
~write
NoConn ~ 5000 5350
Text GLabel 6000 5550 2    50   Input ~ 0
pclk
$Comp
L 74xx:74LS32 U?
U 4 1 5DA1E854
P 4800 3750
AR Path="/5CDEEC9F/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DA1E854" Ref="U3"  Part="4" 
F 0 "U3" H 4800 3750 50  0000 C CNN
F 1 "74F32" H 4800 3550 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4800 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4800 3750 50  0001 C CNN
	4    4800 3750
	1    0    0    1   
$EndComp
NoConn ~ 5000 5950
NoConn ~ 5000 6050
Text GLabel 6000 6050 2    50   Input ~ 0
hsel
Text GLabel 6000 6250 2    50   Input ~ 0
qclk
Text GLabel 6000 5950 2    50   Input ~ 0
fetch
Entry Bus Bus
	1100 7000 1200 7100
Entry Bus Bus
	4400 7100 4500 7000
Wire Wire Line
	1200 6150 1200 6950
Wire Wire Line
	1400 6150 1200 6150
Wire Wire Line
	4700 6250 5000 6250
Text GLabel 9250 2850 2    50   Output ~ 0
~poe
Text GLabel 9250 2550 2    50   Output ~ 0
~xoe
Text GLabel 9250 2750 2    50   Output ~ 0
~alue
Text GLabel 9250 2650 2    50   Output ~ 0
~pgoe
Text GLabel 8250 3150 0    50   Input ~ 0
0
Text GLabel 8250 2350 0    50   Input ~ 0
fetch
Entry Wire Line
	2900 3050 2800 3150
Entry Wire Line
	2900 2950 2800 3050
Text Label 2900 3050 0    50   ~ 0
I4
Entry Wire Line
	2900 2450 2800 2550
Text Label 2900 2450 0    50   ~ 0
I2
Text Label 2900 3850 0    50   ~ 0
I5
Entry Wire Line
	2900 3850 2800 3950
NoConn ~ 1400 1750
$Comp
L Device:R_US R?
U 1 1 5DDC373A
P 2800 1450
AR Path="/62D13D9D/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D9AFF37/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DA1E9C0/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DDC373A" Ref="R1"  Part="1" 
F 0 "R1" H 2950 1500 50  0000 C CNN
F 1 "1k" H 2950 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2840 1440 50  0001 C CNN
F 3 "~" H 2800 1450 50  0001 C CNN
	1    2800 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DFC5D92
P 2800 1300
AR Path="/5CDEEC9F/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DFC5D92" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 2800 1150 50  0001 C CNN
F 1 "VCC" H 2817 1473 50  0000 C CNN
F 2 "" H 2800 1300 50  0001 C CNN
F 3 "" H 2800 1300 50  0001 C CNN
	1    2800 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 1950 3150 1950
Wire Wire Line
	2400 2050 2700 2050
Wire Wire Line
	2400 2150 2700 2150
Wire Wire Line
	2400 2250 2700 2250
Wire Wire Line
	2400 2350 2700 2350
Wire Wire Line
	2400 4000 2700 4000
Wire Wire Line
	2400 3700 2700 3700
Wire Wire Line
	2400 3600 2700 3600
Wire Wire Line
	2400 3500 2700 3500
Wire Wire Line
	2900 5250 3200 5250
Wire Wire Line
	2900 5350 3200 5350
Wire Wire Line
	2900 5450 3200 5450
Wire Wire Line
	2900 5550 3200 5550
Wire Wire Line
	2900 5650 3200 5650
Wire Wire Line
	2900 5950 3200 5950
Wire Wire Line
	2900 5850 3200 5850
Wire Wire Line
	2900 5750 3200 5750
Wire Wire Line
	2400 5250 2700 5250
Wire Wire Line
	2400 5350 2700 5350
Wire Wire Line
	2400 5450 2700 5450
Wire Wire Line
	2400 5550 2700 5550
Wire Wire Line
	2400 5650 2700 5650
Wire Wire Line
	2400 5750 2700 5750
Wire Wire Line
	2400 5850 2700 5850
Wire Wire Line
	2400 5950 2500 5950
Wire Wire Line
	2500 5950 2500 6800
Connection ~ 2500 5950
Wire Wire Line
	2500 5950 2700 5950
Wire Wire Line
	2500 6800 4300 6800
Wire Wire Line
	1200 6950 4700 6950
Wire Bus Line
	1200 7100 4400 7100
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 5500 5350
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U6"  Part="1" 
F 0 "U6" H 5500 5350 50  0000 C CNN
F 1 "74F139" H 5450 5250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5500 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5500 5350 50  0001 C CNN
	1    5500 5350
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 5500 6050
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U6"  Part="2" 
F 0 "U6" H 5500 6050 50  0000 C CNN
F 1 "74F139" H 5450 5950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5500 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5500 6050 50  0001 C CNN
	2    5500 6050
	-1   0    0    -1  
$EndComp
Text GLabel 1400 2150 0    50   Output ~ 0
alu
Wire Wire Line
	7900 3050 8250 3050
Text GLabel 8000 5700 2    50   Output ~ 0
dclk
$Comp
L power:GNDD #PWR?
U 1 1 5E0603AE
P 3900 1750
AR Path="/5CDEEC9F/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5E0603AE" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 3900 1500 50  0001 C CNN
F 1 "GNDD" H 3904 1595 50  0000 C CNN
F 2 "" H 3900 1750 50  0001 C CNN
F 3 "" H 3900 1750 50  0001 C CNN
	1    3900 1750
	1    0    0    -1  
$EndComp
$Comp
L YATAC-rescue:SW_Push-Switch SW1
U 1 1 5E0603B4
P 3350 1650
AR Path="/5E0603B4" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5E0603B4" Ref="SW?"  Part="1" 
F 0 "SW1" H 3300 2000 50  0000 L CNN
F 1 "Reset" H 3250 1900 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 3350 1850 50  0001 C CNN
F 3 "~" H 3350 1850 50  0001 C CNN
	1    3350 1650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3650 1650 3700 1650
Wire Wire Line
	3650 1750 3700 1750
Wire Wire Line
	2400 1650 2800 1650
Wire Wire Line
	2800 1600 2800 1650
Wire Wire Line
	1900 1350 1900 1300
Connection ~ 2800 1650
Wire Wire Line
	2800 1650 3050 1650
Text GLabel 4500 1850 0    50   Input ~ 0
pclk
Text GLabel 5100 1950 2    50   Output ~ 0
DA16
Wire Wire Line
	4200 3250 4500 3250
Text GLabel 4200 2950 2    50   Output ~ 0
~inoe
Text GLabel 5100 3750 2    50   Output ~ 0
~ale
Text GLabel 4500 3650 0    50   Input ~ 0
~alue
Wire Wire Line
	4450 3150 4450 3050
Wire Wire Line
	4200 3150 4450 3150
Wire Wire Line
	4450 3050 4500 3050
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 3700 3050
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U5"  Part="2" 
F 0 "U5" H 3700 3050 50  0000 C CNN
F 1 "74F139" H 3650 2950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3700 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3700 3050 50  0001 C CNN
	2    3700 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2750 4450 2850
Connection ~ 4450 2750
Wire Wire Line
	4450 2650 4500 2650
Wire Wire Line
	4450 2650 4450 2750
$Comp
L 74xx:74LS08 U?
U 2 1 5DA1E903
P 4800 3350
AR Path="/5CDEEC9F/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DA1E903" Ref="U2"  Part="2" 
F 0 "U2" H 4800 3350 50  0000 C CNN
F 1 "74F08" H 4800 3550 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4800 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4800 3350 50  0001 C CNN
	2    4800 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2750 4450 2750
Text GLabel 5100 3350 2    50   Output ~ 0
~doe
Text GLabel 4200 3050 2    50   Output ~ 0
~eoe
Wire Wire Line
	4500 2850 4450 2850
Text GLabel 4350 2750 0    50   Input ~ 0
~write
Text GLabel 3200 3250 0    50   Input ~ 0
~read
Text GLabel 5100 2550 2    50   Output ~ 0
~dwe
Text GLabel 5100 2950 2    50   Output ~ 0
~aoe
Text GLabel 4500 3450 0    50   Input ~ 0
qclk
Text Label 2900 2950 0    50   ~ 0
I11
$Comp
L 74xx:74LS08 U?
U 1 1 5DA1E75E
P 4800 2950
AR Path="/5CDEEC9F/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DA1E75E" Ref="U2"  Part="1" 
F 0 "U2" H 4800 2950 50  0000 C CNN
F 1 "74F08" H 4800 2750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4800 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4800 2950 50  0001 C CNN
	1    4800 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 3850 4500 3850
Wire Wire Line
	2900 3050 3200 3050
Wire Wire Line
	2900 2950 3200 2950
Wire Wire Line
	2900 2450 4500 2450
Wire Wire Line
	2900 2050 4500 2050
Text GLabel 9700 4750 2    50   Output ~ 0
rclk
Text GLabel 9700 4850 2    50   Output ~ 0
sclk
$Comp
L 74xx:74LS86 U1
U 1 1 5D9EA8C5
P 7350 4550
F 0 "U1" H 7350 4550 50  0000 C CNN
F 1 "74F86" H 7350 4784 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 4550 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7350 4550 50  0001 C CNN
	1    7350 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U?
U 2 1 5DDAB655
P 7350 4950
AR Path="/5DA1E9BD/5DDAB655" Ref="U?"  Part="2" 
AR Path="/5DDAB655" Ref="U1"  Part="2" 
F 0 "U1" H 7350 4950 50  0000 C CNN
F 1 "74F86" H 7350 5184 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 4950 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7350 4950 50  0001 C CNN
	2    7350 4950
	1    0    0    -1  
$EndComp
Text GLabel 9250 4950 2    50   Output ~ 0
mclk
NoConn ~ 6700 2950
Text GLabel 5700 2950 0    50   Input ~ 0
rclk
Text GLabel 5700 2750 0    50   Input ~ 0
alu
Text GLabel 5700 2650 0    50   Input ~ 0
boot
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 6200 2750
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U5"  Part="1" 
F 0 "U5" H 6200 2750 50  0000 C CNN
F 1 "74F139" H 6150 2650 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6200 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6200 2750 50  0001 C CNN
	1    6200 2750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DA1E72A
P 7350 1950
AR Path="/5CDEEC9F/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DA1E72A" Ref="U3"  Part="2" 
F 0 "U3" H 7350 1950 50  0000 C CNN
F 1 "74F32" H 7350 1750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7350 1950 50  0001 C CNN
	2    7350 1950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E7A5
P 4800 1950
AR Path="/5CDEEC9F/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DA1E7A5" Ref="U3"  Part="1" 
F 0 "U3" H 4800 1950 50  0000 C CNN
F 1 "74F32" H 4800 1750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4800 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4800 1950 50  0001 C CNN
	1    4800 1950
	1    0    0    -1  
$EndComp
Text GLabel 7050 2450 0    50   Input ~ 0
sclk
Text GLabel 8250 5550 0    50   Input ~ 0
0
NoConn ~ 7050 5700
NoConn ~ 5000 5250
Text GLabel 6000 5250 2    50   Input ~ 0
1
Text GLabel 6000 5350 2    50   Input ~ 0
~store
Text GLabel 9250 2450 2    50   Output ~ 0
~voe
Text GLabel 9700 4550 2    50   Output ~ 0
pclk
Text GLabel 9700 4650 2    50   Output ~ 0
qclk
Wire Wire Line
	9250 4750 9500 4750
Wire Wire Line
	9250 4650 9400 4650
Wire Wire Line
	9250 4550 9300 4550
Wire Wire Line
	7650 2350 7750 2350
Wire Wire Line
	7650 3050 7750 3050
$Comp
L power:GNDD #PWR?
U 1 1 5DA5D9CE
P 8750 5850
AR Path="/5CDEEC9F/5DA5D9CE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9CE" Ref="#PWR?"  Part="1" 
AR Path="/5DA5D9CE" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8750 5600 50  0001 C CNN
F 1 "GNDD" H 8754 5695 50  0000 C CNN
F 2 "" H 8750 5850 50  0001 C CNN
F 3 "" H 8750 5850 50  0001 C CNN
	1    8750 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DA5D9D4
P 8750 5050
AR Path="/5CDEEC9F/5DA5D9D4" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9D4" Ref="U?"  Part="1" 
AR Path="/5DA5D9D4" Ref="U7"  Part="1" 
F 0 "U7" H 8750 4850 50  0000 C CNN
F 1 "74F574" H 8750 4750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8750 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8750 5050 50  0001 C CNN
	1    8750 5050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA5D9DA
P 8750 4250
AR Path="/5CDEEC9F/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DA5D9DA" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8750 4100 50  0001 C CNN
F 1 "VCC" H 8767 4423 50  0000 C CNN
F 2 "" H 8750 4250 50  0001 C CNN
F 3 "" H 8750 4250 50  0001 C CNN
	1    8750 4250
	1    0    0    -1  
$EndComp
Text GLabel 7050 4650 0    50   Input ~ 0
1
Wire Wire Line
	7900 5450 8250 5450
Wire Wire Line
	9250 4850 9600 4850
Wire Wire Line
	8250 4750 8200 4750
Wire Wire Line
	8200 4000 8200 4750
Wire Wire Line
	8100 4850 8250 4850
Wire Wire Line
	8100 3900 9400 3900
Connection ~ 8200 4000
Wire Wire Line
	9600 4850 9700 4850
Connection ~ 9600 4850
Wire Wire Line
	9500 4750 9700 4750
Connection ~ 9500 4750
Wire Wire Line
	9400 4650 9700 4650
Connection ~ 9400 4650
Wire Wire Line
	9300 4550 9700 4550
Connection ~ 9300 4550
Wire Wire Line
	7750 3050 7750 2850
Wire Wire Line
	7750 2850 8250 2850
Wire Wire Line
	7750 2550 7750 2350
Wire Wire Line
	7750 2550 8250 2550
Wire Wire Line
	6950 2950 6950 2650
Wire Wire Line
	6950 2950 7050 2950
Wire Wire Line
	6800 2850 6800 3150
Wire Wire Line
	6800 3150 7050 3150
Wire Wire Line
	7650 4550 8250 4550
Wire Wire Line
	7650 4950 8250 4950
Wire Wire Line
	8200 4000 9300 4000
$Comp
L power:GNDD #PWR?
U 1 1 5DEA197D
P 8750 3450
AR Path="/5CDEEC9F/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DEA197D" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 8750 3200 50  0001 C CNN
F 1 "GNDD" H 8754 3295 50  0000 C CNN
F 2 "" H 8750 3450 50  0001 C CNN
F 3 "" H 8750 3450 50  0001 C CNN
	1    8750 3450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DEA1983
P 8750 2650
AR Path="/5CDEEC9F/5DEA1983" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DEA1983" Ref="U?"  Part="1" 
AR Path="/5DEA1983" Ref="U8"  Part="1" 
F 0 "U8" H 8750 2450 50  0000 C CNN
F 1 "74F574" H 8750 2350 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8750 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8750 2650 50  0001 C CNN
	1    8750 2650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DEA1989
P 8750 1850
AR Path="/5CDEEC9F/5DEA1989" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEA1989" Ref="#PWR?"  Part="1" 
AR Path="/5DEA1989" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 8750 1700 50  0001 C CNN
F 1 "VCC" H 8767 2023 50  0000 C CNN
F 2 "" H 8750 1850 50  0001 C CNN
F 3 "" H 8750 1850 50  0001 C CNN
	1    8750 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5E0DFF1D
P 4800 2550
AR Path="/5CDEEC9F/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5E0DFF1D" Ref="U4"  Part="1" 
AR Path="/5DA1E9BD/5E0DFF1D" Ref="U?"  Part="1" 
F 0 "U4" H 4800 2550 50  0000 C CNN
F 1 "74F32" H 4800 2800 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4800 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4800 2550 50  0001 C CNN
	1    4800 2550
	1    0    0    1   
$EndComp
Text GLabel 7050 2050 0    50   Input ~ 0
rclk
Wire Wire Line
	8250 2450 7900 2450
Wire Wire Line
	7900 2450 7900 1950
Wire Wire Line
	7900 1950 7650 1950
Text GLabel 7050 1850 0    50   Input ~ 0
hblank
Text GLabel 9250 2150 2    50   Output ~ 0
~hsync
Text GLabel 9250 2250 2    50   Output ~ 0
~cle
Text GLabel 9250 2350 2    50   Output ~ 0
~store
$Comp
L 74xx:74LS86 U1
U 3 1 5E144A34
P 7350 3050
AR Path="/5E144A34" Ref="U1"  Part="3" 
AR Path="/5DA1E9BD/5E144A34" Ref="U?"  Part="3" 
F 0 "U1" H 7350 3050 50  0000 C CNN
F 1 "74F86" H 7350 3284 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 3050 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7350 3050 50  0001 C CNN
	3    7350 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DA1E90F
P 7350 2350
AR Path="/5CDEEC9F/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DA1E90F" Ref="U3"  Part="3" 
F 0 "U3" H 7350 2350 50  0000 C CNN
F 1 "74F32" H 7350 2150 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7350 2350 50  0001 C CNN
	3    7350 2350
	1    0    0    -1  
$EndComp
Text GLabel 8250 2150 0    50   Input ~ 0
~gsync
Text GLabel 8250 2250 0    50   Input ~ 0
s1
Text GLabel 9250 5150 2    50   Output ~ 0
g
Text GLabel 9250 5050 2    50   Output ~ 0
r
Text GLabel 9250 5250 2    50   Output ~ 0
b
Wire Wire Line
	6700 2850 6800 2850
Wire Wire Line
	6700 2650 6950 2650
Connection ~ 6950 2650
Wire Wire Line
	7650 5700 7900 5700
Wire Wire Line
	6700 2750 8250 2750
Text GLabel 8250 5050 0    50   Input ~ 0
gr
Text GLabel 8250 5150 0    50   Input ~ 0
gg
Text GLabel 8250 5250 0    50   Input ~ 0
gb
Wire Wire Line
	8000 3800 8000 4650
Wire Wire Line
	8000 4650 8250 4650
Connection ~ 8000 3800
Wire Wire Line
	8000 3800 9500 3800
Wire Wire Line
	7050 4450 7000 4450
Wire Wire Line
	7000 3800 8000 3800
Wire Wire Line
	6700 5050 7050 5050
Wire Wire Line
	6700 3700 9600 3700
Wire Wire Line
	6850 4850 7050 4850
Wire Wire Line
	6850 4000 8200 4000
Wire Wire Line
	7900 5700 8000 5700
Connection ~ 7900 5700
Text Label 2900 4200 0    50   ~ 0
I15
Text Label 2900 4300 0    50   ~ 0
I14
Text Label 2900 4400 0    50   ~ 0
I13
Text Label 2900 4500 0    50   ~ 0
I12
Text Label 2900 4600 0    50   ~ 0
I11
Text Label 2900 4700 0    50   ~ 0
I10
Text Label 2900 4800 0    50   ~ 0
I9
Text Label 2900 4900 0    50   ~ 0
I8
Entry Wire Line
	2800 4900 2900 4800
Entry Wire Line
	2800 4800 2900 4700
Entry Wire Line
	2800 4700 2900 4600
Entry Wire Line
	2800 4600 2900 4500
Entry Wire Line
	2800 4500 2900 4400
Entry Wire Line
	2800 4400 2900 4300
Entry Wire Line
	2800 4300 2900 4200
Entry Wire Line
	2800 5000 2900 4900
Wire Wire Line
	3500 4900 3700 4900
Wire Wire Line
	3700 4900 3700 4950
Wire Wire Line
	3700 4900 3700 4850
Connection ~ 3700 4900
Wire Wire Line
	2900 4900 3100 4900
Wire Wire Line
	2900 4800 3100 4800
Wire Wire Line
	2900 4700 3100 4700
Wire Wire Line
	2900 4600 3100 4600
Wire Wire Line
	2900 4200 3100 4200
Wire Wire Line
	2900 4300 3100 4300
Wire Wire Line
	2900 4400 3100 4400
Wire Wire Line
	2900 4500 3100 4500
Wire Wire Line
	6700 5050 6700 3700
Wire Wire Line
	6850 4850 6850 4000
Wire Wire Line
	7000 4450 7000 3800
Wire Wire Line
	8100 4850 8100 3900
Wire Wire Line
	9600 4850 9600 3700
Wire Wire Line
	9500 4750 9500 3800
Wire Wire Line
	9400 4650 9400 3900
Wire Wire Line
	9300 4550 9300 4000
Wire Wire Line
	7900 5450 7900 5700
Wire Wire Line
	4300 6250 4300 6800
Wire Wire Line
	4700 6250 4700 6950
Wire Wire Line
	3700 1650 3700 1700
Wire Wire Line
	3900 1750 3900 1700
Wire Wire Line
	3900 1700 3700 1700
Connection ~ 3700 1700
Wire Wire Line
	3700 1700 3700 1750
Wire Wire Line
	7900 5450 7900 3050
Connection ~ 7900 5450
Wire Wire Line
	6950 2650 8250 2650
Wire Wire Line
	2900 2250 7050 2250
Wire Bus Line
	4500 5350 4500 7000
Wire Bus Line
	1100 4950 1100 7000
Wire Bus Line
	2800 2150 2800 6350
$EndSCHEMATC
