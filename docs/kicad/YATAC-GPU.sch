EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "Graphics Processing Unit"
Date "2019-08-10"
Rev "1.0.2"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS163 U32
U 1 1 5E4B79C3
P 1800 6300
F 0 "U32" H 1800 6300 50  0000 C CNN
F 1 "74F163" H 1850 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1800 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 1800 6300 50  0001 C CNN
	1    1800 6300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U33
U 1 1 5E4BA4C4
P 3400 6300
F 0 "U33" H 3400 6100 50  0000 C CNN
F 1 "74F541" H 3400 6000 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3400 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3400 6300 50  0001 C CNN
	1    3400 6300
	1    0    0    -1  
$EndComp
Text Label 6300 5200 2    50   ~ 0
PD7
Text Label 6300 5100 2    50   ~ 0
PD6
Text Label 6300 5000 2    50   ~ 0
PD5
Text Label 6300 4900 2    50   ~ 0
PD4
Entry Wire Line
	2600 4100 2500 4000
Entry Wire Line
	2600 4000 2500 3900
Entry Wire Line
	2600 3900 2500 3800
Entry Wire Line
	2600 3800 2500 3700
Entry Wire Line
	2700 5800 2600 5700
Entry Wire Line
	2700 5900 2600 5800
Entry Wire Line
	2700 6000 2600 5900
Entry Wire Line
	2700 6100 2600 6000
Wire Wire Line
	2700 5800 2900 5800
Wire Wire Line
	2700 5900 2900 5900
Wire Wire Line
	2700 6000 2900 6000
Wire Wire Line
	2700 6100 2900 6100
Text Label 2700 5800 0    50   ~ 0
H0
Text Label 2700 5900 0    50   ~ 0
H1
Text Label 2700 6000 0    50   ~ 0
H2
Text Label 2700 6100 0    50   ~ 0
H3
Entry Wire Line
	2700 6200 2600 6100
Entry Wire Line
	2700 6300 2600 6200
Entry Wire Line
	2700 6400 2600 6300
Entry Wire Line
	2700 6500 2600 6400
Wire Wire Line
	2700 6200 2900 6200
Wire Wire Line
	2700 6300 2900 6300
Wire Wire Line
	2700 6400 2900 6400
Wire Wire Line
	2700 6500 2900 6500
Text Label 2700 6200 0    50   ~ 0
H4
Text Label 2700 6300 0    50   ~ 0
H5
Text Label 2700 6400 0    50   ~ 0
H6
Text Label 2700 6500 0    50   ~ 0
H7
$Comp
L power:VCC #PWR0106
U 1 1 5E4DC06C
P 1800 5500
F 0 "#PWR0106" H 1800 5350 50  0001 C CNN
F 1 "VCC" H 1817 5673 50  0000 C CNN
F 2 "" H 1800 5500 50  0001 C CNN
F 3 "" H 1800 5500 50  0001 C CNN
	1    1800 5500
	1    0    0    -1  
$EndComp
Text Label 2400 6100 0    50   ~ 0
H7
Text Label 2400 6000 0    50   ~ 0
H6
Text Label 2400 5900 0    50   ~ 0
H5
Text Label 2400 5800 0    50   ~ 0
H4
Wire Wire Line
	2300 5800 2500 5800
Wire Wire Line
	2300 5900 2500 5900
Wire Wire Line
	2300 6000 2500 6000
Wire Wire Line
	2300 6100 2500 6100
Entry Wire Line
	2600 6000 2500 6100
Entry Wire Line
	2600 5900 2500 6000
Entry Wire Line
	2600 5800 2500 5900
Entry Wire Line
	2600 5700 2500 5800
Text Label 3950 6100 0    50   ~ 0
DA3
Text Label 3950 6000 0    50   ~ 0
DA2
Text Label 3950 5900 0    50   ~ 0
DA1
Text Label 3950 5800 0    50   ~ 0
DA0
Wire Wire Line
	3900 5800 4100 5800
Wire Wire Line
	3900 5900 4100 5900
Wire Wire Line
	3900 6000 4100 6000
Wire Wire Line
	3900 6100 4100 6100
Entry Wire Line
	4100 6100 4200 6200
Entry Wire Line
	4100 6000 4200 6100
Entry Wire Line
	4100 5900 4200 6000
Entry Wire Line
	4100 5800 4200 5900
Text Label 3950 6500 0    50   ~ 0
DA7
Text Label 3950 6400 0    50   ~ 0
DA6
Text Label 3950 6300 0    50   ~ 0
DA5
Text Label 3950 6200 0    50   ~ 0
DA4
Wire Wire Line
	3900 6200 4100 6200
Wire Wire Line
	3900 6300 4100 6300
Wire Wire Line
	3900 6400 4100 6400
Wire Wire Line
	3900 6500 4100 6500
Entry Wire Line
	4100 6500 4200 6600
Entry Wire Line
	4100 6400 4200 6500
Entry Wire Line
	4100 6300 4200 6400
Entry Wire Line
	4100 6200 4200 6300
Text GLabel 4200 6700 3    50   Output ~ 0
DA[0..15]
$Comp
L power:VCC #PWR0107
U 1 1 5E4E6308
P 3400 5500
F 0 "#PWR0107" H 3400 5350 50  0001 C CNN
F 1 "VCC" H 3417 5673 50  0000 C CNN
F 2 "" H 3400 5500 50  0001 C CNN
F 3 "" H 3400 5500 50  0001 C CNN
	1    3400 5500
	1    0    0    -1  
$EndComp
Text Label 5100 4900 2    50   ~ 0
DA12
Text Label 5100 5000 2    50   ~ 0
DA13
Text Label 5100 5100 2    50   ~ 0
DA14
Text Label 5100 5200 2    50   ~ 0
DA15
Wire Wire Line
	5100 5200 4900 5200
Wire Wire Line
	5100 5100 4900 5100
Wire Wire Line
	5100 5000 4900 5000
Wire Wire Line
	5100 4900 4900 4900
Entry Wire Line
	4900 4800 4800 4900
Entry Wire Line
	4900 4900 4800 5000
Entry Wire Line
	4900 5000 4800 5100
Entry Wire Line
	4900 5100 4800 5200
Text Label 5050 4500 2    50   ~ 0
DA8
Text Label 5050 4600 2    50   ~ 0
DA9
Text Label 5100 4700 2    50   ~ 0
DA10
Text Label 5100 4800 2    50   ~ 0
DA11
Wire Wire Line
	5100 4800 4900 4800
Wire Wire Line
	5100 4700 4900 4700
Wire Wire Line
	5100 4600 4900 4600
Wire Wire Line
	5100 4500 4900 4500
Entry Wire Line
	4900 5200 4800 5300
Entry Wire Line
	4900 4500 4800 4600
Entry Wire Line
	4900 4600 4800 4700
Entry Wire Line
	4900 4700 4800 4800
$Comp
L power:VCC #PWR0111
U 1 1 5E4FB07B
P 5600 5800
F 0 "#PWR0111" H 5600 5650 50  0001 C CNN
F 1 "VCC" H 5617 5973 50  0000 C CNN
F 2 "" H 5600 5800 50  0001 C CNN
F 3 "" H 5600 5800 50  0001 C CNN
	1    5600 5800
	-1   0    0    1   
$EndComp
Text Label 6300 4800 2    50   ~ 0
PD3
Text Label 6300 4700 2    50   ~ 0
PD2
Text Label 6300 4600 2    50   ~ 0
PD1
Text Label 6300 4500 2    50   ~ 0
PD0
Text GLabel 3500 4100 2    50   Output ~ 0
~gsync
Text GLabel 3500 5100 2    50   Output ~ 0
hblank
$Comp
L power:GNDD #PWR0113
U 1 1 5E721518
P 1800 7100
F 0 "#PWR0113" H 1800 6850 50  0001 C CNN
F 1 "GNDD" H 1804 6945 50  0000 C CNN
F 2 "" H 1800 7100 50  0001 C CNN
F 3 "" H 1800 7100 50  0001 C CNN
	1    1800 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0114
U 1 1 5E722349
P 3400 7100
F 0 "#PWR0114" H 3400 6850 50  0001 C CNN
F 1 "GNDD" H 3404 6945 50  0000 C CNN
F 2 "" H 3400 7100 50  0001 C CNN
F 3 "" H 3400 7100 50  0001 C CNN
	1    3400 7100
	1    0    0    -1  
$EndComp
Text GLabel 1300 5900 0    50   Input ~ 0
1
Text GLabel 1300 5800 0    50   Input ~ 0
0
Text GLabel 1300 6000 0    50   Input ~ 0
0
Text GLabel 1300 6100 0    50   Input ~ 0
0
Text GLabel 1300 6400 0    50   Input ~ 0
1
Text GLabel 1300 6600 0    50   Input ~ 0
qclk2
Text GLabel 1300 6800 0    50   Input ~ 0
1
Text GLabel 2900 6700 0    50   Input ~ 0
hblank
Text GLabel 2900 6800 0    50   Input ~ 0
qclk2
$Comp
L power:GNDD #PWR0116
U 1 1 5E86644C
P 5600 4200
F 0 "#PWR0116" H 5600 3950 50  0001 C CNN
F 1 "GNDD" H 5604 4045 50  0000 C CNN
F 2 "" H 5600 4200 50  0001 C CNN
F 3 "" H 5600 4200 50  0001 C CNN
	1    5600 4200
	-1   0    0    1   
$EndComp
$Comp
L power:GNDD #PWR0126
U 1 1 5F1A79BE
P 8500 3250
F 0 "#PWR0126" H 8500 3000 50  0001 C CNN
F 1 "GNDD" H 8504 3095 50  0000 C CNN
F 2 "" H 8500 3250 50  0001 C CNN
F 3 "" H 8500 3250 50  0001 C CNN
	1    8500 3250
	1    0    0    -1  
$EndComp
Entry Wire Line
	7700 1650 7600 1750
Entry Wire Line
	7700 1750 7600 1850
Entry Wire Line
	7700 1850 7600 1950
Entry Wire Line
	7700 1950 7600 2050
Entry Wire Line
	7700 2050 7600 2150
Entry Wire Line
	7700 2150 7600 2250
Entry Wire Line
	7700 2250 7600 2350
Entry Wire Line
	7700 1550 7600 1650
Entry Wire Line
	7800 1650 7700 1550
Entry Wire Line
	7800 1750 7700 1650
Entry Wire Line
	7800 1950 7700 1850
Entry Wire Line
	7800 2050 7700 1950
Entry Wire Line
	7800 2250 7700 2150
Entry Wire Line
	7800 2350 7700 2250
Wire Wire Line
	7400 2350 7600 2350
Wire Wire Line
	7400 2250 7600 2250
Wire Wire Line
	7400 2150 7600 2150
Wire Wire Line
	7400 2050 7600 2050
Wire Wire Line
	7400 1950 7600 1950
Wire Wire Line
	7400 1850 7600 1850
Wire Wire Line
	7400 1750 7600 1750
Wire Wire Line
	7400 1650 7600 1650
Text Label 7500 1650 0    50   ~ 0
C0
Text Label 7500 1750 0    50   ~ 0
C1
Text Label 7500 1850 0    50   ~ 0
C2
Text Label 7500 1950 0    50   ~ 0
C3
Text Label 7500 2050 0    50   ~ 0
C4
Text Label 7500 2250 0    50   ~ 0
C6
Text Label 7500 2350 0    50   ~ 0
C7
Text Label 7800 1650 0    50   ~ 0
C0
Text Label 7800 1750 0    50   ~ 0
C4
Text Label 7800 1950 0    50   ~ 0
C1
Text Label 7800 2050 0    50   ~ 0
C5
Text Label 7800 2250 0    50   ~ 0
C2
Text Label 7800 2350 0    50   ~ 0
C6
Text Label 7500 2150 0    50   ~ 0
C5
Text GLabel 6400 2650 0    50   Input ~ 0
vblank
Wire Wire Line
	10250 5200 10050 5200
Text Label 10150 5200 2    50   ~ 0
G7
Wire Wire Line
	7800 1650 8000 1650
Wire Wire Line
	7800 1750 8000 1750
Wire Wire Line
	7800 1950 8000 1950
Wire Wire Line
	7800 2050 8000 2050
Wire Wire Line
	7800 2250 8000 2250
Wire Wire Line
	7800 2350 8000 2350
NoConn ~ 9000 2550
Entry Wire Line
	6200 1650 6100 1550
Entry Wire Line
	6200 1750 6100 1650
Entry Wire Line
	6200 1850 6100 1750
Entry Wire Line
	6200 1950 6100 1850
Text Label 6200 1650 0    50   ~ 0
PA0
Text Label 6200 1750 0    50   ~ 0
PA1
Text Label 6200 1850 0    50   ~ 0
PA2
Text Label 6200 1950 0    50   ~ 0
PA3
Wire Wire Line
	6200 1650 6400 1650
Wire Wire Line
	6200 1750 6400 1750
Wire Wire Line
	6200 1850 6400 1850
Wire Wire Line
	6200 1950 6400 1950
Entry Wire Line
	6200 2050 6100 1950
Entry Wire Line
	6200 2150 6100 2050
Entry Wire Line
	6200 2250 6100 2150
Entry Wire Line
	6200 2350 6100 2250
Text Label 6200 2050 0    50   ~ 0
PA4
Text Label 6200 2150 0    50   ~ 0
PA5
Text Label 6200 2250 0    50   ~ 0
PA6
Text Label 6200 2350 0    50   ~ 0
PA7
Wire Wire Line
	6200 2050 6400 2050
Wire Wire Line
	6200 2150 6400 2150
Wire Wire Line
	6200 2250 6400 2250
Wire Wire Line
	6200 2350 6400 2350
Text GLabel 6100 1450 1    50   Input ~ 0
PA[0..15]
$Comp
L power:GNDD #PWR0128
U 1 1 60936E83
P 6900 2950
F 0 "#PWR0128" H 6900 2700 50  0001 C CNN
F 1 "GNDD" H 6904 2795 50  0000 C CNN
F 2 "" H 6900 2950 50  0001 C CNN
F 3 "" H 6900 2950 50  0001 C CNN
	1    6900 2950
	1    0    0    -1  
$EndComp
Text GLabel 8000 2550 0    50   Input ~ 0
1
Text GLabel 8000 2650 0    50   Input ~ 0
1
$Comp
L power:VCC #PWR0129
U 1 1 621DDA78
P 6900 1350
F 0 "#PWR0129" H 6900 1200 50  0001 C CNN
F 1 "VCC" H 6917 1523 50  0000 C CNN
F 2 "" H 6900 1350 50  0001 C CNN
F 3 "" H 6900 1350 50  0001 C CNN
	1    6900 1350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0130
U 1 1 621DEBCC
P 8500 1350
F 0 "#PWR0130" H 8500 1200 50  0001 C CNN
F 1 "VCC" H 8517 1523 50  0000 C CNN
F 2 "" H 8500 1350 50  0001 C CNN
F 3 "" H 8500 1350 50  0001 C CNN
	1    8500 1350
	1    0    0    -1  
$EndComp
Entry Wire Line
	6300 4700 6400 4800
Entry Wire Line
	6300 4600 6400 4700
Entry Wire Line
	6300 4500 6400 4600
Entry Wire Line
	6300 4800 6400 4900
Entry Wire Line
	6300 5100 6400 5200
Entry Wire Line
	6300 5000 6400 5100
Entry Wire Line
	6300 4900 6400 5000
Entry Wire Line
	6300 5200 6400 5300
Text GLabel 9250 1850 0    50   Output ~ 0
vdac1g
Text GLabel 9250 1550 0    50   Output ~ 0
vdac1r
Text GLabel 9250 2150 0    50   Output ~ 0
vdac1b
$Comp
L Device:R_Pack03_SIP RN7
U 1 1 5CF64880
P 9450 1850
F 0 "RN7" V 8900 1800 50  0000 L CNN
F 1 "470" V 9000 1800 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP6" V 10025 1850 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9450 1850 50  0001 C CNN
	1    9450 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	9000 1650 9250 1650
Wire Wire Line
	9000 1950 9250 1950
Wire Wire Line
	9000 2250 9250 2250
$Comp
L 74xx:74LS157 U40
U 1 1 5CFB1097
P 8500 2250
F 0 "U40" H 8500 2150 50  0000 C CNN
F 1 "74F157" H 8500 2050 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8500 2250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8500 2250 50  0001 C CNN
	1    8500 2250
	1    0    0    -1  
$EndComp
Text GLabel 2900 3500 0    50   Input ~ 0
mode1
Text GLabel 4350 3700 0    50   Input ~ 0
nclk
Text GLabel 5050 3200 0    50   Input ~ 0
cclk
Text GLabel 3650 3400 0    50   Input ~ 0
qclk2
Text Label 6200 2550 0    50   ~ 0
~cle
Entry Wire Line
	2700 3700 2600 3800
Wire Wire Line
	2700 3700 2900 3700
Text Label 2700 3700 0    50   ~ 0
H0
Text Label 2700 3850 0    50   ~ 0
H1
Entry Wire Line
	2700 4000 2600 4100
Text Label 2700 4000 0    50   ~ 0
H4
Entry Wire Line
	2600 3950 2700 3850
$Comp
L 74xx:74LS574 U34
U 1 1 5D660036
P 5600 5000
F 0 "U34" H 5600 4800 50  0000 C CNN
F 1 "74F574" H 5600 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 5600 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5600 5000 50  0001 C CNN
	1    5600 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2700 3850 2900 3850
Wire Wire Line
	2900 4000 2700 4000
NoConn ~ 2300 6300
$Comp
L 74xx:74LS32 U?
U 3 1 5E880E74
P 3200 4100
AR Path="/5CDEEC9F/5E880E74" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5E880E74" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5E880E74" Ref="U6"  Part="3" 
F 0 "U6" H 3200 4100 50  0000 C CNN
F 1 "74F32" H 3200 3900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3200 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3200 4100 50  0001 C CNN
	3    3200 4100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5E880E7A
P 3200 4600
AR Path="/5CDEEC9F/5E880E7A" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5E880E7A" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5E880E7A" Ref="U6"  Part="4" 
F 0 "U6" H 3200 4600 50  0000 C CNN
F 1 "74F32" H 3200 4834 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3200 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3200 4600 50  0001 C CNN
	4    3200 4600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 3 1 5F2C1DFC
P 5350 3300
AR Path="/5DAA5CD8/5F2C1DFC" Ref="U?"  Part="3" 
AR Path="/5DAA19D5/5F2C1DFC" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5F2C1DFC" Ref="U1"  Part="3" 
F 0 "U1" H 5350 3300 50  0000 C CNN
F 1 "74F00" H 5300 3100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5350 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5350 3300 50  0001 C CNN
	3    5350 3300
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U3
U 2 1 5F534DD6
P 4650 3600
F 0 "U3" H 4650 3600 50  0000 C CNN
F 1 "74F08" H 4850 3400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4650 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4650 3600 50  0001 C CNN
	2    4650 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U3
U 1 1 5F5C337B
P 3950 3500
F 0 "U3" H 3950 3500 50  0000 C CNN
F 1 "74F08" H 4100 3300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3950 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3950 3500 50  0001 C CNN
	1    3950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 5D1C1190
P 4700 6200
F 0 "RN2" V 5250 6100 50  0000 L CNN
F 1 "270" V 5150 6100 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5175 6200 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4700 6200 50  0001 C CNN
	1    4700 6200
	0    1    1    0   
$EndComp
Entry Wire Line
	4200 5900 4300 5800
Entry Wire Line
	4200 6600 4300 6500
Entry Wire Line
	4200 6100 4300 6000
Entry Wire Line
	4200 6000 4300 5900
Entry Wire Line
	4200 6300 4300 6200
Entry Wire Line
	4200 6200 4300 6100
Entry Wire Line
	4200 6500 4300 6400
Entry Wire Line
	4200 6400 4300 6300
Entry Wire Line
	4700 5100 4800 5200
Entry Wire Line
	4700 5200 4800 5300
Entry Wire Line
	4700 4900 4800 5000
Entry Wire Line
	4700 5000 4800 5100
Entry Wire Line
	4700 4700 4800 4800
Entry Wire Line
	4700 4800 4800 4900
Entry Wire Line
	4700 4500 4800 4600
Entry Wire Line
	4700 4600 4800 4700
Wire Wire Line
	4300 5800 4500 5800
Wire Wire Line
	4300 5900 4500 5900
Wire Wire Line
	4300 6000 4500 6000
Wire Wire Line
	4300 6100 4500 6100
Wire Wire Line
	4300 6200 4500 6200
Wire Wire Line
	4300 6300 4500 6300
Wire Wire Line
	4300 6400 4500 6400
Wire Wire Line
	4300 6500 4500 6500
Text Label 4300 5800 0    50   ~ 0
DA0
Text Label 4300 5900 0    50   ~ 0
DA1
Text Label 4300 6000 0    50   ~ 0
DA2
Text Label 4300 6100 0    50   ~ 0
DA3
Text Label 4300 6200 0    50   ~ 0
DA4
Text Label 4300 6300 0    50   ~ 0
DA5
Text Label 4300 6400 0    50   ~ 0
DA6
Text Label 4300 6500 0    50   ~ 0
DA7
Text Label 4700 5100 2    50   ~ 0
DA14
Text Label 4700 5000 2    50   ~ 0
DA13
Text Label 4700 4900 2    50   ~ 0
DA12
Text Label 4700 4800 2    50   ~ 0
DA11
Text Label 4700 4700 2    50   ~ 0
DA10
Text Label 4700 4600 2    50   ~ 0
DA9
Text Label 4700 4500 2    50   ~ 0
DA8
$Comp
L power:VCC #PWR0112
U 1 1 5D1C11D4
P 5000 5700
F 0 "#PWR0112" H 5000 5550 50  0001 C CNN
F 1 "VCC" H 5017 5873 50  0000 C CNN
F 2 "" H 5000 5700 50  0001 C CNN
F 3 "" H 5000 5700 50  0001 C CNN
	1    5000 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5D26EEA2
P 5600 2050
AR Path="/5D26EEA2" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D26EEA2" Ref="RN5"  Part="1" 
F 0 "RN5" V 4950 1950 50  0000 L CNN
F 1 "270" V 5050 1950 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6075 2050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5600 2050 50  0001 C CNN
	1    5600 2050
	0    -1   1    0   
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D26EEC0
P 5200 1550
AR Path="/5D26EEC0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA3954/5D26EEC0" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 5200 1400 50  0001 C CNN
F 1 "VCC" H 5217 1723 50  0000 C CNN
F 2 "" H 5200 1550 50  0001 C CNN
F 3 "" H 5200 1550 50  0001 C CNN
	1    5200 1550
	1    0    0    -1  
$EndComp
Entry Wire Line
	6100 1550 6000 1650
Entry Wire Line
	6100 1650 6000 1750
Entry Wire Line
	6100 1750 6000 1850
Entry Wire Line
	6100 1850 6000 1950
Text Label 5850 1650 0    50   ~ 0
PA0
Text Label 5850 1750 0    50   ~ 0
PA1
Text Label 5850 1850 0    50   ~ 0
PA2
Text Label 5850 1950 0    50   ~ 0
PA3
Entry Wire Line
	6100 1950 6000 2050
Entry Wire Line
	6100 2050 6000 2150
Entry Wire Line
	6100 2150 6000 2250
Entry Wire Line
	6100 2250 6000 2350
Text Label 5850 2050 0    50   ~ 0
PA4
Text Label 5850 2150 0    50   ~ 0
PA5
Text Label 5850 2250 0    50   ~ 0
PA6
Text Label 5850 2350 0    50   ~ 0
PA7
Text GLabel 900  2550 0    50   Input ~ 0
~scle
Text Label 4500 2350 0    50   ~ 0
PA15
Text Label 4500 2250 0    50   ~ 0
PA14
Text Label 4500 2150 0    50   ~ 0
PA13
Text Label 4500 2050 0    50   ~ 0
PA12
Text Label 4500 1950 0    50   ~ 0
PA11
Text Label 4500 1850 0    50   ~ 0
PA10
Text Label 4500 1750 0    50   ~ 0
PA9
Text Label 4500 1650 0    50   ~ 0
PA8
Wire Wire Line
	4500 2350 4700 2350
Wire Wire Line
	4500 2250 4700 2250
Wire Wire Line
	4500 2150 4700 2150
Wire Wire Line
	4500 2050 4700 2050
Wire Wire Line
	4500 1950 4700 1950
Wire Wire Line
	4500 1850 4700 1850
Wire Wire Line
	4500 1750 4700 1750
Wire Wire Line
	4500 1650 4700 1650
Entry Wire Line
	4500 2250 4400 2150
Entry Wire Line
	4500 2350 4400 2250
Entry Wire Line
	4500 2050 4400 1950
Entry Wire Line
	4500 2150 4400 2050
Entry Wire Line
	4500 1850 4400 1750
Entry Wire Line
	4500 1950 4400 1850
Entry Wire Line
	4500 1650 4400 1550
Entry Wire Line
	4500 1750 4400 1650
$Comp
L Device:R_Network08_US RN?
U 1 1 5D1C9541
P 4900 2050
AR Path="/5D1C9541" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D1C9541" Ref="RN4"  Part="1" 
F 0 "RN4" V 4250 1950 50  0000 L CNN
F 1 "270" V 4350 1950 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5375 2050 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4900 2050 50  0001 C CNN
	1    4900 2050
	0    1    1    0   
$EndComp
Text GLabel 1300 2650 0    50   Input ~ 0
1
$Comp
L power:GNDD #PWR0110
U 1 1 5D7DF376
P 1800 2950
F 0 "#PWR0110" H 1800 2700 50  0001 C CNN
F 1 "GNDD" H 1804 2795 50  0000 C CNN
F 2 "" H 1800 2950 50  0001 C CNN
F 3 "" H 1800 2950 50  0001 C CNN
	1    1800 2950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5D7D093F
P 1800 1350
F 0 "#PWR0109" H 1800 1200 50  0001 C CNN
F 1 "VCC" H 1817 1523 50  0000 C CNN
F 2 "" H 1800 1350 50  0001 C CNN
F 3 "" H 1800 1350 50  0001 C CNN
	1    1800 1350
	1    0    0    -1  
$EndComp
Text GLabel 2300 2050 2    50   Output ~ 0
vblank
Text GLabel 2300 2150 2    50   Output ~ 0
vsync
$Comp
L 74xx:74LS541 U36
U 1 1 5E4BAE6E
P 3600 2150
F 0 "U36" H 3600 1950 50  0000 C CNN
F 1 "74F541" H 3600 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3600 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3600 2150 50  0001 C CNN
	1    3600 2150
	1    0    0    -1  
$EndComp
Text GLabel 2650 2450 3    50   Input ~ 0
C[0..7]
Text GLabel 3100 2550 0    50   Input ~ 0
hblank
Text GLabel 3100 2650 0    50   Input ~ 0
pclk2
Text GLabel 3100 2350 0    50   Input ~ 0
1
Entry Wire Line
	2650 2150 2750 2050
Text Label 2750 2050 0    50   ~ 0
C3
Entry Wire Line
	2650 2250 2750 2150
Text Label 2750 2150 0    50   ~ 0
C7
Wire Wire Line
	2750 2050 3100 2050
Wire Wire Line
	2750 2150 3100 2150
Text Label 4100 1950 0    50   ~ 0
PA11
Text Label 4100 1850 0    50   ~ 0
PA10
Text Label 4150 1750 0    50   ~ 0
PA9
Text Label 4150 1650 0    50   ~ 0
PA8
Wire Wire Line
	4100 1650 4300 1650
Wire Wire Line
	4100 1750 4300 1750
Wire Wire Line
	4100 1850 4300 1850
Wire Wire Line
	4100 1950 4300 1950
Entry Wire Line
	4300 2050 4400 1950
Entry Wire Line
	4300 1950 4400 1850
Entry Wire Line
	4300 1850 4400 1750
Entry Wire Line
	4300 1750 4400 1650
Text Label 4100 2250 0    50   ~ 0
PA14
Text Label 4100 2150 0    50   ~ 0
PA13
Text Label 4100 2050 0    50   ~ 0
PA12
Wire Wire Line
	4100 2050 4300 2050
Wire Wire Line
	4100 2150 4300 2150
Wire Wire Line
	4100 2250 4300 2250
Entry Wire Line
	4300 1650 4400 1550
Entry Wire Line
	4300 2250 4400 2150
Entry Wire Line
	4300 2150 4400 2050
Text GLabel 4400 1450 1    50   Output ~ 0
PA[0..15]
$Comp
L power:GNDD #PWR0121
U 1 1 5F0FA20D
P 3600 2950
F 0 "#PWR0121" H 3600 2700 50  0001 C CNN
F 1 "GNDD" H 3604 2795 50  0000 C CNN
F 2 "" H 3600 2950 50  0001 C CNN
F 3 "" H 3600 2950 50  0001 C CNN
	1    3600 2950
	1    0    0    -1  
$EndComp
Text GLabel 3100 2250 0    50   Input ~ 0
mode0
$Comp
L power:VCC #PWR0131
U 1 1 621DFBC5
P 3600 1350
F 0 "#PWR0131" H 3600 1200 50  0001 C CNN
F 1 "VCC" H 3617 1523 50  0000 C CNN
F 2 "" H 3600 1350 50  0001 C CNN
F 3 "" H 3600 1350 50  0001 C CNN
	1    3600 1350
	1    0    0    -1  
$EndComp
Text GLabel 10650 4500 2    50   Output ~ 0
adac
$Comp
L power:GNDA #PWR0127
U 1 1 5FA7CAFE
P 10150 5400
F 0 "#PWR0127" H 10150 5150 50  0001 C CNN
F 1 "GNDA" H 10155 5227 50  0000 C CNN
F 2 "" H 10150 5400 50  0001 C CNN
F 3 "" H 10150 5400 50  0001 C CNN
	1    10150 5400
	1    0    0    -1  
$EndComp
Text Label 10150 4700 2    50   ~ 0
G2
Text Label 10150 4500 2    50   ~ 0
G0
Text Label 10150 4600 2    50   ~ 0
G1
Text Label 10150 4800 2    50   ~ 0
G3
Text Label 10150 4900 2    50   ~ 0
G4
Text Label 10150 5000 2    50   ~ 0
G5
Text Label 10150 5100 2    50   ~ 0
G6
Wire Wire Line
	10250 5100 10050 5100
Wire Wire Line
	10250 5000 10050 5000
Wire Wire Line
	10250 4900 10050 4900
Wire Wire Line
	10250 4800 10050 4800
Wire Wire Line
	10250 4700 10050 4700
Wire Wire Line
	10250 4600 10050 4600
Wire Wire Line
	10250 4500 10050 4500
Entry Wire Line
	9950 5300 10050 5200
Entry Wire Line
	9950 4600 10050 4500
Entry Wire Line
	9950 4700 10050 4600
Entry Wire Line
	9950 4800 10050 4700
Entry Wire Line
	9950 4900 10050 4800
Entry Wire Line
	9950 5000 10050 4900
Entry Wire Line
	9950 5100 10050 5000
Entry Wire Line
	9950 5200 10050 5100
$Comp
L Device:R_Network09_US RN6
U 1 1 5FA45019
P 10450 4900
F 0 "RN6" V 9800 4900 50  0000 C CNN
F 1 "R2R10k" V 9900 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Array_SIP10" V 11025 4900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10450 4900 50  0001 C CNN
	1    10450 4900
	0    1    1    0   
$EndComp
Text GLabel 6400 5600 3    50   Input ~ 0
PD[0..7]
$Comp
L power:VCC #PWR0125
U 1 1 5F174359
P 8800 3900
F 0 "#PWR0125" H 8800 3750 50  0001 C CNN
F 1 "VCC" H 8817 4073 50  0000 C CNN
F 2 "" H 8800 3900 50  0001 C CNN
F 3 "" H 8800 3900 50  0001 C CNN
	1    8800 3900
	1    0    0    -1  
$EndComp
Text GLabel 6700 5500 0    50   Input ~ 0
0
Text GLabel 6700 5400 0    50   Input ~ 0
pclk2
$Comp
L power:VCC #PWR0124
U 1 1 5F161314
P 7200 4200
F 0 "#PWR0124" H 7200 4050 50  0001 C CNN
F 1 "VCC" H 7217 4373 50  0000 C CNN
F 2 "" H 7200 4200 50  0001 C CNN
F 3 "" H 7200 4200 50  0001 C CNN
	1    7200 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0123
U 1 1 5F160896
P 8800 5600
F 0 "#PWR0123" H 8800 5350 50  0001 C CNN
F 1 "GNDD" H 8804 5445 50  0000 C CNN
F 2 "" H 8800 5600 50  0001 C CNN
F 3 "" H 8800 5600 50  0001 C CNN
	1    8800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0122
U 1 1 5F15FC9A
P 7200 5800
F 0 "#PWR0122" H 7200 5550 50  0001 C CNN
F 1 "GNDD" H 7204 5645 50  0000 C CNN
F 2 "" H 7200 5800 50  0001 C CNN
F 3 "" H 7200 5800 50  0001 C CNN
	1    7200 5800
	1    0    0    -1  
$EndComp
Text Label 6500 5200 0    50   ~ 0
PD7
Text Label 6500 5100 0    50   ~ 0
PD6
Text Label 6500 5000 0    50   ~ 0
PD5
Text Label 6500 4900 0    50   ~ 0
PD4
Text Label 6500 4800 0    50   ~ 0
PD3
Text Label 6500 4700 0    50   ~ 0
PD2
Text Label 6500 4600 0    50   ~ 0
PD1
Text Label 6500 4500 0    50   ~ 0
PD0
Entry Wire Line
	6400 5200 6500 5100
Entry Wire Line
	6400 5100 6500 5000
Entry Wire Line
	6400 5000 6500 4900
Entry Wire Line
	6400 4900 6500 4800
Entry Wire Line
	6400 4800 6500 4700
Entry Wire Line
	6400 4700 6500 4600
Entry Wire Line
	6400 4600 6500 4500
Entry Wire Line
	6400 5300 6500 5200
Wire Wire Line
	6500 5200 6700 5200
Wire Wire Line
	6500 5100 6700 5100
Wire Wire Line
	6500 5000 6700 5000
Wire Wire Line
	6500 4900 6700 4900
Wire Wire Line
	6500 4800 6700 4800
Wire Wire Line
	6500 4700 6700 4700
Wire Wire Line
	6500 4600 6700 4600
Wire Wire Line
	6500 4500 6700 4500
$Comp
L 74xx:74LS574 U37
U 1 1 5E4BEA85
P 7200 5000
F 0 "U37" H 7200 4800 50  0000 C CNN
F 1 "74F574" H 7200 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7200 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7200 5000 50  0001 C CNN
	1    7200 5000
	1    0    0    -1  
$EndComp
Entry Bus Bus
	7700 1150 7800 1050
Entry Bus Bus
	9650 1050 9750 1150
Text GLabel 10650 1250 2    50   Output ~ 0
vdac2r
Wire Wire Line
	9850 2550 10150 2550
Wire Wire Line
	9850 2400 10150 2400
Wire Wire Line
	9850 2250 10250 2250
Wire Wire Line
	10150 1550 9850 1550
Wire Wire Line
	9850 1400 10150 1400
Wire Wire Line
	9850 1250 10250 1250
Wire Wire Line
	10250 2350 10150 2350
Wire Wire Line
	10150 2350 10150 2400
Wire Wire Line
	10150 2450 10250 2450
Wire Wire Line
	10250 2550 10150 2550
Wire Wire Line
	10150 2550 10150 2650
Connection ~ 10150 2650
Wire Wire Line
	10150 2850 10250 2850
Wire Wire Line
	10150 2650 10250 2650
Wire Wire Line
	10150 2650 10150 2750
Connection ~ 10150 2750
Wire Wire Line
	10150 2750 10250 2750
Wire Wire Line
	10150 2750 10150 2850
Wire Wire Line
	10150 1450 10250 1450
Wire Wire Line
	10150 1350 10150 1400
Wire Wire Line
	10250 1350 10150 1350
Wire Wire Line
	10150 1750 10150 1850
Connection ~ 10150 1750
Wire Wire Line
	10150 1750 10250 1750
Connection ~ 10150 1650
Wire Wire Line
	10150 1650 10250 1650
Wire Wire Line
	10150 1850 10250 1850
Wire Wire Line
	10150 1550 10150 1650
Wire Wire Line
	10250 1550 10150 1550
Wire Wire Line
	10200 3750 10150 3750
$Comp
L Device:R_Network07_US RN?
U 1 1 5D54D3C2
P 10450 1550
AR Path="/5D54D3C2" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D54D3C2" Ref="RN8"  Part="1" 
F 0 "RN8" V 9900 1450 50  0000 L CNN
F 1 "3300" V 10000 1450 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 10925 1550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10450 1550 50  0001 C CNN
	1    10450 1550
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack03_SIP RN10
U 1 1 5D54D3BC
P 10400 3650
AR Path="/5DAA3954/5D54D3BC" Ref="RN10"  Part="1" 
AR Path="/5D54D3BC" Ref="RN?"  Part="1" 
F 0 "RN10" V 9850 3600 50  0000 L CNN
F 1 "1500" V 9950 3600 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP6" V 10975 3650 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10400 3650 50  0001 C CNN
	1    10400 3650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Network07_US RN?
U 1 1 5D54D3B6
P 10450 2550
AR Path="/5D54D3B6" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D54D3B6" Ref="RN9"  Part="1" 
F 0 "RN9" V 9900 2450 50  0000 L CNN
F 1 "3300" V 10000 2450 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 10925 2550 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 10450 2550 50  0001 C CNN
	1    10450 2550
	0    1    1    0   
$EndComp
Entry Wire Line
	9850 1400 9750 1300
Entry Wire Line
	9850 1250 9750 1150
Entry Wire Line
	9850 1550 9750 1450
Entry Wire Line
	9850 2250 9750 2150
Entry Wire Line
	9850 2550 9750 2450
Entry Wire Line
	9850 2400 9750 2300
Entry Wire Line
	9850 3350 9750 3250
Entry Wire Line
	9850 3850 9750 3750
Text Label 9950 3850 2    50   ~ 0
C7
Text Label 9950 3350 2    50   ~ 0
C6
Text Label 10000 2550 2    50   ~ 0
C5
Text Label 10000 2400 2    50   ~ 0
C4
Text Label 10000 2250 2    50   ~ 0
C3
Text Label 10000 1550 2    50   ~ 0
C2
Text Label 10000 1400 2    50   ~ 0
C1
Text Label 10000 1250 2    50   ~ 0
C0
Text GLabel 10650 3000 2    50   Output ~ 0
vdac2b
Text GLabel 10650 2250 2    50   Output ~ 0
vdac2g
Wire Wire Line
	10150 5400 10150 5300
Wire Wire Line
	10150 5300 10250 5300
Entry Bus Bus
	8000 5800 8100 5900
Entry Bus Bus
	9850 5900 9950 5800
Text Label 4700 5200 2    50   ~ 0
DA15
$Comp
L Device:R_Network08_US RN3
U 1 1 5D1C1196
P 4250 4900
F 0 "RN3" V 3600 4850 50  0000 L CNN
F 1 "270" V 3700 4850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4725 4900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4250 4900 50  0001 C CNN
	1    4250 4900
	0    -1   1    0   
$EndComp
Wire Wire Line
	4450 4500 4700 4500
Wire Wire Line
	4450 4600 4700 4600
Wire Wire Line
	4450 4700 4700 4700
Wire Wire Line
	4450 4800 4700 4800
Wire Wire Line
	4450 4900 4700 4900
Wire Wire Line
	4450 5000 4700 5000
Wire Wire Line
	4450 5100 4700 5100
Wire Wire Line
	4450 5200 4700 5200
Text GLabel 1300 4700 0    50   Input ~ 0
1
Text GLabel 1300 4500 0    50   Input ~ 0
qclk2
Text GLabel 1300 4400 0    50   Input ~ 0
1
Text GLabel 1300 4300 0    50   Input ~ 0
1
Text GLabel 1300 4000 0    50   Input ~ 0
0
Text GLabel 1300 3900 0    50   Input ~ 0
0
Text GLabel 1300 3700 0    50   Input ~ 0
0
Text GLabel 1300 3800 0    50   Input ~ 0
0
$Comp
L power:VCC #PWR0108
U 1 1 5E4ED6D8
P 1800 3400
F 0 "#PWR0108" H 1800 3250 50  0001 C CNN
F 1 "VCC" H 1817 3573 50  0000 C CNN
F 2 "" H 1800 3400 50  0001 C CNN
F 3 "" H 1800 3400 50  0001 C CNN
	1    1800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4200 2400 5250
Wire Wire Line
	2300 4200 2400 4200
$Comp
L power:GNDD #PWR0105
U 1 1 5E4DB628
P 1800 5000
F 0 "#PWR0105" H 1800 4750 50  0001 C CNN
F 1 "GNDD" H 1804 4845 50  0000 C CNN
F 2 "" H 1800 5000 50  0001 C CNN
F 3 "" H 1800 5000 50  0001 C CNN
	1    1800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4000 2500 4000
Wire Wire Line
	2300 3900 2500 3900
Wire Wire Line
	2300 3800 2500 3800
Wire Wire Line
	2300 3700 2500 3700
Text Label 2400 3700 0    50   ~ 0
H0
Text Label 2400 3800 0    50   ~ 0
H1
Text Label 2400 3900 0    50   ~ 0
H2
Text Label 2400 4000 0    50   ~ 0
H3
$Comp
L 74xx:74LS163 U31
U 1 1 5E4B7483
P 1800 4200
F 0 "U31" H 1800 4200 50  0000 C CNN
F 1 "74F163" H 1850 4100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1800 4200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 1800 4200 50  0001 C CNN
	1    1800 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1650 5200 1550
$Comp
L power:VCC #PWR0133
U 1 1 5E732E82
P 3950 4400
F 0 "#PWR0133" H 3950 4250 50  0001 C CNN
F 1 "VCC" H 3967 4573 50  0000 C CNN
F 2 "" H 3950 4400 50  0001 C CNN
F 3 "" H 3950 4400 50  0001 C CNN
	1    3950 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4500 3950 4500
Wire Wire Line
	3950 4500 3950 4400
Entry Bus Bus
	4700 5550 4800 5450
Entry Bus Bus
	4200 5650 4300 5550
Wire Bus Line
	4300 5550 4700 5550
Wire Wire Line
	10200 3950 10150 3950
Wire Wire Line
	6100 4500 6300 4500
Wire Wire Line
	6100 4600 6300 4600
Wire Wire Line
	6100 4700 6300 4700
Wire Wire Line
	6100 4800 6300 4800
Wire Wire Line
	6100 4900 6300 4900
Wire Wire Line
	6100 5000 6300 5000
Wire Wire Line
	6100 5100 6300 5100
Text GLabel 9300 5100 2    50   Input ~ 0
dclk
Text GLabel 9300 4800 2    50   Input ~ 0
1
Text GLabel 9300 4900 2    50   Input ~ 0
1
Text GLabel 9300 5300 2    50   Input ~ 0
1
Text GLabel 9300 4500 2    50   Input ~ 0
1
Text GLabel 9300 4200 2    50   Input ~ 0
1
Text GLabel 9300 4300 2    50   Input ~ 0
1
NoConn ~ 8300 4200
Wire Wire Line
	7700 4700 7900 4700
$Comp
L 74xx:74LS299 U38
U 1 1 5E4BD098
P 8800 4700
F 0 "U38" H 8800 4800 50  0000 C CNN
F 1 "74F299" H 8750 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8800 4700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS299" H 8800 4700 50  0001 C CNN
	1    8800 4700
	-1   0    0    -1  
$EndComp
Entry Wire Line
	8000 5300 7900 5200
Entry Wire Line
	8000 5200 7900 5100
Entry Wire Line
	8000 5100 7900 5000
Entry Wire Line
	8000 5000 7900 4900
Entry Wire Line
	8000 4900 7900 4800
Entry Wire Line
	8000 4800 7900 4700
Entry Wire Line
	8000 4700 7900 4600
Entry Wire Line
	8000 4600 7900 4500
Wire Wire Line
	7700 5200 7900 5200
Wire Wire Line
	7700 5100 7900 5100
Wire Wire Line
	7700 5000 7900 5000
Wire Wire Line
	7700 4900 7900 4900
Wire Wire Line
	7700 4800 7900 4800
Wire Wire Line
	7700 4600 7900 4600
Wire Wire Line
	7700 4500 7900 4500
Wire Wire Line
	8100 4500 8300 4500
Wire Wire Line
	8100 4600 8300 4600
Wire Wire Line
	8100 4700 8300 4700
Wire Wire Line
	8100 4800 8300 4800
Wire Wire Line
	8100 4900 8300 4900
Wire Wire Line
	8100 5000 8300 5000
Wire Wire Line
	8100 5100 8300 5100
Wire Wire Line
	8100 5200 8300 5200
Entry Wire Line
	8000 5300 8100 5200
Entry Wire Line
	8000 4600 8100 4500
Entry Wire Line
	8000 4700 8100 4600
Entry Wire Line
	8000 4800 8100 4700
Entry Wire Line
	8000 4900 8100 4800
Entry Wire Line
	8000 5000 8100 4900
Entry Wire Line
	8000 5100 8100 5000
Entry Wire Line
	8000 5200 8100 5100
Text Label 7800 4500 0    50   ~ 0
G0
Text Label 7800 4600 0    50   ~ 0
G1
Text Label 7800 4700 0    50   ~ 0
G2
Text Label 7800 4800 0    50   ~ 0
G3
Text Label 7800 4900 0    50   ~ 0
G4
Text Label 7800 5000 0    50   ~ 0
G5
Text Label 7800 5100 0    50   ~ 0
G6
Text Label 7800 5200 0    50   ~ 0
G7
Text Label 8100 4500 0    50   ~ 0
G0
Text Label 8100 4600 0    50   ~ 0
G1
Text Label 8100 4700 0    50   ~ 0
G2
Text Label 8100 4800 0    50   ~ 0
G3
Text Label 8100 4900 0    50   ~ 0
G4
Text Label 8100 5000 0    50   ~ 0
G5
Text Label 8100 5100 0    50   ~ 0
G6
Text Label 8100 5200 0    50   ~ 0
G7
Wire Wire Line
	4250 3500 4350 3500
Wire Wire Line
	9500 4600 9500 3600
Wire Wire Line
	9300 4600 9500 4600
Wire Wire Line
	6100 5200 6300 5200
Wire Wire Line
	3500 3600 3650 3600
Wire Bus Line
	8100 5900 9850 5900
Wire Bus Line
	7800 1050 9650 1050
Connection ~ 10150 1400
Wire Wire Line
	10150 1400 10150 1450
Connection ~ 10150 1550
Wire Wire Line
	10150 1650 10150 1750
Connection ~ 10150 2400
Wire Wire Line
	10150 2400 10150 2450
Connection ~ 10150 2550
Wire Wire Line
	5800 1650 6000 1650
Wire Wire Line
	5800 1750 6000 1750
Wire Wire Line
	5800 1850 6000 1850
Wire Wire Line
	5800 1950 6000 1950
Wire Wire Line
	5800 2050 6000 2050
Wire Wire Line
	5800 2150 6000 2150
Wire Wire Line
	5800 2250 6000 2250
Wire Wire Line
	5800 2350 6000 2350
Wire Wire Line
	5100 1650 5200 1650
$Comp
L power:GNDD #PWR0135
U 1 1 5D8AB4CC
P 5300 1750
F 0 "#PWR0135" H 5300 1500 50  0001 C CNN
F 1 "GNDD" H 5304 1595 50  0000 C CNN
F 2 "" H 5300 1750 50  0001 C CNN
F 3 "" H 5300 1750 50  0001 C CNN
	1    5300 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1750 5300 1650
Wire Wire Line
	5300 1650 5400 1650
Text Label 4100 2350 0    50   ~ 0
PA15
Wire Wire Line
	4100 2350 4300 2350
Entry Wire Line
	4300 2350 4400 2250
Wire Wire Line
	10150 3950 10150 3850
Wire Wire Line
	9850 3850 10150 3850
Connection ~ 10150 3850
Wire Wire Line
	10150 3850 10150 3750
Wire Wire Line
	9850 3350 10200 3350
Wire Wire Line
	10200 4050 10050 4050
Wire Wire Line
	10050 3000 10650 3000
Text Label 1100 1650 0    50   ~ 0
PD0
Text Label 1100 1750 0    50   ~ 0
PD1
Text Label 1100 1850 0    50   ~ 0
PD2
Text Label 1100 1950 0    50   ~ 0
PD3
Text Label 1100 2050 0    50   ~ 0
PD4
Text Label 1100 2150 0    50   ~ 0
PD5
Wire Wire Line
	1100 1650 1300 1650
Wire Wire Line
	1100 1750 1300 1750
Wire Wire Line
	1100 1850 1300 1850
Wire Wire Line
	1100 1950 1300 1950
Entry Wire Line
	1100 2150 1000 2050
Entry Wire Line
	1100 2050 1000 1950
Entry Wire Line
	1100 1750 1000 1650
Entry Wire Line
	1100 1850 1000 1750
Entry Wire Line
	1100 1950 1000 1850
Entry Wire Line
	1100 1650 1000 1550
Text GLabel 1000 1450 1    50   Input ~ 0
PD[0..7]
Wire Wire Line
	1100 2150 1300 2150
Wire Wire Line
	1100 2050 1300 2050
Text GLabel 6100 5500 2    50   Input ~ 0
~voe
Text GLabel 6100 5400 2    50   Input ~ 0
~vle
$Comp
L 74xx:74LS574 U39
U 1 1 5E4BDEC4
P 6900 2150
F 0 "U39" H 6900 1950 50  0000 C CNN
F 1 "74F574" H 6900 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 6900 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6900 2150 50  0001 C CNN
	1    6900 2150
	1    0    0    -1  
$EndComp
Text GLabel 8000 2950 0    50   Input ~ 0
vblank
Wire Wire Line
	8000 2850 7600 2850
Wire Wire Line
	7600 2850 7600 4300
Wire Wire Line
	7600 4300 8300 4300
$Comp
L 74xx:74LS00 U?
U 4 1 5D1E20D4
P 3200 5100
AR Path="/62D13D9D/5D1E20D4" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5D1E20D4" Ref="U?"  Part="4" 
AR Path="/5DAA19D5/5D1E20D4" Ref="U?"  Part="4" 
AR Path="/5DAA3954/5D1E20D4" Ref="U1"  Part="4" 
F 0 "U1" H 3200 5100 50  0000 C CNN
F 1 "74F00" H 3200 5300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3200 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 3200 5100 50  0001 C CNN
	4    3200 5100
	1    0    0    -1  
$EndComp
Entry Wire Line
	2700 4700 2600 4800
Entry Wire Line
	2700 4500 2600 4600
Wire Wire Line
	2700 4500 2900 4500
Wire Wire Line
	2700 4700 2900 4700
Text Label 2700 4500 0    50   ~ 0
H6
Text Label 2700 4700 0    50   ~ 0
H7
Wire Wire Line
	3500 4600 3550 4600
Wire Wire Line
	3550 4600 3550 4350
Wire Wire Line
	3550 4350 2850 4350
Text GLabel 2300 2250 2    50   Output ~ 0
mode0
$Comp
L 74xx:74LS574 U35
U 1 1 5D29AFB1
P 1800 2150
F 0 "U35" H 1800 1950 50  0000 C CNN
F 1 "74F574" H 1800 1850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1800 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1800 2150 50  0001 C CNN
	1    1800 2150
	1    0    0    -1  
$EndComp
Text Label 1100 2250 0    50   ~ 0
PD6
Text Label 1100 2350 0    50   ~ 0
PD7
Entry Wire Line
	1100 2350 1000 2250
Entry Wire Line
	1100 2250 1000 2150
Wire Wire Line
	1100 2350 1300 2350
Wire Wire Line
	1100 2250 1300 2250
Wire Wire Line
	2300 1950 3100 1950
Wire Wire Line
	2300 1750 3100 1750
Wire Wire Line
	2300 1850 3100 1850
Wire Wire Line
	2300 1650 3100 1650
Wire Wire Line
	4900 5800 5000 5800
Wire Wire Line
	5000 5800 5000 5700
Wire Wire Line
	2900 5000 2850 5000
Wire Wire Line
	3550 4850 3550 4600
Connection ~ 3550 4600
Wire Wire Line
	2900 5200 2850 5200
Wire Wire Line
	1150 6500 1150 5250
Wire Wire Line
	1150 6500 1300 6500
Wire Wire Line
	1150 5250 2400 5250
Wire Wire Line
	1300 6300 1000 6300
Wire Wire Line
	1000 4200 1300 4200
Wire Wire Line
	1000 4200 1000 6300
Wire Wire Line
	1000 4200 1000 2550
Wire Wire Line
	1000 2550 1300 2550
Connection ~ 1000 4200
Wire Wire Line
	900  2550 1000 2550
Connection ~ 1000 2550
Wire Wire Line
	10150 3650 10200 3650
Wire Wire Line
	10150 3450 10200 3450
Wire Wire Line
	10150 3550 10150 3450
Wire Wire Line
	10150 3650 10150 3550
Connection ~ 10150 3550
Wire Wire Line
	10050 3000 10050 3550
Connection ~ 10050 3550
Wire Wire Line
	10050 3550 10150 3550
Wire Wire Line
	10050 3550 10050 4050
Wire Wire Line
	2850 5200 2850 5000
Connection ~ 2850 5000
Wire Wire Line
	2850 5000 2850 4850
Wire Wire Line
	2850 4850 3550 4850
Wire Wire Line
	2850 4350 2850 4200
Wire Wire Line
	2850 4200 2900 4200
$Comp
L 74xx:74LS32 U?
U 2 1 5EFF05F1
P 3200 3600
AR Path="/5CDEEC9F/5EFF05F1" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5EFF05F1" Ref="U?"  Part="2" 
AR Path="/5DAA3954/5EFF05F1" Ref="U6"  Part="2" 
F 0 "U6" H 3150 3600 50  0000 L CNN
F 1 "74F32" V 3200 3150 50  0001 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 3200 3600 50  0001 C CNN
	2    3200 3600
	1    0    0    -1  
$EndComp
Text GLabel 2900 3850 2    50   Output ~ 0
eclk
Wire Wire Line
	4950 3600 5000 3600
Wire Wire Line
	5000 3600 5000 3400
Wire Wire Line
	5000 3400 5050 3400
Connection ~ 5000 3600
Wire Wire Line
	5000 3600 9500 3600
Wire Wire Line
	5850 3300 5850 2550
Wire Wire Line
	5850 2550 6400 2550
Wire Wire Line
	5650 3300 5850 3300
NoConn ~ 2300 2350
Wire Bus Line
	2650 2150 2650 2450
Wire Bus Line
	4800 4600 4800 5450
Wire Bus Line
	6400 4600 6400 5600
Wire Bus Line
	9750 1150 9750 3750
Wire Bus Line
	1000 1450 1000 2250
Wire Bus Line
	8000 4600 8000 5800
Wire Bus Line
	9950 4600 9950 5800
Wire Bus Line
	4400 1450 4400 2250
Wire Bus Line
	6100 1450 6100 2250
Wire Bus Line
	7700 1150 7700 2250
Wire Bus Line
	2600 3800 2600 6400
Wire Bus Line
	4200 5650 4200 6700
$EndSCHEMATC
