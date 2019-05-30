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
P 4000 3350
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U6"  Part="2" 
F 0 "U6" H 4000 3350 50  0000 C CNN
F 1 "74ALS139" H 3950 3250 50  0000 C CNN
F 2 "" H 4000 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 3350 50  0001 C CNN
	2    4000 3350
	1    0    0    -1  
$EndComp
Text GLabel 5200 2200 0    50   Input ~ 0
qclk1
Text GLabel 5800 2100 2    50   Output ~ 0
~pgle
Text GLabel 5800 1500 2    50   Output ~ 0
~pcpe
Text GLabel 6850 1900 2    50   Output ~ 0
~pcmr
$Comp
L 74xx:74LS574 U?
U 1 1 5DB93147
P 2400 6200
AR Path="/5CDEEC9F/5DB93147" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93147" Ref="U18"  Part="1" 
F 0 "U18" H 2400 6000 50  0000 C CNN
F 1 "74F574" H 2400 5900 50  0000 C CNN
F 2 "" H 2400 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2400 6200 50  0001 C CNN
	1    2400 6200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 8400 2200
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U4"  Part="1" 
F 0 "U4" H 8400 2200 50  0000 C CNN
F 1 "74F32" H 8400 2000 50  0001 C CNN
F 2 "" H 8400 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8400 2200 50  0001 C CNN
	1    8400 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 7700 2900
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U4"  Part="3" 
F 0 "U4" H 7700 2900 50  0000 C CNN
F 1 "74F32" H 7700 2700 50  0001 C CNN
F 2 "" H 7700 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7700 2900 50  0001 C CNN
	3    7700 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DB9315A
P 7700 2300
AR Path="/5CDEEC9F/5DB9315A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9315A" Ref="U2"  Part="1" 
F 0 "U2" H 7700 2300 50  0000 C CNN
F 1 "74F00" H 7700 2100 50  0001 C CNN
F 2 "" H 7700 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7700 2300 50  0001 C CNN
	1    7700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2600 7350 2600
Wire Wire Line
	8050 2600 8050 2900
Connection ~ 8050 2900
Wire Wire Line
	8050 2900 8100 2900
Wire Wire Line
	8000 2900 8050 2900
Wire Wire Line
	8000 2300 8050 2300
Connection ~ 8050 2300
Wire Wire Line
	8050 2300 8100 2300
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9900 3600
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9900 3350 50  0001 C CNN
F 1 "GNDD" H 9904 3445 50  0000 C CNN
F 2 "" H 9900 3600 50  0001 C CNN
F 3 "" H 9900 3600 50  0001 C CNN
	1    9900 3600
	1    0    0    -1  
$EndComp
Text GLabel 7400 2200 0    50   Input ~ 0
rclk
Text GLabel 7400 3000 0    50   Input ~ 0
sclk
Wire Wire Line
	8050 3100 8100 3100
$Comp
L power:GNDD #PWR?
U 1 1 5DB93177
P 2250 3100
AR Path="/5CDEEC9F/5DB93177" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB93177" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 2250 2850 50  0001 C CNN
F 1 "GNDD" H 2254 2945 50  0000 C CNN
F 2 "" H 2250 3100 50  0001 C CNN
F 3 "" H 2250 3100 50  0001 C CNN
	1    2250 3100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 4000 1600
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U6"  Part="1" 
F 0 "U6" H 4000 1600 50  0000 C CNN
F 1 "74ALS139" H 3950 1500 50  0000 C CNN
F 2 "" H 4000 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 1600 50  0001 C CNN
	1    4000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2100 8050 2100
$Comp
L 74xx:74LS157 U?
U 1 1 5DB93191
P 2250 2100
AR Path="/5CDEEC9F/5DB93191" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93191" Ref="U12"  Part="1" 
F 0 "U12" H 2250 2000 50  0000 C CNN
F 1 "74F157" H 2250 1900 50  0000 C CNN
F 2 "" H 2250 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2250 2100 50  0001 C CNN
	1    2250 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3550 3500 3550
Text GLabel 5150 2700 2    50   Output ~ 0
I3+4
Entry Wire Line
	3200 3650 3300 3550
Entry Wire Line
	3200 3350 3300 3250
Entry Wire Line
	3200 3450 3300 3350
Entry Wire Line
	3200 2900 3300 2800
Entry Wire Line
	3200 2700 3300 2600
Wire Wire Line
	3300 3250 3500 3250
Wire Wire Line
	3300 3350 3500 3350
Wire Wire Line
	3300 3550 3450 3550
Connection ~ 3450 3550
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2250 5000
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2250 4750 50  0001 C CNN
F 1 "GNDD" H 2254 4845 50  0000 C CNN
F 2 "" H 2250 5000 50  0001 C CNN
F 3 "" H 2250 5000 50  0001 C CNN
	1    2250 5000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 4000 4600
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U14"  Part="1" 
F 0 "U14" H 4000 4650 50  0000 C CNN
F 1 "74F138" H 3950 4550 50  0000 C CNN
F 2 "" H 4000 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 4600 50  0001 C CNN
	1    4000 4600
	1    0    0    -1  
$EndComp
Text GLabel 2750 3800 2    50   Input ~ 0
sclk
Text GLabel 2750 4700 2    50   Input ~ 0
0
Text GLabel 2750 4200 2    50   Input ~ 0
I3+4
Text GLabel 1750 3800 0    50   Input ~ 0
pclk1
Text GLabel 1750 4500 0    50   Input ~ 0
~rst
Text GLabel 1750 4400 0    50   Output ~ 0
pcent
Text GLabel 1300 4300 0    50   Output ~ 0
~inst
Text GLabel 1750 4200 0    50   Output ~ 0
hsel
Text GLabel 1750 4100 0    50   Output ~ 0
boot
NoConn ~ 1750 4000
Text GLabel 2750 2400 2    50   Output ~ 0
PA16
Text GLabel 9400 2300 0    50   Input ~ 0
~inst
Wire Wire Line
	2750 4500 3100 4500
Wire Wire Line
	2750 4400 3100 4400
Wire Wire Line
	2750 4300 3100 4300
Wire Wire Line
	2750 4000 3100 4000
Wire Wire Line
	2750 3900 3100 3900
Text GLabel 1750 1500 0    50   Input ~ 0
0
Text GLabel 1750 2400 0    50   Input ~ 0
hblank
Text GLabel 1750 2100 0    50   Input ~ 0
1
Text GLabel 1750 2700 0    50   Input ~ 0
pclk1
Text GLabel 1750 2800 0    50   Input ~ 0
0
Text GLabel 7950 1900 0    50   Input ~ 0
boot
Text GLabel 6700 2700 0    50   Input ~ 0
~inst
Entry Wire Line
	3300 4300 3200 4400
Entry Wire Line
	3300 4400 3200 4500
Text GLabel 3500 4800 0    50   Input ~ 0
~inst
Text GLabel 4500 4400 2    50   Output ~ 0
~vle
Text GLabel 4500 4800 2    50   Output ~ 0
~ele
Text GLabel 4500 4300 2    50   Output ~ 0
~pcle
Text GLabel 4500 4500 2    50   Output ~ 0
~xle
Text GLabel 4500 4600 2    50   Output ~ 0
~yle
Text GLabel 4500 4700 2    50   Output ~ 0
~hlle
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DB93291
P 2250 4300
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U16"  Part="1" 
F 0 "U16" H 2250 4350 50  0000 C CNN
F 1 "16R4" H 2250 4250 50  0000 C CNN
F 2 "" H 2250 4300 50  0001 C CNN
F 3 "" H 2250 4300 50  0001 C CNN
	1    2250 4300
	-1   0    0    -1  
$EndComp
Text GLabel 1900 6700 0    50   Input ~ 0
0
Entry Wire Line
	1600 5600 1700 5700
Entry Wire Line
	1600 5700 1700 5800
Entry Wire Line
	1600 5800 1700 5900
Entry Wire Line
	1600 5900 1700 6000
Entry Wire Line
	1600 6000 1700 6100
Entry Wire Line
	1600 6100 1700 6200
Entry Wire Line
	1600 6200 1700 6300
Entry Wire Line
	1600 6300 1700 6400
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A0
P 2400 7000
AR Path="/5CDEEC9F/5DB932A0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2400 6750 50  0001 C CNN
F 1 "GNDD" H 2404 6845 50  0000 C CNN
F 2 "" H 2400 7000 50  0001 C CNN
F 3 "" H 2400 7000 50  0001 C CNN
	1    2400 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932AC
P 4000 5300
AR Path="/5CDEEC9F/5DB932AC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932AC" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 4000 5050 50  0001 C CNN
F 1 "GNDD" H 4004 5145 50  0000 C CNN
F 2 "" H 4000 5300 50  0001 C CNN
F 3 "" H 4000 5300 50  0001 C CNN
	1    4000 5300
	1    0    0    -1  
$EndComp
Entry Wire Line
	3200 5800 3100 5700
Entry Wire Line
	3200 5900 3100 5800
Entry Wire Line
	3200 6000 3100 5900
Entry Wire Line
	3200 6500 3100 6400
Text Label 3300 4300 0    50   ~ 0
I0
Text Label 3300 4400 0    50   ~ 0
I1
Text Label 3300 4500 0    50   ~ 0
I2
Text Label 3300 3550 0    50   ~ 0
I7
Text Label 3300 3250 0    50   ~ 0
I6
Text Label 3300 3350 0    50   ~ 0
I5
Text Label 3300 2800 0    50   ~ 0
I4
Text Label 3300 2600 0    50   ~ 0
I3
Text Label 3000 3350 0    50   ~ 0
I4
Text Label 3000 3900 0    50   ~ 0
I0
Text Label 3000 4000 0    50   ~ 0
I1
Text Label 3000 4100 0    50   ~ 0
I2
Text Label 3000 4300 0    50   ~ 0
I5
Text Label 3000 4400 0    50   ~ 0
I6
Text Label 3000 4500 0    50   ~ 0
I7
Text Label 3000 5700 0    50   ~ 0
I0
Text Label 3000 5800 0    50   ~ 0
I1
Text Label 3000 5900 0    50   ~ 0
I2
Text Label 3000 6000 0    50   ~ 0
I3
Text Label 3000 6100 0    50   ~ 0
I4
Text Label 3000 6200 0    50   ~ 0
I5
Text Label 3000 6300 0    50   ~ 0
I6
Text Label 3000 6400 0    50   ~ 0
I7
Wire Wire Line
	1700 5700 1900 5700
Wire Wire Line
	1700 5800 1900 5800
Wire Wire Line
	1700 5900 1900 5900
Wire Wire Line
	1700 6000 1900 6000
Wire Wire Line
	1700 6100 1900 6100
Wire Wire Line
	1700 6200 1900 6200
Wire Wire Line
	1700 6300 1900 6300
Wire Wire Line
	1700 6400 1900 6400
Text Label 1700 5700 0    50   ~ 0
PD0
Text Label 1700 5800 0    50   ~ 0
PD1
Text Label 1700 5900 0    50   ~ 0
PD2
Text Label 1700 6000 0    50   ~ 0
PD3
Text Label 1700 6100 0    50   ~ 0
PD4
Text Label 1700 6200 0    50   ~ 0
PD5
Text Label 1700 6300 0    50   ~ 0
PD6
Text Label 1700 6400 0    50   ~ 0
PD7
Text GLabel 1600 5500 1    50   Input ~ 0
PD[0..7]
Text GLabel 3200 6700 3    50   Output ~ 0
I[0..7]
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9900 2000
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9900 1850 50  0001 C CNN
F 1 "VCC" H 9917 2173 50  0000 C CNN
F 2 "" H 9900 2000 50  0001 C CNN
F 3 "" H 9900 2000 50  0001 C CNN
	1    9900 2000
	1    0    0    -1  
$EndComp
Text GLabel 6250 2000 0    50   Input ~ 0
~rst
NoConn ~ 4500 1600
NoConn ~ 4500 1500
$Comp
L 74xx:74LS32 U?
U 4 1 5DB9335E
P 1300 5450
AR Path="/5CDEEC9F/5DB9335E" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB9335E" Ref="U5"  Part="4" 
F 0 "U5" H 1300 5450 50  0000 C CNN
F 1 "74F32" H 1300 5684 50  0001 C CNN
F 2 "" H 1300 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 1300 5450 50  0001 C CNN
	4    1300 5450
	0    1    1    0   
$EndComp
Text GLabel 1200 5150 1    50   Input ~ 0
qclk1
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 7000 2600
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U3"  Part="1" 
F 0 "U3" H 7000 2600 50  0000 C CNN
F 1 "74F08" H 7000 2400 50  0001 C CNN
F 2 "" H 7000 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7000 2600 50  0001 C CNN
	1    7000 2600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93377
P 5500 2100
AR Path="/5CDEEC9F/5DB93377" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93377" Ref="U5"  Part="3" 
F 0 "U5" H 5500 2100 50  0000 C CNN
F 1 "74F32" H 5500 1900 50  0001 C CNN
F 2 "" H 5500 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5500 2100 50  0001 C CNN
	3    5500 2100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB9337D
P 4150 2250
AR Path="/5CDEEC9F/5DB9337D" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB9337D" Ref="U5"  Part="2" 
F 0 "U5" H 4100 2250 50  0000 L CNN
F 1 "74F32" V 4150 1800 50  0001 L CNN
F 2 "" H 4150 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4150 2250 50  0001 C CNN
	2    4150 2250
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB93383
P 3850 2700
AR Path="/5CDEEC9F/5DB93383" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93383" Ref="U5"  Part="1" 
F 0 "U5" H 3850 2700 50  0000 C CNN
F 1 "74F32" H 3850 2950 50  0001 C CNN
F 2 "" H 3850 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3850 2700 50  0001 C CNN
	1    3850 2700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 8400 3000
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U4"  Part="2" 
F 0 "U4" H 8400 3000 50  0000 C CNN
F 1 "74F32" H 8400 2800 50  0001 C CNN
F 2 "" H 8400 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8400 3000 50  0001 C CNN
	2    8400 3000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B3
P 2250 1200
AR Path="/5CDEEC9F/5DB933B3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B3" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2250 1050 50  0001 C CNN
F 1 "VCC" H 2267 1373 50  0000 C CNN
F 2 "" H 2250 1200 50  0001 C CNN
F 3 "" H 2250 1200 50  0001 C CNN
	1    2250 1200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 2250 3600
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2250 3450 50  0001 C CNN
F 1 "VCC" H 2267 3773 50  0000 C CNN
F 2 "" H 2250 3600 50  0001 C CNN
F 3 "" H 2250 3600 50  0001 C CNN
	1    2250 3600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2400 5400
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2400 5250 50  0001 C CNN
F 1 "VCC" H 2417 5573 50  0000 C CNN
F 2 "" H 2400 5400 50  0001 C CNN
F 3 "" H 2400 5400 50  0001 C CNN
	1    2400 5400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933D1
P 4000 4000
AR Path="/5CDEEC9F/5DB933D1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933D1" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 4000 3850 50  0001 C CNN
F 1 "VCC" H 4017 4173 50  0000 C CNN
F 2 "" H 4000 4000 50  0001 C CNN
F 3 "" H 4000 4000 50  0001 C CNN
	1    4000 4000
	1    0    0    -1  
$EndComp
Entry Wire Line
	3200 4500 3100 4400
Entry Wire Line
	3200 4400 3100 4300
Entry Wire Line
	3200 4600 3100 4500
Entry Wire Line
	3200 4200 3100 4100
Entry Wire Line
	3200 4100 3100 4000
Entry Wire Line
	3200 4000 3100 3900
Entry Wire Line
	3200 6400 3100 6300
Entry Wire Line
	3200 6300 3100 6200
Entry Wire Line
	3200 6200 3100 6100
Entry Wire Line
	3200 6100 3100 6000
Wire Wire Line
	2900 5700 3100 5700
Wire Wire Line
	2900 5800 3100 5800
Wire Wire Line
	2900 5900 3100 5900
Wire Wire Line
	2900 6000 3100 6000
Wire Wire Line
	2900 6100 3100 6100
Wire Wire Line
	2900 6200 3100 6200
Wire Wire Line
	2900 6300 3100 6300
Wire Wire Line
	2900 6400 3100 6400
Entry Wire Line
	2950 4600 3050 4700
Text Label 2800 4600 0    50   ~ 0
DD7
Text GLabel 3050 4800 3    50   Input ~ 0
DD[0..7]
Wire Bus Line
	3050 4800 3050 4700
Wire Wire Line
	2750 4600 2950 4600
$Comp
L 74xx:74LS08 U?
U 4 1 5CED2B25
P 6550 1900
AR Path="/5DAA3954/5CED2B25" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5CED2B25" Ref="U3"  Part="4" 
F 0 "U3" H 6550 1900 50  0000 C CNN
F 1 "74F08" H 6550 1700 50  0001 C CNN
F 2 "" H 6550 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6550 1900 50  0001 C CNN
	4    6550 1900
	1    0    0    -1  
$EndComp
Text GLabel 5200 1400 0    50   Input ~ 0
~pcle
Wire Wire Line
	7350 2800 7350 2600
Wire Wire Line
	7350 2800 7400 2800
Wire Wire Line
	7350 2400 7400 2400
Connection ~ 7350 2600
Wire Wire Line
	7350 2600 7350 2400
Entry Wire Line
	3200 1700 3300 1600
Text Label 3300 1600 0    50   ~ 0
I2
$Comp
L 74xx:74LS139 U15
U 1 1 5CEE0F76
P 5900 3050
F 0 "U15" H 5900 3050 50  0000 C CNN
F 1 "74ALS139" H 5850 2950 50  0000 C CNN
F 2 "" H 5900 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5900 3050 50  0001 C CNN
	1    5900 3050
	1    0    0    -1  
$EndComp
Text GLabel 5400 3050 0    50   Input ~ 0
pclk1
Wire Wire Line
	8050 3100 8050 3500
Wire Wire Line
	8700 3000 8750 3000
Wire Wire Line
	8750 3000 8750 2700
Wire Wire Line
	8700 2200 8750 2200
Text GLabel 6400 3750 2    50   Output ~ 0
~r8en
$Comp
L 74xx:74LS139 U15
U 2 1 5CEF3946
P 5900 3950
F 0 "U15" H 5900 3950 50  0000 C CNN
F 1 "74ALS139" H 5850 3850 50  0000 C CNN
F 2 "" H 5900 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5900 3950 50  0001 C CNN
	2    5900 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	7950 1900 8050 1900
Wire Wire Line
	8050 1900 8050 2100
Entry Wire Line
	3300 4500 3200 4600
Text GLabel 2750 1800 2    50   Output ~ 0
~2nd
Wire Wire Line
	8750 2200 8750 2400
Wire Wire Line
	8050 2300 8050 2500
Wire Wire Line
	10400 2900 10650 2900
$Comp
L 74xx:74LS574 U?
U 1 1 5DB933A7
P 9900 2800
AR Path="/5CDEEC9F/5DB933A7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB933A7" Ref="U17"  Part="1" 
F 0 "U17" H 9900 2600 50  0000 C CNN
F 1 "74F574" H 9900 2500 50  0000 C CNN
F 2 "" H 9900 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9900 2800 50  0001 C CNN
	1    9900 2800
	1    0    0    -1  
$EndComp
Text GLabel 10400 2800 2    50   Output ~ 0
~gcoe
Text GLabel 10400 2700 2    50   Output ~ 0
~fnoe
Text GLabel 10400 2600 2    50   Output ~ 0
~alue
Text GLabel 10400 2500 2    50   Output ~ 0
~pcoe
Text GLabel 10400 2400 2    50   Output ~ 0
~pgoe
Text GLabel 10400 3000 2    50   Output ~ 0
~xoe
Text GLabel 9400 2800 0    50   Input ~ 0
sclk
Text GLabel 9400 3300 0    50   Input ~ 0
0
Text GLabel 9400 3200 0    50   Input ~ 0
dclk
Wire Wire Line
	9400 2400 8750 2400
Wire Wire Line
	8050 2500 9400 2500
Wire Wire Line
	9400 2600 8050 2600
Wire Wire Line
	8750 2700 9400 2700
Wire Wire Line
	9400 3000 9050 3000
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	8900 2900 8900 3250
Text GLabel 1750 1900 0    50   Input ~ 0
1
Wire Wire Line
	9050 3000 9050 3900
Wire Wire Line
	10650 2900 10650 3900
Wire Wire Line
	9050 3900 10650 3900
Text GLabel 4500 4900 2    50   Output ~ 0
~exle
Text GLabel 4500 5000 2    50   Output ~ 0
~eyle
Wire Wire Line
	3100 3350 1200 3350
Entry Wire Line
	3100 3350 3200 3450
Wire Wire Line
	1300 6600 1900 6600
Wire Wire Line
	1400 5150 1400 4300
Wire Wire Line
	1400 4300 1750 4300
Wire Wire Line
	1400 4300 1300 4300
Wire Wire Line
	1750 2500 1400 2500
Text GLabel 2750 2100 2    50   Output ~ 0
DA16
Wire Wire Line
	3300 4300 3500 4300
Wire Wire Line
	3300 4400 3500 4400
Wire Wire Line
	3300 4500 3500 4500
Wire Wire Line
	1400 3900 1750 3900
Text Label 3300 6000 0    50   ~ 0
I5
Entry Wire Line
	3200 5700 3300 5600
Text Label 3300 5600 0    50   ~ 0
I3
Text Label 3300 5700 0    50   ~ 0
I4
Entry Wire Line
	3200 6100 3300 6000
Entry Wire Line
	3200 5800 3300 5700
Wire Wire Line
	1200 2200 1750 2200
Text GLabel 10400 2300 2    50   Output ~ 0
~1st
Wire Wire Line
	6600 3450 6600 3400
Wire Wire Line
	6600 3400 6700 3400
Wire Wire Line
	6600 3550 6600 3600
Wire Wire Line
	6600 3600 6700 3600
Wire Wire Line
	7300 3500 8050 3500
Wire Wire Line
	3450 3550 3450 3750
$Comp
L 74xx:74LS00 U?
U 2 1 5DB93395
P 7000 3500
AR Path="/5CDEEC9F/5DB93395" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93395" Ref="U2"  Part="2" 
F 0 "U2" H 7000 3500 50  0000 C CNN
F 1 "74F00" H 7150 3300 50  0001 C CNN
F 2 "" H 7000 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7000 3500 50  0001 C CNN
	2    7000 3500
	1    0    0    -1  
$EndComp
Text GLabel 1750 1600 0    50   Input ~ 0
~inst
Wire Wire Line
	2750 4100 3100 4100
Wire Wire Line
	6900 5900 6900 5500
Wire Wire Line
	6400 5900 6900 5900
Wire Wire Line
	6700 5800 6700 5150
Wire Wire Line
	6400 5800 6700 5800
Connection ~ 6900 4600
Wire Wire Line
	6700 4600 6900 4600
Wire Wire Line
	6900 5200 6900 4600
Wire Wire Line
	6700 4750 6700 4600
Connection ~ 6700 4750
Wire Wire Line
	6500 4750 6700 4750
Wire Wire Line
	6700 4850 6700 4750
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23D2
P 7900 5000
AR Path="/5CDEEC9F/5D3A23D2" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23D2" Ref="D8"  Part="1" 
F 0 "D8" V 8050 4950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7900 5125 50  0001 C CNN
F 2 "" H 7900 5000 50  0001 C CNN
F 3 "~" H 7900 5000 50  0001 C CNN
	1    7900 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23CC
P 7500 5000
AR Path="/5CDEEC9F/5D3A23CC" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23CC" Ref="D6"  Part="1" 
F 0 "D6" V 7650 4950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7500 5125 50  0001 C CNN
F 2 "" H 7500 5000 50  0001 C CNN
F 3 "~" H 7500 5000 50  0001 C CNN
	1    7500 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23C6
P 7100 5000
AR Path="/5CDEEC9F/5D3A23C6" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23C6" Ref="D4"  Part="1" 
F 0 "D4" V 7250 4950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7100 5125 50  0001 C CNN
F 2 "" H 7100 5000 50  0001 C CNN
F 3 "~" H 7100 5000 50  0001 C CNN
	1    7100 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D3A23C0
P 6700 5000
AR Path="/5CDEEC9F/5D3A23C0" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D3A23C0" Ref="D2"  Part="1" 
F 0 "D2" V 6850 4950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6700 5125 50  0001 C CNN
F 2 "" H 6700 5000 50  0001 C CNN
F 3 "~" H 6700 5000 50  0001 C CNN
	1    6700 5000
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D38E79E
P 7700 5350
AR Path="/5CDEEC9F/5D38E79E" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D38E79E" Ref="D7"  Part="1" 
F 0 "D7" V 7850 5300 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7700 5475 50  0001 C CNN
F 2 "" H 7700 5350 50  0001 C CNN
F 3 "~" H 7700 5350 50  0001 C CNN
	1    7700 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D38E798
P 7300 5350
AR Path="/5CDEEC9F/5D38E798" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D38E798" Ref="D5"  Part="1" 
F 0 "D5" V 7450 5300 50  0000 R CNN
F 1 "D_Schottky_ALT" H 7300 5475 50  0001 C CNN
F 2 "" H 7300 5350 50  0001 C CNN
F 3 "~" H 7300 5350 50  0001 C CNN
	1    7300 5350
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D387AD3
P 6900 5350
AR Path="/5CDEEC9F/5D387AD3" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D387AD3" Ref="D3"  Part="1" 
F 0 "D3" V 7050 5300 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6900 5475 50  0001 C CNN
F 2 "" H 6900 5350 50  0001 C CNN
F 3 "~" H 6900 5350 50  0001 C CNN
	1    6900 5350
	0    -1   -1   0   
$EndComp
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 4900 5900
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U3"  Part="2" 
F 0 "U3" H 4900 5900 50  0000 C CNN
F 1 "74F08" H 4900 6100 50  0001 C CNN
F 2 "" H 4900 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4900 5900 50  0001 C CNN
	2    4900 5900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C1
P 5900 5900
AR Path="/5CDEEC9F/5DB931C1" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C1" Ref="U13"  Part="1" 
F 0 "U13" H 5900 5950 50  0000 C CNN
F 1 "74F138" H 5850 5850 50  0000 C CNN
F 2 "" H 5900 5900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 5900 5900 50  0001 C CNN
	1    5900 5900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933C5
P 5900 5300
AR Path="/5CDEEC9F/5DB933C5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933C5" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 5900 5150 50  0001 C CNN
F 1 "VCC" H 5917 5473 50  0000 C CNN
F 2 "" H 5900 5300 50  0001 C CNN
F 3 "" H 5900 5300 50  0001 C CNN
	1    5900 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A6
P 5900 6600
AR Path="/5CDEEC9F/5DB932A6" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A6" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 5900 6350 50  0001 C CNN
F 1 "GNDD" H 5904 6445 50  0000 C CNN
F 2 "" H 5900 6600 50  0001 C CNN
F 3 "" H 5900 6600 50  0001 C CNN
	1    5900 6600
	1    0    0    -1  
$EndComp
Text GLabel 5400 6200 0    50   Input ~ 0
~1st
Text GLabel 5400 6300 0    50   Input ~ 0
pclk1
Text GLabel 5400 6100 0    50   Input ~ 0
1
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5DE37F3D
P 6500 5350
AR Path="/5CDEEC9F/5DE37F3D" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5DE37F3D" Ref="D1"  Part="1" 
F 0 "D1" V 6650 5300 50  0000 R CNN
F 1 "D_Schottky_ALT" H 6500 5475 50  0001 C CNN
F 2 "" H 6500 5350 50  0001 C CNN
F 3 "~" H 6500 5350 50  0001 C CNN
	1    6500 5350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 5800 5400 5800
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 5500 1500
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U3"  Part="3" 
F 0 "U3" H 5500 1500 50  0000 C CNN
F 1 "74F08" H 5500 1300 50  0001 C CNN
F 2 "" H 5500 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5500 1500 50  0001 C CNN
	3    5500 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5700 7500 5700
$Comp
L 74xx:74LS00 U2
U 3 1 5D1448EA
P 1600 1050
AR Path="/5DAA5CD8/5D1448EA" Ref="U2"  Part="3" 
AR Path="/5DAA19D5/5D1448EA" Ref="U?"  Part="3" 
F 0 "U2" H 1600 1050 50  0000 C CNN
F 1 "74F00" H 1550 850 50  0001 C CNN
F 2 "" H 1600 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 1600 1050 50  0001 C CNN
	3    1600 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	3300 1600 3500 1600
Wire Wire Line
	6400 3250 8900 3250
Wire Wire Line
	4500 3450 6600 3450
Wire Wire Line
	4500 3550 6600 3550
Wire Wire Line
	4500 3350 4850 3350
Wire Wire Line
	3300 6000 4600 6000
Wire Wire Line
	5200 5900 5300 5900
Wire Wire Line
	5300 5900 5300 5800
Wire Wire Line
	3300 5600 5400 5600
Wire Wire Line
	3300 5700 5400 5700
Wire Wire Line
	6400 5600 6500 5600
Wire Wire Line
	6500 5600 6500 5500
Wire Wire Line
	6500 5200 6500 4750
Wire Wire Line
	3300 2800 3450 2800
Wire Wire Line
	3500 1800 3450 1800
Wire Wire Line
	3450 2950 3450 2800
Wire Wire Line
	3300 2600 3550 2600
Wire Wire Line
	3450 2800 3550 2800
Connection ~ 3450 2800
Wire Wire Line
	3450 2950 5400 2950
Wire Wire Line
	2750 1500 3500 1500
Wire Wire Line
	3850 2250 3450 2250
Text GLabel 1900 1150 2    50   Input ~ 0
~1st
Connection ~ 3450 1800
NoConn ~ 6400 2950
NoConn ~ 6400 3050
NoConn ~ 6400 3150
NoConn ~ 6400 3850
NoConn ~ 6400 3950
NoConn ~ 6400 4050
Wire Wire Line
	4450 2150 4850 2150
Wire Wire Line
	4500 3250 4850 3250
Wire Wire Line
	4850 3250 4850 2500
Connection ~ 4850 3250
Wire Wire Line
	4850 3250 5400 3250
Wire Wire Line
	4850 2500 6700 2500
Connection ~ 4850 2500
Wire Wire Line
	4850 2500 4850 2150
Wire Wire Line
	4450 2350 4550 2350
Wire Wire Line
	4150 2700 4550 2700
Wire Wire Line
	5100 1800 5100 2000
Connection ~ 5100 1800
Wire Wire Line
	5100 1800 6250 1800
Wire Wire Line
	5100 2000 5200 2000
Wire Wire Line
	5100 1700 5100 1600
Wire Wire Line
	5100 1600 5200 1600
Text GLabel 3650 950  2    50   Output ~ 0
~bra
Wire Wire Line
	4550 2700 4550 2350
Connection ~ 4550 2700
Wire Wire Line
	4550 2700 5150 2700
Wire Wire Line
	4550 5800 4550 5400
Wire Wire Line
	4550 5800 4600 5800
Wire Wire Line
	4550 5400 4850 5400
Wire Wire Line
	3450 1800 3450 2250
Wire Wire Line
	4500 1700 5100 1700
Wire Wire Line
	4500 1800 5100 1800
Wire Wire Line
	3450 950  3450 1800
Wire Wire Line
	4850 3350 4850 4050
Wire Wire Line
	3450 3750 5400 3750
Wire Wire Line
	5400 4050 4850 4050
Connection ~ 4850 4050
Wire Wire Line
	4850 4050 4850 5400
Text GLabel 5400 3950 0    50   Input ~ 0
~bra
Wire Wire Line
	3450 950  3650 950 
Connection ~ 3450 950 
Text GLabel 3500 4900 0    50   Input ~ 0
~r8en
Text GLabel 3500 5000 0    50   Input ~ 0
qclk1
Wire Wire Line
	1900 950  3450 950 
Wire Wire Line
	1300 1050 1200 1050
Wire Wire Line
	1200 1050 1200 1800
Wire Wire Line
	1200 1800 1750 1800
Wire Wire Line
	1200 2200 1200 3350
Text GLabel 3550 6200 0    50   Input ~ 0
~2nd
Wire Wire Line
	1400 3900 1400 2500
Connection ~ 1400 4300
Wire Wire Line
	1300 6600 1300 5750
Wire Wire Line
	7500 5700 7500 5150
Wire Wire Line
	6400 6100 7100 6100
Wire Wire Line
	6400 6300 7300 6300
Wire Wire Line
	7700 5500 7700 6000
Wire Wire Line
	7900 5150 7900 6200
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D1AF7E0
P 8350 4750
AR Path="/5CDEEC9F/5D1AF7E0" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D1AF7E0" Ref="D10"  Part="1" 
F 0 "D10" H 8250 4650 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8350 4875 50  0001 C CNN
F 2 "" H 8350 4750 50  0001 C CNN
F 3 "~" H 8350 4750 50  0001 C CNN
	1    8350 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:D_Schottky_ALT D?
U 1 1 5D1FC64C
P 8350 4050
AR Path="/5CDEEC9F/5D1FC64C" Ref="D?"  Part="1" 
AR Path="/5DAA5CD8/5D1FC64C" Ref="D9"  Part="1" 
F 0 "D9" H 8250 3950 50  0000 R CNN
F 1 "D_Schottky_ALT" H 8350 4175 50  0001 C CNN
F 2 "" H 8350 4050 50  0001 C CNN
F 3 "~" H 8350 4050 50  0001 C CNN
	1    8350 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7300 4450 7300 5200
Wire Wire Line
	7100 4350 7100 4850
Wire Wire Line
	6900 4250 6900 4600
Wire Wire Line
	8200 4750 8100 4750
Wire Wire Line
	8100 4250 8100 4050
Wire Wire Line
	8100 4050 8200 4050
Wire Wire Line
	8100 4550 8100 4750
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 3850 6300
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U4"  Part="4" 
F 0 "U4" H 3850 6300 50  0000 C CNN
F 1 "74F32" H 3850 6100 50  0001 C CNN
F 2 "" H 3850 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3850 6300 50  0001 C CNN
	4    3850 6300
	1    0    0    -1  
$EndComp
Text GLabel 4250 6300 2    50   Output ~ 0
~dwe
Text GLabel 8600 4050 2    50   Input ~ 0
~2nd
Text GLabel 8600 4750 2    50   Input ~ 0
qclk1
Text GLabel 8700 4550 2    50   Output ~ 0
~doe
Text GLabel 8700 4450 2    50   Output ~ 0
~eoe
Text GLabel 8700 4350 2    50   Output ~ 0
~xroe
Text GLabel 8700 4250 2    50   Output ~ 0
~aoe
Wire Wire Line
	7900 4550 7900 4850
Wire Wire Line
	7700 4550 7700 4700
Wire Wire Line
	7500 4700 7700 4700
Wire Wire Line
	7500 4700 7500 4850
Connection ~ 7700 4700
Wire Wire Line
	7700 4700 7700 5200
Wire Wire Line
	8100 4550 8700 4550
Wire Wire Line
	8100 4250 8700 4250
Wire Wire Line
	8500 4050 8600 4050
Wire Wire Line
	8500 4750 8600 4750
Wire Wire Line
	7900 4550 8100 4550
Connection ~ 7900 4550
Connection ~ 8100 4550
Connection ~ 8100 4250
Wire Wire Line
	7300 4450 7600 4450
Wire Wire Line
	6900 4250 7400 4250
Wire Wire Line
	7400 4250 7400 4150
Wire Wire Line
	7500 4350 7500 4150
Wire Wire Line
	7600 4450 7600 4150
Wire Wire Line
	7700 4550 7700 4150
$Comp
L Device:R_Network04_US RN?
U 1 1 5DB932E4
P 7600 3950
AR Path="/5CDEEC9F/5DB932E4" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DB932E4" Ref="RN5"  Part="1" 
F 0 "RN5" H 7600 4300 50  0000 L CNN
F 1 "680" H 7600 4200 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP5" V 7875 3950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 7600 3950 50  0001 C CNN
	1    7600 3950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB932ED
P 7400 3750
AR Path="/5CDEEC9F/5DB932ED" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932ED" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 7400 3600 50  0001 C CNN
F 1 "VCC" H 7417 3923 50  0000 C CNN
F 2 "" H 7400 3750 50  0001 C CNN
F 3 "" H 7400 3750 50  0001 C CNN
	1    7400 3750
	1    0    0    -1  
$EndComp
Connection ~ 7400 4250
Connection ~ 7500 4350
Wire Wire Line
	7500 4350 7100 4350
Connection ~ 7600 4450
Connection ~ 7700 4550
Wire Wire Line
	7700 4550 7900 4550
Wire Wire Line
	7500 4350 8700 4350
Wire Wire Line
	7600 4450 8700 4450
Wire Wire Line
	7400 4250 8100 4250
Text Label 3300 6400 0    50   ~ 0
I3
Entry Wire Line
	3200 6500 3300 6400
Wire Wire Line
	3300 6400 3550 6400
Wire Wire Line
	4150 6300 4250 6300
Wire Wire Line
	6400 6000 7700 6000
Wire Wire Line
	7100 6100 7100 5150
Wire Wire Line
	7300 6300 7300 5500
Wire Wire Line
	6400 6200 7900 6200
Wire Bus Line
	1600 5500 1600 6300
Wire Bus Line
	3200 1700 3200 6700
$EndSCHEMATC
