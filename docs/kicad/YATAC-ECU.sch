EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "Execution and Control Unit"
Date "2019-05-31"
Rev "0.7"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS139 U?
U 2 1 5DB93139
P 4000 3250
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U7"  Part="2" 
F 0 "U7" H 4000 3250 50  0000 C CNN
F 1 "74ALS139" H 3950 3150 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4000 3250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 3250 50  0001 C CNN
	2    4000 3250
	1    0    0    -1  
$EndComp
Text GLabel 5400 2200 0    50   Input ~ 0
qclk1
Text GLabel 6000 2100 2    50   Output ~ 0
~pgle
Text GLabel 6000 1400 2    50   Output ~ 0
~pcpe
Text GLabel 7000 1800 2    50   Output ~ 0
~pcmr
$Comp
L 74xx:74LS574 U?
U 1 1 5DB93147
P 2150 6200
AR Path="/5CDEEC9F/5DB93147" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93147" Ref="U13"  Part="1" 
F 0 "U13" H 2150 6000 50  0000 C CNN
F 1 "74F574" H 2150 5900 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2150 6200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2150 6200 50  0001 C CNN
	1    2150 6200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 7500 2800
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U4"  Part="1" 
F 0 "U4" H 7500 2800 50  0000 C CNN
F 1 "74F32" H 7500 2600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7500 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7500 2800 50  0001 C CNN
	1    7500 2800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 8300 2100
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U4"  Part="3" 
F 0 "U4" H 8300 2100 50  0000 C CNN
F 1 "74F32" H 8300 1900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8300 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8300 2100 50  0001 C CNN
	3    8300 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9800 3500
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9800 3250 50  0001 C CNN
F 1 "GNDD" H 9804 3345 50  0000 C CNN
F 2 "" H 9800 3500 50  0001 C CNN
F 3 "" H 9800 3500 50  0001 C CNN
	1    9800 3500
	1    0    0    -1  
$EndComp
Text GLabel 7200 2100 0    50   Input ~ 0
rclk
Text GLabel 7200 2900 0    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DB93177
P 2150 3000
AR Path="/5CDEEC9F/5DB93177" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB93177" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 2150 2750 50  0001 C CNN
F 1 "GNDD" H 2154 2845 50  0000 C CNN
F 2 "" H 2150 3000 50  0001 C CNN
F 3 "" H 2150 3000 50  0001 C CNN
	1    2150 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 4000 1500
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U7"  Part="1" 
F 0 "U7" H 4000 1500 50  0000 C CNN
F 1 "74ALS139" H 3950 1400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4000 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 1500 50  0001 C CNN
	1    4000 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS157 U?
U 1 1 5DB93191
P 2150 2000
AR Path="/5CDEEC9F/5DB93191" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93191" Ref="U11"  Part="1" 
F 0 "U11" H 2150 1900 50  0000 C CNN
F 1 "74F157" H 2150 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2150 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 2150 2000 50  0001 C CNN
	1    2150 2000
	1    0    0    -1  
$EndComp
Text GLabel 4750 2600 2    50   Output ~ 0
I3+4
Entry Wire Line
	3100 3550 3200 3450
Entry Wire Line
	3100 3250 3200 3150
Entry Wire Line
	3100 3350 3200 3250
Entry Wire Line
	3100 2800 3200 2700
Entry Wire Line
	3100 2600 3200 2500
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2150 4900
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2150 4650 50  0001 C CNN
F 1 "GNDD" H 2154 4745 50  0000 C CNN
F 2 "" H 2150 4900 50  0001 C CNN
F 3 "" H 2150 4900 50  0001 C CNN
	1    2150 4900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 4000 4600
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U9"  Part="1" 
F 0 "U9" H 4000 4650 50  0000 C CNN
F 1 "74F138" H 3950 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4000 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 4000 4600 50  0001 C CNN
	1    4000 4600
	1    0    0    -1  
$EndComp
Text GLabel 2650 3700 2    50   Input ~ 0
sclk
Text GLabel 2650 4600 2    50   Input ~ 0
0
Text GLabel 2650 4100 2    50   Input ~ 0
I3+4
Text GLabel 1650 3700 0    50   Input ~ 0
pclk1
Text GLabel 1650 4400 0    50   Input ~ 0
~rst
Text GLabel 1650 4300 0    50   Output ~ 0
pcent
Text GLabel 1650 4200 0    50   Output ~ 0
~inst
Text GLabel 1650 4100 0    50   Output ~ 0
hsel
Text GLabel 1650 4000 0    50   Output ~ 0
boot
NoConn ~ 1650 3900
Text GLabel 2650 2000 2    50   Output ~ 0
PA16
Text GLabel 9300 2200 0    50   Input ~ 0
~inst
Wire Wire Line
	2650 4400 3000 4400
Wire Wire Line
	2650 4300 3000 4300
Wire Wire Line
	2650 4200 3000 4200
Wire Wire Line
	2650 3900 3000 3900
Wire Wire Line
	2650 3800 3000 3800
Text GLabel 1650 1400 0    50   Input ~ 0
0
Text GLabel 1650 2000 0    50   Input ~ 0
hblank
Text GLabel 1650 2400 0    50   Input ~ 0
1
Text GLabel 1650 2600 0    50   Input ~ 0
pclk1
Text GLabel 1650 2700 0    50   Input ~ 0
0
Text GLabel 7800 1800 0    50   Input ~ 0
boot
Text GLabel 6400 2600 0    50   Input ~ 0
~inst
Entry Wire Line
	3200 4300 3100 4400
Entry Wire Line
	3200 4400 3100 4500
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
P 2150 4200
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U12"  Part="1" 
F 0 "U12" H 2150 4250 50  0000 C CNN
F 1 "PAL16R4" H 2100 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2150 4200 50  0001 C CNN
F 3 "" H 2150 4200 50  0001 C CNN
	1    2150 4200
	-1   0    0    -1  
$EndComp
Text GLabel 1650 6700 0    50   Input ~ 0
0
Entry Wire Line
	1250 5600 1350 5700
Entry Wire Line
	1250 5700 1350 5800
Entry Wire Line
	1250 5800 1350 5900
Entry Wire Line
	1250 5900 1350 6000
Entry Wire Line
	1250 6000 1350 6100
Entry Wire Line
	1250 6100 1350 6200
Entry Wire Line
	1250 6200 1350 6300
Entry Wire Line
	1250 6300 1350 6400
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A0
P 2150 7000
AR Path="/5CDEEC9F/5DB932A0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2150 6750 50  0001 C CNN
F 1 "GNDD" H 2154 6845 50  0000 C CNN
F 2 "" H 2150 7000 50  0001 C CNN
F 3 "" H 2150 7000 50  0001 C CNN
	1    2150 7000
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
	3100 5800 3000 5700
Entry Wire Line
	3100 5900 3000 5800
Entry Wire Line
	3100 6000 3000 5900
Entry Wire Line
	3100 6500 3000 6400
Text Label 3200 4300 0    50   ~ 0
I0
Text Label 3200 4400 0    50   ~ 0
I1
Text Label 3200 4500 0    50   ~ 0
I2
Text Label 3200 3450 0    50   ~ 0
I7
Text Label 3200 3150 0    50   ~ 0
I6
Text Label 3200 3250 0    50   ~ 0
I5
Text Label 3200 2700 0    50   ~ 0
I4
Text Label 3200 2500 0    50   ~ 0
I3
Text Label 2900 3250 0    50   ~ 0
I4
Text Label 2900 3800 0    50   ~ 0
I0
Text Label 2900 3900 0    50   ~ 0
I1
Text Label 2900 4000 0    50   ~ 0
I2
Text Label 2900 4200 0    50   ~ 0
I5
Text Label 2900 4300 0    50   ~ 0
I6
Text Label 2900 4400 0    50   ~ 0
I7
Text Label 2900 5700 0    50   ~ 0
I0
Text Label 2900 5800 0    50   ~ 0
I1
Text Label 2900 5900 0    50   ~ 0
I2
Text Label 2900 6000 0    50   ~ 0
I3
Text Label 2900 6100 0    50   ~ 0
I4
Text Label 2900 6200 0    50   ~ 0
I5
Text Label 2900 6300 0    50   ~ 0
I6
Text Label 2900 6400 0    50   ~ 0
I7
Text Label 1350 5700 0    50   ~ 0
PD0
Text Label 1350 5800 0    50   ~ 0
PD1
Text Label 1350 5900 0    50   ~ 0
PD2
Text Label 1350 6000 0    50   ~ 0
PD3
Text Label 1350 6100 0    50   ~ 0
PD4
Text Label 1350 6200 0    50   ~ 0
PD5
Text Label 1350 6300 0    50   ~ 0
PD6
Text Label 1350 6400 0    50   ~ 0
PD7
Text GLabel 1250 5500 1    50   Input ~ 0
PD[0..7]
Text GLabel 3100 6700 3    50   Output ~ 0
I[0..7]
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9800 1900
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9800 1750 50  0001 C CNN
F 1 "VCC" H 9817 2073 50  0000 C CNN
F 2 "" H 9800 1900 50  0001 C CNN
F 3 "" H 9800 1900 50  0001 C CNN
	1    9800 1900
	1    0    0    -1  
$EndComp
Text GLabel 6400 1900 0    50   Input ~ 0
~rst
NoConn ~ 4500 1500
NoConn ~ 4500 1400
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 6700 2500
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U3"  Part="1" 
F 0 "U3" H 6700 2500 50  0000 C CNN
F 1 "74F08" H 6700 2300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6700 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6700 2500 50  0001 C CNN
	1    6700 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB9337D
P 4050 2100
AR Path="/5CDEEC9F/5DB9337D" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB9337D" Ref="U5"  Part="2" 
F 0 "U5" H 4000 2100 50  0000 L CNN
F 1 "74F32" V 4050 1650 50  0001 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4050 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4050 2100 50  0001 C CNN
	2    4050 2100
	-1   0    0    1   
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DB93383
P 3950 2600
AR Path="/5CDEEC9F/5DB93383" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93383" Ref="U5"  Part="1" 
F 0 "U5" H 3950 2600 50  0000 C CNN
F 1 "74F32" H 3950 2850 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3950 2600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3950 2600 50  0001 C CNN
	1    3950 2600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 8300 2900
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U4"  Part="2" 
F 0 "U4" H 8300 2900 50  0000 C CNN
F 1 "74F32" H 8300 2700 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 8300 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 8300 2900 50  0001 C CNN
	2    8300 2900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B3
P 2150 1100
AR Path="/5CDEEC9F/5DB933B3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B3" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 2150 950 50  0001 C CNN
F 1 "VCC" H 2167 1273 50  0000 C CNN
F 2 "" H 2150 1100 50  0001 C CNN
F 3 "" H 2150 1100 50  0001 C CNN
	1    2150 1100
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 2150 3500
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2150 3350 50  0001 C CNN
F 1 "VCC" H 2167 3673 50  0000 C CNN
F 2 "" H 2150 3500 50  0001 C CNN
F 3 "" H 2150 3500 50  0001 C CNN
	1    2150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2150 5400
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2150 5250 50  0001 C CNN
F 1 "VCC" H 2167 5573 50  0000 C CNN
F 2 "" H 2150 5400 50  0001 C CNN
F 3 "" H 2150 5400 50  0001 C CNN
	1    2150 5400
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
	3100 4400 3000 4300
Entry Wire Line
	3100 4300 3000 4200
Entry Wire Line
	3100 4500 3000 4400
Entry Wire Line
	3100 4100 3000 4000
Entry Wire Line
	3100 4000 3000 3900
Entry Wire Line
	3100 3900 3000 3800
Entry Wire Line
	3100 6400 3000 6300
Entry Wire Line
	3100 6300 3000 6200
Entry Wire Line
	3100 6200 3000 6100
Entry Wire Line
	3100 6100 3000 6000
Entry Wire Line
	2850 4500 2950 4600
Text Label 2700 4500 0    50   ~ 0
DD7
Text GLabel 2950 4700 3    50   Input ~ 0
DD[0..7]
Wire Bus Line
	2950 4700 2950 4600
Wire Wire Line
	2650 4500 2850 4500
$Comp
L 74xx:74LS08 U?
U 4 1 5CED2B25
P 6700 1800
AR Path="/5DAA3954/5CED2B25" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5CED2B25" Ref="U3"  Part="4" 
F 0 "U3" H 6700 1800 50  0000 C CNN
F 1 "74F08" H 6700 1600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6700 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6700 1800 50  0001 C CNN
	4    6700 1800
	1    0    0    -1  
$EndComp
Text GLabel 5400 1300 0    50   Input ~ 0
~pcle
Entry Wire Line
	3100 1600 3200 1500
Text Label 3200 1500 0    50   ~ 0
I2
Text GLabel 5150 2950 0    50   Input ~ 0
pclk1
Wire Wire Line
	8600 2900 8650 2900
Wire Wire Line
	8650 2900 8650 2600
Wire Wire Line
	8600 2100 8650 2100
Text GLabel 6150 3650 2    50   Output ~ 0
~r8en
Wire Wire Line
	7800 1800 7900 1800
Wire Wire Line
	7900 1800 7900 2000
Entry Wire Line
	3200 4500 3100 4600
Text GLabel 2650 1700 2    50   Output ~ 0
~ile
Wire Wire Line
	8650 2100 8650 2300
Wire Wire Line
	10300 2800 10550 2800
$Comp
L 74xx:74LS574 U?
U 1 1 5DB933A7
P 9800 2700
AR Path="/5CDEEC9F/5DB933A7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB933A7" Ref="U14"  Part="1" 
F 0 "U14" H 9800 2500 50  0000 C CNN
F 1 "74F574" H 9800 2400 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9800 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9800 2700 50  0001 C CNN
	1    9800 2700
	1    0    0    -1  
$EndComp
Text GLabel 10300 2700 2    50   Output ~ 0
~gcoe
Text GLabel 10300 2600 2    50   Output ~ 0
~fnoe
Text GLabel 10300 2500 2    50   Output ~ 0
~alue
Text GLabel 10300 2400 2    50   Output ~ 0
~pcoe
Text GLabel 10300 2300 2    50   Output ~ 0
~pgoe
Text GLabel 10300 2900 2    50   Output ~ 0
~xoe
Text GLabel 9300 2700 0    50   Input ~ 0
sclk
Text GLabel 9300 3200 0    50   Input ~ 0
0
Text GLabel 9300 3100 0    50   Input ~ 0
dclk
Wire Wire Line
	9300 2300 8650 2300
Wire Wire Line
	8650 2600 9300 2600
Wire Wire Line
	9300 2900 8950 2900
Wire Wire Line
	9300 2800 8800 2800
Wire Wire Line
	8800 2800 8800 3150
Text GLabel 1650 1700 0    50   Input ~ 0
1
Wire Wire Line
	8950 2900 8950 3800
Wire Wire Line
	10550 2800 10550 3800
Wire Wire Line
	8950 3800 10550 3800
Text GLabel 4500 4900 2    50   Output ~ 0
~exle
Entry Wire Line
	3000 3250 3100 3350
Text GLabel 2650 2300 2    50   Output ~ 0
DA16
Text Label 3200 5900 0    50   ~ 0
I5
Entry Wire Line
	3100 5800 3200 5700
Text Label 3200 5700 0    50   ~ 0
I3
Text Label 3200 5800 0    50   ~ 0
I4
Entry Wire Line
	3100 6000 3200 5900
Entry Wire Line
	3100 5900 3200 5800
Text GLabel 10300 2200 2    50   Output ~ 0
~1st
Text GLabel 1650 1500 0    50   Input ~ 0
~inst
Wire Wire Line
	2650 4000 3000 4000
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 5700 5500
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U3"  Part="2" 
F 0 "U3" H 5700 5500 50  0000 C CNN
F 1 "74F08" H 5700 5700 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5700 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5700 5500 50  0001 C CNN
	2    5700 5500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C1
P 8300 5400
AR Path="/5CDEEC9F/5DB931C1" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C1" Ref="U10"  Part="1" 
F 0 "U10" H 8300 5450 50  0000 C CNN
F 1 "74F138" H 8250 5350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8300 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 8300 5400 50  0001 C CNN
	1    8300 5400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DB933C5
P 8300 4800
AR Path="/5CDEEC9F/5DB933C5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933C5" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 8300 4650 50  0001 C CNN
F 1 "VCC" H 8317 4973 50  0000 C CNN
F 2 "" H 8300 4800 50  0001 C CNN
F 3 "" H 8300 4800 50  0001 C CNN
	1    8300 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A6
P 8300 6100
AR Path="/5CDEEC9F/5DB932A6" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A6" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 8300 5850 50  0001 C CNN
F 1 "GNDD" H 8304 5945 50  0000 C CNN
F 2 "" H 8300 6100 50  0001 C CNN
F 3 "" H 8300 6100 50  0001 C CNN
	1    8300 6100
	1    0    0    -1  
$EndComp
Text GLabel 7800 5700 0    50   Input ~ 0
~1st
Text GLabel 7800 5800 0    50   Input ~ 0
pclk1
Text GLabel 7800 5600 0    50   Input ~ 0
1
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 5700 1400
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U3"  Part="3" 
F 0 "U3" H 5700 1400 50  0000 C CNN
F 1 "74F08" H 5700 1200 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5700 1400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5700 1400 50  0001 C CNN
	3    5700 1400
	1    0    0    -1  
$EndComp
NoConn ~ 6150 2850
NoConn ~ 6150 2950
NoConn ~ 6150 3050
NoConn ~ 6150 3750
NoConn ~ 6150 3850
NoConn ~ 6150 3950
Text GLabel 3350 2100 0    50   Output ~ 0
~bra
Text GLabel 5150 3850 0    50   Input ~ 0
~bra
Text GLabel 3500 4900 0    50   Input ~ 0
~r8en
Text GLabel 3500 5000 0    50   Input ~ 0
qclk1
Text GLabel 9650 5100 0    50   Input ~ 0
qclk1
Text GLabel 10300 5250 2    50   Output ~ 0
~doe
Text GLabel 10300 5800 2    50   Output ~ 0
~eoe
Text GLabel 10300 5600 2    50   Output ~ 0
~xroe
Text GLabel 10300 4750 2    50   Output ~ 0
~aoe
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 5700 2100
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U4"  Part="4" 
F 0 "U4" H 5700 2100 50  0000 C CNN
F 1 "74F32" H 5700 1900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5700 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5700 2100 50  0001 C CNN
	4    5700 2100
	1    0    0    -1  
$EndComp
Text GLabel 5400 4700 0    50   Input ~ 0
~bra
Text GLabel 5400 4500 0    50   Input ~ 0
~1st
Text GLabel 1650 1800 0    50   Input ~ 0
~inst
Text GLabel 1650 6600 0    50   Input ~ 0
~ile
Wire Wire Line
	1150 2100 1650 2100
Wire Wire Line
	1150 2100 1150 3800
Wire Wire Line
	1150 3800 1650 3800
Wire Wire Line
	3000 3250 1300 3250
Wire Wire Line
	1650 2300 1300 2300
Wire Wire Line
	1300 2300 1300 3250
$Comp
L 74xx:74LS00 U?
U 2 1 5DB93395
P 6700 3400
AR Path="/5CDEEC9F/5DB93395" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93395" Ref="U2"  Part="2" 
F 0 "U2" H 6700 3400 50  0000 C CNN
F 1 "74F00" H 6850 3200 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6700 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6700 3400 50  0001 C CNN
	2    6700 3400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DB9315A
P 7500 2200
AR Path="/5CDEEC9F/5DB9315A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9315A" Ref="U2"  Part="1" 
F 0 "U2" H 7500 2200 50  0000 C CNN
F 1 "74F00" H 7500 2000 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7500 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 7500 2200 50  0001 C CNN
	1    7500 2200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U2
U 3 1 5D1448EA
P 5700 4600
AR Path="/5DAA5CD8/5D1448EA" Ref="U2"  Part="3" 
AR Path="/5DAA19D5/5D1448EA" Ref="U?"  Part="3" 
F 0 "U2" H 5700 4600 50  0000 C CNN
F 1 "74F00" H 5650 4400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5700 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5700 4600 50  0001 C CNN
	3    5700 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3250 4850 3250
Wire Wire Line
	3450 3650 3450 3450
Wire Wire Line
	3450 3450 3500 3450
Connection ~ 3450 3450
Wire Wire Line
	3200 3450 3450 3450
Wire Wire Line
	3200 3250 3500 3250
Wire Wire Line
	3200 3150 3500 3150
Wire Wire Line
	3200 2700 3450 2700
Wire Wire Line
	3450 2850 3450 2700
Connection ~ 3450 2700
Wire Wire Line
	2650 1400 3500 1400
Wire Wire Line
	3200 1500 3500 1500
Wire Wire Line
	3350 2100 3450 2100
Wire Wire Line
	3500 1700 3450 1700
Wire Wire Line
	3450 1700 3450 2100
Wire Wire Line
	3200 4300 3500 4300
Wire Wire Line
	3200 4400 3500 4400
Wire Wire Line
	3200 4500 3500 4500
Wire Wire Line
	2650 5700 3000 5700
Wire Wire Line
	2650 5800 3000 5800
Wire Wire Line
	2650 5900 3000 5900
Wire Wire Line
	2650 6000 3000 6000
Wire Wire Line
	2650 6100 3000 6100
Wire Wire Line
	2650 6200 3000 6200
Wire Wire Line
	2650 6300 3000 6300
Wire Wire Line
	2650 6400 3000 6400
Wire Wire Line
	3200 2500 3650 2500
Wire Wire Line
	3450 2700 3650 2700
Wire Wire Line
	3450 2100 3750 2100
Connection ~ 3450 2100
Wire Wire Line
	4350 2200 4400 2200
Wire Wire Line
	4250 2600 4400 2600
Wire Wire Line
	4400 2200 4400 2600
Wire Wire Line
	4500 3150 4550 3150
Wire Wire Line
	4550 2400 6400 2400
Wire Wire Line
	4550 3150 4550 2400
Wire Wire Line
	4350 2000 4550 2000
Connection ~ 4550 2400
Wire Wire Line
	4550 2400 4550 2000
Wire Wire Line
	4750 2600 4400 2600
Connection ~ 4400 2600
Wire Wire Line
	7800 2800 7900 2800
Wire Wire Line
	7900 2800 7900 2500
Connection ~ 7900 2800
Wire Wire Line
	7900 2500 9300 2500
Wire Wire Line
	7900 2800 8000 2800
Wire Wire Line
	7900 2400 7900 2200
Wire Wire Line
	7900 2200 8000 2200
Wire Wire Line
	7900 2400 9300 2400
Wire Wire Line
	7800 2200 7900 2200
Connection ~ 7900 2200
Wire Wire Line
	7900 2000 8000 2000
Wire Wire Line
	7000 2500 7100 2500
Wire Wire Line
	7100 2500 7100 2300
Connection ~ 7100 2500
Wire Wire Line
	7100 2700 7100 2500
Wire Wire Line
	7100 2700 7200 2700
Wire Wire Line
	7100 2300 7200 2300
Wire Wire Line
	7900 3400 7900 3000
Wire Wire Line
	7900 3000 8000 3000
Wire Wire Line
	6400 3500 6300 3500
Wire Wire Line
	6300 3500 6300 3450
Wire Wire Line
	6300 3350 6300 3300
Wire Wire Line
	6300 3300 6400 3300
Connection ~ 5300 1700
Wire Wire Line
	5300 1700 6400 1700
Wire Wire Line
	5300 1600 5300 1500
Wire Wire Line
	5300 1500 5400 1500
$Comp
L 74xx:74LS139 U8
U 2 1 5CEF3946
P 5650 3850
F 0 "U8" H 5650 3850 50  0000 C CNN
F 1 "74ALS139" H 5600 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5650 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5650 3850 50  0001 C CNN
	2    5650 3850
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS139 U8
U 1 1 5CEE0F76
P 5650 2950
F 0 "U8" H 5650 2950 50  0000 C CNN
F 1 "74ALS139" H 5600 2850 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5650 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5650 2950 50  0001 C CNN
	1    5650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3250 4850 3950
Wire Wire Line
	3450 2850 5150 2850
Wire Wire Line
	3450 3650 5150 3650
Wire Wire Line
	4850 3950 5150 3950
Connection ~ 4850 3950
Wire Wire Line
	4550 3150 5150 3150
Connection ~ 4550 3150
Wire Wire Line
	6150 3150 8800 3150
Text GLabel 7800 4600 2    50   Output ~ 0
~dwe
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93377
P 7500 4600
AR Path="/5CDEEC9F/5DB93377" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93377" Ref="U5"  Part="3" 
F 0 "U5" H 7500 4600 50  0000 C CNN
F 1 "74F32" H 7500 4400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7500 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7500 4600 50  0001 C CNN
	3    7500 4600
	1    0    0    1   
$EndComp
Text GLabel 6400 4400 0    50   Input ~ 0
pclk1
$Comp
L 74xx:74LS32 U?
U 4 1 5DB9335E
P 6700 4500
AR Path="/5CDEEC9F/5DB9335E" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB9335E" Ref="U5"  Part="4" 
F 0 "U5" H 6700 4500 50  0000 C CNN
F 1 "74F32" H 6700 4734 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6700 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 6700 4500 50  0001 C CNN
	4    6700 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U6
U 1 1 5DAB5829
P 9950 4750
F 0 "U6" H 9950 4750 50  0000 C CNN
F 1 "74F21" H 9950 4500 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9950 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 9950 4750 50  0001 C CNN
	1    9950 4750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS21 U6
U 2 1 5DABFC68
P 9950 5250
F 0 "U6" H 9950 5250 50  0000 C CNN
F 1 "74F21" H 9950 5000 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9950 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS21" H 9950 5250 50  0001 C CNN
	2    9950 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 5100 8950 4700
Wire Wire Line
	9100 5300 9100 4800
Wire Wire Line
	9250 5400 9250 4900
Wire Wire Line
	9400 5500 9400 5300
Wire Wire Line
	9550 5400 9650 5400
Wire Wire Line
	9550 5400 9550 5700
Wire Wire Line
	9400 5300 9650 5300
Wire Wire Line
	9250 4900 9650 4900
Wire Wire Line
	9100 4800 9650 4800
Wire Wire Line
	8950 4700 9650 4700
Wire Wire Line
	8950 4600 9650 4600
Wire Wire Line
	7200 4700 7100 4700
Wire Wire Line
	7100 4700 7100 5100
Wire Wire Line
	7000 4500 7100 4500
Connection ~ 7100 4500
Wire Wire Line
	7100 4500 7200 4500
Wire Wire Line
	3200 5700 5000 5700
Wire Wire Line
	3200 5800 5150 5800
Wire Wire Line
	8800 5100 8950 5100
Wire Wire Line
	8800 5200 9650 5200
Wire Wire Line
	8800 5300 9100 5300
Wire Wire Line
	8800 5400 9250 5400
Wire Wire Line
	8800 5500 9400 5500
Wire Wire Line
	8800 5700 9550 5700
Wire Wire Line
	5000 5100 7100 5100
Connection ~ 7100 5100
Wire Wire Line
	7100 5100 7800 5100
Wire Wire Line
	5150 5200 7800 5200
Wire Wire Line
	7100 5300 7800 5300
Wire Wire Line
	8950 4200 7100 4200
Wire Wire Line
	8950 4200 8950 4600
Wire Wire Line
	7100 4200 7100 4500
Wire Wire Line
	5300 5600 5400 5600
Wire Wire Line
	4850 3950 4850 5400
Wire Wire Line
	7100 5300 7100 5500
Wire Wire Line
	6000 4600 6400 4600
Wire Wire Line
	5400 5400 4850 5400
Wire Wire Line
	6000 5500 7100 5500
Wire Wire Line
	4500 1600 5300 1600
Wire Wire Line
	4500 1700 5300 1700
Wire Wire Line
	5400 2000 5300 2000
Wire Wire Line
	5300 1700 5300 2000
Wire Wire Line
	3200 5900 5300 5900
Wire Wire Line
	5300 5600 5300 5900
Wire Wire Line
	5000 5100 5000 5700
Wire Wire Line
	5150 5200 5150 5800
Wire Wire Line
	1350 5700 1650 5700
Wire Wire Line
	1350 5800 1650 5800
Wire Wire Line
	1350 5900 1650 5900
Wire Wire Line
	1350 6000 1650 6000
Wire Wire Line
	1350 6100 1650 6100
Wire Wire Line
	1350 6200 1650 6200
Wire Wire Line
	1350 6300 1650 6300
Wire Wire Line
	1350 6400 1650 6400
Wire Wire Line
	10250 4750 10300 4750
Wire Wire Line
	10250 5250 10300 5250
Wire Wire Line
	8800 5600 10300 5600
Wire Wire Line
	8800 5800 10300 5800
NoConn ~ 4500 5000
Wire Wire Line
	4500 3350 6300 3350
Wire Wire Line
	4500 3450 6300 3450
Wire Wire Line
	7000 3400 7900 3400
Wire Bus Line
	1250 5500 1250 6300
Wire Bus Line
	3100 1600 3100 6700
$EndSCHEMATC
