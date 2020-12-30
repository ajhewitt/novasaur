EESchema Schematic File Version 4
LIBS:novasaur-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 4
Title "Novasaur Retrocomputer"
Date "2020-12-30"
Rev "1.8"
Comp ""
Comment1 "(c) A J Hewitt 2020"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4650 6000 4650 6700
Wire Wire Line
	4250 6000 4250 6550
Text GLabel 1350 1800 0    50   Output ~ 0
alu
Wire Bus Line
	1150 6850 4350 6850
Wire Wire Line
	2450 5700 2650 5700
Connection ~ 2450 5700
Wire Wire Line
	2450 5700 2450 6550
Wire Wire Line
	2350 5700 2450 5700
Wire Wire Line
	2350 5600 2650 5600
Wire Wire Line
	2350 5500 2650 5500
Wire Wire Line
	2350 5400 2650 5400
Wire Wire Line
	2350 5300 2650 5300
Wire Wire Line
	2350 5200 2650 5200
Wire Wire Line
	2350 5100 2650 5100
Wire Wire Line
	2350 5000 2650 5000
Wire Wire Line
	2850 5500 3150 5500
Wire Wire Line
	2850 5600 3150 5600
Wire Wire Line
	2850 5700 3150 5700
Wire Wire Line
	2850 5400 3150 5400
Wire Wire Line
	2850 5300 3150 5300
Wire Wire Line
	2850 5200 3150 5200
Wire Wire Line
	2850 5100 3150 5100
Wire Wire Line
	2850 5000 3150 5000
Wire Wire Line
	2350 3200 2650 3200
Wire Wire Line
	2350 3300 2650 3300
Wire Wire Line
	2350 3400 2650 3400
Wire Wire Line
	2350 3700 2650 3700
Wire Wire Line
	2350 2000 2650 2000
Wire Wire Line
	2350 1900 2650 1900
Wire Wire Line
	2350 1800 2650 1800
Wire Wire Line
	2350 1700 2650 1700
NoConn ~ 1350 1400
Entry Bus Bus
	4350 6850 4450 6750
Entry Bus Bus
	1050 6750 1150 6850
Text GLabel 2350 3900 2    50   Input ~ 0
qclk1
Text GLabel 2350 3800 2    50   Input ~ 0
~exec
Entry Wire Line
	2650 3700 2750 3800
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 1850 5500
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U10"  Part="1" 
F 0 "U10" H 1850 5300 50  0000 C CNN
F 1 "74F574" H 1850 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1850 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1850 5500 50  0001 C CNN
	1    1850 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 1850 6300
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1850 6050 50  0001 C CNN
F 1 "GNDD" H 1854 6145 50  0000 C CNN
F 2 "" H 1850 6300 50  0001 C CNN
F 3 "" H 1850 6300 50  0001 C CNN
	1    1850 6300
	1    0    0    -1  
$EndComp
Text GLabel 1350 1300 0    50   Output ~ 0
PA16
Text GLabel 1350 1900 0    50   Output ~ 0
pcent
Text Label 2500 1700 0    50   ~ 0
C12
Entry Wire Line
	2650 1700 2750 1800
Wire Wire Line
	4250 6000 4150 6000
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 1850 2400
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 1850 2150 50  0001 C CNN
F 1 "GNDD" H 1854 2245 50  0000 C CNN
F 2 "" H 1850 2400 50  0001 C CNN
F 3 "" H 1850 2400 50  0001 C CNN
	1    1850 2400
	1    0    0    -1  
$EndComp
Text GLabel 2350 1200 2    50   Input ~ 0
sclk
Text GLabel 2350 2100 2    50   Input ~ 0
0
Text GLabel 2350 1300 2    50   Input ~ 0
pclk1
Entry Wire Line
	2650 3300 2750 3400
Entry Wire Line
	2650 3400 2750 3500
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 1850 1700
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U12"  Part="1" 
F 0 "U12" H 1850 1500 50  0000 C CNN
F 1 "PAL16R4" H 1850 1400 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 1850 1700 50  0001 C CNN
F 3 "" H 1850 1700 50  0001 C CNN
	1    1850 1700
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 1850 4200
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 1850 3950 50  0001 C CNN
F 1 "GNDD" H 1854 4045 50  0000 C CNN
F 2 "" H 1850 4200 50  0001 C CNN
F 3 "" H 1850 4200 50  0001 C CNN
	1    1850 4200
	1    0    0    -1  
$EndComp
Text Label 2550 3200 0    50   ~ 0
C8
Text Label 2550 3300 0    50   ~ 0
C9
Text Label 2550 3400 0    50   ~ 0
C0
Text Label 2500 1900 0    50   ~ 0
C14
Text GLabel 2750 6000 3    50   Output ~ 0
C[0..15]
Entry Wire Line
	2650 3200 2750 3300
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 3650 5500
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U11"  Part="1" 
F 0 "U11" H 3650 5300 50  0000 C CNN
F 1 "74F574" H 3650 5200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3650 5500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3650 5500 50  0001 C CNN
	1    3650 5500
	-1   0    0    -1  
$EndComp
Text GLabel 1350 6000 0    50   Input ~ 0
0
Entry Wire Line
	2750 5800 2850 5700
Entry Wire Line
	2750 5100 2850 5000
Entry Wire Line
	2750 5200 2850 5100
Entry Wire Line
	2750 5300 2850 5200
Entry Wire Line
	2750 5400 2850 5300
Entry Wire Line
	2750 5500 2850 5400
Entry Wire Line
	2750 5600 2850 5500
Entry Wire Line
	2750 5700 2850 5600
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 3650 6300
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3650 6050 50  0001 C CNN
F 1 "GNDD" H 3654 6145 50  0000 C CNN
F 2 "" H 3650 6300 50  0001 C CNN
F 3 "" H 3650 6300 50  0001 C CNN
	1    3650 6300
	1    0    0    -1  
$EndComp
Entry Wire Line
	4450 5100 4350 5000
Entry Wire Line
	4450 5200 4350 5100
Entry Wire Line
	4450 5300 4350 5200
Entry Wire Line
	4450 5800 4350 5700
Text Label 2550 5000 0    50   ~ 0
C8
Text Label 2550 5100 0    50   ~ 0
C9
Text Label 2500 5200 0    50   ~ 0
C10
Text Label 2500 5300 0    50   ~ 0
C11
Text Label 2500 5400 0    50   ~ 0
C12
Text Label 2500 5500 0    50   ~ 0
C13
Text Label 2500 5600 0    50   ~ 0
C14
Text Label 2500 5700 0    50   ~ 0
C15
Text Label 4200 5000 0    50   ~ 0
PD0
Text Label 4200 5100 0    50   ~ 0
PD1
Text Label 4200 5200 0    50   ~ 0
PD2
Text Label 4200 5300 0    50   ~ 0
PD3
Text Label 4200 5400 0    50   ~ 0
PD4
Text Label 4200 5500 0    50   ~ 0
PD5
Text Label 4200 5600 0    50   ~ 0
PD6
Text Label 4200 5700 0    50   ~ 0
PD7
Text GLabel 1050 4700 1    50   Input ~ 0
PD[0..7]
Entry Wire Line
	4450 5700 4350 5600
Entry Wire Line
	4450 5600 4350 5500
Entry Wire Line
	4450 5500 4350 5400
Entry Wire Line
	4450 5400 4350 5300
Wire Wire Line
	4150 5000 4350 5000
Wire Wire Line
	4150 5100 4350 5100
Wire Wire Line
	4150 5200 4350 5200
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
Entry Wire Line
	2650 2000 2750 2100
Entry Wire Line
	2650 1900 2750 2000
Text Label 2500 1800 0    50   ~ 0
C13
Entry Wire Line
	2650 1800 2750 1900
Text GLabel 1350 1500 0    50   Output ~ 0
boot
Text GLabel 1350 1600 0    50   Output ~ 0
hsel
Text GLabel 1350 1700 0    50   Output ~ 0
fetch
Text GLabel 1350 1200 0    50   Output ~ 0
PA17
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
Wire Wire Line
	1150 5200 1350 5200
Wire Wire Line
	1150 5100 1350 5100
Wire Wire Line
	1150 5000 1350 5000
Entry Wire Line
	2750 5400 2650 5300
Entry Wire Line
	2750 5500 2650 5400
Entry Wire Line
	2750 5600 2650 5500
Entry Wire Line
	2750 5700 2650 5600
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 1850 4700
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1850 4550 50  0001 C CNN
F 1 "VCC" H 1867 4873 50  0000 C CNN
F 2 "" H 1850 4700 50  0001 C CNN
F 3 "" H 1850 4700 50  0001 C CNN
	1    1850 4700
	1    0    0    -1  
$EndComp
Text Label 1150 5700 0    50   ~ 0
PD7
Text Label 1150 5600 0    50   ~ 0
PD6
Text Label 1150 5500 0    50   ~ 0
PD5
Text Label 1150 5400 0    50   ~ 0
PD4
Text Label 1150 5300 0    50   ~ 0
PD3
Text Label 1150 5200 0    50   ~ 0
PD2
Text Label 1150 5100 0    50   ~ 0
PD1
Text Label 1150 5000 0    50   ~ 0
PD0
Text Label 2850 5700 0    50   ~ 0
C7
Text Label 2850 5600 0    50   ~ 0
C6
Text Label 2850 5500 0    50   ~ 0
C5
Text Label 2850 5400 0    50   ~ 0
C4
Text Label 2850 5300 0    50   ~ 0
C3
Text Label 2850 5200 0    50   ~ 0
C2
Text Label 2850 5100 0    50   ~ 0
C1
Text Label 2850 5000 0    50   ~ 0
C0
Entry Wire Line
	2750 5800 2650 5700
Entry Wire Line
	2750 5300 2650 5200
Entry Wire Line
	2750 5200 2650 5100
Entry Wire Line
	2750 5100 2650 5000
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
Entry Wire Line
	1150 5200 1050 5100
Entry Wire Line
	1150 5100 1050 5000
Entry Wire Line
	1150 5000 1050 4900
Text Label 2550 3700 0    50   ~ 0
C1
Text GLabel 1350 3900 0    50   Output ~ 0
pgcp
Text GLabel 1350 3400 0    50   Output ~ 0
scp
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 1850 2900
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 1850 2750 50  0001 C CNN
F 1 "VCC" H 1867 3073 50  0000 C CNN
F 2 "" H 1850 2900 50  0001 C CNN
F 3 "" H 1850 2900 50  0001 C CNN
	1    1850 2900
	1    0    0    -1  
$EndComp
Text GLabel 1350 3700 0    50   Output ~ 0
hlcp
Text GLabel 1350 3600 0    50   Output ~ 0
ycp
Text GLabel 1350 3200 0    50   Output ~ 0
xcp
Text GLabel 1350 3800 0    50   Output ~ 0
pccp
Text GLabel 1350 3300 0    50   Output ~ 0
ecp
Text GLabel 1350 3500 0    50   Output ~ 0
vcp
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 1850 3500
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U9"  Part="1" 
F 0 "U9" H 1850 3550 50  0000 C CNN
F 1 "74F138" H 1800 3450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1850 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1850 3500 50  0001 C CNN
	1    1850 3500
	-1   0    0    -1  
$EndComp
Text Label 2500 2000 0    50   ~ 0
C15
Entry Wire Line
	2750 4650 2850 4550
Entry Wire Line
	2750 4550 2850 4450
Entry Wire Line
	2750 4450 2850 4350
Entry Wire Line
	2750 4350 2850 4250
Entry Wire Line
	2750 4250 2850 4150
Entry Wire Line
	2750 4150 2850 4050
Entry Wire Line
	2750 4050 2850 3950
Entry Wire Line
	2750 4750 2850 4650
Wire Wire Line
	1150 6700 4650 6700
Wire Wire Line
	2450 6550 4250 6550
Wire Wire Line
	2850 4250 3050 4250
Wire Wire Line
	2850 4150 3050 4150
Wire Wire Line
	2850 4050 3050 4050
Wire Wire Line
	2850 3950 3050 3950
Wire Wire Line
	2850 4350 3050 4350
Wire Wire Line
	2850 4450 3050 4450
Wire Wire Line
	2850 4550 3050 4550
Wire Wire Line
	2850 4650 3050 4650
Text Label 2850 4650 0    50   ~ 0
C0
Text Label 2850 4550 0    50   ~ 0
C1
Text Label 2850 4450 0    50   ~ 0
C2
Text Label 2850 4350 0    50   ~ 0
C3
Text Label 2850 4250 0    50   ~ 0
C4
Text Label 2850 4150 0    50   ~ 0
C5
Text Label 2850 4050 0    50   ~ 0
C6
Text Label 2850 3950 0    50   ~ 0
C7
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 3650 4600
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3650 4450 50  0001 C CNN
F 1 "VCC" H 3667 4773 50  0000 C CNN
F 2 "" H 3650 4600 50  0001 C CNN
F 3 "" H 3650 4600 50  0001 C CNN
	1    3650 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4650 3650 4650
Wire Wire Line
	3650 4650 3650 4700
Wire Wire Line
	3650 4650 3650 4600
Connection ~ 3650 4650
Text GLabel 6600 5300 2    50   Input ~ 0
pclk1
Text GLabel 6600 5800 2    50   Input ~ 0
hsel
Text GLabel 6600 6000 2    50   Input ~ 0
qclk1
Text GLabel 6600 5700 2    50   Input ~ 0
fetch
Text GLabel 6600 5000 2    50   Input ~ 0
1
Text GLabel 6600 5100 2    50   Input ~ 0
~exec
NoConn ~ 5600 5000
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 6100 5800
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U4"  Part="2" 
F 0 "U4" H 6100 5800 50  0000 C CNN
F 1 "74F139" H 6050 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6100 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6100 5800 50  0001 C CNN
	2    6100 5800
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 6100 5100
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U4"  Part="1" 
F 0 "U4" H 6100 5100 50  0000 C CNN
F 1 "74F139" H 6050 5000 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6100 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6100 5100 50  0001 C CNN
	1    6100 5100
	-1   0    0    -1  
$EndComp
NoConn ~ 5600 5800
NoConn ~ 5600 5700
NoConn ~ 5600 5100
Text GLabel 5600 5200 0    50   Output ~ 0
~write
Text GLabel 5600 5300 0    50   Output ~ 0
~read
$Comp
L 74xx:74LS32 U?
U 1 1 5E0DFF1D
P 7200 2400
AR Path="/5CDEEC9F/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5E0DFF1D" Ref="U?"  Part="1" 
AR Path="/5E0DFF1D" Ref="U2"  Part="1" 
AR Path="/5DA1E9BD/5E0DFF1D" Ref="U?"  Part="1" 
F 0 "U2" H 7200 2400 50  0000 C CNN
F 1 "74F32" H 7200 2650 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7200 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7200 2400 50  0001 C CNN
	1    7200 2400
	1    0    0    1   
$EndComp
Text GLabel 8300 1700 0    50   Input ~ 0
s1
Text GLabel 9300 1800 2    50   Output ~ 0
~exec
Text GLabel 9300 1700 2    50   Output ~ 0
fcp
Text GLabel 6900 2300 0    50   Input ~ 0
hblank
Text GLabel 6900 2500 0    50   Input ~ 0
rclk
Text GLabel 9300 2400 2    50   Output ~ 0
~voe
Text GLabel 6900 2100 0    50   Input ~ 0
qclk1
Text GLabel 8300 1800 0    50   Input ~ 0
fetch
Text GLabel 9300 2000 2    50   Output ~ 0
~pgoe
Text GLabel 9300 2100 2    50   Output ~ 0
~alue
Text GLabel 9300 1900 2    50   Output ~ 0
~xoe
Text GLabel 9300 2200 2    50   Output ~ 0
~boe
$Comp
L 74xx:74LS574 U?
U 1 1 5EAB438A
P 8800 2200
AR Path="/5CDEEC9F/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5EAB438A" Ref="U?"  Part="1" 
AR Path="/5EAB438A" Ref="U8"  Part="1" 
F 0 "U8" H 8800 2000 50  0000 C CNN
F 1 "74F574" H 8800 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8800 2200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8800 2200 50  0001 C CNN
	1    8800 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5EAB4390
P 8800 3000
AR Path="/5CDEEC9F/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4390" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4390" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8800 2750 50  0001 C CNN
F 1 "GNDD" H 8804 2845 50  0000 C CNN
F 2 "" H 8800 3000 50  0001 C CNN
F 3 "" H 8800 3000 50  0001 C CNN
	1    8800 3000
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5EAB4396
P 8800 1400
AR Path="/5CDEEC9F/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAB4396" Ref="#PWR?"  Part="1" 
AR Path="/5EAB4396" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 8800 1250 50  0001 C CNN
F 1 "VCC" H 8817 1573 50  0000 C CNN
F 2 "" H 8800 1400 50  0001 C CNN
F 3 "" H 8800 1400 50  0001 C CNN
	1    8800 1400
	1    0    0    -1  
$EndComp
Text GLabel 8300 2700 0    50   Input ~ 0
0
Text GLabel 2350 1400 2    50   Input ~ 0
hblank
$Comp
L power:VCC #PWR?
U 1 1 5DE9082F
P 1850 1000
AR Path="/5CDEEC9F/5DE9082F" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DE9082F" Ref="#PWR?"  Part="1" 
AR Path="/5DE9082F" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 1850 850 50  0001 C CNN
F 1 "VCC" H 1867 1173 50  0000 C CNN
F 2 "" H 1850 1000 50  0001 C CNN
F 3 "" H 1850 1000 50  0001 C CNN
	1    1850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 1100 8000 1100
$Comp
L Connector:TestPoint_Alt TP3
U 1 1 5E52109D
P 6600 5700
AR Path="/5E52109D" Ref="TP3"  Part="1" 
AR Path="/5DA1E9BA/5E52109D" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E52109D" Ref="TP?"  Part="1" 
F 0 "TP3" H 6650 5800 50  0000 L CNN
F 1 "FETCH" H 6350 5850 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6800 5700 50  0001 C CNN
F 3 "~" H 6800 5700 50  0001 C CNN
	1    6600 5700
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP4
U 1 1 5E5291C6
P 6600 5800
AR Path="/5E5291C6" Ref="TP4"  Part="1" 
AR Path="/5DA1E9BA/5E5291C6" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E5291C6" Ref="TP?"  Part="1" 
F 0 "TP4" H 6400 5900 50  0000 L CNN
F 1 "HSEL" H 6350 5950 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6800 5800 50  0001 C CNN
F 3 "~" H 6800 5800 50  0001 C CNN
	1    6600 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint_Alt TP9
U 1 1 5E4F93AC
P 4450 2400
AR Path="/5E4F93AC" Ref="TP9"  Part="1" 
AR Path="/5DA1E9BA/5E4F93AC" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4F93AC" Ref="TP?"  Part="1" 
F 0 "TP9" H 4250 2500 50  0000 L CNN
F 1 "~ALUE" H 4200 2550 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4650 2400 50  0001 C CNN
F 3 "~" H 4650 2400 50  0001 C CNN
	1    4450 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP5
U 1 1 5E4C1851
P 3150 3400
AR Path="/5E4C1851" Ref="TP5"  Part="1" 
AR Path="/5DA1E9BA/5E4C1851" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4C1851" Ref="TP?"  Part="1" 
F 0 "TP5" H 2950 3500 50  0000 L CNN
F 1 "~READ" H 2900 3550 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 3350 3400 50  0001 C CNN
F 3 "~" H 3350 3400 50  0001 C CNN
	1    3150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3100 3150 3100
Wire Wire Line
	2850 3200 3150 3200
Text Label 2850 3100 0    50   ~ 0
C3
Text GLabel 3150 3400 0    50   Input ~ 0
~read
Text GLabel 4150 3200 2    50   Output ~ 0
~eoe
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 3650 3200
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U5"  Part="2" 
F 0 "U5" H 3650 3200 50  0000 C CNN
F 1 "74F139" H 3600 3100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3650 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3650 3200 50  0001 C CNN
	2    3650 3200
	1    0    0    -1  
$EndComp
Text GLabel 4450 2400 0    50   Input ~ 0
~alue
Text GLabel 5050 2300 2    50   Output ~ 0
acp
Text GLabel 4150 3100 2    50   Output ~ 0
~ioe
Entry Wire Line
	2850 2200 2750 2300
Text Label 2850 2200 0    50   ~ 0
C13
Text Label 2850 3200 0    50   ~ 0
C12
Entry Wire Line
	2850 3100 2750 3200
Entry Wire Line
	2850 3200 2750 3300
Text Notes 3750 7550 0    150  ~ 0
I/O
Text Notes 2500 7550 0    150  ~ 0
GPU
Text Notes 1300 7550 0    150  ~ 0
CPU
$Sheet
S 1250 7150 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "novasaur-cpu.sch" 50
$EndSheet
$Sheet
S 2450 7150 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "novasaur-gpu.sch" 50
$EndSheet
Text Label 2850 3700 0    50   ~ 0
C2
Entry Wire Line
	2850 3700 2750 3800
$Comp
L 74xx:74LS32 U?
U 2 1 5EC20A8E
P 7200 2000
AR Path="/5DA1E9BD/5EC20A8E" Ref="U?"  Part="2" 
AR Path="/5EC20A8E" Ref="U2"  Part="2" 
F 0 "U2" H 7200 2000 50  0000 C CNN
F 1 "74F32" H 7200 2234 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7200 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7200 2000 50  0001 C CNN
	2    7200 2000
	1    0    0    -1  
$EndComp
$Sheet
S 3650 7150 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "novasaur-io.sch" 50
$EndSheet
$Comp
L power:VCC #PWR?
U 1 1 5E57D7F8
P 6100 2500
AR Path="/5CDEEC9F/5E57D7F8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E57D7F8" Ref="#PWR?"  Part="1" 
AR Path="/5E57D7F8" Ref="#PWR0192"  Part="1" 
F 0 "#PWR0192" H 6100 2350 50  0001 C CNN
F 1 "VCC" H 6117 2673 50  0000 C CNN
F 2 "" H 6100 2500 50  0001 C CNN
F 3 "" H 6100 2500 50  0001 C CNN
	1    6100 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3000 4400 3000
Text GLabel 4300 2900 0    50   Input ~ 0
~write
$Comp
L Connector:TestPoint_Alt TP6
U 1 1 5E4C9C4C
P 4300 2900
AR Path="/5E4C9C4C" Ref="TP6"  Part="1" 
AR Path="/5DA1E9BA/5E4C9C4C" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4C9C4C" Ref="TP?"  Part="1" 
F 0 "TP6" H 4100 3000 50  0000 L CNN
F 1 "~WRITE" H 4050 3050 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4500 2900 50  0001 C CNN
F 3 "~" H 4500 2900 50  0001 C CNN
	1    4300 2900
	1    0    0    -1  
$EndComp
Text GLabel 5050 3100 2    50   Output ~ 0
~aoe
$Comp
L 74xx:74LS32 U?
U 3 1 5E6A8202
P 4750 2300
AR Path="/5CDEEC9F/5E6A8202" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5E6A8202" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5E6A8202" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5D9A6C5F/5E6A8202" Ref="U?"  Part="3" 
AR Path="/5DA1E9BD/5E6A8202" Ref="U?"  Part="3" 
AR Path="/5E6A8202" Ref="U2"  Part="3" 
F 0 "U2" H 4750 2300 50  0000 C CNN
F 1 "74F32" H 4750 2100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 2300 50  0001 C CNN
	3    4750 2300
	1    0    0    -1  
$EndComp
Text GLabel 5050 2700 2    50   Output ~ 0
~dwe
$Comp
L Connector:TestPoint_Alt TP7
U 1 1 5E4D1ADC
P 5050 2700
AR Path="/5E4D1ADC" Ref="TP7"  Part="1" 
AR Path="/5DA1E9BA/5E4D1ADC" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4D1ADC" Ref="TP?"  Part="1" 
F 0 "TP7" H 5100 2800 50  0000 L CNN
F 1 "~DWE" H 4800 2850 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5250 2700 50  0001 C CNN
F 3 "~" H 5250 2700 50  0001 C CNN
	1    5050 2700
	1    0    0    -1  
$EndComp
Entry Wire Line
	2850 2600 2750 2700
Text Label 2850 2600 0    50   ~ 0
C10
Wire Wire Line
	2850 2600 4450 2600
Entry Wire Line
	2850 1900 2750 2000
Text Label 2850 1900 0    50   ~ 0
C11
Wire Wire Line
	2850 2200 4450 2200
$Comp
L 74xx:74LS32 U?
U 4 1 5E7FC7FA
P 4750 2700
AR Path="/5CDEEC9F/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5D9A6C5F/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5DA1E9C0/5E7FC7FA" Ref="U?"  Part="4" 
AR Path="/5E7FC7FA" Ref="U2"  Part="4" 
F 0 "U2" H 4750 2700 50  0000 C CNN
F 1 "74F32" H 4750 2934 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4750 2700 50  0001 C CNN
	4    4750 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3400 4400 3400
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 3250 4250
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 3550 4450 50  0000 L CNN
F 1 "680" V 3450 4450 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3725 4250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3250 4250 50  0001 C CNN
	1    3250 4250
	0    1    -1   0   
$EndComp
$Comp
L Connector:TestPoint_Alt TP36
U 1 1 5E2B88BD
P 8000 5500
AR Path="/5E2B88BD" Ref="TP36"  Part="1" 
AR Path="/5DA1E9BA/5E2B88BD" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E2B88BD" Ref="TP?"  Part="1" 
AR Path="/5DA1E9C0/5E2B88BD" Ref="TP?"  Part="1" 
F 0 "TP36" H 8050 5650 50  0000 L CNN
F 1 "DCLK" H 7750 5650 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 8200 5500 50  0001 C CNN
F 3 "~" H 8200 5500 50  0001 C CNN
	1    8000 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5500 7200 5500
Wire Wire Line
	7150 5150 7500 5150
Wire Wire Line
	9500 3300 9500 4550
Wire Wire Line
	9350 3450 9350 4250
Wire Wire Line
	8300 4050 8250 4050
Text GLabel 7500 4650 0    50   Output ~ 0
nclk
NoConn ~ 9300 4750
Wire Wire Line
	7500 5150 7500 5100
Connection ~ 7500 5150
Wire Wire Line
	7500 5200 7500 5150
Wire Wire Line
	9350 4250 9650 4250
Connection ~ 9350 4250
Wire Wire Line
	9300 4050 9650 4050
Wire Wire Line
	9500 4550 9650 4550
Connection ~ 9500 4550
Wire Wire Line
	9300 4350 9650 4350
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 5D9CA9D5
P 7500 5500
F 0 "X1" H 7650 5900 50  0000 L CNN
F 1 "33M" H 7600 5800 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 7950 5150 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7400 5500 50  0001 C CNN
	1    7500 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D9CBE89
P 7500 5800
AR Path="/5CDEEC9F/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5D9CBE89" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7500 5550 50  0001 C CNN
F 1 "GNDD" H 7504 5645 50  0000 C CNN
F 2 "" H 7500 5800 50  0001 C CNN
F 3 "" H 7500 5800 50  0001 C CNN
	1    7500 5800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0191
U 1 1 5D9DED2A
P 7500 5100
AR Path="/5D9DED2A" Ref="#PWR0191"  Part="1" 
AR Path="/5DAA5CD8/5D9DED2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 7500 4950 50  0001 C CNN
F 1 "VCC" H 7517 5273 50  0000 C CNN
F 2 "" H 7500 5100 50  0001 C CNN
F 3 "" H 7500 5100 50  0001 C CNN
	1    7500 5100
	1    0    0    -1  
$EndComp
Text GLabel 8000 5500 2    50   Output ~ 0
dclk
$Comp
L power:GNDD #PWR?
U 1 1 5DEA197D
P 8800 5250
AR Path="/5CDEEC9F/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DEA197D" Ref="#PWR?"  Part="1" 
AR Path="/5DEA197D" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 8800 5000 50  0001 C CNN
F 1 "GNDD" H 8804 5095 50  0000 C CNN
F 2 "" H 8800 5250 50  0001 C CNN
F 3 "" H 8800 5250 50  0001 C CNN
	1    8800 5250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA5D9DA
P 8800 3750
AR Path="/5CDEEC9F/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA5D9DA" Ref="#PWR?"  Part="1" 
AR Path="/5DA5D9DA" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8800 3600 50  0001 C CNN
F 1 "VCC" H 8817 3923 50  0000 C CNN
F 2 "" H 8800 3750 50  0001 C CNN
F 3 "" H 8800 3750 50  0001 C CNN
	1    8800 3750
	1    0    0    -1  
$EndComp
Text GLabel 9650 4150 2    50   Output ~ 0
qclk1
Text GLabel 9650 4050 2    50   Output ~ 0
pclk1
Text GLabel 9650 4650 2    50   Output ~ 0
mclk
Text GLabel 9650 4550 2    50   Output ~ 0
sclk
Text GLabel 9650 4450 2    50   Output ~ 0
rclk
$Comp
L 74xx:74LS175 U7
U 1 1 5DF6E15C
P 8800 4450
F 0 "U7" H 8800 4450 50  0000 C CNN
F 1 "74F175" H 8750 4350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8800 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8800 4450 50  0001 C CNN
	1    8800 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4250 9350 4250
Wire Wire Line
	9300 4150 9650 4150
Wire Wire Line
	9300 4450 9650 4450
Text GLabel 8300 4950 0    50   Input ~ 0
1
Text GLabel 9650 4350 2    50   Output ~ 0
qclk2
Text GLabel 9650 4250 2    50   Output ~ 0
pclk2
Wire Wire Line
	9300 4550 9500 4550
Wire Wire Line
	5550 3700 5600 3700
Wire Wire Line
	5600 3800 5550 3800
$Comp
L power:GNDD #PWR?
U 1 1 5E58D7F4
P 6100 4400
AR Path="/5CDEEC9F/5E58D7F4" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E58D7F4" Ref="#PWR?"  Part="1" 
AR Path="/5E58D7F4" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 6100 4150 50  0001 C CNN
F 1 "GNDD" H 6104 4245 50  0000 C CNN
F 2 "" H 6100 4400 50  0001 C CNN
F 3 "" H 6100 4400 50  0001 C CNN
	1    6100 4400
	1    0    0    -1  
$EndComp
Text GLabel 6600 2800 2    50   Output ~ 0
DA16
$Comp
L 74xx:74LS157 U6
U 1 1 5E4B050A
P 6100 3400
F 0 "U6" H 6100 3600 50  0000 C CNN
F 1 "74F157" H 6100 3500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6100 3400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 6100 3400 50  0001 C CNN
	1    6100 3400
	1    0    0    -1  
$EndComp
Text GLabel 5600 4100 0    50   Input ~ 0
pclk1
$Comp
L Connector:TestPoint_Alt TP8
U 1 1 5E4E17B0
P 6600 3700
AR Path="/5E4E17B0" Ref="TP8"  Part="1" 
AR Path="/5DA1E9BA/5E4E17B0" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E4E17B0" Ref="TP?"  Part="1" 
F 0 "TP8" H 6650 3800 50  0000 L CNN
F 1 "~DOE" H 6350 3850 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6800 3700 50  0001 C CNN
F 3 "~" H 6800 3700 50  0001 C CNN
	1    6600 3700
	1    0    0    -1  
$EndComp
Text GLabel 6600 3700 2    50   Output ~ 0
~doe
Text GLabel 5600 3200 0    50   Input ~ 0
0
Text GLabel 5600 3500 0    50   Input ~ 0
0
Text GLabel 5600 2900 0    50   Input ~ 0
0
Wire Wire Line
	5550 3800 5550 3750
Connection ~ 5550 3750
Wire Wire Line
	5550 3750 5550 3700
Text GLabel 6600 3400 2    50   Output ~ 0
DA18
Text GLabel 5600 2800 0    50   Input ~ 0
DB0
Text GLabel 5600 3100 0    50   Input ~ 0
DB1
Text GLabel 5600 3400 0    50   Input ~ 0
DB2
Wire Wire Line
	7600 4650 7600 4250
$Comp
L Connector:TestPoint_Alt TP10
U 1 1 60ED566B
P 6600 5100
AR Path="/60ED566B" Ref="TP10"  Part="1" 
AR Path="/5DA1E9BA/60ED566B" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/60ED566B" Ref="TP?"  Part="1" 
F 0 "TP10" H 6350 5200 50  0000 L CNN
F 1 "~EXEC" H 6350 5250 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6800 5100 50  0001 C CNN
F 3 "~" H 6800 5100 50  0001 C CNN
	1    6600 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 4650 7500 4650
Connection ~ 7600 4650
Text GLabel 7000 3300 2    50   Output ~ 0
DA17
Wire Wire Line
	9600 2300 9300 2300
Wire Wire Line
	9600 1100 9600 2300
Wire Wire Line
	8000 1100 8000 1900
Wire Wire Line
	4400 3000 4400 2900
Wire Wire Line
	4400 2800 4450 2800
Wire Wire Line
	6600 1250 6850 1250
$Comp
L Connector:TestPoint_Alt TP2
U 1 1 5E14D83F
P 5600 1350
AR Path="/5E14D83F" Ref="TP2"  Part="1" 
AR Path="/5DA1E9BA/5E14D83F" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E14D83F" Ref="TP?"  Part="1" 
F 0 "TP2" H 5650 1450 50  0000 L CNN
F 1 "ALU" H 5350 1500 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5800 1350 50  0001 C CNN
F 3 "~" H 5800 1350 50  0001 C CNN
	1    5600 1350
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint_Alt TP1
U 1 1 5DEA480B
P 5600 1250
F 0 "TP1" H 5400 1350 50  0000 L CNN
F 1 "BOOT" H 5350 1400 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 5800 1250 50  0001 C CNN
F 3 "~" H 5800 1250 50  0001 C CNN
	1    5600 1250
	1    0    0    -1  
$EndComp
NoConn ~ 6600 1550
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 6100 1350
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U5"  Part="1" 
F 0 "U5" H 6100 1350 50  0000 C CNN
F 1 "74F139" H 6050 1250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6100 1350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6100 1350 50  0001 C CNN
	1    6100 1350
	1    0    0    -1  
$EndComp
Text GLabel 5600 1250 0    50   Input ~ 0
boot
Text GLabel 5600 1350 0    50   Input ~ 0
alu
Text GLabel 5600 1550 0    50   Input ~ 0
rclk
Wire Wire Line
	8300 1900 8000 1900
Wire Wire Line
	7900 2000 7900 1250
Wire Wire Line
	7500 2400 8300 2400
Wire Wire Line
	6700 1450 6700 1700
Wire Wire Line
	6700 1450 6600 1450
Connection ~ 6850 1250
Wire Wire Line
	6850 1250 7900 1250
Wire Wire Line
	6900 1700 6700 1700
Wire Wire Line
	6900 1500 6850 1500
Wire Wire Line
	6850 1500 6850 1250
Wire Wire Line
	7800 1350 7800 2100
Wire Wire Line
	7800 2100 8300 2100
Wire Wire Line
	6600 1350 7800 1350
Wire Wire Line
	7700 1600 7700 2200
Wire Wire Line
	7700 2200 8300 2200
Wire Wire Line
	7500 1600 7700 1600
Wire Wire Line
	7600 2000 7600 2300
Wire Wire Line
	7500 2000 7600 2000
Wire Wire Line
	7600 2300 8300 2300
Wire Wire Line
	8300 2000 7900 2000
Wire Wire Line
	8250 4250 8250 4050
Wire Wire Line
	8250 4250 8300 4250
Connection ~ 8250 4050
Wire Wire Line
	8250 4050 8250 3300
Wire Wire Line
	8250 3300 9500 3300
Wire Wire Line
	8100 4450 8100 3450
Connection ~ 8100 3450
Wire Wire Line
	8100 4450 8300 4450
Wire Wire Line
	8100 3450 9350 3450
Connection ~ 8250 3300
Wire Wire Line
	7900 4850 8300 4850
Wire Wire Line
	7500 3650 7500 3300
Wire Wire Line
	7500 3300 8250 3300
Wire Wire Line
	7700 3650 7700 3450
Wire Wire Line
	7700 3450 8100 3450
Wire Wire Line
	7900 2600 8300 2600
Wire Wire Line
	4400 3750 5550 3750
Wire Wire Line
	2850 1900 6900 1900
Wire Wire Line
	4650 6000 5600 6000
Wire Wire Line
	7800 5500 7900 5500
Connection ~ 7900 5500
Wire Wire Line
	7900 5500 8000 5500
Wire Wire Line
	4450 3200 4400 3200
Wire Wire Line
	4400 3200 4400 3300
Wire Wire Line
	4400 3300 4150 3300
Wire Wire Line
	4300 2900 4400 2900
Connection ~ 4400 2900
Wire Wire Line
	4400 2900 4400 2800
Wire Wire Line
	7150 5150 7150 5500
Wire Wire Line
	7900 4850 7900 5500
Wire Wire Line
	7600 4650 8300 4650
Wire Wire Line
	7900 4850 7900 2600
Connection ~ 7900 4850
Wire Wire Line
	4400 3750 4400 3400
Wire Wire Line
	2850 3700 4200 3700
Wire Wire Line
	4200 3700 4200 4000
$Comp
L Connector:TestPoint_Alt TP29
U 1 1 5E51CAB2
P 1350 5900
AR Path="/5E51CAB2" Ref="TP29"  Part="1" 
AR Path="/5DA1E9BA/5E51CAB2" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E51CAB2" Ref="TP?"  Part="1" 
AR Path="/5DA1E9C0/5E51CAB2" Ref="TP?"  Part="1" 
F 0 "TP29" H 1100 6000 50  0000 L CNN
F 1 "CHCP" H 1100 6050 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 1550 5900 50  0001 C CNN
F 3 "~" H 1550 5900 50  0001 C CNN
	1    1350 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 6700 1150 5900
Wire Wire Line
	1150 5900 1350 5900
Connection ~ 1350 5900
Wire Wire Line
	5600 5900 4150 5900
Connection ~ 4150 5900
Text GLabel 2350 1500 2    50   Input ~ 0
~reset
$Comp
L Connector:TestPoint_Alt TP28
U 1 1 5E514E07
P 4150 5900
AR Path="/5E514E07" Ref="TP28"  Part="1" 
AR Path="/5DA1E9BA/5E514E07" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E514E07" Ref="TP?"  Part="1" 
AR Path="/5DA1E9C0/5E514E07" Ref="TP?"  Part="1" 
F 0 "TP28" H 4200 6000 50  0000 L CNN
F 1 "CLCP" H 3900 6050 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 4350 5900 50  0001 C CNN
F 3 "~" H 4350 5900 50  0001 C CNN
	1    4150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 3100 6700 3100
$Comp
L Jumper:SolderJumper_3_Bridged12 JP1
U 1 1 5EB86903
P 6900 3100
F 0 "JP1" H 6900 3305 50  0000 C CNN
F 1 "RAM" H 6900 3214 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm" H 6900 3100 50  0001 C CNN
F 3 "~" H 6900 3100 50  0001 C CNN
	1    6900 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3300 6900 3300
Wire Wire Line
	6900 3300 6900 3250
Wire Wire Line
	7100 3100 7200 3100
Wire Wire Line
	7200 3100 7200 3000
$Comp
L power:VCC #PWR?
U 1 1 5EAF98E7
P 7200 3000
AR Path="/5CDEEC9F/5EAF98E7" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5EAF98E7" Ref="#PWR?"  Part="1" 
AR Path="/5EAF98E7" Ref="#PWR0198"  Part="1" 
F 0 "#PWR0198" H 7200 2850 50  0001 C CNN
F 1 "VCC" H 7217 3173 50  0000 C CNN
F 2 "" H 7200 3000 50  0001 C CNN
F 3 "" H 7200 3000 50  0001 C CNN
	1    7200 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 4650 9500 4650
$Comp
L Connector:TestPoint_Alt TP37
U 1 1 5EB702DB
P 9500 4650
AR Path="/5EB702DB" Ref="TP37"  Part="1" 
AR Path="/5DA1E9BA/5EB702DB" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5EB702DB" Ref="TP?"  Part="1" 
AR Path="/5DA1E9C0/5EB702DB" Ref="TP?"  Part="1" 
F 0 "TP37" H 9250 4800 50  0000 L CNN
F 1 "MCLK" H 9250 4800 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 9700 4650 50  0001 C CNN
F 3 "~" H 9700 4650 50  0001 C CNN
	1    9500 4650
	-1   0    0    1   
$EndComp
Connection ~ 9500 4650
Wire Wire Line
	9500 4650 9650 4650
Wire Wire Line
	2350 1600 3050 1600
Text Label 2850 1600 0    50   ~ 0
DD7
Text GLabel 3050 1600 2    50   Input ~ 0
DD[0..7]
$Comp
L 74xx:74LS86 U?
U 2 1 5E78AC8B
P 7200 1600
AR Path="/5DA1E9BD/5E78AC8B" Ref="U?"  Part="2" 
AR Path="/5E78AC8B" Ref="U1"  Part="2" 
F 0 "U1" H 7200 1600 50  0000 C CNN
F 1 "74F86" H 7200 1834 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7200 1600 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7200 1600 50  0001 C CNN
	2    7200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4000 5600 4000
$Comp
L 74xx:74LS11 U?
U 2 1 5FA4FFFA
P 4750 3100
AR Path="/5DA1E9BD/5FA4FFFA" Ref="U?"  Part="2" 
AR Path="/5FA4FFFA" Ref="U3"  Part="2" 
F 0 "U3" H 4750 3100 50  0000 C CNN
F 1 "74F11" H 4750 3334 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4750 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS11" H 4750 3100 50  0001 C CNN
	2    4750 3100
	1    0    0    1   
$EndComp
Wire Wire Line
	4400 3200 4400 3100
Wire Wire Line
	4400 3100 4450 3100
Connection ~ 4400 3200
$Comp
L 74xx:74LS86 U1
U 4 1 5F86670E
P 7600 3950
AR Path="/5F86670E" Ref="U1"  Part="4" 
AR Path="/5DA1E9BD/5F86670E" Ref="U?"  Part="4" 
AR Path="/5DA1E9BA/5F86670E" Ref="U?"  Part="4" 
F 0 "U1" H 7600 3950 50  0000 C CNN
F 1 "74F86" H 7600 4184 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7600 3950 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7600 3950 50  0001 C CNN
	4    7600 3950
	0    -1   1    0   
$EndComp
Wire Bus Line
	4450 5100 4450 6750
Wire Bus Line
	1050 4700 1050 6750
Wire Bus Line
	2750 1800 2750 6000
$EndSCHEMATC
