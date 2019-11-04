EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "YATAC78 TTL Computer"
Date "2019-10-27"
Rev "1.1.0"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS32 U?
U 2 1 5DA1E72A
P 4700 2550
AR Path="/5CDEEC9F/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DA1E72A" Ref="U3"  Part="2" 
F 0 "U3" H 4700 2550 50  0000 C CNN
F 1 "74F32" H 4700 2350 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 2550 50  0001 C CNN
	2    4700 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DA1E90F
P 4700 3750
AR Path="/5CDEEC9F/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DA1E90F" Ref="U3"  Part="3" 
F 0 "U3" H 4700 3750 50  0000 C CNN
F 1 "74F32" H 4700 3550 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 3750 50  0001 C CNN
	3    4700 3750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5DA1E854
P 4700 4150
AR Path="/5CDEEC9F/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DA1E854" Ref="U3"  Part="4" 
F 0 "U3" H 4700 4150 50  0000 C CNN
F 1 "74F32" H 4700 3950 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 4150 50  0001 C CNN
	4    4700 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	2800 3050 2700 3150
Entry Wire Line
	2800 2950 2700 3050
Text Label 2800 3050 0    50   ~ 0
I4
Entry Wire Line
	2800 2450 2700 2550
Text Label 2800 2450 0    50   ~ 0
I2
Text Label 2800 3650 0    50   ~ 0
I5
Entry Wire Line
	2800 3650 2700 3750
Wire Wire Line
	4100 3250 4400 3250
Text GLabel 4100 2950 2    50   Output ~ 0
~inoe
Text GLabel 5000 3750 2    50   Output ~ 0
~ale
Text GLabel 4400 3850 0    50   Input ~ 0
~alue
Wire Wire Line
	4350 3150 4350 3050
Wire Wire Line
	4100 3150 4350 3150
Wire Wire Line
	4350 3050 4400 3050
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 3600 3050
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U5"  Part="2" 
F 0 "U5" H 3600 3050 50  0000 C CNN
F 1 "74F139" H 3550 2950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3600 3050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3600 3050 50  0001 C CNN
	2    3600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2750 4350 2850
Connection ~ 4350 2750
Wire Wire Line
	4350 2650 4400 2650
Wire Wire Line
	4350 2650 4350 2750
$Comp
L 74xx:74LS08 U?
U 2 1 5DA1E903
P 4700 3350
AR Path="/5CDEEC9F/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DA1E903" Ref="U2"  Part="2" 
F 0 "U2" H 4700 3350 50  0000 C CNN
F 1 "74F08" H 4700 3550 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4700 3350 50  0001 C CNN
	2    4700 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2750 4350 2750
Text GLabel 5000 3350 2    50   Output ~ 0
~doe
Text GLabel 4100 3050 2    50   Output ~ 0
~eoe
Wire Wire Line
	4400 2850 4350 2850
Text GLabel 4250 2750 0    50   Input ~ 0
~write
Text GLabel 3100 3250 0    50   Input ~ 0
~read
Text GLabel 5000 2550 2    50   Output ~ 0
~dwe
Text GLabel 5000 2950 2    50   Output ~ 0
~aoe
Text GLabel 4400 3450 0    50   Input ~ 0
qclk2
Text Label 2800 2950 0    50   ~ 0
I11
$Comp
L 74xx:74LS08 U?
U 1 1 5DA1E75E
P 4700 2950
AR Path="/5CDEEC9F/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DA1E75E" Ref="U2"  Part="1" 
F 0 "U2" H 4700 2950 50  0000 C CNN
F 1 "74F08" H 4700 2750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4700 2950 50  0001 C CNN
	1    4700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 3650 4400 3650
Wire Wire Line
	2800 3050 3100 3050
Wire Wire Line
	2800 2950 3100 2950
Wire Wire Line
	2800 2450 4400 2450
Wire Wire Line
	3600 1700 3600 1750
Connection ~ 3600 1700
Wire Wire Line
	3800 1700 3600 1700
Wire Wire Line
	3800 1750 3800 1700
Wire Wire Line
	3600 1650 3600 1700
Wire Wire Line
	4600 6350 4600 7050
Wire Wire Line
	4200 6350 4200 6900
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E7A5
P 4700 1950
AR Path="/5CDEEC9F/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DA1E7A5" Ref="U3"  Part="1" 
F 0 "U3" H 4700 1950 50  0000 C CNN
F 1 "74F32" H 4700 1750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 1950 50  0001 C CNN
	1    4700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 2050 4400 2050
Text GLabel 5000 1950 2    50   Output ~ 0
DA16
Text GLabel 4400 1850 0    50   Input ~ 0
pclk1
Wire Wire Line
	2700 1650 2950 1650
Connection ~ 2700 1650
Wire Wire Line
	2700 1600 2700 1650
Wire Wire Line
	2300 1650 2700 1650
Wire Wire Line
	3550 1750 3600 1750
Wire Wire Line
	3550 1650 3600 1650
$Comp
L YATAC-rescue:SW_Push-Switch SW1
U 1 1 5E0603B4
P 3250 1650
AR Path="/5E0603B4" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5E0603B4" Ref="SW?"  Part="1" 
F 0 "SW1" H 3200 2000 50  0000 L CNN
F 1 "Reset" H 3150 1900 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 3250 1850 50  0001 C CNN
F 3 "~" H 3250 1850 50  0001 C CNN
	1    3250 1650
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5E0603AE
P 3800 1750
AR Path="/5CDEEC9F/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5E0603AE" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 3800 1500 50  0001 C CNN
F 1 "GNDD" H 3804 1595 50  0000 C CNN
F 2 "" H 3800 1750 50  0001 C CNN
F 3 "" H 3800 1750 50  0001 C CNN
	1    3800 1750
	1    0    0    -1  
$EndComp
Text GLabel 1300 2150 0    50   Output ~ 0
alu
Wire Bus Line
	1100 7200 4300 7200
Wire Wire Line
	2400 6050 2600 6050
Connection ~ 2400 6050
Wire Wire Line
	2400 6050 2400 6900
Wire Wire Line
	2300 6050 2400 6050
Wire Wire Line
	2300 5950 2600 5950
Wire Wire Line
	2300 5850 2600 5850
Wire Wire Line
	2300 5750 2600 5750
Wire Wire Line
	2300 5650 2600 5650
Wire Wire Line
	2300 5550 2600 5550
Wire Wire Line
	2300 5450 2600 5450
Wire Wire Line
	2300 5350 2600 5350
Wire Wire Line
	2800 5850 3100 5850
Wire Wire Line
	2800 5950 3100 5950
Wire Wire Line
	2800 6050 3100 6050
Wire Wire Line
	2800 5750 3100 5750
Wire Wire Line
	2800 5650 3100 5650
Wire Wire Line
	2800 5550 3100 5550
Wire Wire Line
	2800 5450 3100 5450
Wire Wire Line
	2800 5350 3100 5350
Wire Wire Line
	2300 3550 2600 3550
Wire Wire Line
	2300 3650 2600 3650
Wire Wire Line
	2300 3750 2600 3750
Wire Wire Line
	2300 4050 2600 4050
Wire Wire Line
	2300 2350 2600 2350
Wire Wire Line
	2300 2250 2600 2250
Wire Wire Line
	2300 2150 2600 2150
Wire Wire Line
	2300 2050 2600 2050
$Comp
L power:VCC #PWR?
U 1 1 5DFC5D92
P 2250 1200
AR Path="/5CDEEC9F/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DFC5D92" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 2250 1050 50  0001 C CNN
F 1 "VCC" H 2267 1373 50  0000 C CNN
F 2 "" H 2250 1200 50  0001 C CNN
F 3 "" H 2250 1200 50  0001 C CNN
	1    2250 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DDC373A
P 2700 1450
AR Path="/62D13D9D/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D9AFF37/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DA1E9C0/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DDC373A" Ref="R1"  Part="1" 
F 0 "R1" H 2850 1500 50  0000 C CNN
F 1 "1k" H 2850 1400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2740 1440 50  0001 C CNN
F 3 "~" H 2700 1450 50  0001 C CNN
	1    2700 1450
	1    0    0    -1  
$EndComp
NoConn ~ 1300 1750
Wire Wire Line
	1300 6250 1100 6250
Wire Wire Line
	1100 6250 1100 7050
Entry Bus Bus
	4300 7200 4400 7100
Entry Bus Bus
	1000 7100 1100 7200
Text GLabel 2300 4250 2    50   Input ~ 0
qclk1
Text GLabel 2300 4150 2    50   Input ~ 0
~store
Entry Wire Line
	2600 4050 2700 4150
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 1800 5850
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U10"  Part="1" 
F 0 "U10" H 1800 5650 50  0000 C CNN
F 1 "74F574" H 1800 5550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1800 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1800 5850 50  0001 C CNN
	1    1800 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 1800 6650
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1800 6400 50  0001 C CNN
F 1 "GNDD" H 1804 6495 50  0000 C CNN
F 2 "" H 1800 6650 50  0001 C CNN
F 3 "" H 1800 6650 50  0001 C CNN
	1    1800 6650
	1    0    0    -1  
$EndComp
Entry Wire Line
	2800 2050 2700 2150
Text Label 2800 2050 0    50   ~ 0
I10
Text GLabel 1300 1650 0    50   Output ~ 0
PA16
Text GLabel 1300 2250 0    50   Output ~ 0
pcent
Entry Wire Line
	2800 2250 2700 2350
Text Label 2800 2250 0    50   ~ 0
I3
Text Label 2500 2050 0    50   ~ 0
I4
Entry Wire Line
	2600 2050 2700 2150
Text GLabel 3000 1950 2    50   Input ~ 0
DD[0..7]
Wire Wire Line
	4200 6350 4100 6350
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 1800 2750
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 1800 2500 50  0001 C CNN
F 1 "GNDD" H 1804 2595 50  0000 C CNN
F 2 "" H 1800 2750 50  0001 C CNN
F 3 "" H 1800 2750 50  0001 C CNN
	1    1800 2750
	1    0    0    -1  
$EndComp
Text GLabel 2300 1550 2    50   Input ~ 0
sclk
Text GLabel 2300 2450 2    50   Input ~ 0
0
Text GLabel 2300 1750 2    50   Input ~ 0
pclk1
Text GLabel 2300 1850 2    50   Input ~ 0
hblank
Entry Wire Line
	2600 3650 2700 3750
Entry Wire Line
	2600 3750 2700 3850
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 1800 2050
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U12"  Part="1" 
F 0 "U12" H 1800 1900 50  0000 C CNN
F 1 "PAL16R4" H 1800 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1800 2050 50  0001 C CNN
F 3 "" H 1800 2050 50  0001 C CNN
	1    1800 2050
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 1800 4550
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 1800 4300 50  0001 C CNN
F 1 "GNDD" H 1804 4395 50  0000 C CNN
F 2 "" H 1800 4550 50  0001 C CNN
F 3 "" H 1800 4550 50  0001 C CNN
	1    1800 4550
	1    0    0    -1  
$EndComp
Text Label 2500 3550 0    50   ~ 0
I0
Text Label 2500 3650 0    50   ~ 0
I1
Text Label 2500 3750 0    50   ~ 0
I8
Text Label 2500 2250 0    50   ~ 0
I6
Text GLabel 2700 6350 3    50   Output ~ 0
I[0..15]
Entry Wire Line
	2600 3550 2700 3650
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 3600 5850
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U11"  Part="1" 
F 0 "U11" H 3600 5650 50  0000 C CNN
F 1 "74F574" H 3600 5550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3600 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3600 5850 50  0001 C CNN
	1    3600 5850
	-1   0    0    -1  
$EndComp
Text GLabel 1300 6350 0    50   Input ~ 0
0
Entry Wire Line
	2700 6150 2800 6050
Entry Wire Line
	2700 5450 2800 5350
Entry Wire Line
	2700 5550 2800 5450
Entry Wire Line
	2700 5650 2800 5550
Entry Wire Line
	2700 5750 2800 5650
Entry Wire Line
	2700 5850 2800 5750
Entry Wire Line
	2700 5950 2800 5850
Entry Wire Line
	2700 6050 2800 5950
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 3600 6650
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3600 6400 50  0001 C CNN
F 1 "GNDD" H 3604 6495 50  0000 C CNN
F 2 "" H 3600 6650 50  0001 C CNN
F 3 "" H 3600 6650 50  0001 C CNN
	1    3600 6650
	1    0    0    -1  
$EndComp
Entry Wire Line
	4400 5450 4300 5350
Entry Wire Line
	4400 5550 4300 5450
Entry Wire Line
	4400 5650 4300 5550
Entry Wire Line
	4400 6150 4300 6050
Text Label 2500 5350 0    50   ~ 0
I0
Text Label 2500 5450 0    50   ~ 0
I1
Text Label 2500 5550 0    50   ~ 0
I2
Text Label 2500 5650 0    50   ~ 0
I3
Text Label 2500 5750 0    50   ~ 0
I4
Text Label 2500 5850 0    50   ~ 0
I5
Text Label 2500 5950 0    50   ~ 0
I6
Text Label 2500 6050 0    50   ~ 0
I7
Text Label 4150 5350 0    50   ~ 0
PD0
Text Label 4150 5450 0    50   ~ 0
PD1
Text Label 4150 5550 0    50   ~ 0
PD2
Text Label 4150 5650 0    50   ~ 0
PD3
Text Label 4150 5750 0    50   ~ 0
PD4
Text Label 4150 5850 0    50   ~ 0
PD5
Text Label 4150 5950 0    50   ~ 0
PD6
Text Label 4150 6050 0    50   ~ 0
PD7
Text GLabel 1000 5050 1    50   Input ~ 0
PD[0..7]
Entry Wire Line
	4400 6050 4300 5950
Entry Wire Line
	4400 5950 4300 5850
Entry Wire Line
	4400 5850 4300 5750
Entry Wire Line
	4400 5750 4300 5650
Wire Wire Line
	4100 5350 4300 5350
Wire Wire Line
	4100 5450 4300 5450
Wire Wire Line
	4100 5550 4300 5550
Wire Wire Line
	4100 5650 4300 5650
Wire Wire Line
	4100 5750 4300 5750
Wire Wire Line
	4100 5850 4300 5850
Wire Wire Line
	4100 5950 4300 5950
Wire Wire Line
	4100 6050 4300 6050
Entry Wire Line
	2600 2350 2700 2450
Entry Wire Line
	2600 2250 2700 2350
Text Label 2500 2150 0    50   ~ 0
I5
Entry Wire Line
	2600 2150 2700 2250
Text GLabel 1300 1850 0    50   Output ~ 0
boot
Text GLabel 1300 1950 0    50   Output ~ 0
hsel
Text GLabel 1300 2050 0    50   Output ~ 0
fetch
Text GLabel 1300 1550 0    50   Output ~ 0
PA17
Wire Wire Line
	1100 6050 1300 6050
Wire Wire Line
	1100 5950 1300 5950
Wire Wire Line
	1100 5850 1300 5850
Wire Wire Line
	1100 5750 1300 5750
Wire Wire Line
	1100 5650 1300 5650
Wire Wire Line
	1100 5550 1300 5550
Wire Wire Line
	1100 5450 1300 5450
Wire Wire Line
	1100 5350 1300 5350
Entry Wire Line
	2700 5750 2600 5650
Entry Wire Line
	2700 5850 2600 5750
Entry Wire Line
	2700 5950 2600 5850
Entry Wire Line
	2700 6050 2600 5950
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 1800 5050
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1800 4900 50  0001 C CNN
F 1 "VCC" H 1817 5223 50  0000 C CNN
F 2 "" H 1800 5050 50  0001 C CNN
F 3 "" H 1800 5050 50  0001 C CNN
	1    1800 5050
	1    0    0    -1  
$EndComp
Text Label 1100 6050 0    50   ~ 0
PD7
Text Label 1100 5950 0    50   ~ 0
PD6
Text Label 1100 5850 0    50   ~ 0
PD5
Text Label 1100 5750 0    50   ~ 0
PD4
Text Label 1100 5650 0    50   ~ 0
PD3
Text Label 1100 5550 0    50   ~ 0
PD2
Text Label 1100 5450 0    50   ~ 0
PD1
Text Label 1100 5350 0    50   ~ 0
PD0
Text Label 2800 6050 0    50   ~ 0
I15
Text Label 2800 5950 0    50   ~ 0
I14
Text Label 2800 5850 0    50   ~ 0
I13
Text Label 2800 5750 0    50   ~ 0
I12
Text Label 2800 5650 0    50   ~ 0
I11
Text Label 2800 5550 0    50   ~ 0
I10
Text Label 2800 5450 0    50   ~ 0
I9
Text Label 2800 5350 0    50   ~ 0
I8
Entry Wire Line
	2700 6150 2600 6050
Entry Wire Line
	2700 5650 2600 5550
Entry Wire Line
	2700 5550 2600 5450
Entry Wire Line
	2700 5450 2600 5350
Entry Wire Line
	1100 6050 1000 5950
Entry Wire Line
	1100 5950 1000 5850
Entry Wire Line
	1100 5850 1000 5750
Entry Wire Line
	1100 5750 1000 5650
Entry Wire Line
	1100 5650 1000 5550
Entry Wire Line
	1100 5550 1000 5450
Entry Wire Line
	1100 5450 1000 5350
Entry Wire Line
	1100 5350 1000 5250
Text Label 2500 4050 0    50   ~ 0
I9
Text Label 2800 1950 0    50   ~ 0
DD7
Text GLabel 1300 4250 0    50   Output ~ 0
~pgle
Text GLabel 1300 3750 0    50   Output ~ 0
~sle
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 1800 3250
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 1800 3100 50  0001 C CNN
F 1 "VCC" H 1817 3423 50  0000 C CNN
F 2 "" H 1800 3250 50  0001 C CNN
F 3 "" H 1800 3250 50  0001 C CNN
	1    1800 3250
	1    0    0    -1  
$EndComp
Text GLabel 1300 4050 0    50   Output ~ 0
~hlle
Text GLabel 1300 3950 0    50   Output ~ 0
~yle
Text GLabel 1300 3550 0    50   Output ~ 0
~xle
Text GLabel 1300 4150 0    50   Output ~ 0
~pcle
Text GLabel 1300 3650 0    50   Output ~ 0
~ele
Text GLabel 1300 3850 0    50   Output ~ 0
~vle
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 1800 3850
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U9"  Part="1" 
F 0 "U9" H 1800 3900 50  0000 C CNN
F 1 "74F138" H 1750 3800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1800 3850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 3850 50  0001 C CNN
	1    1800 3850
	-1   0    0    -1  
$EndComp
Text Label 2500 2350 0    50   ~ 0
I7
Text Label 2800 4050 0    50   ~ 0
I9
Entry Wire Line
	2800 4050 2700 4150
Wire Wire Line
	2800 4050 4400 4050
Entry Wire Line
	2700 5000 2800 4900
Entry Wire Line
	2700 4900 2800 4800
Entry Wire Line
	2700 4800 2800 4700
Entry Wire Line
	2700 4700 2800 4600
Entry Wire Line
	2700 4600 2800 4500
Entry Wire Line
	2700 4500 2800 4400
Entry Wire Line
	2700 4400 2800 4300
Entry Wire Line
	2700 5100 2800 5000
Text GLabel 4400 4250 0    50   Input ~ 0
~store
Text GLabel 5000 4150 2    50   Output ~ 0
~ole
Wire Wire Line
	1100 7050 4600 7050
Wire Wire Line
	2400 6900 4200 6900
Wire Wire Line
	2800 4600 3000 4600
Wire Wire Line
	2800 4500 3000 4500
Wire Wire Line
	2800 4400 3000 4400
Wire Wire Line
	2800 4300 3000 4300
Wire Wire Line
	2800 4700 3000 4700
Wire Wire Line
	2800 4800 3000 4800
Wire Wire Line
	2800 4900 3000 4900
Wire Wire Line
	2800 5000 3000 5000
Text Label 2800 5000 0    50   ~ 0
I8
Text Label 2800 4900 0    50   ~ 0
I9
Text Label 2800 4800 0    50   ~ 0
I10
Text Label 2800 4700 0    50   ~ 0
I11
Text Label 2800 4600 0    50   ~ 0
I12
Text Label 2800 4500 0    50   ~ 0
I13
Text Label 2800 4400 0    50   ~ 0
I14
Text Label 2800 4300 0    50   ~ 0
I15
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 3200 4600
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 3500 4800 50  0000 L CNN
F 1 "270" V 3400 4800 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3675 4600 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3200 4600 50  0001 C CNN
	1    3200 4600
	0    1    -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 3600 4950
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3600 4800 50  0001 C CNN
F 1 "VCC" H 3617 5123 50  0000 C CNN
F 2 "" H 3600 4950 50  0001 C CNN
F 3 "" H 3600 4950 50  0001 C CNN
	1    3600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5000 3600 5000
Wire Wire Line
	3600 5000 3600 5050
Wire Wire Line
	3600 5000 3600 4950
Connection ~ 3600 5000
Text GLabel 5900 5650 2    50   Input ~ 0
pclk1
Text GLabel 5900 6150 2    50   Input ~ 0
hsel
Text GLabel 5900 6350 2    50   Input ~ 0
qclk1
Text GLabel 5900 6050 2    50   Input ~ 0
fetch
Text GLabel 5900 5350 2    50   Input ~ 0
1
Text GLabel 5900 5450 2    50   Input ~ 0
~store
NoConn ~ 4900 5350
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 5400 6150
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U6"  Part="2" 
F 0 "U6" H 5400 6150 50  0000 C CNN
F 1 "74F139" H 5350 6050 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5400 6150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5400 6150 50  0001 C CNN
	2    5400 6150
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 5400 5450
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U6"  Part="1" 
F 0 "U6" H 5400 5450 50  0000 C CNN
F 1 "74F139" H 5350 5350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5400 5450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5400 5450 50  0001 C CNN
	1    5400 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4600 6350 4900 6350
NoConn ~ 4900 6150
NoConn ~ 4900 6050
NoConn ~ 4900 5450
Text GLabel 4900 5550 0    50   Output ~ 0
~write
Text GLabel 4900 5650 0    50   Output ~ 0
~read
Wire Wire Line
	4100 6250 4900 6250
Text GLabel 5500 2750 0    50   Input ~ 0
rclk
Text GLabel 5500 2550 0    50   Input ~ 0
alu
Text GLabel 5500 2450 0    50   Input ~ 0
boot
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 6000 2550
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U5"  Part="1" 
F 0 "U5" H 6000 2550 50  0000 C CNN
F 1 "74F139" H 5950 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6000 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6000 2550 50  0001 C CNN
	1    6000 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5EC20A8E
P 7450 2150
AR Path="/5DA1E9BD/5EC20A8E" Ref="U?"  Part="2" 
AR Path="/5EC20A8E" Ref="U4"  Part="2" 
F 0 "U4" H 7450 2150 50  0000 C CNN
F 1 "74F32" H 7450 2384 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7450 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7450 2150 50  0001 C CNN
	2    7450 2150
	1    0    0    -1  
$EndComp
$Sheet
S 5700 3250 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Text Notes 5750 3650 0    150  ~ 0
CPU
$Comp
L 74xx:74LS32 U?
U 1 1 5E0DFF1D
P 7450 1750
AR Path="/5CDEEC9F/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5E0DFF1D" Ref="U4"  Part="1" 
AR Path="/5DA1E9BD/5E0DFF1D" Ref="U?"  Part="1" 
F 0 "U4" H 7450 1750 50  0000 C CNN
F 1 "74F32" H 7450 2000 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7450 1750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7450 1750 50  0001 C CNN
	1    7450 1750
	1    0    0    1   
$EndComp
Text Notes 5750 4650 0    150  ~ 0
GPU
$Sheet
S 5700 4250 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Wire Wire Line
	7950 1750 7750 1750
Wire Wire Line
	7950 2250 7950 1750
Wire Wire Line
	7800 2150 7750 2150
Wire Wire Line
	7800 2350 7800 2150
$Comp
L 74xx:74LS86 U?
U 2 1 5DDAB655
P 7450 3250
AR Path="/5DA1E9BD/5DDAB655" Ref="U?"  Part="2" 
AR Path="/5DDAB655" Ref="U1"  Part="2" 
F 0 "U1" H 7450 3250 50  0000 C CNN
F 1 "74F86" H 7450 3484 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7450 3250 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7450 3250 50  0001 C CNN
	2    7450 3250
	1    0    0    -1  
$EndComp
Text GLabel 8250 2050 0    50   Input ~ 0
s1
Text GLabel 9250 2150 2    50   Output ~ 0
~store
Text GLabel 9250 2050 2    50   Output ~ 0
~cle
Text GLabel 7150 1650 0    50   Input ~ 0
hblank
Text GLabel 7150 1850 0    50   Input ~ 0
rclk
Text GLabel 9250 2250 2    50   Output ~ 0
~voe
Text GLabel 7150 2050 0    50   Input ~ 0
sclk
NoConn ~ 6500 2750
$Comp
L 74xx:74LS86 U1
U 1 1 5D9EA8C5
P 7450 2850
F 0 "U1" H 7450 2850 50  0000 C CNN
F 1 "74F86" H 7450 3084 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7450 2850 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7450 2850 50  0001 C CNN
	1    7450 2850
	1    0    0    -1  
$EndComp
Text GLabel 8250 2150 0    50   Input ~ 0
fetch
Text GLabel 9250 2550 2    50   Output ~ 0
~pgoe
Text GLabel 9250 2450 2    50   Output ~ 0
~alue
Text GLabel 9250 2350 2    50   Output ~ 0
~xoe
Text GLabel 9250 2650 2    50   Output ~ 0
~poe
$Sheet
S 5700 1350 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Text Notes 5800 1750 0    150  ~ 0
I/O
Wire Wire Line
	2700 1300 2700 1250
Wire Wire Line
	2700 1250 2250 1250
Wire Wire Line
	1800 1250 1800 1350
Wire Wire Line
	2250 1250 2250 1200
Connection ~ 2250 1250
Wire Wire Line
	2250 1250 1800 1250
Wire Wire Line
	3000 1950 2300 1950
$Comp
L 74xx:74LS574 U?
U 1 1 5EAB438A
P 8750 2550
AR Path="/5CDEEC9F/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5EAB438A" Ref="U8"  Part="1" 
F 0 "U8" H 8750 2350 50  0000 C CNN
F 1 "74F574" H 8750 2250 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8750 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8750 2550 50  0001 C CNN
	1    8750 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5EAB4390
P 8750 3350
AR Path="/5CDEEC9F/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4390" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8750 3100 50  0001 C CNN
F 1 "GNDD" H 8754 3195 50  0000 C CNN
F 2 "" H 8750 3350 50  0001 C CNN
F 3 "" H 8750 3350 50  0001 C CNN
	1    8750 3350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EAB4396
P 8750 1750
AR Path="/5CDEEC9F/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4396" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 8750 1600 50  0001 C CNN
F 1 "VCC" H 8767 1923 50  0000 C CNN
F 2 "" H 8750 1750 50  0001 C CNN
F 3 "" H 8750 1750 50  0001 C CNN
	1    8750 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2250 8250 2250
Wire Wire Line
	7800 2350 8250 2350
Connection ~ 7100 2450
Wire Wire Line
	7100 2450 8250 2450
Wire Wire Line
	7800 2650 8250 2650
Wire Wire Line
	7750 2850 7800 2850
Wire Wire Line
	7800 2650 7800 2850
Wire Wire Line
	7150 2950 6950 2950
Wire Wire Line
	7150 2750 7100 2750
Wire Wire Line
	7100 2450 7100 2750
Wire Wire Line
	7750 3250 7950 3250
Wire Wire Line
	7950 3250 7950 2750
Wire Wire Line
	7950 2750 8250 2750
Text GLabel 7150 3150 0    50   Input ~ 0
hblank
Text GLabel 7150 3350 0    50   Input ~ 0
mode2
Text GLabel 9250 2750 2    50   Output ~ 0
hsync
Text GLabel 8250 3050 0    50   Input ~ 0
0
Wire Wire Line
	9250 4900 9600 4900
Wire Wire Line
	9250 4800 9450 4800
Text GLabel 9600 4500 2    50   Output ~ 0
pclk2
Text GLabel 9600 4600 2    50   Output ~ 0
qclk2
Text GLabel 8250 5200 0    50   Input ~ 0
1
Wire Wire Line
	7100 3750 7100 4800
Wire Wire Line
	8250 5100 8100 5100
Wire Wire Line
	7750 4900 8250 4900
Wire Wire Line
	7150 5000 6950 5000
Wire Wire Line
	7150 4800 7100 4800
$Comp
L 74xx:74LS86 U1
U 3 1 5EB8600D
P 7450 4900
AR Path="/5EB8600D" Ref="U1"  Part="3" 
AR Path="/5DA1E9BD/5EB8600D" Ref="U?"  Part="3" 
F 0 "U1" H 7450 4900 50  0000 C CNN
F 1 "74F86" H 7450 5134 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7450 4900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7450 4900 50  0001 C CNN
	3    7450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4700 9600 4700
Wire Wire Line
	9250 4400 9600 4400
Wire Wire Line
	9250 4500 9300 4500
$Comp
L 74xx:74LS175 U7
U 1 1 5DF6E15C
P 8750 4700
F 0 "U7" H 8750 4700 50  0000 C CNN
F 1 "74F175" H 8700 4600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8750 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8750 4700 50  0001 C CNN
	1    8750 4700
	1    0    0    -1  
$EndComp
Text GLabel 9600 4700 2    50   Output ~ 0
rclk
Text GLabel 9600 4800 2    50   Output ~ 0
sclk
Text GLabel 9600 4900 2    50   Output ~ 0
mclk
Text GLabel 9600 4300 2    50   Output ~ 0
pclk1
Text GLabel 9600 4400 2    50   Output ~ 0
qclk1
$Comp
L power:VCC #PWR?
U 1 1 5DA5D9DA
P 8750 4000
AR Path="/5CDEEC9F/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DA5D9DA" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8750 3850 50  0001 C CNN
F 1 "VCC" H 8767 4173 50  0000 C CNN
F 2 "" H 8750 4000 50  0001 C CNN
F 3 "" H 8750 4000 50  0001 C CNN
	1    8750 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DEA197D
P 8750 5500
AR Path="/5CDEEC9F/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DEA197D" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 8750 5250 50  0001 C CNN
F 1 "GNDD" H 8754 5345 50  0000 C CNN
F 2 "" H 8750 5500 50  0001 C CNN
F 3 "" H 8750 5500 50  0001 C CNN
	1    8750 5500
	1    0    0    -1  
$EndComp
Text GLabel 9600 5750 2    50   Output ~ 0
dclk
Wire Wire Line
	7750 5750 8100 5750
NoConn ~ 7150 5750
$Comp
L power:VCC #PWR0191
U 1 1 5D9DED2A
P 7450 5450
AR Path="/5D9DED2A" Ref="#PWR0191"  Part="1" 
AR Path="/5DAA5CD8/5D9DED2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 7450 5300 50  0001 C CNN
F 1 "VCC" H 7467 5623 50  0000 C CNN
F 2 "" H 7450 5450 50  0001 C CNN
F 3 "" H 7450 5450 50  0001 C CNN
	1    7450 5450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D9CBE89
P 7450 6050
AR Path="/5CDEEC9F/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5D9CBE89" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7450 5800 50  0001 C CNN
F 1 "GNDD" H 7454 5895 50  0000 C CNN
F 2 "" H 7450 6050 50  0001 C CNN
F 3 "" H 7450 6050 50  0001 C CNN
	1    7450 6050
	1    0    0    -1  
$EndComp
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 5D9CA9D5
P 7450 5750
F 0 "X1" H 7700 6150 50  0000 L CNN
F 1 "ACH-28M322" H 7550 6050 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 7900 5400 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7350 5750 50  0001 C CNN
	1    7450 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3750 7800 3750
Connection ~ 7800 3750
Wire Wire Line
	7800 4700 7800 3750
Wire Wire Line
	8250 4700 7800 4700
Wire Wire Line
	7800 3750 9300 3750
Wire Wire Line
	6950 3600 7950 3600
Connection ~ 7950 3600
Wire Wire Line
	7950 3600 7950 4300
Connection ~ 7950 4300
Wire Wire Line
	7950 4300 7950 4500
Wire Wire Line
	7950 3600 9450 3600
Wire Wire Line
	8250 4300 7950 4300
Wire Wire Line
	7950 4500 8250 4500
Connection ~ 8100 5100
Wire Wire Line
	8100 2950 8100 5100
Wire Wire Line
	8250 2950 8100 2950
Wire Wire Line
	8100 5750 9600 5750
Connection ~ 8100 5750
Wire Wire Line
	8100 5100 8100 5750
Wire Wire Line
	6950 2950 6950 2650
Wire Wire Line
	6950 2650 6500 2650
Wire Wire Line
	6500 2550 8250 2550
Wire Wire Line
	6500 2450 7100 2450
Wire Wire Line
	6950 5000 6950 3600
Wire Wire Line
	2800 2250 7150 2250
Wire Wire Line
	9250 4600 9600 4600
Wire Wire Line
	9450 3600 9450 4800
Connection ~ 9450 4800
Wire Wire Line
	9450 4800 9600 4800
Wire Wire Line
	9250 5000 9600 5000
Text GLabel 9600 5000 2    50   Output ~ 0
nclk
Wire Wire Line
	9250 4300 9600 4300
Wire Wire Line
	9300 3750 9300 4500
Connection ~ 9300 4500
Wire Wire Line
	9300 4500 9600 4500
$Comp
L 74xx:74LS32 U?
U 4 1 5DEC0D55
P 4700 4550
AR Path="/5CDEEC9F/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5D9A6C5F/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DA1E9C0/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DEC0D55" Ref="U4"  Part="4" 
F 0 "U4" H 4700 4550 50  0000 C CNN
F 1 "74F32" H 4700 4784 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4700 4550 50  0001 C CNN
	4    4700 4550
	1    0    0    -1  
$EndComp
NoConn ~ 5000 4550
Text GLabel 4400 4450 0    50   Input ~ 0
1
Text GLabel 4400 4650 0    50   Input ~ 0
1
$Comp
L 74xx:74LS86 U1
U 4 1 5DEE629C
P 4700 4950
F 0 "U1" H 4700 4950 50  0000 C CNN
F 1 "74F86" H 4700 5184 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4700 4950 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4700 4950 50  0001 C CNN
	4    4700 4950
	1    0    0    -1  
$EndComp
Text GLabel 4400 4850 0    50   Input ~ 0
1
Text GLabel 4400 5050 0    50   Input ~ 0
1
NoConn ~ 5000 4950
Wire Bus Line
	4400 5450 4400 7100
Wire Bus Line
	1000 5050 1000 7100
Wire Bus Line
	2700 2150 2700 6350
$EndSCHEMATC
