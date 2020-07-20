EESchema Schematic File Version 4
LIBS:novasaur-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 3 4
Title "Graphics Processing Unit"
Date "2020-07-18"
Rev "1.7"
Comp ""
Comment1 "(c) A J Hewitt 2020"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1150 2450 0    50   Input ~ 0
scp
Text GLabel 1650 2550 0    50   Input ~ 0
0
$Comp
L power:GNDD #PWR0110
U 1 1 5D7DF376
P 2150 2850
AR Path="/5DAA3954/5D7DF376" Ref="#PWR0110"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D7DF376" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D7DF376" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 2150 2600 50  0001 C CNN
F 1 "GNDD" H 2154 2695 50  0000 C CNN
F 2 "" H 2150 2850 50  0001 C CNN
F 3 "" H 2150 2850 50  0001 C CNN
	1    2150 2850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5D7D093F
P 2150 1250
AR Path="/5DAA3954/5D7D093F" Ref="#PWR0109"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D7D093F" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D7D093F" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 2150 1100 50  0001 C CNN
F 1 "VCC" H 2167 1423 50  0000 C CNN
F 2 "" H 2150 1250 50  0001 C CNN
F 3 "" H 2150 1250 50  0001 C CNN
	1    2150 1250
	1    0    0    -1  
$EndComp
Text GLabel 2650 2050 2    50   Output ~ 0
vsync
Text GLabel 3050 2450 3    50   Input ~ 0
F[0..7]
Entry Wire Line
	3050 2150 3150 2050
Text Label 3150 2050 0    50   ~ 0
F3
Entry Wire Line
	3050 2250 3150 2150
Text Label 3150 2150 0    50   ~ 0
F7
Text Label 1450 1550 0    50   ~ 0
PD0
Text Label 1450 1650 0    50   ~ 0
PD1
Text Label 1450 1750 0    50   ~ 0
PD2
Text Label 1450 1850 0    50   ~ 0
PD3
Text Label 1450 1950 0    50   ~ 0
PD4
Text Label 1450 2050 0    50   ~ 0
PD5
Wire Wire Line
	1450 1550 1650 1550
Wire Wire Line
	1450 1650 1650 1650
Wire Wire Line
	1450 1750 1650 1750
Wire Wire Line
	1450 1850 1650 1850
Entry Wire Line
	1450 2050 1350 1950
Entry Wire Line
	1450 1950 1350 1850
Entry Wire Line
	1450 1650 1350 1550
Entry Wire Line
	1450 1750 1350 1650
Entry Wire Line
	1450 1850 1350 1750
Entry Wire Line
	1450 1550 1350 1450
Text GLabel 1350 1350 1    50   Input ~ 0
PD[0..7]
Wire Wire Line
	1450 2050 1650 2050
Wire Wire Line
	1450 1950 1650 1950
Wire Wire Line
	5900 1550 6000 1550
Wire Wire Line
	6000 1550 6000 1450
$Comp
L power:VCC #PWR0131
U 1 1 621DFBC5
P 4150 1250
AR Path="/5DAA3954/621DFBC5" Ref="#PWR0131"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DFBC5" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DFBC5" Ref="#PWR0158"  Part="1" 
F 0 "#PWR0158" H 4150 1100 50  0001 C CNN
F 1 "VCC" H 4167 1423 50  0000 C CNN
F 2 "" H 4150 1250 50  0001 C CNN
F 3 "" H 4150 1250 50  0001 C CNN
	1    4150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0121
U 1 1 5F0FA20D
P 4150 2850
AR Path="/5DAA3954/5F0FA20D" Ref="#PWR0121"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F0FA20D" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F0FA20D" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 4150 2600 50  0001 C CNN
F 1 "GNDD" H 4154 2695 50  0000 C CNN
F 2 "" H 4150 2850 50  0001 C CNN
F 3 "" H 4150 2850 50  0001 C CNN
	1    4150 2850
	1    0    0    -1  
$EndComp
Text GLabel 5150 1350 1    50   Output ~ 0
PA[0..15]
Entry Wire Line
	5050 2050 5150 1950
Entry Wire Line
	5050 2150 5150 2050
Entry Wire Line
	5050 1550 5150 1450
Text Label 4850 1950 0    50   ~ 0
PA12
Text Label 4850 2050 0    50   ~ 0
PA13
Text Label 4850 2150 0    50   ~ 0
PA14
Entry Wire Line
	5050 1650 5150 1550
Entry Wire Line
	5050 1750 5150 1650
Entry Wire Line
	5050 1850 5150 1750
Entry Wire Line
	5050 1950 5150 1850
Text Label 4900 1550 0    50   ~ 0
PA8
Text Label 4900 1650 0    50   ~ 0
PA9
Text Label 4850 1750 0    50   ~ 0
PA10
Text Label 4850 1850 0    50   ~ 0
PA11
Text GLabel 3650 2250 0    50   Input ~ 0
0
Text GLabel 3650 2550 0    50   Input ~ 0
pclk2
Text GLabel 3650 2450 0    50   Input ~ 0
hblank
$Comp
L 74xx:74LS541 U33
U 1 1 5E4BAE6E
P 4150 2050
AR Path="/5DAA3954/5E4BAE6E" Ref="U33"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BAE6E" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BAE6E" Ref="U33"  Part="1" 
F 0 "U33" H 4150 1850 50  0000 C CNN
F 1 "74F541" H 4150 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4150 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 4150 2050 50  0001 C CNN
	1    4150 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5D1C9541
P 5700 1950
AR Path="/5D1C9541" Ref="RN?"  Part="1" 
AR Path="/5DAA3954/5D1C9541" Ref="RN2"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C9541" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C9541" Ref="RN5"  Part="1" 
F 0 "RN5" V 5050 1850 50  0000 L CNN
F 1 "1k" V 5150 1850 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 6175 1950 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5700 1950 50  0001 C CNN
	1    5700 1950
	0    1    1    0   
$EndComp
Entry Wire Line
	5250 1650 5150 1550
Entry Wire Line
	5250 1550 5150 1450
Entry Wire Line
	5250 1850 5150 1750
Entry Wire Line
	5250 1750 5150 1650
Entry Wire Line
	5250 2050 5150 1950
Entry Wire Line
	5250 1950 5150 1850
Entry Wire Line
	5250 2250 5150 2150
Entry Wire Line
	5250 2150 5150 2050
Text Label 5250 1550 0    50   ~ 0
PA8
Text Label 5250 1650 0    50   ~ 0
PA9
Text Label 5250 1750 0    50   ~ 0
PA10
Text Label 5250 1850 0    50   ~ 0
PA11
Text Label 5250 1950 0    50   ~ 0
PA12
Text Label 5250 2050 0    50   ~ 0
PA13
Text Label 5250 2150 0    50   ~ 0
PA14
Text Label 5250 2250 0    50   ~ 0
PA15
$Comp
L power:VCC #PWR?
U 1 1 5D26EEC0
P 6000 1450
AR Path="/5D26EEC0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA3954/5D26EEC0" Ref="#PWR0120"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D26EEC0" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D26EEC0" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 6000 1300 50  0001 C CNN
F 1 "VCC" H 6017 1623 50  0000 C CNN
F 2 "" H 6000 1450 50  0001 C CNN
F 3 "" H 6000 1450 50  0001 C CNN
	1    6000 1450
	1    0    0    -1  
$EndComp
Text GLabel 9050 2150 2    50   Output ~ 0
b
Text GLabel 9050 1850 2    50   Output ~ 0
g
Text GLabel 9050 1550 2    50   Output ~ 0
r
Text GLabel 6650 2450 0    50   Input ~ 0
fcp
Text GLabel 7850 1350 1    50   Output ~ 0
F[0..7]
Wire Wire Line
	7950 2250 8050 2250
Wire Wire Line
	7950 2150 8050 2150
Wire Wire Line
	7950 1950 8050 1950
Wire Wire Line
	7950 1850 8050 1850
Wire Wire Line
	7950 1650 8050 1650
Wire Wire Line
	7950 1550 8050 1550
Wire Wire Line
	7650 2250 7750 2250
Wire Wire Line
	7650 2150 7750 2150
Wire Wire Line
	7650 2050 7750 2050
Wire Wire Line
	7650 1950 7750 1950
Wire Wire Line
	7650 1850 7750 1850
Wire Wire Line
	7650 1750 7750 1750
Wire Wire Line
	7650 1650 7750 1650
Wire Wire Line
	7650 1550 7750 1550
$Comp
L 74xx:74LS574 U36
U 1 1 5E4BDEC4
P 7150 2050
AR Path="/5DAA3954/5E4BDEC4" Ref="U36"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BDEC4" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BDEC4" Ref="U36"  Part="1" 
F 0 "U36" H 7150 1850 50  0000 C CNN
F 1 "74F574" H 7150 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7150 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7150 2050 50  0001 C CNN
	1    7150 2050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0130
U 1 1 621DEBCC
P 8550 1250
AR Path="/5DAA3954/621DEBCC" Ref="#PWR0130"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DEBCC" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DEBCC" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 8550 1100 50  0001 C CNN
F 1 "VCC" H 8567 1423 50  0000 C CNN
F 2 "" H 8550 1250 50  0001 C CNN
F 3 "" H 8550 1250 50  0001 C CNN
	1    8550 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0129
U 1 1 621DDA78
P 7150 1250
AR Path="/5DAA3954/621DDA78" Ref="#PWR0129"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/621DDA78" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/621DDA78" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 7150 1100 50  0001 C CNN
F 1 "VCC" H 7167 1423 50  0000 C CNN
F 2 "" H 7150 1250 50  0001 C CNN
F 3 "" H 7150 1250 50  0001 C CNN
	1    7150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0128
U 1 1 60936E83
P 7150 2850
AR Path="/5DAA3954/60936E83" Ref="#PWR0128"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/60936E83" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/60936E83" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 7150 2600 50  0001 C CNN
F 1 "GNDD" H 7154 2695 50  0000 C CNN
F 2 "" H 7150 2850 50  0001 C CNN
F 3 "" H 7150 2850 50  0001 C CNN
	1    7150 2850
	1    0    0    -1  
$EndComp
Text GLabel 6350 1350 1    50   Input ~ 0
PA[0..15]
Wire Wire Line
	6450 2250 6650 2250
Wire Wire Line
	6450 2150 6650 2150
Wire Wire Line
	6450 2050 6650 2050
Wire Wire Line
	6450 1950 6650 1950
Text Label 6450 2250 0    50   ~ 0
PA7
Text Label 6450 2150 0    50   ~ 0
PA6
Text Label 6450 2050 0    50   ~ 0
PA5
Text Label 6450 1950 0    50   ~ 0
PA4
Entry Wire Line
	6450 2250 6350 2150
Entry Wire Line
	6450 2150 6350 2050
Entry Wire Line
	6450 2050 6350 1950
Entry Wire Line
	6450 1950 6350 1850
Wire Wire Line
	6450 1850 6650 1850
Wire Wire Line
	6450 1750 6650 1750
Wire Wire Line
	6450 1650 6650 1650
Wire Wire Line
	6450 1550 6650 1550
Text Label 6450 1850 0    50   ~ 0
PA3
Text Label 6450 1750 0    50   ~ 0
PA2
Text Label 6450 1650 0    50   ~ 0
PA1
Text Label 6450 1550 0    50   ~ 0
PA0
Entry Wire Line
	6450 1850 6350 1750
Entry Wire Line
	6450 1750 6350 1650
Entry Wire Line
	6450 1650 6350 1550
Entry Wire Line
	6450 1550 6350 1450
Text Label 7650 2050 0    50   ~ 0
F5
Text Label 7950 2250 0    50   ~ 0
F6
Text Label 7950 2150 0    50   ~ 0
F2
Text Label 7950 1950 0    50   ~ 0
F5
Text Label 7950 1850 0    50   ~ 0
F1
Text Label 7950 1650 0    50   ~ 0
F4
Text Label 7950 1550 0    50   ~ 0
F0
Text Label 7650 2250 0    50   ~ 0
F7
Text Label 7650 2150 0    50   ~ 0
F6
Text Label 7650 1950 0    50   ~ 0
F4
Text Label 7650 1850 0    50   ~ 0
F3
Text Label 7650 1750 0    50   ~ 0
F2
Text Label 7650 1650 0    50   ~ 0
F1
Text Label 7650 1550 0    50   ~ 0
F0
Entry Wire Line
	7850 2150 7750 2250
Entry Wire Line
	7850 2050 7750 2150
Entry Wire Line
	7850 1850 7750 1950
Entry Wire Line
	7850 1750 7750 1850
Entry Wire Line
	7850 1550 7750 1650
Entry Wire Line
	7850 1450 7750 1550
Entry Wire Line
	7850 1450 7950 1550
Entry Wire Line
	7850 2150 7950 2250
Entry Wire Line
	7850 2050 7950 2150
Entry Wire Line
	7750 2050 7850 1950
Entry Wire Line
	7850 1850 7950 1950
Entry Wire Line
	7850 1750 7950 1850
Entry Wire Line
	7750 1750 7850 1650
Entry Wire Line
	7850 1550 7950 1650
Wire Wire Line
	5250 2250 5500 2250
Wire Wire Line
	5250 2150 5500 2150
Wire Wire Line
	5250 2050 5500 2050
Wire Wire Line
	5250 1950 5500 1950
Wire Wire Line
	5250 1850 5500 1850
Wire Wire Line
	5250 1750 5500 1750
Wire Wire Line
	5250 1650 5500 1650
Wire Wire Line
	5250 1550 5500 1550
Wire Wire Line
	3150 2050 3650 2050
Wire Wire Line
	3150 2150 3650 2150
Wire Wire Line
	2650 1550 3650 1550
Wire Wire Line
	2650 1650 3650 1650
Wire Wire Line
	2650 1750 3650 1750
Wire Wire Line
	2650 1850 3650 1850
Wire Wire Line
	2650 3750 2800 3750
$Comp
L 74xx:74LS163 U29
U 1 1 5E4B79C3
P 2150 6450
AR Path="/5DAA3954/5E4B79C3" Ref="U29"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4B79C3" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4B79C3" Ref="U29"  Part="1" 
F 0 "U29" H 2150 6650 50  0000 C CNN
F 1 "74F163" H 2150 6550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2150 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 2150 6450 50  0001 C CNN
	1    2150 6450
	1    0    0    -1  
$EndComp
Text GLabel 3450 3550 0    50   Input ~ 0
mode1
Text GLabel 1650 3850 0    50   Input ~ 0
0
Text GLabel 1650 3950 0    50   Input ~ 0
mode3
Text GLabel 1650 3750 0    50   Input ~ 0
0
Text GLabel 1650 4050 0    50   Input ~ 0
mode3
Wire Wire Line
	2650 4250 2750 4250
Wire Wire Line
	2750 4250 2750 5350
Wire Wire Line
	4650 7200 4900 7200
Wire Wire Line
	4650 7100 4900 7100
Wire Wire Line
	4650 7000 4900 7000
Wire Wire Line
	4650 6900 4900 6900
Wire Wire Line
	4650 6800 4900 6800
Wire Wire Line
	4650 6700 4900 6700
Wire Wire Line
	4650 6600 4900 6600
Wire Wire Line
	4650 6500 4900 6500
Wire Wire Line
	4200 7200 4450 7200
Wire Wire Line
	4200 7100 4450 7100
Wire Wire Line
	4200 7000 4450 7000
Wire Wire Line
	4200 6900 4450 6900
Wire Wire Line
	4200 6800 4450 6800
Wire Wire Line
	4200 6700 4450 6700
Wire Wire Line
	4200 6600 4450 6600
Wire Wire Line
	4200 6500 4450 6500
Text Label 4300 6800 0    50   ~ 0
DA3
Text Label 4300 6700 0    50   ~ 0
DA2
Text Label 4300 6600 0    50   ~ 0
DA1
Text Label 4300 6500 0    50   ~ 0
DA0
Entry Wire Line
	4450 6900 4550 6800
Entry Wire Line
	4450 6800 4550 6700
Entry Wire Line
	4450 6700 4550 6600
Entry Wire Line
	4450 6600 4550 6500
Text Label 4300 7200 0    50   ~ 0
DA7
Text Label 4300 7100 0    50   ~ 0
DA6
Text Label 4300 7000 0    50   ~ 0
DA5
Text Label 4300 6900 0    50   ~ 0
DA4
Entry Wire Line
	4450 6500 4550 6400
Entry Wire Line
	4450 7200 4550 7100
Entry Wire Line
	4450 7100 4550 7000
Entry Wire Line
	4450 7000 4550 6900
Text Label 4850 6900 2    50   ~ 0
DA12
Text Label 4850 7000 2    50   ~ 0
DA13
Text Label 4850 7100 2    50   ~ 0
DA14
Text Label 4850 7200 2    50   ~ 0
DA15
Entry Wire Line
	4550 6800 4650 6900
Entry Wire Line
	4550 6900 4650 7000
Entry Wire Line
	4550 7000 4650 7100
Entry Wire Line
	4550 7100 4650 7200
Text Label 4800 6500 2    50   ~ 0
DA8
Text Label 4800 6600 2    50   ~ 0
DA9
Text Label 4850 6700 2    50   ~ 0
DA10
Text Label 4850 6800 2    50   ~ 0
DA11
Entry Wire Line
	4550 6400 4650 6500
Entry Wire Line
	4550 6500 4650 6600
Entry Wire Line
	4550 6600 4650 6700
Entry Wire Line
	4550 6700 4650 6800
Wire Wire Line
	3000 5350 3250 5350
Wire Wire Line
	3000 5250 3250 5250
Wire Wire Line
	3000 5150 3250 5150
Wire Wire Line
	3000 5050 3250 5050
Wire Wire Line
	3000 4950 3250 4950
Wire Wire Line
	3000 4850 3250 4850
Wire Wire Line
	3000 4750 3250 4750
Wire Wire Line
	3000 4650 3250 4650
Wire Wire Line
	2650 4050 2800 4050
Wire Wire Line
	2650 3950 2800 3950
Wire Wire Line
	2650 3850 2800 3850
Wire Wire Line
	2650 6250 2800 6250
Wire Wire Line
	2650 6150 2800 6150
Wire Wire Line
	2650 6050 2800 6050
Wire Wire Line
	2650 5950 2800 5950
Text GLabel 3250 5550 0    50   Input ~ 0
hblank
Wire Wire Line
	3800 6500 3750 6500
Wire Wire Line
	5300 6500 5350 6500
Text GLabel 2650 6450 2    50   Output ~ 0
hblank
Text GLabel 6150 5650 3    50   Input ~ 0
PD[0..7]
$Comp
L power:GNDD #PWR0122
U 1 1 5F15FC9A
P 7150 5950
AR Path="/5DAA3954/5F15FC9A" Ref="#PWR0122"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F15FC9A" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F15FC9A" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 7150 5700 50  0001 C CNN
F 1 "GNDD" H 7154 5795 50  0000 C CNN
F 2 "" H 7150 5950 50  0001 C CNN
F 3 "" H 7150 5950 50  0001 C CNN
	1    7150 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U30
U 1 1 5E4BA4C4
P 3750 5150
AR Path="/5DAA3954/5E4BA4C4" Ref="U30"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BA4C4" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BA4C4" Ref="U30"  Part="1" 
F 0 "U30" H 3750 4950 50  0000 C CNN
F 1 "74F541" H 3750 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3750 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3750 5150 50  0001 C CNN
	1    3750 5150
	1    0    0    -1  
$EndComp
Text Label 6050 5350 2    50   ~ 0
PD7
Text Label 6050 5250 2    50   ~ 0
PD6
Text Label 6050 5150 2    50   ~ 0
PD5
Text Label 6050 5050 2    50   ~ 0
PD4
Entry Wire Line
	2900 4150 2800 4050
Entry Wire Line
	2900 4050 2800 3950
Entry Wire Line
	2900 3950 2800 3850
Entry Wire Line
	2900 3850 2800 3750
Entry Wire Line
	3000 4650 2900 4550
Entry Wire Line
	3000 4750 2900 4650
Entry Wire Line
	3000 4850 2900 4750
Entry Wire Line
	3000 4950 2900 4850
Text Label 3000 4650 0    50   ~ 0
H0
Text Label 3000 4750 0    50   ~ 0
H1
Text Label 3000 4850 0    50   ~ 0
H2
Text Label 3000 4950 0    50   ~ 0
H3
Entry Wire Line
	3000 5350 2900 5450
Entry Wire Line
	3000 5050 2900 5150
Entry Wire Line
	3000 5150 2900 5250
Entry Wire Line
	3000 5250 2900 5350
Text Label 3000 5050 0    50   ~ 0
H4
Text Label 3000 5150 0    50   ~ 0
H5
Text Label 3000 5250 0    50   ~ 0
H6
Text Label 3000 5350 0    50   ~ 0
H7
$Comp
L power:VCC #PWR0106
U 1 1 5E4DC06C
P 2150 5650
AR Path="/5DAA3954/5E4DC06C" Ref="#PWR0106"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4DC06C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4DC06C" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 2150 5500 50  0001 C CNN
F 1 "VCC" H 2167 5823 50  0000 C CNN
F 2 "" H 2150 5650 50  0001 C CNN
F 3 "" H 2150 5650 50  0001 C CNN
	1    2150 5650
	1    0    0    -1  
$EndComp
Text Label 2700 6250 0    50   ~ 0
H7
Text Label 2700 6150 0    50   ~ 0
H6
Text Label 2700 6050 0    50   ~ 0
H5
Text Label 2700 5950 0    50   ~ 0
H4
Entry Wire Line
	2900 6150 2800 6250
Entry Wire Line
	2900 6050 2800 6150
Entry Wire Line
	2900 5950 2800 6050
Entry Wire Line
	2900 5850 2800 5950
Text Label 4300 4950 0    50   ~ 0
DA3
Text Label 4300 4850 0    50   ~ 0
DA2
Text Label 4300 4750 0    50   ~ 0
DA1
Text Label 4300 4650 0    50   ~ 0
DA0
Wire Wire Line
	4250 4650 4450 4650
Wire Wire Line
	4250 4750 4450 4750
Wire Wire Line
	4250 4850 4450 4850
Wire Wire Line
	4250 4950 4450 4950
Entry Wire Line
	4450 5050 4550 4950
Entry Wire Line
	4450 4950 4550 4850
Entry Wire Line
	4450 4850 4550 4750
Entry Wire Line
	4450 4750 4550 4650
Text Label 4300 5350 0    50   ~ 0
DA7
Text Label 4300 5250 0    50   ~ 0
DA6
Text Label 4300 5150 0    50   ~ 0
DA5
Text Label 4300 5050 0    50   ~ 0
DA4
Wire Wire Line
	4250 5050 4450 5050
Wire Wire Line
	4250 5150 4450 5150
Wire Wire Line
	4250 5250 4450 5250
Wire Wire Line
	4250 5350 4450 5350
Entry Wire Line
	4450 4650 4550 4550
Entry Wire Line
	4450 5350 4550 5250
Entry Wire Line
	4450 5250 4550 5150
Entry Wire Line
	4450 5150 4550 5050
Text GLabel 4550 4450 1    50   Input ~ 0
DA[0..15]
$Comp
L power:VCC #PWR0107
U 1 1 5E4E6308
P 3750 4350
AR Path="/5DAA3954/5E4E6308" Ref="#PWR0107"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4E6308" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4E6308" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 3750 4200 50  0001 C CNN
F 1 "VCC" H 3767 4523 50  0000 C CNN
F 2 "" H 3750 4350 50  0001 C CNN
F 3 "" H 3750 4350 50  0001 C CNN
	1    3750 4350
	1    0    0    -1  
$EndComp
Text Label 4850 5050 2    50   ~ 0
DA12
Text Label 4850 5150 2    50   ~ 0
DA13
Text Label 4850 5250 2    50   ~ 0
DA14
Text Label 4850 5350 2    50   ~ 0
DA15
Wire Wire Line
	4850 5350 4650 5350
Wire Wire Line
	4850 5250 4650 5250
Wire Wire Line
	4850 5150 4650 5150
Wire Wire Line
	4850 5050 4650 5050
Entry Wire Line
	4550 4950 4650 5050
Entry Wire Line
	4550 5050 4650 5150
Entry Wire Line
	4550 5150 4650 5250
Entry Wire Line
	4550 5250 4650 5350
Text Label 4800 4650 2    50   ~ 0
DA8
Text Label 4800 4750 2    50   ~ 0
DA9
Text Label 4850 4850 2    50   ~ 0
DA10
Text Label 4850 4950 2    50   ~ 0
DA11
Wire Wire Line
	4850 4950 4650 4950
Wire Wire Line
	4850 4850 4650 4850
Wire Wire Line
	4850 4750 4650 4750
Wire Wire Line
	4850 4650 4650 4650
Entry Wire Line
	4550 4550 4650 4650
Entry Wire Line
	4550 4650 4650 4750
Entry Wire Line
	4550 4750 4650 4850
Entry Wire Line
	4550 4850 4650 4950
Text Label 6050 4950 2    50   ~ 0
PD3
Text Label 6050 4850 2    50   ~ 0
PD2
Text Label 6050 4750 2    50   ~ 0
PD1
Text Label 6050 4650 2    50   ~ 0
PD0
$Comp
L power:GNDD #PWR0113
U 1 1 5E721518
P 2150 7250
AR Path="/5DAA3954/5E721518" Ref="#PWR0113"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E721518" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E721518" Ref="#PWR0146"  Part="1" 
F 0 "#PWR0146" H 2150 7000 50  0001 C CNN
F 1 "GNDD" H 2154 7095 50  0000 C CNN
F 2 "" H 2150 7250 50  0001 C CNN
F 3 "" H 2150 7250 50  0001 C CNN
	1    2150 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0114
U 1 1 5E722349
P 3750 5950
AR Path="/5DAA3954/5E722349" Ref="#PWR0114"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E722349" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E722349" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 3750 5700 50  0001 C CNN
F 1 "GNDD" H 3754 5795 50  0000 C CNN
F 2 "" H 3750 5950 50  0001 C CNN
F 3 "" H 3750 5950 50  0001 C CNN
	1    3750 5950
	1    0    0    -1  
$EndComp
Text GLabel 1650 5950 0    50   Input ~ 0
1
Text GLabel 1650 6050 0    50   Input ~ 0
1
Text GLabel 1650 6150 0    50   Input ~ 0
1
Text GLabel 1650 6250 0    50   Input ~ 0
1
Text GLabel 1650 6650 0    50   Input ~ 0
1
Text GLabel 1650 6750 0    50   Input ~ 0
qclk2
Text GLabel 1650 6950 0    50   Input ~ 0
1
Text GLabel 3250 5650 0    50   Input ~ 0
qclk2
Entry Wire Line
	6050 4850 6150 4950
Entry Wire Line
	6050 4750 6150 4850
Entry Wire Line
	6050 4650 6150 4750
Entry Wire Line
	6050 4950 6150 5050
Entry Wire Line
	6050 5250 6150 5350
Entry Wire Line
	6050 5150 6150 5250
Entry Wire Line
	6050 5050 6150 5150
Entry Wire Line
	6050 5350 6150 5450
Text GLabel 5900 3450 0    50   Input ~ 0
nclk
Text GLabel 5100 3750 0    50   Input ~ 0
sclk
Text Label 3000 3750 0    50   ~ 0
H0
$Comp
L 74xx:74LS574 U31
U 1 1 5D660036
P 5350 5150
AR Path="/5DAA3954/5D660036" Ref="U31"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D660036" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5D660036" Ref="U31"  Part="1" 
F 0 "U31" H 5350 4950 50  0000 C CNN
F 1 "74F574" H 5350 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 5350 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 5350 5150 50  0001 C CNN
	1    5350 5150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN3
U 1 1 5D1C1190
P 5100 6900
AR Path="/5DAA3954/5D1C1190" Ref="RN3"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C1190" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C1190" Ref="RN4"  Part="1" 
F 0 "RN4" V 4450 6800 50  0000 L CNN
F 1 "1k" V 4550 6800 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 5575 6900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 5100 6900 50  0001 C CNN
	1    5100 6900
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0112
U 1 1 5D1C11D4
P 5350 6400
AR Path="/5DAA3954/5D1C11D4" Ref="#PWR0112"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C11D4" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5D1C11D4" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 5350 6250 50  0001 C CNN
F 1 "VCC" H 5367 6573 50  0000 C CNN
F 2 "" H 5350 6400 50  0001 C CNN
F 3 "" H 5350 6400 50  0001 C CNN
	1    5350 6400
	1    0    0    -1  
$EndComp
Text GLabel 6350 5650 3    50   Input ~ 0
FD[0..7]
$Comp
L power:VCC #PWR0125
U 1 1 5F174359
P 8550 4050
AR Path="/5DAA3954/5F174359" Ref="#PWR0125"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F174359" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F174359" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 8550 3900 50  0001 C CNN
F 1 "VCC" H 8567 4223 50  0000 C CNN
F 2 "" H 8550 4050 50  0001 C CNN
F 3 "" H 8550 4050 50  0001 C CNN
	1    8550 4050
	1    0    0    -1  
$EndComp
Text GLabel 6650 5650 0    50   Input ~ 0
0
$Comp
L power:VCC #PWR0124
U 1 1 5F161314
P 7150 4350
AR Path="/5DAA3954/5F161314" Ref="#PWR0124"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F161314" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F161314" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 7150 4200 50  0001 C CNN
F 1 "VCC" H 7167 4523 50  0000 C CNN
F 2 "" H 7150 4350 50  0001 C CNN
F 3 "" H 7150 4350 50  0001 C CNN
	1    7150 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0123
U 1 1 5F160896
P 8550 5750
AR Path="/5DAA3954/5F160896" Ref="#PWR0123"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F160896" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F160896" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 8550 5500 50  0001 C CNN
F 1 "GNDD" H 8554 5595 50  0000 C CNN
F 2 "" H 8550 5750 50  0001 C CNN
F 3 "" H 8550 5750 50  0001 C CNN
	1    8550 5750
	1    0    0    -1  
$EndComp
Text Label 6450 5350 0    50   ~ 0
FD7
Text Label 6450 5250 0    50   ~ 0
FD6
Text Label 6450 5150 0    50   ~ 0
FD5
Text Label 6450 5050 0    50   ~ 0
FD4
Text Label 6450 4950 0    50   ~ 0
FD3
Text Label 6450 4850 0    50   ~ 0
FD2
Text Label 6450 4750 0    50   ~ 0
FD1
Text Label 6450 4650 0    50   ~ 0
FD0
Entry Wire Line
	6350 5350 6450 5250
Entry Wire Line
	6350 5250 6450 5150
Entry Wire Line
	6350 5150 6450 5050
Entry Wire Line
	6350 5050 6450 4950
Entry Wire Line
	6350 4950 6450 4850
Entry Wire Line
	6350 4850 6450 4750
Entry Wire Line
	6350 4750 6450 4650
Entry Wire Line
	6350 5450 6450 5350
Wire Wire Line
	6450 5350 6650 5350
Wire Wire Line
	6450 5250 6650 5250
Wire Wire Line
	6450 5150 6650 5150
Wire Wire Line
	6450 5050 6650 5050
Wire Wire Line
	6450 4950 6650 4950
Wire Wire Line
	6450 4850 6650 4850
Wire Wire Line
	6450 4750 6650 4750
Wire Wire Line
	6450 4650 6650 4650
$Comp
L 74xx:74LS574 U34
U 1 1 5E4BEA85
P 7150 5150
AR Path="/5DAA3954/5E4BEA85" Ref="U34"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BEA85" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BEA85" Ref="U34"  Part="1" 
F 0 "U34" H 7150 4950 50  0000 C CNN
F 1 "74F574" H 7150 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 7150 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 7150 5150 50  0001 C CNN
	1    7150 5150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN4
U 1 1 5D1C1196
P 4000 6900
AR Path="/5DAA3954/5D1C1196" Ref="RN4"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5D1C1196" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5D1C1196" Ref="RN3"  Part="1" 
F 0 "RN3" V 3350 6800 50  0000 L CNN
F 1 "1k" V 3450 6800 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4475 6900 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4000 6900 50  0001 C CNN
	1    4000 6900
	0    -1   1    0   
$EndComp
Text GLabel 1650 4550 0    50   Input ~ 0
qclk2
Text GLabel 1650 4450 0    50   Input ~ 0
1
Text GLabel 1650 4350 0    50   Input ~ 0
1
$Comp
L power:VCC #PWR0108
U 1 1 5E4ED6D8
P 2150 3450
AR Path="/5DAA3954/5E4ED6D8" Ref="#PWR0108"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4ED6D8" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4ED6D8" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 2150 3300 50  0001 C CNN
F 1 "VCC" H 2167 3623 50  0000 C CNN
F 2 "" H 2150 3450 50  0001 C CNN
F 3 "" H 2150 3450 50  0001 C CNN
	1    2150 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0105
U 1 1 5E4DB628
P 2150 5050
AR Path="/5DAA3954/5E4DB628" Ref="#PWR0105"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4DB628" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E4DB628" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 2150 4800 50  0001 C CNN
F 1 "GNDD" H 2154 4895 50  0000 C CNN
F 2 "" H 2150 5050 50  0001 C CNN
F 3 "" H 2150 5050 50  0001 C CNN
	1    2150 5050
	1    0    0    -1  
$EndComp
Text Label 2700 3750 0    50   ~ 0
H0
Text Label 2700 3850 0    50   ~ 0
H1
Text Label 2700 3950 0    50   ~ 0
H2
Text Label 2700 4050 0    50   ~ 0
H3
$Comp
L 74xx:74LS163 U28
U 1 1 5E4B7483
P 2150 4250
AR Path="/5DAA3954/5E4B7483" Ref="U28"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4B7483" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4B7483" Ref="U28"  Part="1" 
F 0 "U28" H 2150 4450 50  0000 C CNN
F 1 "74F163" H 2150 4350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2150 4250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 2150 4250 50  0001 C CNN
	1    2150 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0133
U 1 1 5E732E82
P 3750 6400
AR Path="/5DAA3954/5E732E82" Ref="#PWR0133"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E732E82" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5E732E82" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 3750 6250 50  0001 C CNN
F 1 "VCC" H 3767 6573 50  0000 C CNN
F 2 "" H 3750 6400 50  0001 C CNN
F 3 "" H 3750 6400 50  0001 C CNN
	1    3750 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 6500 3750 6400
Wire Wire Line
	5850 4650 6050 4650
Wire Wire Line
	5850 4750 6050 4750
Wire Wire Line
	5850 4850 6050 4850
Wire Wire Line
	5850 4950 6050 4950
Wire Wire Line
	5850 5050 6050 5050
Wire Wire Line
	5850 5150 6050 5150
Wire Wire Line
	5850 5250 6050 5250
Text GLabel 9050 5250 2    50   Input ~ 0
dclk
Text GLabel 9050 4950 2    50   Input ~ 0
1
Text GLabel 9050 5050 2    50   Input ~ 0
1
Text GLabel 9050 5450 2    50   Input ~ 0
1
Text GLabel 9050 4650 2    50   Input ~ 0
1
Text GLabel 9050 4350 2    50   Input ~ 0
1
Text GLabel 9050 4450 2    50   Input ~ 0
1
Entry Wire Line
	7850 5450 7750 5350
Entry Wire Line
	7850 5350 7750 5250
Entry Wire Line
	7850 5250 7750 5150
Entry Wire Line
	7850 5150 7750 5050
Entry Wire Line
	7850 5050 7750 4950
Entry Wire Line
	7850 4950 7750 4850
Entry Wire Line
	7850 4850 7750 4750
Entry Wire Line
	7850 5450 7950 5350
Entry Wire Line
	7850 4750 7950 4650
Entry Wire Line
	7850 4850 7950 4750
Entry Wire Line
	7850 4950 7950 4850
Entry Wire Line
	7850 5050 7950 4950
Entry Wire Line
	7850 5150 7950 5050
Entry Wire Line
	7850 5250 7950 5150
Entry Wire Line
	7850 5350 7950 5250
Text Label 7650 4650 0    50   ~ 0
G0
Text Label 7650 4750 0    50   ~ 0
G1
Text Label 7650 4850 0    50   ~ 0
G2
Text Label 7650 4950 0    50   ~ 0
G3
Text Label 7650 5050 0    50   ~ 0
G4
Text Label 7650 5150 0    50   ~ 0
G5
Text Label 7650 5250 0    50   ~ 0
G6
Text Label 7650 5350 0    50   ~ 0
G7
Text Label 7950 4650 0    50   ~ 0
G0
Text Label 7950 4750 0    50   ~ 0
G1
Text Label 7950 4850 0    50   ~ 0
G2
Text Label 7950 4950 0    50   ~ 0
G3
Text Label 7950 5050 0    50   ~ 0
G4
Text Label 7950 5150 0    50   ~ 0
G5
Text Label 7950 5250 0    50   ~ 0
G6
Text Label 7950 5350 0    50   ~ 0
G7
Wire Wire Line
	5850 5350 6050 5350
Text GLabel 5850 5550 2    50   Input ~ 0
vcp
Wire Wire Line
	5350 6500 5350 6400
Entry Wire Line
	3000 3750 2900 3850
$Comp
L 74xx:74LS299 U35
U 1 1 5E4BD098
P 8550 4850
AR Path="/5DAA3954/5E4BD098" Ref="U35"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5E4BD098" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5E4BD098" Ref="U35"  Part="1" 
F 0 "U35" H 8550 4950 50  0000 C CNN
F 1 "74F299" H 8500 4850 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8550 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS299" H 8550 4850 50  0001 C CNN
	1    8550 4850
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DC7B04C
P 5350 5950
AR Path="/5DAA3954/5DC7B04C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC7B04C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5DC7B04C" Ref="#PWR0145"  Part="1" 
F 0 "#PWR0145" H 5350 5700 50  0001 C CNN
F 1 "GNDD" H 5354 5795 50  0000 C CNN
F 2 "" H 5350 5950 50  0001 C CNN
F 3 "" H 5350 5950 50  0001 C CNN
	1    5350 5950
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DC90855
P 5350 4350
AR Path="/5DAA3954/5DC90855" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC90855" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5DC90855" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 5350 4200 50  0001 C CNN
F 1 "VCC" H 5367 4523 50  0000 C CNN
F 2 "" H 5350 4350 50  0001 C CNN
F 3 "" H 5350 4350 50  0001 C CNN
	1    5350 4350
	1    0    0    -1  
$EndComp
Entry Wire Line
	7850 4750 7750 4650
NoConn ~ 8050 4350
Wire Wire Line
	7650 4650 7750 4650
Wire Wire Line
	7650 4750 7750 4750
Wire Wire Line
	7650 4850 7750 4850
Wire Wire Line
	7650 4950 7750 4950
Wire Wire Line
	7650 5050 7750 5050
Wire Wire Line
	7650 5150 7750 5150
Wire Wire Line
	7650 5250 7750 5250
Wire Wire Line
	7650 5350 7750 5350
Wire Wire Line
	7950 4650 8050 4650
Wire Wire Line
	7950 4750 8050 4750
Wire Wire Line
	7950 4850 8050 4850
Wire Wire Line
	7950 4950 8050 4950
Wire Wire Line
	7950 5050 8050 5050
Wire Wire Line
	7950 5150 8050 5150
Wire Wire Line
	7950 5250 8050 5250
Wire Wire Line
	7950 5350 8050 5350
Text GLabel 7850 5550 3    50   Output ~ 0
G[0..7]
Text GLabel 6650 5550 0    50   Input ~ 0
pclk2
Text GLabel 9350 3550 2    50   Output ~ 0
s1
Text GLabel 5850 5650 2    50   Input ~ 0
~voe
Wire Wire Line
	9050 4750 9250 4750
$Comp
L power:GNDD #PWR0126
U 1 1 5F1A79BE
P 8550 3150
AR Path="/5DAA3954/5F1A79BE" Ref="#PWR0126"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5F1A79BE" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BD/5F1A79BE" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 8550 2900 50  0001 C CNN
F 1 "GNDD" H 8554 2995 50  0000 C CNN
F 2 "" H 8550 3150 50  0001 C CNN
F 3 "" H 8550 3150 50  0001 C CNN
	1    8550 3150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DC04EC2
P 2150 2050
AR Path="/5DAA3954/5DC04EC2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC04EC2" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5DC04EC2" Ref="U32"  Part="1" 
F 0 "U32" H 2150 1850 50  0000 C CNN
F 1 "74F574" H 2150 1750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2150 2050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2150 2050 50  0001 C CNN
	1    2150 2050
	1    0    0    -1  
$EndComp
Text Label 1450 2150 0    50   ~ 0
PD6
Entry Wire Line
	1450 2150 1350 2050
Wire Wire Line
	1450 2150 1650 2150
$Comp
L 74xx:74LS08 U?
U 2 1 5DCE5E0A
P 6200 3550
AR Path="/5CDEEC9F/5DCE5E0A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DCE5E0A" Ref="U?"  Part="2" 
AR Path="/5DCE5E0A" Ref="U?"  Part="2" 
AR Path="/5DA1E9BD/5DCE5E0A" Ref="U3"  Part="2" 
F 0 "U3" H 6200 3550 50  0000 C CNN
F 1 "74F08" H 6200 3750 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6200 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6200 3550 50  0001 C CNN
	2    6200 3550
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U?
U 1 1 5DCE5E10
P 5400 3650
AR Path="/5CDEEC9F/5DCE5E10" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DCE5E10" Ref="U?"  Part="1" 
AR Path="/5DCE5E10" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5DCE5E10" Ref="U3"  Part="1" 
F 0 "U3" H 5400 3650 50  0000 C CNN
F 1 "74F08" H 5400 3450 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5400 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5400 3650 50  0001 C CNN
	1    5400 3650
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 5E10A07A
P 5850 5550
AR Path="/5E10A07A" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BA/5E10A07A" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E10A07A" Ref="TP25"  Part="1" 
F 0 "TP25" H 5900 5650 50  0000 L CNN
F 1 "VCP" H 5600 5700 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6050 5550 50  0001 C CNN
F 3 "~" H 6050 5550 50  0001 C CNN
	1    5850 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 5E19A64A
P 2650 6450
AR Path="/5E19A64A" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BA/5E19A64A" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E19A64A" Ref="TP24"  Part="1" 
F 0 "TP24" H 2700 6550 50  0000 L CNN
F 1 "HBLANK" H 2400 6600 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 2850 6450 50  0001 C CNN
F 3 "~" H 2850 6450 50  0001 C CNN
	1    2650 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 5E24D2E2
P 5850 5650
AR Path="/5E24D2E2" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BA/5E24D2E2" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E24D2E2" Ref="TP26"  Part="1" 
F 0 "TP26" H 5600 5800 50  0000 L CNN
F 1 "~VOE" H 5600 5800 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6050 5650 50  0001 C CNN
F 3 "~" H 6050 5650 50  0001 C CNN
	1    5850 5650
	-1   0    0    1   
$EndComp
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 5E199218
P 6650 2450
AR Path="/5E199218" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BA/5E199218" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E199218" Ref="TP27"  Part="1" 
F 0 "TP27" H 6400 2550 50  0000 L CNN
F 1 "FCP" H 6400 2600 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 6850 2450 50  0001 C CNN
F 3 "~" H 6850 2450 50  0001 C CNN
	1    6650 2450
	1    0    0    -1  
$EndComp
Text GLabel 9200 2850 0    50   Input ~ 0
mode3
Text GLabel 1650 4750 0    50   Input ~ 0
1
Wire Wire Line
	1150 2450 1250 2450
Wire Wire Line
	1250 2450 1250 4250
Wire Wire Line
	1250 4250 1250 6450
Connection ~ 1250 4250
Wire Wire Line
	1250 4250 1650 4250
Wire Wire Line
	1250 6450 1650 6450
Wire Wire Line
	1450 6550 1450 5350
Wire Wire Line
	1450 5350 2750 5350
Wire Wire Line
	1450 6550 1650 6550
Connection ~ 9250 3550
Wire Wire Line
	9250 3550 9350 3550
$Comp
L 74xx:74LS157 U?
U 1 1 5F980CCE
P 8550 2150
AR Path="/5F980CCE" Ref="U?"  Part="1" 
AR Path="/5DA1E9BD/5F980CCE" Ref="U37"  Part="1" 
F 0 "U37" H 8550 2350 50  0000 C CNN
F 1 "74F157" H 8550 2250 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8550 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS157" H 8550 2150 50  0001 C CNN
	1    8550 2150
	1    0    0    -1  
$EndComp
Text GLabel 8050 2450 0    50   Input ~ 0
1
Text GLabel 8050 2550 0    50   Input ~ 0
1
Text GLabel 2650 2150 2    50   Output ~ 0
vblank
Text GLabel 6650 2550 0    50   Input ~ 0
hblank
Text GLabel 8050 2850 0    50   Input ~ 0
hblank
Wire Wire Line
	8050 2750 7650 2750
Wire Wire Line
	7650 2750 7650 4450
Wire Wire Line
	7650 4450 8050 4450
$Comp
L 74xx:74LS86 U?
U 3 1 5E79B6AD
P 9500 2750
AR Path="/5E79B6AD" Ref="U?"  Part="3" 
AR Path="/5DA1E9BD/5E79B6AD" Ref="U1"  Part="3" 
F 0 "U1" H 9500 2750 50  0000 C CNN
F 1 "74F86" H 9500 2984 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9500 2750 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 9500 2750 50  0001 C CNN
	3    9500 2750
	1    0    0    -1  
$EndComp
Text GLabel 9800 2750 2    50   Output ~ 0
hsync
Wire Wire Line
	9050 2450 9100 2450
Wire Wire Line
	5700 3650 5900 3650
Wire Wire Line
	9250 3550 9250 4750
Wire Wire Line
	2650 1950 3650 1950
Text GLabel 4250 3450 0    50   Input ~ 0
1
$Comp
L 74xx:74LS86 U?
U 4 1 5E72FE45
P 4550 3550
AR Path="/5E72FE45" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5E72FE45" Ref="U1"  Part="4" 
AR Path="/5DA1E9BA/5E72FE45" Ref="U?"  Part="4" 
F 0 "U1" H 4550 3550 50  0000 C CNN
F 1 "74F86" H 4550 3784 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4550 3550 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 4550 3550 50  0001 C CNN
	4    4550 3550
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U?
U 4 1 5E79B5B5
P 3750 3650
AR Path="/5DAA3954/5E79B5B5" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5E79B5B5" Ref="U?"  Part="4" 
AR Path="/5E79B5B5" Ref="U?"  Part="4" 
AR Path="/5DA1E9BD/5E79B5B5" Ref="U3"  Part="4" 
AR Path="/5DA1E9C0/5E79B5B5" Ref="U?"  Part="4" 
F 0 "U3" H 3750 3650 50  0000 C CNN
F 1 "74F08" H 3750 3450 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3750 3650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3750 3650 50  0001 C CNN
	4    3750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3550 9250 3550
Wire Wire Line
	3000 3750 3450 3750
Wire Wire Line
	4050 3650 4250 3650
Wire Wire Line
	4850 3550 5100 3550
Text Label 2650 1950 0    50   ~ 0
mode0
Text GLabel 1650 2250 0    50   Input ~ 0
~hblank
Text GLabel 2650 2250 2    50   Output ~ 0
ps2tx
$Comp
L Connector:TestPoint_Alt TP?
U 1 1 5E144DCF
P 1150 2450
AR Path="/5E144DCF" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BA/5E144DCF" Ref="TP?"  Part="1" 
AR Path="/5DA1E9BD/5E144DCF" Ref="TP22"  Part="1" 
F 0 "TP22" H 900 2550 50  0000 L CNN
F 1 "SCP" H 900 2600 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_1.0x1.0mm" H 1350 2450 50  0001 C CNN
F 3 "~" H 1350 2450 50  0001 C CNN
	1    1150 2450
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5EC0E5B4
P 4800 2450
F 0 "JP2" V 4850 2250 50  0000 C CNN
F 1 "FONT" V 4750 2250 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4800 2450 50  0001 C CNN
F 3 "~" H 4800 2450 50  0001 C CNN
	1    4800 2450
	0    -1   -1   0   
$EndComp
Entry Wire Line
	5050 2250 5150 2150
Text Label 4850 2250 0    50   ~ 0
PA15
Wire Wire Line
	5050 2250 4800 2250
Wire Wire Line
	4800 2600 4800 2650
Wire Wire Line
	4800 2650 4700 2650
Wire Wire Line
	4700 2650 4700 2250
Wire Wire Line
	4700 2250 4650 2250
Wire Wire Line
	4800 2300 4800 2250
Wire Wire Line
	4650 1550 5050 1550
Wire Wire Line
	4650 1650 5050 1650
Wire Wire Line
	4650 1750 5050 1750
Wire Wire Line
	4650 1850 5050 1850
Wire Wire Line
	4650 1950 5050 1950
Wire Wire Line
	4650 2050 5050 2050
Wire Wire Line
	4650 2150 5050 2150
Wire Wire Line
	1250 2450 1650 2450
Connection ~ 1250 2450
Wire Wire Line
	9200 2650 9100 2650
Wire Wire Line
	9100 2650 9100 2450
Connection ~ 9100 2450
Wire Wire Line
	9100 2450 9200 2450
Text GLabel 9200 2450 2    50   Output ~ 0
~hblank
Wire Bus Line
	3050 2150 3050 2450
Wire Bus Line
	1350 1350 1350 2050
Wire Bus Line
	2900 3850 2900 4850
Wire Bus Line
	2900 5150 2900 6150
Wire Bus Line
	6150 4750 6150 5650
Wire Bus Line
	6350 4750 6350 5650
Wire Bus Line
	7850 4750 7850 5550
Wire Bus Line
	7850 1350 7850 2150
Wire Bus Line
	6350 1350 6350 2150
Wire Bus Line
	5150 1350 5150 2150
Wire Bus Line
	4550 4450 4550 7100
$EndSCHEMATC
