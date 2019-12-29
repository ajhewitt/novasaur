EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "YATAC78 TTL Computer"
Date "2019-12-27"
Rev "1.2.1"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS32 U?
U 2 1 5DA1E72A
P 4750 2500
AR Path="/5CDEEC9F/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DA1E72A" Ref="U3"  Part="2" 
F 0 "U3" H 4750 2500 50  0000 C CNN
F 1 "74F32" H 4750 2300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 2500 50  0001 C CNN
	2    4750 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 3 1 5DA1E90F
P 4750 3700
AR Path="/5CDEEC9F/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DA1E90F" Ref="U3"  Part="3" 
F 0 "U3" H 4750 3700 50  0000 C CNN
F 1 "74F32" H 4750 3500 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 3700 50  0001 C CNN
	3    4750 3700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5DA1E854
P 4750 4100
AR Path="/5CDEEC9F/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DA1E854" Ref="U3"  Part="4" 
F 0 "U3" H 4750 4100 50  0000 C CNN
F 1 "74F32" H 4750 3900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 4100 50  0001 C CNN
	4    4750 4100
	1    0    0    -1  
$EndComp
Entry Wire Line
	2850 3000 2750 3100
Entry Wire Line
	2850 2900 2750 3000
Text Label 2850 3000 0    50   ~ 0
I4
Entry Wire Line
	2850 2400 2750 2500
Text Label 2850 2400 0    50   ~ 0
I2
Text Label 2850 3600 0    50   ~ 0
I5
Entry Wire Line
	2850 3600 2750 3700
Wire Wire Line
	4150 3200 4450 3200
Text GLabel 4150 2900 2    50   Output ~ 0
~inoe
Text GLabel 5050 3700 2    50   Output ~ 0
acp
Text GLabel 4450 3800 0    50   Input ~ 0
~alue
Wire Wire Line
	4400 3100 4400 3000
Wire Wire Line
	4150 3100 4400 3100
Wire Wire Line
	4400 3000 4450 3000
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 3650 3000
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U5"  Part="2" 
F 0 "U5" H 3650 3000 50  0000 C CNN
F 1 "74F139" H 3600 2900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3650 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3650 3000 50  0001 C CNN
	2    3650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2600 4450 2600
Wire Wire Line
	4300 2600 4400 2600
Text GLabel 5050 3300 2    50   Output ~ 0
~doe
Text GLabel 4150 3000 2    50   Output ~ 0
~eoe
Wire Wire Line
	4450 2800 4400 2800
Text GLabel 4300 2600 0    50   Input ~ 0
~write
Text GLabel 3150 3200 0    50   Input ~ 0
~read
Text GLabel 5050 2500 2    50   Output ~ 0
~dwe
Text GLabel 5050 2900 2    50   Output ~ 0
~aoe
Text GLabel 4450 3400 0    50   Input ~ 0
qclk2
Text Label 2850 2900 0    50   ~ 0
I11
Wire Wire Line
	2850 3600 4450 3600
Wire Wire Line
	2850 3000 3150 3000
Wire Wire Line
	2850 2900 3150 2900
Wire Wire Line
	2850 2400 4450 2400
Wire Wire Line
	4650 6300 4650 7000
Wire Wire Line
	4250 6300 4250 6850
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E7A5
P 4750 1900
AR Path="/5CDEEC9F/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DA1E7A5" Ref="U3"  Part="1" 
F 0 "U3" H 4750 1900 50  0000 C CNN
F 1 "74F32" H 4750 1700 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 1900 50  0001 C CNN
	1    4750 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2000 4450 2000
Text GLabel 5050 1900 2    50   Output ~ 0
DA16
Text GLabel 4450 1800 0    50   Input ~ 0
pclk1
$Comp
L YATAC-rescue:SW_Push-Switch SW1
U 1 1 5E0603B4
P 3400 1600
AR Path="/5E0603B4" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5E0603B4" Ref="SW?"  Part="1" 
F 0 "SW1" H 3350 1950 50  0000 L CNN
F 1 "RESET" H 3300 1850 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 3400 1800 50  0001 C CNN
F 3 "~" H 3400 1800 50  0001 C CNN
	1    3400 1600
	-1   0    0    -1  
$EndComp
Text GLabel 1350 2100 0    50   Output ~ 0
alu
Wire Bus Line
	1150 7150 4350 7150
Wire Wire Line
	2450 6000 2650 6000
Connection ~ 2450 6000
Wire Wire Line
	2450 6000 2450 6850
Wire Wire Line
	2350 6000 2450 6000
Wire Wire Line
	2350 5900 2650 5900
Wire Wire Line
	2350 5800 2650 5800
Wire Wire Line
	2350 5700 2650 5700
Wire Wire Line
	2350 5600 2650 5600
Wire Wire Line
	2350 5500 2650 5500
Wire Wire Line
	2350 5400 2650 5400
Wire Wire Line
	2350 5300 2650 5300
Wire Wire Line
	2850 5800 3150 5800
Wire Wire Line
	2850 5900 3150 5900
Wire Wire Line
	2850 6000 3150 6000
Wire Wire Line
	2850 5700 3150 5700
Wire Wire Line
	2850 5600 3150 5600
Wire Wire Line
	2850 5500 3150 5500
Wire Wire Line
	2850 5400 3150 5400
Wire Wire Line
	2850 5300 3150 5300
Wire Wire Line
	2350 3500 2650 3500
Wire Wire Line
	2350 3600 2650 3600
Wire Wire Line
	2350 3700 2650 3700
Wire Wire Line
	2350 4000 2650 4000
Wire Wire Line
	2350 2300 2650 2300
Wire Wire Line
	2350 2200 2650 2200
Wire Wire Line
	2350 2100 2650 2100
Wire Wire Line
	2350 2000 2650 2000
NoConn ~ 1350 1700
Wire Wire Line
	1350 6200 1150 6200
Wire Wire Line
	1150 6200 1150 7000
Entry Bus Bus
	4350 7150 4450 7050
Entry Bus Bus
	1050 7050 1150 7150
Text GLabel 2350 4200 2    50   Input ~ 0
qclk1
Text GLabel 2350 4100 2    50   Input ~ 0
~store
Entry Wire Line
	2650 4000 2750 4100
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 1850 5800
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U10"  Part="1" 
F 0 "U10" H 1850 5600 50  0000 C CNN
F 1 "74F574" H 1850 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1850 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1850 5800 50  0001 C CNN
	1    1850 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 1850 6600
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1850 6350 50  0001 C CNN
F 1 "GNDD" H 1854 6445 50  0000 C CNN
F 2 "" H 1850 6600 50  0001 C CNN
F 3 "" H 1850 6600 50  0001 C CNN
	1    1850 6600
	1    0    0    -1  
$EndComp
Entry Wire Line
	2850 2000 2750 2100
Text Label 2850 2000 0    50   ~ 0
I10
Text GLabel 1350 1600 0    50   Output ~ 0
PA16
Text GLabel 1350 2200 0    50   Output ~ 0
pcent
Entry Wire Line
	2850 2200 2750 2300
Text Label 2850 2200 0    50   ~ 0
I3
Text Label 2550 2000 0    50   ~ 0
I4
Entry Wire Line
	2650 2000 2750 2100
Text GLabel 3050 1900 2    50   Input ~ 0
DD[0..7]
Wire Wire Line
	4250 6300 4150 6300
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 1850 2700
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 1850 2450 50  0001 C CNN
F 1 "GNDD" H 1854 2545 50  0000 C CNN
F 2 "" H 1850 2700 50  0001 C CNN
F 3 "" H 1850 2700 50  0001 C CNN
	1    1850 2700
	1    0    0    -1  
$EndComp
Text GLabel 2350 1500 2    50   Input ~ 0
sclk
Text GLabel 2350 2400 2    50   Input ~ 0
0
Text GLabel 2350 1600 2    50   Input ~ 0
pclk1
Entry Wire Line
	2650 3600 2750 3700
Entry Wire Line
	2650 3700 2750 3800
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 1850 2000
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U12"  Part="1" 
F 0 "U12" H 1850 1850 50  0000 C CNN
F 1 "PAL16R4" H 1850 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1850 2000 50  0001 C CNN
F 3 "" H 1850 2000 50  0001 C CNN
	1    1850 2000
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 1850 4500
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 1850 4250 50  0001 C CNN
F 1 "GNDD" H 1854 4345 50  0000 C CNN
F 2 "" H 1850 4500 50  0001 C CNN
F 3 "" H 1850 4500 50  0001 C CNN
	1    1850 4500
	1    0    0    -1  
$EndComp
Text Label 2550 3500 0    50   ~ 0
I0
Text Label 2550 3600 0    50   ~ 0
I1
Text Label 2550 3700 0    50   ~ 0
I8
Text Label 2550 2200 0    50   ~ 0
I6
Text GLabel 2750 6300 3    50   Output ~ 0
I[0..15]
Entry Wire Line
	2650 3500 2750 3600
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 3650 5800
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U11"  Part="1" 
F 0 "U11" H 3650 5600 50  0000 C CNN
F 1 "74F574" H 3650 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3650 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3650 5800 50  0001 C CNN
	1    3650 5800
	-1   0    0    -1  
$EndComp
Text GLabel 1350 6300 0    50   Input ~ 0
0
Entry Wire Line
	2750 6100 2850 6000
Entry Wire Line
	2750 5400 2850 5300
Entry Wire Line
	2750 5500 2850 5400
Entry Wire Line
	2750 5600 2850 5500
Entry Wire Line
	2750 5700 2850 5600
Entry Wire Line
	2750 5800 2850 5700
Entry Wire Line
	2750 5900 2850 5800
Entry Wire Line
	2750 6000 2850 5900
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 3650 6600
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3650 6350 50  0001 C CNN
F 1 "GNDD" H 3654 6445 50  0000 C CNN
F 2 "" H 3650 6600 50  0001 C CNN
F 3 "" H 3650 6600 50  0001 C CNN
	1    3650 6600
	1    0    0    -1  
$EndComp
Entry Wire Line
	4450 5400 4350 5300
Entry Wire Line
	4450 5500 4350 5400
Entry Wire Line
	4450 5600 4350 5500
Entry Wire Line
	4450 6100 4350 6000
Text Label 2550 5300 0    50   ~ 0
I0
Text Label 2550 5400 0    50   ~ 0
I1
Text Label 2550 5500 0    50   ~ 0
I2
Text Label 2550 5600 0    50   ~ 0
I3
Text Label 2550 5700 0    50   ~ 0
I4
Text Label 2550 5800 0    50   ~ 0
I5
Text Label 2550 5900 0    50   ~ 0
I6
Text Label 2550 6000 0    50   ~ 0
I7
Text Label 4200 5300 0    50   ~ 0
PD0
Text Label 4200 5400 0    50   ~ 0
PD1
Text Label 4200 5500 0    50   ~ 0
PD2
Text Label 4200 5600 0    50   ~ 0
PD3
Text Label 4200 5700 0    50   ~ 0
PD4
Text Label 4200 5800 0    50   ~ 0
PD5
Text Label 4200 5900 0    50   ~ 0
PD6
Text Label 4200 6000 0    50   ~ 0
PD7
Text GLabel 1050 5000 1    50   Input ~ 0
PD[0..7]
Entry Wire Line
	4450 6000 4350 5900
Entry Wire Line
	4450 5900 4350 5800
Entry Wire Line
	4450 5800 4350 5700
Entry Wire Line
	4450 5700 4350 5600
Wire Wire Line
	4150 5300 4350 5300
Wire Wire Line
	4150 5400 4350 5400
Wire Wire Line
	4150 5500 4350 5500
Wire Wire Line
	4150 5600 4350 5600
Wire Wire Line
	4150 5700 4350 5700
Wire Wire Line
	4150 5800 4350 5800
Wire Wire Line
	4150 5900 4350 5900
Wire Wire Line
	4150 6000 4350 6000
Entry Wire Line
	2650 2300 2750 2400
Entry Wire Line
	2650 2200 2750 2300
Text Label 2550 2100 0    50   ~ 0
I5
Entry Wire Line
	2650 2100 2750 2200
Text GLabel 1350 1800 0    50   Output ~ 0
boot
Text GLabel 1350 1900 0    50   Output ~ 0
hsel
Text GLabel 1350 2000 0    50   Output ~ 0
fetch
Text GLabel 1350 1500 0    50   Output ~ 0
PA17
Wire Wire Line
	1150 6000 1350 6000
Wire Wire Line
	1150 5900 1350 5900
Wire Wire Line
	1150 5800 1350 5800
Wire Wire Line
	1150 5700 1350 5700
Wire Wire Line
	1150 5600 1350 5600
Wire Wire Line
	1150 5500 1350 5500
Wire Wire Line
	1150 5400 1350 5400
Wire Wire Line
	1150 5300 1350 5300
Entry Wire Line
	2750 5700 2650 5600
Entry Wire Line
	2750 5800 2650 5700
Entry Wire Line
	2750 5900 2650 5800
Entry Wire Line
	2750 6000 2650 5900
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 1850 5000
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1850 4850 50  0001 C CNN
F 1 "VCC" H 1867 5173 50  0000 C CNN
F 2 "" H 1850 5000 50  0001 C CNN
F 3 "" H 1850 5000 50  0001 C CNN
	1    1850 5000
	1    0    0    -1  
$EndComp
Text Label 1150 6000 0    50   ~ 0
PD7
Text Label 1150 5900 0    50   ~ 0
PD6
Text Label 1150 5800 0    50   ~ 0
PD5
Text Label 1150 5700 0    50   ~ 0
PD4
Text Label 1150 5600 0    50   ~ 0
PD3
Text Label 1150 5500 0    50   ~ 0
PD2
Text Label 1150 5400 0    50   ~ 0
PD1
Text Label 1150 5300 0    50   ~ 0
PD0
Text Label 2850 6000 0    50   ~ 0
I15
Text Label 2850 5900 0    50   ~ 0
I14
Text Label 2850 5800 0    50   ~ 0
I13
Text Label 2850 5700 0    50   ~ 0
I12
Text Label 2850 5600 0    50   ~ 0
I11
Text Label 2850 5500 0    50   ~ 0
I10
Text Label 2850 5400 0    50   ~ 0
I9
Text Label 2850 5300 0    50   ~ 0
I8
Entry Wire Line
	2750 6100 2650 6000
Entry Wire Line
	2750 5600 2650 5500
Entry Wire Line
	2750 5500 2650 5400
Entry Wire Line
	2750 5400 2650 5300
Entry Wire Line
	1150 6000 1050 5900
Entry Wire Line
	1150 5900 1050 5800
Entry Wire Line
	1150 5800 1050 5700
Entry Wire Line
	1150 5700 1050 5600
Entry Wire Line
	1150 5600 1050 5500
Entry Wire Line
	1150 5500 1050 5400
Entry Wire Line
	1150 5400 1050 5300
Entry Wire Line
	1150 5300 1050 5200
Text Label 2550 4000 0    50   ~ 0
I9
Text GLabel 1350 4200 0    50   Output ~ 0
pgcp
Text GLabel 1350 3700 0    50   Output ~ 0
scp
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 1850 3200
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 1850 3050 50  0001 C CNN
F 1 "VCC" H 1867 3373 50  0000 C CNN
F 2 "" H 1850 3200 50  0001 C CNN
F 3 "" H 1850 3200 50  0001 C CNN
	1    1850 3200
	1    0    0    -1  
$EndComp
Text GLabel 1350 4000 0    50   Output ~ 0
hlcp
Text GLabel 1350 3900 0    50   Output ~ 0
ycp
Text GLabel 1350 3500 0    50   Output ~ 0
xcp
Text GLabel 1350 4100 0    50   Output ~ 0
pccp
Text GLabel 1350 3600 0    50   Output ~ 0
ecp
Text GLabel 1350 3800 0    50   Output ~ 0
vcp
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 1850 3800
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U9"  Part="1" 
F 0 "U9" H 1850 3850 50  0000 C CNN
F 1 "74F138" H 1800 3750 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1850 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1850 3800 50  0001 C CNN
	1    1850 3800
	-1   0    0    -1  
$EndComp
Text Label 2550 2300 0    50   ~ 0
I7
Text Label 2850 4000 0    50   ~ 0
I9
Entry Wire Line
	2850 4000 2750 4100
Wire Wire Line
	2850 4000 4450 4000
Entry Wire Line
	2750 4950 2850 4850
Entry Wire Line
	2750 4850 2850 4750
Entry Wire Line
	2750 4750 2850 4650
Entry Wire Line
	2750 4650 2850 4550
Entry Wire Line
	2750 4550 2850 4450
Entry Wire Line
	2750 4450 2850 4350
Entry Wire Line
	2750 4350 2850 4250
Entry Wire Line
	2750 5050 2850 4950
Text GLabel 4450 4200 0    50   Input ~ 0
~store
Text GLabel 5050 4100 2    50   Output ~ 0
ocp
Wire Wire Line
	1150 7000 4650 7000
Wire Wire Line
	2450 6850 4250 6850
Wire Wire Line
	2850 4550 3050 4550
Wire Wire Line
	2850 4450 3050 4450
Wire Wire Line
	2850 4350 3050 4350
Wire Wire Line
	2850 4250 3050 4250
Wire Wire Line
	2850 4650 3050 4650
Wire Wire Line
	2850 4750 3050 4750
Wire Wire Line
	2850 4850 3050 4850
Wire Wire Line
	2850 4950 3050 4950
Text Label 2850 4950 0    50   ~ 0
I8
Text Label 2850 4850 0    50   ~ 0
I9
Text Label 2850 4750 0    50   ~ 0
I10
Text Label 2850 4650 0    50   ~ 0
I11
Text Label 2850 4550 0    50   ~ 0
I12
Text Label 2850 4450 0    50   ~ 0
I13
Text Label 2850 4350 0    50   ~ 0
I14
Text Label 2850 4250 0    50   ~ 0
I15
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 3250 4550
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 3550 4750 50  0000 L CNN
F 1 "1k" V 3450 4750 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3725 4550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3250 4550 50  0001 C CNN
	1    3250 4550
	0    1    -1   0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 3650 4900
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3650 4750 50  0001 C CNN
F 1 "VCC" H 3667 5073 50  0000 C CNN
F 2 "" H 3650 4900 50  0001 C CNN
F 3 "" H 3650 4900 50  0001 C CNN
	1    3650 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4950 3650 4950
Wire Wire Line
	3650 4950 3650 5000
Wire Wire Line
	3650 4950 3650 4900
Connection ~ 3650 4950
Text GLabel 5950 5600 2    50   Input ~ 0
pclk1
Text GLabel 5950 6100 2    50   Input ~ 0
hsel
Text GLabel 5950 6300 2    50   Input ~ 0
qclk1
Text GLabel 5950 6000 2    50   Input ~ 0
fetch
Text GLabel 5950 5300 2    50   Input ~ 0
1
Text GLabel 5950 5400 2    50   Input ~ 0
~store
NoConn ~ 4950 5300
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 5450 6100
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U6"  Part="2" 
F 0 "U6" H 5450 6100 50  0000 C CNN
F 1 "74F139" H 5400 6000 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5450 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5450 6100 50  0001 C CNN
	2    5450 6100
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 5450 5400
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U6"  Part="1" 
F 0 "U6" H 5450 5400 50  0000 C CNN
F 1 "74F139" H 5400 5300 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5450 5400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5450 5400 50  0001 C CNN
	1    5450 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4650 6300 4950 6300
NoConn ~ 4950 6100
NoConn ~ 4950 6000
NoConn ~ 4950 5400
Text GLabel 4950 5500 0    50   Output ~ 0
~write
Text GLabel 4950 5600 0    50   Output ~ 0
~read
Wire Wire Line
	4150 6200 4950 6200
Text GLabel 5550 2700 0    50   Input ~ 0
rclk
Text GLabel 5550 2500 0    50   Input ~ 0
alu
Text GLabel 5550 2400 0    50   Input ~ 0
boot
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 6050 2500
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U5"  Part="1" 
F 0 "U5" H 6050 2500 50  0000 C CNN
F 1 "74F139" H 6000 2400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6050 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6050 2500 50  0001 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5EC20A8E
P 7350 2100
AR Path="/5DA1E9BD/5EC20A8E" Ref="U?"  Part="2" 
AR Path="/5EC20A8E" Ref="U4"  Part="2" 
F 0 "U4" H 7350 2100 50  0000 C CNN
F 1 "74F32" H 7350 2334 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7350 2100 50  0001 C CNN
	2    7350 2100
	1    0    0    -1  
$EndComp
$Sheet
S 5750 3200 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Text Notes 5800 3600 0    150  ~ 0
CPU
$Comp
L 74xx:74LS32 U?
U 1 1 5E0DFF1D
P 7350 1700
AR Path="/5CDEEC9F/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5E0DFF1D" Ref="U4"  Part="1" 
AR Path="/5DA1E9BD/5E0DFF1D" Ref="U?"  Part="1" 
F 0 "U4" H 7350 1700 50  0000 C CNN
F 1 "74F32" H 7350 1950 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7350 1700 50  0001 C CNN
	1    7350 1700
	1    0    0    1   
$EndComp
Text Notes 5800 4600 0    150  ~ 0
GPU
$Sheet
S 5750 4200 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Text GLabel 8300 1900 0    50   Input ~ 0
s1
Text GLabel 9300 2000 2    50   Output ~ 0
~store
Text GLabel 9300 1900 2    50   Output ~ 0
ccp
Text GLabel 7050 1600 0    50   Input ~ 0
hblank
Text GLabel 7050 1800 0    50   Input ~ 0
rclk
Text GLabel 9300 2100 2    50   Output ~ 0
~voe
Text GLabel 7050 2000 0    50   Input ~ 0
sclk
NoConn ~ 6550 2700
$Comp
L 74xx:74LS86 U1
U 1 1 5D9EA8C5
P 7350 2800
F 0 "U1" H 7350 2800 50  0000 C CNN
F 1 "74F86" H 7350 3034 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 2800 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7350 2800 50  0001 C CNN
	1    7350 2800
	1    0    0    -1  
$EndComp
Text GLabel 8300 2000 0    50   Input ~ 0
fetch
Text GLabel 9300 2400 2    50   Output ~ 0
~pgoe
Text GLabel 9300 2500 2    50   Output ~ 0
~alue
Text GLabel 9300 2300 2    50   Output ~ 0
~xoe
Text GLabel 9300 2600 2    50   Output ~ 0
~poe
$Sheet
S 5750 1300 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Text Notes 5850 1700 0    150  ~ 0
I/O
$Comp
L 74xx:74LS574 U?
U 1 1 5EAB438A
P 8800 2400
AR Path="/5CDEEC9F/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5EAB438A" Ref="U8"  Part="1" 
F 0 "U8" H 8800 2200 50  0000 C CNN
F 1 "74F574" H 8800 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8800 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8800 2400 50  0001 C CNN
	1    8800 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5EAB4390
P 8800 3200
AR Path="/5CDEEC9F/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4390" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8800 2950 50  0001 C CNN
F 1 "GNDD" H 8804 3045 50  0000 C CNN
F 2 "" H 8800 3200 50  0001 C CNN
F 3 "" H 8800 3200 50  0001 C CNN
	1    8800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EAB4396
P 8800 1600
AR Path="/5CDEEC9F/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4396" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 8800 1450 50  0001 C CNN
F 1 "VCC" H 8817 1773 50  0000 C CNN
F 2 "" H 8800 1600 50  0001 C CNN
F 3 "" H 8800 1600 50  0001 C CNN
	1    8800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2700 7000 2700
Text GLabel 8300 2900 0    50   Input ~ 0
0
Wire Wire Line
	9300 4750 9500 4750
Text GLabel 9650 4450 2    50   Output ~ 0
pclk2
Text GLabel 9650 4550 2    50   Output ~ 0
qclk2
Text GLabel 8300 5150 0    50   Input ~ 0
1
$Comp
L 74xx:74LS86 U1
U 3 1 5EB8600D
P 7350 4850
AR Path="/5EB8600D" Ref="U1"  Part="3" 
AR Path="/5DA1E9BD/5EB8600D" Ref="U?"  Part="3" 
F 0 "U1" H 7350 4850 50  0000 C CNN
F 1 "74F86" H 7350 5084 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7350 4850 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7350 4850 50  0001 C CNN
	3    7350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4650 9650 4650
Wire Wire Line
	9300 4350 9650 4350
Wire Wire Line
	9300 4450 9350 4450
$Comp
L 74xx:74LS175 U7
U 1 1 5DF6E15C
P 8800 4650
F 0 "U7" H 8800 4650 50  0000 C CNN
F 1 "74F175" H 8750 4550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8800 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8800 4650 50  0001 C CNN
	1    8800 4650
	1    0    0    -1  
$EndComp
Text GLabel 9650 4650 2    50   Output ~ 0
rclk
Text GLabel 9650 4750 2    50   Output ~ 0
sclk
Text GLabel 9300 4850 2    50   Output ~ 0
mclk
Text GLabel 9650 4250 2    50   Output ~ 0
pclk1
Text GLabel 9650 4350 2    50   Output ~ 0
qclk1
$Comp
L power:VCC #PWR?
U 1 1 5DA5D9DA
P 8800 3950
AR Path="/5CDEEC9F/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DA5D9DA" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8800 3800 50  0001 C CNN
F 1 "VCC" H 8817 4123 50  0000 C CNN
F 2 "" H 8800 3950 50  0001 C CNN
F 3 "" H 8800 3950 50  0001 C CNN
	1    8800 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DEA197D
P 8800 5450
AR Path="/5CDEEC9F/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DEA197D" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 8800 5200 50  0001 C CNN
F 1 "GNDD" H 8804 5295 50  0000 C CNN
F 2 "" H 8800 5450 50  0001 C CNN
F 3 "" H 8800 5450 50  0001 C CNN
	1    8800 5450
	1    0    0    -1  
$EndComp
Text GLabel 8000 5700 2    50   Output ~ 0
dclk
$Comp
L power:VCC #PWR0191
U 1 1 5D9DED2A
P 7350 5300
AR Path="/5D9DED2A" Ref="#PWR0191"  Part="1" 
AR Path="/5DAA5CD8/5D9DED2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 7350 5150 50  0001 C CNN
F 1 "VCC" H 7367 5473 50  0000 C CNN
F 2 "" H 7350 5300 50  0001 C CNN
F 3 "" H 7350 5300 50  0001 C CNN
	1    7350 5300
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
L Oscillator:CXO_DIP8 X1
U 1 1 5D9CA9D5
P 7350 5700
F 0 "X1" H 7500 6100 50  0000 L CNN
F 1 "35M" H 7500 6000 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 7800 5350 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7250 5700 50  0001 C CNN
	1    7350 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4650 8000 4650
Wire Wire Line
	6550 2500 8300 2500
Wire Wire Line
	9300 4550 9650 4550
Connection ~ 9500 4750
Wire Wire Line
	9500 4750 9650 4750
Wire Wire Line
	9300 4250 9650 4250
Connection ~ 9350 4450
Wire Wire Line
	9350 4450 9650 4450
$Comp
L 74xx:74LS32 U?
U 4 1 5DEC0D55
P 4750 4500
AR Path="/5CDEEC9F/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5D9A6C5F/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DA1E9C0/5DEC0D55" Ref="U?"  Part="4" 
AR Path="/5DEC0D55" Ref="U4"  Part="4" 
F 0 "U4" H 4750 4500 50  0000 C CNN
F 1 "74F32" H 4750 4734 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 4500 50  0001 C CNN
	4    4750 4500
	1    0    0    -1  
$EndComp
NoConn ~ 5050 4500
Text GLabel 4450 4400 0    50   Input ~ 0
1
Text GLabel 4450 4600 0    50   Input ~ 0
1
$Comp
L 74xx:74LS86 U1
U 4 1 5DEE629C
P 4750 4900
F 0 "U1" H 4750 4900 50  0000 C CNN
F 1 "74F86" H 4750 5134 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 4900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4750 4900 50  0001 C CNN
	4    4750 4900
	1    0    0    -1  
$EndComp
Text GLabel 4450 4800 0    50   Input ~ 0
1
Text GLabel 4450 5000 0    50   Input ~ 0
1
NoConn ~ 5050 4900
Text GLabel 2350 1700 2    50   Input ~ 0
hblank
$Comp
L power:VCC #PWR?
U 1 1 5DE9082F
P 1850 1300
AR Path="/5CDEEC9F/5DE9082F" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DE9082F" Ref="#PWR?"  Part="1" 
AR Path="/5DE9082F" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1850 1150 50  0001 C CNN
F 1 "VCC" H 1867 1473 50  0000 C CNN
F 2 "" H 1850 1300 50  0001 C CNN
F 3 "" H 1850 1300 50  0001 C CNN
	1    1850 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DEF95A1
P 3950 1750
AR Path="/5CDEEC9F/5DEF95A1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEF95A1" Ref="#PWR?"  Part="1" 
AR Path="/5DEF95A1" Ref="#PWR0194"  Part="1" 
F 0 "#PWR0194" H 3950 1500 50  0001 C CNN
F 1 "GNDD" H 3954 1595 50  0000 C CNN
F 2 "" H 3950 1750 50  0001 C CNN
F 3 "" H 3950 1750 50  0001 C CNN
	1    3950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1650 3950 1750
Wire Wire Line
	3700 1700 3800 1700
Wire Wire Line
	3800 1700 3800 1650
Wire Wire Line
	3800 1600 3700 1600
Wire Wire Line
	3800 1650 3950 1650
Connection ~ 3800 1650
Wire Wire Line
	3800 1650 3800 1600
Text Label 2850 1900 0    50   ~ 0
DD7
Wire Wire Line
	3050 1900 2350 1900
Wire Wire Line
	2350 1800 2750 1800
Wire Wire Line
	7350 5400 7350 5350
Connection ~ 7350 5350
Wire Wire Line
	7350 5350 7350 5300
NoConn ~ 9300 4950
Text GLabel 7700 4950 3    50   Output ~ 0
nclk
$Comp
L 74xx:74LS08 U?
U 3 1 5DCA46DE
P 4750 2900
AR Path="/5CDEEC9F/5DCA46DE" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DCA46DE" Ref="U?"  Part="3" 
AR Path="/5DCA46DE" Ref="U2"  Part="3" 
AR Path="/5DA1E9BD/5DCA46DE" Ref="U?"  Part="3" 
F 0 "U2" H 4750 2900 50  0000 C CNN
F 1 "74F08" H 4750 2700 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4750 2900 50  0001 C CNN
	3    4750 2900
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U?
U 4 1 5DCA46E5
P 4750 3300
AR Path="/5DAA3954/5DCA46E5" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DCA46E5" Ref="U?"  Part="4" 
AR Path="/5DCA46E5" Ref="U2"  Part="4" 
AR Path="/5DA1E9BD/5DCA46E5" Ref="U?"  Part="4" 
F 0 "U2" H 4750 3300 50  0000 C CNN
F 1 "74F08" H 4750 3100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4750 3300 50  0001 C CNN
	4    4750 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5E523FD1
P 2750 1500
AR Path="/62D13D9D/5E523FD1" Ref="R?"  Part="1" 
AR Path="/5DAA19D5/5E523FD1" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5E523FD1" Ref="R?"  Part="1" 
AR Path="/5DA1E9BA/5E523FD1" Ref="R?"  Part="1" 
AR Path="/5E523FD1" Ref="R1"  Part="1" 
F 0 "R1" H 2850 1550 50  0000 L CNN
F 1 "1k" H 2850 1450 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2790 1490 50  0001 C CNN
F 3 "~" H 2750 1500 50  0001 C CNN
	1    2750 1500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5E54FDAD
P 2750 1300
AR Path="/5CDEEC9F/5E54FDAD" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E54FDAD" Ref="#PWR?"  Part="1" 
AR Path="/5E54FDAD" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 2750 1150 50  0001 C CNN
F 1 "VCC" H 2767 1473 50  0000 C CNN
F 2 "" H 2750 1300 50  0001 C CNN
F 3 "" H 2750 1300 50  0001 C CNN
	1    2750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 1800 2750 1700
Wire Wire Line
	2750 1700 3050 1700
Connection ~ 2750 1700
Wire Wire Line
	2750 1700 2750 1650
Wire Wire Line
	2750 1350 2750 1300
Wire Wire Line
	3050 1700 3050 1600
Wire Wire Line
	3050 1600 3100 1600
Wire Wire Line
	8300 4250 8150 4250
$Comp
L Connector:TestPoint_Alt TP1
U 1 1 5DEA480B
P 5550 2400
F 0 "TP1" H 5350 2500 50  0000 L CNN
F 1 "BOOT" H 5300 2550 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5750 2400 50  0001 C CNN
F 3 "~" H 5750 2400 50  0001 C CNN
	1    5550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3650 9350 4450
Wire Wire Line
	9500 3500 9500 4750
Wire Wire Line
	6550 2400 7000 2400
Wire Wire Line
	6850 2900 7050 2900
Wire Wire Line
	6850 2900 6850 2600
Wire Wire Line
	6850 2600 6550 2600
Wire Wire Line
	7000 2700 7000 2400
Connection ~ 7000 2400
Wire Wire Line
	7000 2400 8300 2400
Wire Wire Line
	7650 2800 7700 2800
Wire Wire Line
	7650 2100 7700 2100
Wire Wire Line
	7700 2800 7700 2600
Wire Wire Line
	7700 2600 8300 2600
Wire Wire Line
	7650 1700 7850 1700
Wire Wire Line
	9600 1300 8000 1300
Wire Wire Line
	9600 1300 9600 2200
Wire Wire Line
	7000 5350 7350 5350
Wire Wire Line
	7050 4750 7000 4750
Wire Wire Line
	7000 4750 7000 3650
Wire Wire Line
	6850 3500 6850 4950
Wire Wire Line
	6850 4950 7050 4950
Wire Wire Line
	7000 5350 7000 5700
Wire Wire Line
	7000 5700 7050 5700
Wire Wire Line
	7650 5700 7850 5700
Wire Wire Line
	8150 4450 8150 4250
Wire Wire Line
	8150 4450 8300 4450
Connection ~ 8150 4250
Wire Wire Line
	8150 4250 8150 3500
Connection ~ 8150 3500
Wire Wire Line
	8150 3500 9500 3500
Wire Wire Line
	6850 3500 8150 3500
Wire Wire Line
	8000 4650 8000 3650
Connection ~ 8000 3650
Wire Wire Line
	8000 3650 9350 3650
Wire Wire Line
	7000 3650 8000 3650
Wire Wire Line
	7650 4850 7700 4850
Wire Wire Line
	8300 2800 7850 2800
Wire Wire Line
	7850 2800 7850 5050
Connection ~ 7850 5050
Wire Wire Line
	7850 5050 7850 5700
Wire Wire Line
	7850 5050 8300 5050
Wire Wire Line
	7850 5700 8000 5700
Connection ~ 7850 5700
Connection ~ 7700 4850
Wire Wire Line
	7700 4850 8300 4850
Wire Wire Line
	7700 4950 7700 4850
Wire Wire Line
	8300 2100 7850 2100
Wire Wire Line
	7850 2100 7850 1700
Wire Wire Line
	8000 2300 8300 2300
Wire Wire Line
	8000 1300 8000 2300
Wire Wire Line
	8300 2200 7700 2200
Wire Wire Line
	7700 2200 7700 2100
Wire Wire Line
	9300 2200 9600 2200
$Comp
L Connector:TestPoint_Alt TP5
U 1 1 5E4C1851
P 3150 3200
AR Path="/5E4C1851" Ref="TP5"  Part="1" 
AR Path="/5DA1E9BA/5E4C1851" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4C1851" Ref="TP?"  Part="1" 
F 0 "TP5" H 2950 3300 50  0000 L CNN
F 1 "~READ" H 2900 3350 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3350 3200 50  0001 C CNN
F 3 "~" H 3350 3200 50  0001 C CNN
	1    3150 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP6
U 1 1 5E4C9C4C
P 4300 2600
AR Path="/5E4C9C4C" Ref="TP6"  Part="1" 
AR Path="/5DA1E9BA/5E4C9C4C" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4C9C4C" Ref="TP?"  Part="1" 
F 0 "TP6" H 4100 2700 50  0000 L CNN
F 1 "~WRITE" H 4050 2750 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4500 2600 50  0001 C CNN
F 3 "~" H 4500 2600 50  0001 C CNN
	1    4300 2600
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP7
U 1 1 5E4D1ADC
P 5050 2500
AR Path="/5E4D1ADC" Ref="TP7"  Part="1" 
AR Path="/5DA1E9BA/5E4D1ADC" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4D1ADC" Ref="TP?"  Part="1" 
F 0 "TP7" H 5100 2600 50  0000 L CNN
F 1 "~DWE" H 4800 2650 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5250 2500 50  0001 C CNN
F 3 "~" H 5250 2500 50  0001 C CNN
	1    5050 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP8
U 1 1 5E4E17B0
P 5050 3300
AR Path="/5E4E17B0" Ref="TP8"  Part="1" 
AR Path="/5DA1E9BA/5E4E17B0" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4E17B0" Ref="TP?"  Part="1" 
F 0 "TP8" H 5100 3400 50  0000 L CNN
F 1 "~DOE" H 4800 3450 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5250 3300 50  0001 C CNN
F 3 "~" H 5250 3300 50  0001 C CNN
	1    5050 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP9
U 1 1 5E4F93AC
P 4450 3800
AR Path="/5E4F93AC" Ref="TP9"  Part="1" 
AR Path="/5DA1E9BA/5E4F93AC" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4F93AC" Ref="TP?"  Part="1" 
F 0 "TP9" H 4250 3900 50  0000 L CNN
F 1 "~ALUE" H 4200 3950 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4650 3800 50  0001 C CNN
F 3 "~" H 4650 3800 50  0001 C CNN
	1    4450 3800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP10
U 1 1 5E501288
P 4450 4200
AR Path="/5E501288" Ref="TP10"  Part="1" 
AR Path="/5DA1E9BA/5E501288" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E501288" Ref="TP?"  Part="1" 
F 0 "TP10" H 4200 4300 50  0000 L CNN
F 1 "~STORE" H 4200 4350 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4650 4200 50  0001 C CNN
F 3 "~" H 4650 4200 50  0001 C CNN
	1    4450 4200
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP3
U 1 1 5E52109D
P 5950 6000
AR Path="/5E52109D" Ref="TP3"  Part="1" 
AR Path="/5DA1E9BA/5E52109D" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E52109D" Ref="TP?"  Part="1" 
F 0 "TP3" H 6000 6150 50  0000 L CNN
F 1 "FETCH" H 5700 6150 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6150 6000 50  0001 C CNN
F 3 "~" H 6150 6000 50  0001 C CNN
	1    5950 6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP4
U 1 1 5E5291C6
P 5950 6100
AR Path="/5E5291C6" Ref="TP4"  Part="1" 
AR Path="/5DA1E9BA/5E5291C6" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E5291C6" Ref="TP?"  Part="1" 
F 0 "TP4" H 5750 6200 50  0000 L CNN
F 1 "HSEL" H 5700 6250 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6150 6100 50  0001 C CNN
F 3 "~" H 6150 6100 50  0001 C CNN
	1    5950 6100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2850 2200 7050 2200
$Comp
L Connector:TestPoint_Alt TP11
U 1 1 5E63C233
P 7700 4850
AR Path="/5E63C233" Ref="TP11"  Part="1" 
AR Path="/5DA1E9BA/5E63C233" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E63C233" Ref="TP?"  Part="1" 
F 0 "TP11" H 7450 5000 50  0000 L CNN
F 1 "NCLK" H 7450 5000 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 7900 4850 50  0001 C CNN
F 3 "~" H 7900 4850 50  0001 C CNN
	1    7700 4850
	1    0    0    -1  
$EndComp
Connection ~ 4400 2600
Wire Wire Line
	4400 2600 4400 2800
$Comp
L Connector:TestPoint_Alt TP12
U 1 1 5E643BC8
P 7050 2000
AR Path="/5E643BC8" Ref="TP12"  Part="1" 
AR Path="/5DA1E9BA/5E643BC8" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E643BC8" Ref="TP?"  Part="1" 
F 0 "TP12" H 6800 2100 50  0000 L CNN
F 1 "SCLK" H 6800 2150 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 7250 2000 50  0001 C CNN
F 3 "~" H 7250 2000 50  0001 C CNN
	1    7050 2000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP2
U 1 1 5E14D83F
P 5550 2500
AR Path="/5E14D83F" Ref="TP2"  Part="1" 
AR Path="/5DA1E9BA/5E14D83F" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E14D83F" Ref="TP?"  Part="1" 
F 0 "TP2" H 5600 2600 50  0000 L CNN
F 1 "ALU" H 5300 2650 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5750 2500 50  0001 C CNN
F 3 "~" H 5750 2500 50  0001 C CNN
	1    5550 2500
	-1   0    0    1   
$EndComp
Wire Bus Line
	4450 5400 4450 7050
Wire Bus Line
	1050 5000 1050 7050
Wire Bus Line
	2750 2100 2750 6300
$EndSCHEMATC
