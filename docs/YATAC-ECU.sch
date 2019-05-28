EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "Execution and Control Unit"
Date "2019-05-23"
Rev "0.5"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS139 U?
U 2 1 5DB93139
P 4000 3300
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U6"  Part="2" 
F 0 "U6" H 4000 3300 50  0000 C CNN
F 1 "74ALS139" H 3950 3200 50  0000 C CNN
F 2 "" H 4000 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 3300 50  0001 C CNN
	2    4000 3300
	1    0    0    -1  
$EndComp
Text GLabel 5650 1950 0    50   Input ~ 0
qclk1
Text GLabel 6250 1850 2    50   Output ~ 0
~pgle
Text GLabel 6250 1250 2    50   Output ~ 0
~pcpe
Text GLabel 7300 1650 2    50   Output ~ 0
~pcmr
Wire Wire Line
	4500 3200 4550 3200
$Comp
L 74xx:74LS574 U?
U 1 1 5DB93147
P 2400 6250
AR Path="/5CDEEC9F/5DB93147" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93147" Ref="U18"  Part="1" 
F 0 "U18" H 2400 6050 50  0000 C CNN
F 1 "74F574" H 2400 5950 50  0000 C CNN
F 2 "" H 2400 6250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2400 6250 50  0001 C CNN
	1    2400 6250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 8400 2150
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U4"  Part="1" 
F 0 "U4" H 8400 2150 50  0000 C CNN
F 1 "74F32" H 8400 1950 50  0001 C CNN
F 2 "" H 8400 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8400 2150 50  0001 C CNN
	1    8400 2150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 7700 2850
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U4"  Part="3" 
F 0 "U4" H 7700 2850 50  0000 C CNN
F 1 "74F32" H 7700 2650 50  0001 C CNN
F 2 "" H 7700 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7700 2850 50  0001 C CNN
	3    7700 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DB9315A
P 7700 2250
AR Path="/5CDEEC9F/5DB9315A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9315A" Ref="U2"  Part="1" 
F 0 "U2" H 7700 2250 50  0000 C CNN
F 1 "74F00" H 7700 2050 50  0001 C CNN
F 2 "" H 7700 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7700 2250 50  0001 C CNN
	1    7700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2550 7350 2550
Wire Wire Line
	8050 2550 8050 2850
Connection ~ 8050 2850
Wire Wire Line
	8050 2850 8100 2850
Wire Wire Line
	8000 2850 8050 2850
Wire Wire Line
	8000 2250 8050 2250
Connection ~ 8050 2250
Wire Wire Line
	8050 2250 8100 2250
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9900 3550
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9900 3300 50  0001 C CNN
F 1 "GNDD" H 9904 3395 50  0000 C CNN
F 2 "" H 9900 3550 50  0001 C CNN
F 3 "" H 9900 3550 50  0001 C CNN
	1    9900 3550
	1    0    0    -1  
$EndComp
Text GLabel 7400 2150 0    50   Input ~ 0
rclk
Text GLabel 7400 2950 0    50   Input ~ 0
sclk
Wire Wire Line
	8050 3050 8100 3050
$Comp
L power:GNDD #PWR?
U 1 1 5DB93177
P 2250 3050
AR Path="/5CDEEC9F/5DB93177" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB93177" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 2250 2800 50  0001 C CNN
F 1 "GNDD" H 2254 2895 50  0000 C CNN
F 2 "" H 2250 3050 50  0001 C CNN
F 3 "" H 2250 3050 50  0001 C CNN
	1    2250 3050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 5000 1550
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U6"  Part="1" 
F 0 "U6" H 5000 1550 50  0000 C CNN
F 1 "74ALS139" H 4950 1450 50  0000 C CNN
F 2 "" H 5000 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5000 1550 50  0001 C CNN
	1    5000 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2050 8050 2050
$Comp
L 74xx:74LS157 U?
U 1 1 5DB93191
P 2250 2050
AR Path="/5CDEEC9F/5DB93191" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93191" Ref="U12"  Part="1" 
F 0 "U12" H 2250 1950 50  0000 C CNN
F 1 "74F157" H 2250 1850 50  0000 C CNN
F 2 "" H 2250 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2250 2050 50  0001 C CNN
	1    2250 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3500 3500 3500
Text GLabel 4750 2600 2    50   Output ~ 0
I3+4
Wire Wire Line
	4150 2600 4350 2600
Connection ~ 4350 2600
Wire Wire Line
	4350 2600 4750 2600
Wire Wire Line
	4550 2450 4550 2400
Connection ~ 4550 2450
Entry Wire Line
	3200 3600 3300 3500
Entry Wire Line
	3200 3300 3300 3200
Entry Wire Line
	3200 3400 3300 3300
Entry Wire Line
	3200 2800 3300 2700
Entry Wire Line
	3200 2600 3300 2500
Wire Wire Line
	3300 3200 3500 3200
Wire Wire Line
	3300 3300 3500 3300
Wire Wire Line
	3300 3500 3450 3500
Connection ~ 3450 3500
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2250 5050
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2250 4800 50  0001 C CNN
F 1 "GNDD" H 2254 4895 50  0000 C CNN
F 2 "" H 2250 5050 50  0001 C CNN
F 3 "" H 2250 5050 50  0001 C CNN
	1    2250 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 4000 4550
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U14"  Part="1" 
F 0 "U14" H 4000 4600 50  0000 C CNN
F 1 "74F138" H 3950 4500 50  0000 C CNN
F 2 "" H 4000 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 4550 50  0001 C CNN
	1    4000 4550
	1    0    0    -1  
$EndComp
Text GLabel 2750 3850 2    50   Input ~ 0
sclk
Text GLabel 2750 4750 2    50   Input ~ 0
0
Text GLabel 2750 4250 2    50   Input ~ 0
I3+4
Text GLabel 1750 3850 0    50   Input ~ 0
pclk1
Text GLabel 1750 4550 0    50   Input ~ 0
~rst
Text GLabel 1750 4450 0    50   Output ~ 0
pcent
Text GLabel 1300 4350 0    50   Output ~ 0
~inst
Text GLabel 1750 4250 0    50   Output ~ 0
hsel
Text GLabel 1750 4150 0    50   Output ~ 0
boot
NoConn ~ 1750 4050
Text GLabel 2750 2350 2    50   Output ~ 0
PA16
Text GLabel 9400 2250 0    50   Input ~ 0
~inst
Wire Wire Line
	2750 4550 3100 4550
Wire Wire Line
	2750 4450 3100 4450
Wire Wire Line
	2750 4350 3100 4350
Wire Wire Line
	2750 4050 3100 4050
Wire Wire Line
	2750 3950 3100 3950
Text GLabel 1750 1450 0    50   Input ~ 0
1
Text GLabel 1750 2350 0    50   Input ~ 0
hblank
Text GLabel 1750 2050 0    50   Input ~ 0
1
Text GLabel 1750 2650 0    50   Input ~ 0
pclk1
Text GLabel 1750 2750 0    50   Input ~ 0
0
Text GLabel 7950 1850 0    50   Input ~ 0
boot
Text GLabel 6700 2650 0    50   Input ~ 0
~inst
Entry Wire Line
	3300 4250 3200 4350
Text GLabel 4300 1750 0    50   Output ~ 0
~bra
Entry Wire Line
	3300 4350 3200 4450
Text GLabel 3500 4750 0    50   Input ~ 0
~bra
Text GLabel 3500 4950 0    50   Input ~ 0
qclk1
Text GLabel 3500 4850 0    50   Input ~ 0
~r8en
Text GLabel 4500 4350 2    50   Output ~ 0
~vle
Text GLabel 4500 4450 2    50   Output ~ 0
~ele
Text GLabel 4500 4250 2    50   Output ~ 0
~pcle
Text GLabel 4500 4750 2    50   Output ~ 0
~xle
Text GLabel 4500 4850 2    50   Output ~ 0
~yle
Text GLabel 4500 4950 2    50   Output ~ 0
~hlle
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DB93291
P 2250 4350
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U16"  Part="1" 
F 0 "U16" H 2250 4400 50  0000 C CNN
F 1 "16R4" H 2250 4300 50  0000 C CNN
F 2 "" H 2250 4350 50  0001 C CNN
F 3 "" H 2250 4350 50  0001 C CNN
	1    2250 4350
	-1   0    0    -1  
$EndComp
Text GLabel 1900 6750 0    50   Input ~ 0
0
Entry Wire Line
	1600 5650 1700 5750
Entry Wire Line
	1600 5750 1700 5850
Entry Wire Line
	1600 5850 1700 5950
Entry Wire Line
	1600 5950 1700 6050
Entry Wire Line
	1600 6050 1700 6150
Entry Wire Line
	1600 6150 1700 6250
Entry Wire Line
	1600 6250 1700 6350
Entry Wire Line
	1600 6350 1700 6450
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A0
P 2400 7050
AR Path="/5CDEEC9F/5DB932A0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2400 6800 50  0001 C CNN
F 1 "GNDD" H 2404 6895 50  0000 C CNN
F 2 "" H 2400 7050 50  0001 C CNN
F 3 "" H 2400 7050 50  0001 C CNN
	1    2400 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932AC
P 4000 5250
AR Path="/5CDEEC9F/5DB932AC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932AC" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 4000 5000 50  0001 C CNN
F 1 "GNDD" H 4004 5095 50  0000 C CNN
F 2 "" H 4000 5250 50  0001 C CNN
F 3 "" H 4000 5250 50  0001 C CNN
	1    4000 5250
	1    0    0    -1  
$EndComp
Entry Wire Line
	3100 5850 3200 5750
Entry Wire Line
	3100 5950 3200 5850
Entry Wire Line
	3100 6050 3200 5950
Entry Wire Line
	3100 5750 3200 5650
Text Label 3300 4250 0    50   ~ 0
I0
Text Label 3300 4350 0    50   ~ 0
I1
Text Label 3300 4450 0    50   ~ 0
I2
Text Label 3300 3500 0    50   ~ 0
I7
Text Label 3300 3200 0    50   ~ 0
I6
Text Label 3300 3300 0    50   ~ 0
I5
Text Label 3300 2700 0    50   ~ 0
I4
Text Label 3300 2500 0    50   ~ 0
I3
Text Label 3000 3400 0    50   ~ 0
I4
Text Label 3000 3950 0    50   ~ 0
I0
Text Label 3000 4050 0    50   ~ 0
I1
Text Label 3000 4150 0    50   ~ 0
I2
Text Label 3000 4350 0    50   ~ 0
I5
Text Label 3000 4450 0    50   ~ 0
I6
Text Label 3000 4550 0    50   ~ 0
I7
Text Label 3000 5750 0    50   ~ 0
I0
Text Label 3000 5850 0    50   ~ 0
I1
Text Label 3000 5950 0    50   ~ 0
I2
Text Label 3000 6050 0    50   ~ 0
I3
Text Label 3000 6150 0    50   ~ 0
I4
Text Label 3000 6250 0    50   ~ 0
I5
Text Label 3000 6350 0    50   ~ 0
I6
Text Label 3000 6450 0    50   ~ 0
I7
Wire Wire Line
	1700 5750 1900 5750
Wire Wire Line
	1700 5850 1900 5850
Wire Wire Line
	1700 5950 1900 5950
Wire Wire Line
	1700 6050 1900 6050
Wire Wire Line
	1700 6150 1900 6150
Wire Wire Line
	1700 6250 1900 6250
Wire Wire Line
	1700 6350 1900 6350
Wire Wire Line
	1700 6450 1900 6450
Text Label 1700 5750 0    50   ~ 0
PD0
Text Label 1700 5850 0    50   ~ 0
PD1
Text Label 1700 5950 0    50   ~ 0
PD2
Text Label 1700 6050 0    50   ~ 0
PD3
Text Label 1700 6150 0    50   ~ 0
PD4
Text Label 1700 6250 0    50   ~ 0
PD5
Text Label 1700 6350 0    50   ~ 0
PD6
Text Label 1700 6450 0    50   ~ 0
PD7
Text GLabel 1600 5550 1    50   Input ~ 0
PD[0..7]
Text GLabel 3200 2050 1    50   Output ~ 0
I[0..7]
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9900 1950
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9900 1800 50  0001 C CNN
F 1 "VCC" H 9917 2123 50  0000 C CNN
F 2 "" H 9900 1950 50  0001 C CNN
F 3 "" H 9900 1950 50  0001 C CNN
	1    9900 1950
	1    0    0    -1  
$EndComp
Text GLabel 6700 1750 0    50   Input ~ 0
~rst
NoConn ~ 5500 1650
NoConn ~ 5500 1750
$Comp
L 74xx:74LS32 U?
U 4 1 5DB9335E
P 1300 5500
AR Path="/5CDEEC9F/5DB9335E" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB9335E" Ref="U5"  Part="4" 
F 0 "U5" H 1300 5500 50  0000 C CNN
F 1 "74F32" H 1300 5734 50  0001 C CNN
F 2 "" H 1300 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1300 5500 50  0001 C CNN
	4    1300 5500
	0    1    1    0   
$EndComp
Text GLabel 1200 5200 1    50   Input ~ 0
qclk1
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 7000 2550
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U3"  Part="1" 
F 0 "U3" H 7000 2550 50  0000 C CNN
F 1 "74F08" H 7000 2350 50  0001 C CNN
F 2 "" H 7000 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7000 2550 50  0001 C CNN
	1    7000 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93377
P 5950 1850
AR Path="/5CDEEC9F/5DB93377" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93377" Ref="U5"  Part="3" 
F 0 "U5" H 5950 1850 50  0000 C CNN
F 1 "74F32" H 5950 1650 50  0001 C CNN
F 2 "" H 5950 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5950 1850 50  0001 C CNN
	3    5950 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB9337D
P 4450 2100
AR Path="/5CDEEC9F/5DB9337D" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB9337D" Ref="U5"  Part="2" 
F 0 "U5" H 4400 2100 50  0000 L CNN
F 1 "74F32" V 4450 1650 50  0001 L CNN
F 2 "" H 4450 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4450 2100 50  0001 C CNN
	2    4450 2100
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB93383
P 3850 2600
AR Path="/5CDEEC9F/5DB93383" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93383" Ref="U5"  Part="1" 
F 0 "U5" H 3850 2600 50  0000 C CNN
F 1 "74F32" H 3850 2850 50  0001 C CNN
F 2 "" H 3850 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3850 2600 50  0001 C CNN
	1    3850 2600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 8400 2950
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U4"  Part="2" 
F 0 "U4" H 8400 2950 50  0000 C CNN
F 1 "74F32" H 8400 2750 50  0001 C CNN
F 2 "" H 8400 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8400 2950 50  0001 C CNN
	2    8400 2950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B3
P 2250 1150
AR Path="/5CDEEC9F/5DB933B3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B3" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2250 1000 50  0001 C CNN
F 1 "VCC" H 2267 1323 50  0000 C CNN
F 2 "" H 2250 1150 50  0001 C CNN
F 3 "" H 2250 1150 50  0001 C CNN
	1    2250 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 2250 3650
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2250 3500 50  0001 C CNN
F 1 "VCC" H 2267 3823 50  0000 C CNN
F 2 "" H 2250 3650 50  0001 C CNN
F 3 "" H 2250 3650 50  0001 C CNN
	1    2250 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2400 5450
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2400 5300 50  0001 C CNN
F 1 "VCC" H 2417 5623 50  0000 C CNN
F 2 "" H 2400 5450 50  0001 C CNN
F 3 "" H 2400 5450 50  0001 C CNN
	1    2400 5450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933D1
P 4000 3950
AR Path="/5CDEEC9F/5DB933D1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933D1" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 4000 3800 50  0001 C CNN
F 1 "VCC" H 4017 4123 50  0000 C CNN
F 2 "" H 4000 3950 50  0001 C CNN
F 3 "" H 4000 3950 50  0001 C CNN
	1    4000 3950
	1    0    0    -1  
$EndComp
Entry Wire Line
	3200 4550 3100 4450
Entry Wire Line
	3200 4450 3100 4350
Entry Wire Line
	3200 4650 3100 4550
Entry Wire Line
	3200 4250 3100 4150
Entry Wire Line
	3200 4150 3100 4050
Entry Wire Line
	3200 4050 3100 3950
Entry Wire Line
	3100 6450 3200 6350
Entry Wire Line
	3100 6350 3200 6250
Entry Wire Line
	3100 6250 3200 6150
Entry Wire Line
	3100 6150 3200 6050
Wire Wire Line
	2900 5750 3100 5750
Wire Wire Line
	2900 5850 3100 5850
Wire Wire Line
	2900 5950 3100 5950
Wire Wire Line
	2900 6050 3100 6050
Wire Wire Line
	2900 6150 3100 6150
Wire Wire Line
	2900 6250 3100 6250
Wire Wire Line
	2900 6350 3100 6350
Wire Wire Line
	2900 6450 3100 6450
Entry Wire Line
	2950 4650 3050 4750
Text Label 2800 4650 0    50   ~ 0
DD7
Text GLabel 3050 4850 3    50   Input ~ 0
DD[0..7]
Wire Bus Line
	3050 4850 3050 4750
Wire Wire Line
	2750 4650 2950 4650
$Comp
L 74xx:74LS08 U?
U 4 1 5CED2B25
P 7000 1650
AR Path="/5DAA3954/5CED2B25" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5CED2B25" Ref="U3"  Part="4" 
F 0 "U3" H 7000 1650 50  0000 C CNN
F 1 "74F08" H 7000 1450 50  0001 C CNN
F 2 "" H 7000 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7000 1650 50  0001 C CNN
	4    7000 1650
	1    0    0    -1  
$EndComp
Text GLabel 5650 1150 0    50   Input ~ 0
~pcle
Wire Wire Line
	7350 2750 7350 2550
Wire Wire Line
	7350 2750 7400 2750
Wire Wire Line
	7350 2350 7400 2350
Connection ~ 7350 2550
Wire Wire Line
	7350 2550 7350 2350
Wire Wire Line
	3300 2500 3550 2500
Entry Wire Line
	3200 2450 3300 2350
Text Label 3300 2350 0    50   ~ 0
I2
Wire Wire Line
	4450 1800 4450 1750
Wire Wire Line
	4450 1750 4500 1750
Connection ~ 4450 1750
Wire Wire Line
	4300 1750 4450 1750
Wire Wire Line
	3300 2350 3450 2350
Wire Wire Line
	3450 1550 4500 1550
Wire Wire Line
	3450 1550 3450 2350
Wire Wire Line
	4550 2450 4550 3200
$Comp
L 74xx:74LS139 U15
U 1 1 5CEE0F76
P 5700 3000
F 0 "U15" H 5700 3000 50  0000 C CNN
F 1 "74ALS139" H 5650 2900 50  0000 C CNN
F 2 "" H 5700 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5700 3000 50  0001 C CNN
	1    5700 3000
	1    0    0    -1  
$EndComp
Text GLabel 5200 3000 0    50   Input ~ 0
pclk1
NoConn ~ 6200 2900
NoConn ~ 6200 3000
NoConn ~ 6200 3100
Wire Wire Line
	2750 1450 4500 1450
Wire Wire Line
	8050 3050 8050 3450
Wire Wire Line
	4350 2400 4350 2600
Wire Wire Line
	8700 2950 8750 2950
Wire Wire Line
	8750 2950 8750 2650
Wire Wire Line
	8700 2150 8750 2150
Text GLabel 6200 3800 2    50   Output ~ 0
~r8en
NoConn ~ 6200 4000
NoConn ~ 6200 3900
NoConn ~ 6200 3700
$Comp
L 74xx:74LS139 U15
U 2 1 5CEF3946
P 5700 3800
F 0 "U15" H 5700 3800 50  0000 C CNN
F 1 "74ALS139" H 5650 3700 50  0000 C CNN
F 2 "" H 5700 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5700 3800 50  0001 C CNN
	2    5700 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1850 8050 1850
Wire Wire Line
	8050 1850 8050 2050
Entry Wire Line
	3300 4450 3200 4550
Text GLabel 2750 1750 2    50   Output ~ 0
~dwe
Wire Wire Line
	8750 2150 8750 2350
Wire Wire Line
	8050 2250 8050 2450
Wire Wire Line
	10400 2850 10650 2850
$Comp
L 74xx:74LS574 U?
U 1 1 5DB933A7
P 9900 2750
AR Path="/5CDEEC9F/5DB933A7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB933A7" Ref="U17"  Part="1" 
F 0 "U17" H 9900 2550 50  0000 C CNN
F 1 "74F574" H 9900 2450 50  0000 C CNN
F 2 "" H 9900 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9900 2750 50  0001 C CNN
	1    9900 2750
	1    0    0    -1  
$EndComp
Text GLabel 10400 2750 2    50   Output ~ 0
~gcoe
Text GLabel 10400 2650 2    50   Output ~ 0
~fnoe
Text GLabel 10400 2550 2    50   Output ~ 0
~alue
Text GLabel 10400 2450 2    50   Output ~ 0
~pcoe
Text GLabel 10400 2350 2    50   Output ~ 0
~pgoe
Text GLabel 10400 2950 2    50   Output ~ 0
~xoe
Text GLabel 9400 2750 0    50   Input ~ 0
sclk
Text GLabel 9400 3250 0    50   Input ~ 0
0
Text GLabel 9400 3150 0    50   Input ~ 0
dclk
Wire Wire Line
	9400 2350 8750 2350
Wire Wire Line
	8050 2450 9400 2450
Wire Wire Line
	9400 2550 8050 2550
Wire Wire Line
	8750 2650 9400 2650
Wire Wire Line
	9400 2950 9050 2950
Wire Wire Line
	9400 2850 8900 2850
Wire Wire Line
	8900 2850 8900 3200
Text GLabel 1750 1850 0    50   Input ~ 0
1
Wire Wire Line
	9050 2950 9050 3850
Wire Wire Line
	10650 2850 10650 3850
Wire Wire Line
	9050 3850 10650 3850
Wire Wire Line
	5500 1450 5600 1450
Wire Wire Line
	5500 1550 5600 1550
Connection ~ 5600 1550
Wire Wire Line
	5600 1550 6700 1550
Text GLabel 4500 4550 2    50   Output ~ 0
~exle
Text GLabel 4500 4650 2    50   Output ~ 0
~eyle
Wire Wire Line
	3100 3300 1050 3300
Text Label 3000 3300 0    50   ~ 0
I3
Entry Wire Line
	3100 3300 3200 3400
Entry Wire Line
	3100 3400 3200 3500
Wire Wire Line
	1300 6650 1300 5800
Wire Wire Line
	1300 6650 1900 6650
Wire Wire Line
	1400 5200 1400 4350
Wire Wire Line
	1400 4350 1750 4350
Wire Wire Line
	1400 4350 1300 4350
Connection ~ 1400 4350
Wire Wire Line
	1750 2450 1400 2450
Text GLabel 2750 2050 2    50   Output ~ 0
DA16
Wire Wire Line
	3300 4250 3500 4250
Wire Wire Line
	3300 4350 3500 4350
Wire Wire Line
	3300 4450 3500 4450
Wire Wire Line
	1400 3950 1400 2450
Wire Wire Line
	1400 3950 1750 3950
Wire Wire Line
	1100 1850 1050 1850
Wire Wire Line
	1050 1850 1050 3300
Text GLabel 8750 4400 2    50   Output ~ 0
~aoe
Text Label 3300 5950 0    50   ~ 0
I5
Entry Wire Line
	3200 5650 3300 5550
Text Label 3300 5550 0    50   ~ 0
I3
Text Label 3300 5650 0    50   ~ 0
I4
Entry Wire Line
	3200 6050 3300 5950
Entry Wire Line
	3200 5750 3300 5650
Wire Wire Line
	1200 3400 1200 2150
Wire Wire Line
	1200 2150 1750 2150
Wire Wire Line
	1200 3400 3100 3400
Wire Wire Line
	1750 1750 1700 1750
Wire Wire Line
	1100 1650 1050 1650
Text GLabel 10400 2250 2    50   Output ~ 0
~1st
Wire Wire Line
	4550 2450 6700 2450
Text GLabel 5200 4000 0    50   Input ~ 0
~1st
Wire Wire Line
	6600 3400 6600 3350
Wire Wire Line
	6600 3350 6700 3350
Wire Wire Line
	6600 3500 6600 3550
Wire Wire Line
	6600 3550 6700 3550
Wire Wire Line
	7300 3450 8050 3450
Wire Wire Line
	6200 3200 8900 3200
Wire Wire Line
	3450 3500 3450 3700
$Comp
L 74xx:74LS00 U?
U 2 1 5DB93395
P 7000 3450
AR Path="/5CDEEC9F/5DB93395" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93395" Ref="U2"  Part="2" 
F 0 "U2" H 7000 3450 50  0000 C CNN
F 1 "74F00" H 7150 3250 50  0001 C CNN
F 2 "" H 7000 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7000 3450 50  0001 C CNN
	2    7000 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3500 6600 3500
Wire Wire Line
	4500 3400 6600 3400
Wire Wire Line
	1550 1550 1750 1550
Text GLabel 1700 1150 2    50   Input ~ 0
~1st
Wire Wire Line
	1050 1150 1100 1150
$Comp
L 74xx:74LS04 U8
U 6 1 5E353FA1
P 1400 1150
F 0 "U8" H 1350 1150 50  0000 C CNN
F 1 "74F04" H 1400 1350 50  0001 C CNN
F 2 "" H 1400 1150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1400 1150 50  0001 C CNN
	6    1400 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 1550 1550 1450
Wire Wire Line
	1050 1150 1050 1450
Wire Wire Line
	1050 1650 1050 1450
Connection ~ 1050 1450
Wire Wire Line
	1550 1450 1050 1450
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 1400 1750
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U4"  Part="4" 
F 0 "U4" H 1400 1750 50  0000 C CNN
F 1 "74F32" H 1400 1550 50  0001 C CNN
F 2 "" H 1400 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1400 1750 50  0001 C CNN
	4    1400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 3800 4950 3800
Wire Wire Line
	2750 4150 3100 4150
Wire Wire Line
	4550 3200 5200 3200
Connection ~ 4550 3200
Wire Wire Line
	3450 3700 5200 3700
Wire Wire Line
	4950 3300 4950 3800
Wire Wire Line
	4500 3300 4950 3300
Wire Wire Line
	7700 5100 7700 6250
Wire Wire Line
	6200 6250 7700 6250
Wire Wire Line
	7500 5450 7500 6150
Wire Wire Line
	7500 4600 7500 5150
Connection ~ 7500 4600
Wire Wire Line
	7300 5650 7300 5100
Wire Wire Line
	6200 6150 7500 6150
Wire Wire Line
	7100 6050 7100 5450
Wire Wire Line
	6200 6050 7100 6050
Wire Wire Line
	6900 5950 6900 5100
Wire Wire Line
	6200 5950 6900 5950
Wire Wire Line
	6700 5850 6700 5450
Wire Wire Line
	6200 5850 6700 5850
Wire Wire Line
	6500 5750 6500 5100
Wire Wire Line
	6200 5750 6500 5750
Wire Wire Line
	6200 5650 7300 5650
Wire Wire Line
	7300 4600 7500 4600
Wire Wire Line
	7100 4500 7100 4650
Wire Wire Line
	6700 4550 6700 4400
Connection ~ 6700 4550
Wire Wire Line
	6500 4550 6700 4550
Wire Wire Line
	6700 5150 6700 4550
Wire Wire Line
	6500 4700 6500 4550
Connection ~ 6500 4700
Wire Wire Line
	6300 4700 6500 4700
Wire Wire Line
	6300 5150 6300 4700
Wire Wire Line
	6500 4800 6500 4700
Wire Wire Line
	7300 4800 7300 4600
Wire Wire Line
	7700 4800 7700 4700
Wire Wire Line
	6300 5550 6300 5450
Wire Wire Line
	6200 5550 6300 5550
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23D2
P 7700 4950
AR Path="/5CDEEC9F/5D3A23D2" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23D2" Ref="D8"  Part="1" 
F 0 "D8" V 7850 4900 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7700 5075 50  0001 C CNN
F 2 "" H 7700 4950 50  0001 C CNN
F 3 "~" H 7700 4950 50  0001 C CNN
	1    7700 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23CC
P 7300 4950
AR Path="/5CDEEC9F/5D3A23CC" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23CC" Ref="D6"  Part="1" 
F 0 "D6" V 7450 4900 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7300 5075 50  0001 C CNN
F 2 "" H 7300 4950 50  0001 C CNN
F 3 "~" H 7300 4950 50  0001 C CNN
	1    7300 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23C6
P 6900 4950
AR Path="/5CDEEC9F/5D3A23C6" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23C6" Ref="D4"  Part="1" 
F 0 "D4" V 7050 4900 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6900 5075 50  0001 C CNN
F 2 "" H 6900 4950 50  0001 C CNN
F 3 "~" H 6900 4950 50  0001 C CNN
	1    6900 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23C0
P 6500 4950
AR Path="/5CDEEC9F/5D3A23C0" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23C0" Ref="D2"  Part="1" 
F 0 "D2" V 6650 4900 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6500 5075 50  0001 C CNN
F 2 "" H 6500 4950 50  0001 C CNN
F 3 "~" H 6500 4950 50  0001 C CNN
	1    6500 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D38E79E
P 7500 5300
AR Path="/5CDEEC9F/5D38E79E" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D38E79E" Ref="D7"  Part="1" 
F 0 "D7" V 7650 5250 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7500 5425 50  0001 C CNN
F 2 "" H 7500 5300 50  0001 C CNN
F 3 "~" H 7500 5300 50  0001 C CNN
	1    7500 5300
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D38E798
P 7100 5300
AR Path="/5CDEEC9F/5D38E798" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D38E798" Ref="D5"  Part="1" 
F 0 "D5" V 7250 5250 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7100 5425 50  0001 C CNN
F 2 "" H 7100 5300 50  0001 C CNN
F 3 "~" H 7100 5300 50  0001 C CNN
	1    7100 5300
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D387AD3
P 6700 5300
AR Path="/5CDEEC9F/5D387AD3" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D387AD3" Ref="D3"  Part="1" 
F 0 "D3" V 6850 5250 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6700 5425 50  0001 C CNN
F 2 "" H 6700 5300 50  0001 C CNN
F 3 "~" H 6700 5300 50  0001 C CNN
	1    6700 5300
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 4700 5850
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U3"  Part="2" 
F 0 "U3" H 4700 5850 50  0000 C CNN
F 1 "74F08" H 4700 6050 50  0001 C CNN
F 2 "" H 4700 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4700 5850 50  0001 C CNN
	2    4700 5850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C1
P 5700 5850
AR Path="/5CDEEC9F/5DB931C1" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C1" Ref="U13"  Part="1" 
F 0 "U13" H 5700 5900 50  0000 C CNN
F 1 "74F138" H 5650 5800 50  0000 C CNN
F 2 "" H 5700 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5700 5850 50  0001 C CNN
	1    5700 5850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933C5
P 5700 5250
AR Path="/5CDEEC9F/5DB933C5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933C5" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 5700 5100 50  0001 C CNN
F 1 "VCC" H 5717 5423 50  0000 C CNN
F 2 "" H 5700 5250 50  0001 C CNN
F 3 "" H 5700 5250 50  0001 C CNN
	1    5700 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A6
P 5700 6550
AR Path="/5CDEEC9F/5DB932A6" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A6" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 5700 6300 50  0001 C CNN
F 1 "GNDD" H 5704 6395 50  0000 C CNN
F 2 "" H 5700 6550 50  0001 C CNN
F 3 "" H 5700 6550 50  0001 C CNN
	1    5700 6550
	1    0    0    -1  
$EndComp
Text GLabel 5200 6150 0    50   Input ~ 0
~1st
Text GLabel 5200 6250 0    50   Input ~ 0
pclk1
Text GLabel 5200 6050 0    50   Input ~ 0
~bra
Text GLabel 8750 4500 2    50   Output ~ 0
~xroe
Text GLabel 8750 4700 2    50   Output ~ 0
~eoe
Text GLabel 8750 4600 2    50   Output ~ 0
~doe
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DE37F3D
P 6300 5300
AR Path="/5CDEEC9F/5DE37F3D" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DE37F3D" Ref="D1"  Part="1" 
F 0 "D1" V 6450 5250 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6300 5425 50  0001 C CNN
F 2 "" H 6300 5300 50  0001 C CNN
F 3 "~" H 6300 5300 50  0001 C CNN
	1    6300 5300
	0    -1   -1   0   
$EndComp
Text GLabel 8750 3400 2    50   Input ~ 0
~bra
Text GLabel 8750 3750 2    50   Input ~ 0
~dwe
Wire Wire Line
	5000 5850 5100 5850
Wire Wire Line
	5100 5850 5100 5750
Wire Wire Line
	3300 5550 5200 5550
Wire Wire Line
	3300 5650 5200 5650
Wire Wire Line
	5100 5750 5200 5750
Wire Wire Line
	3300 5950 4400 5950
Wire Wire Line
	4400 5750 4300 5750
Wire Wire Line
	4300 5750 4300 5350
Connection ~ 4950 3800
Wire Wire Line
	4300 5350 4950 5350
Wire Wire Line
	4950 3800 4950 5350
Wire Wire Line
	3300 2700 3450 2700
Wire Wire Line
	5200 2900 3450 2900
Wire Wire Line
	3450 2900 3450 2700
Connection ~ 3450 2700
Wire Wire Line
	3450 2700 3550 2700
Wire Wire Line
	6900 4650 7100 4650
Wire Wire Line
	6900 4650 6900 4800
Connection ~ 7100 4650
Wire Wire Line
	7100 4650 7100 5150
Wire Wire Line
	5600 1450 5600 1350
Wire Wire Line
	5600 1350 5650 1350
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 5950 1250
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U3"  Part="3" 
F 0 "U3" H 5950 1250 50  0000 C CNN
F 1 "74F08" H 5950 1050 50  0001 C CNN
F 2 "" H 5950 1250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5950 1250 50  0001 C CNN
	3    5950 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1750 5600 1750
Wire Wire Line
	5600 1550 5600 1750
Connection ~ 7700 4400
Connection ~ 7800 4500
Connection ~ 8000 4700
Connection ~ 7900 4600
Wire Wire Line
	7700 4700 8000 4700
Wire Wire Line
	7500 4600 7900 4600
Wire Wire Line
	7100 4500 7800 4500
Wire Wire Line
	6700 4400 7700 4400
$Comp
L power:VCC #PWR?
U 1 1 5DB932ED
P 7700 3800
AR Path="/5CDEEC9F/5DB932ED" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932ED" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 7700 3650 50  0001 C CNN
F 1 "VCC" H 7717 3973 50  0000 C CNN
F 2 "" H 7700 3800 50  0001 C CNN
F 3 "" H 7700 3800 50  0001 C CNN
	1    7700 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network04_US RN?
U 1 1 5DB932E4
P 7900 4000
AR Path="/5CDEEC9F/5DB932E4" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DB932E4" Ref="RN5"  Part="1" 
F 0 "RN5" H 7900 4350 50  0000 L CNN
F 1 "680" H 7900 4250 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 8175 4000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7900 4000 50  0001 C CNN
	1    7900 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4200 7700 4400
Wire Wire Line
	7800 4200 7800 4500
Wire Wire Line
	7900 4200 7900 4600
Wire Wire Line
	8000 4200 8000 4700
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5F464DAF
P 8300 3750
AR Path="/5CDEEC9F/5F464DAF" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5F464DAF" Ref="D9"  Part="1" 
F 0 "D9" V 8100 3900 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8300 3875 50  0001 C CNN
F 2 "" H 8300 3750 50  0001 C CNN
F 3 "~" H 8300 3750 50  0001 C CNN
	1    8300 3750
	0    1    1    0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5F470AB3
P 8500 4100
AR Path="/5CDEEC9F/5F470AB3" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5F470AB3" Ref="D10"  Part="1" 
F 0 "D10" V 8300 4300 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8500 4225 50  0001 C CNN
F 2 "" H 8500 4100 50  0001 C CNN
F 3 "~" H 8500 4100 50  0001 C CNN
	1    8500 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	8300 4400 8300 3900
Connection ~ 8300 4400
Wire Wire Line
	8300 3600 8300 3400
Wire Wire Line
	8300 3400 8750 3400
Wire Wire Line
	8500 3950 8500 3750
Wire Wire Line
	8500 3750 8750 3750
Wire Wire Line
	8500 4400 8500 4250
Connection ~ 8500 4400
Wire Wire Line
	8300 4400 8500 4400
Wire Wire Line
	7700 4400 8300 4400
Wire Wire Line
	8500 4400 8750 4400
Wire Wire Line
	7800 4500 8750 4500
Wire Wire Line
	7900 4600 8750 4600
Wire Wire Line
	8000 4700 8750 4700
Wire Bus Line
	1600 5550 1600 6350
Wire Bus Line
	3200 2050 3200 6350
$EndSCHEMATC
