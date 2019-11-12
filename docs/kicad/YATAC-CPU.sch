EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 2 4
Title "Central Processing Unit"
Date "2019-11-10"
Rev "1.1.0"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	2650 4750 2800 4750
Wire Wire Line
	2650 4650 2800 4650
Wire Wire Line
	2650 4550 2800 4550
Wire Wire Line
	2650 4450 2800 4450
Wire Wire Line
	2650 4350 2800 4350
Wire Wire Line
	2650 4250 2800 4250
Wire Wire Line
	2650 4150 2800 4150
Wire Wire Line
	2650 4050 2800 4050
Wire Wire Line
	7100 5200 7250 5200
Wire Wire Line
	7100 5100 7250 5100
Wire Wire Line
	7100 5000 7250 5000
Wire Wire Line
	7100 4900 7250 4900
Wire Wire Line
	7100 4800 7250 4800
Wire Wire Line
	7100 4700 7250 4700
Wire Wire Line
	7100 4600 7250 4600
Wire Wire Line
	7100 4500 7250 4500
Wire Wire Line
	5250 2150 5400 2150
Wire Wire Line
	5250 2050 5400 2050
Wire Wire Line
	5250 1950 5400 1950
Wire Wire Line
	5250 1850 5400 1850
Wire Wire Line
	5250 1750 5400 1750
Wire Wire Line
	5250 1650 5400 1650
Wire Wire Line
	5250 1550 5400 1550
Wire Wire Line
	5250 1450 5400 1450
$Comp
L 74xx:74LS541 U?
U 1 1 5DAE3284
P 6600 5000
AR Path="/5F6C0B36/5DAE3284" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3284" Ref="U19"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3284" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3284" Ref="U15"  Part="1" 
F 0 "U15" H 6600 4800 50  0000 C CNN
F 1 "74F541" H 6600 4700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 6600 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 6600 5000 50  0001 C CNN
	1    6600 5000
	1    0    0    -1  
$EndComp
Text GLabel 10250 2900 1    50   Output ~ 0
PD[0..7]
Entry Bus Bus
	750  850  850  750 
Entry Bus Bus
	10150 750  10250 850 
Entry Wire Line
	8900 1550 8800 1650
Entry Wire Line
	8900 1650 8800 1750
Entry Wire Line
	8900 1750 8800 1850
Entry Wire Line
	8900 1850 8800 1950
Entry Wire Line
	8900 1950 8800 2050
Entry Wire Line
	8900 2050 8800 2150
Entry Wire Line
	8900 2150 8800 2250
Entry Wire Line
	8900 1450 8800 1550
Text Label 8550 1450 0    50   ~ 0
FD0
Text Label 8550 1550 0    50   ~ 0
FD1
Text Label 8550 1650 0    50   ~ 0
FD2
Text Label 8550 1750 0    50   ~ 0
FD3
Text Label 8550 1850 0    50   ~ 0
FD4
Text Label 8550 1950 0    50   ~ 0
FD5
Text Label 8550 2050 0    50   ~ 0
FD6
Text Label 8550 2150 0    50   ~ 0
FD7
Entry Wire Line
	3950 4250 4050 4150
Entry Wire Line
	3950 4350 4050 4250
Entry Wire Line
	3950 4450 4050 4350
Entry Wire Line
	3950 4550 4050 4450
Entry Wire Line
	3950 4650 4050 4550
Entry Wire Line
	3950 4750 4050 4650
Entry Wire Line
	3950 4050 4050 3950
Entry Wire Line
	3950 4150 4050 4050
Text Label 3800 4050 0    50   ~ 0
PD0
Text Label 3800 4150 0    50   ~ 0
PD1
Text Label 3800 4250 0    50   ~ 0
PD2
Text Label 3800 4350 0    50   ~ 0
PD3
Text Label 3800 4450 0    50   ~ 0
PD4
Text Label 3800 4550 0    50   ~ 0
PD5
Text Label 3800 4650 0    50   ~ 0
PD6
Text Label 3800 4750 0    50   ~ 0
PD7
Wire Wire Line
	3800 6800 3950 6800
Wire Wire Line
	3800 6700 3950 6700
Wire Wire Line
	3800 6600 3950 6600
Wire Wire Line
	3800 6500 3950 6500
Wire Wire Line
	3800 6400 3950 6400
Wire Wire Line
	3800 6200 3950 6200
Wire Wire Line
	3800 6100 3950 6100
Entry Wire Line
	3950 6800 4050 6900
Entry Wire Line
	3950 6700 4050 6800
Entry Wire Line
	3950 6600 4050 6700
Entry Wire Line
	3950 6500 4050 6600
Entry Wire Line
	3950 6100 4050 6000
Entry Wire Line
	3950 6200 4050 6100
Entry Wire Line
	3950 6300 4050 6200
Entry Wire Line
	3950 6400 4050 6300
Text Label 2650 6800 0    50   ~ 0
PA15
Text Label 2650 6700 0    50   ~ 0
PA14
Text Label 2650 6600 0    50   ~ 0
PA13
Text Label 2650 6500 0    50   ~ 0
PA12
Text Label 2650 6400 0    50   ~ 0
DD3
Text Label 2650 6300 0    50   ~ 0
DD2
Text Label 2650 6200 0    50   ~ 0
DD1
Text Label 2650 6100 0    50   ~ 0
DD0
Wire Wire Line
	2650 6100 2800 6100
Wire Wire Line
	2650 6200 2800 6200
Wire Wire Line
	2650 6300 2800 6300
Wire Wire Line
	2650 6400 2800 6400
Wire Wire Line
	2650 6500 2800 6500
Wire Wire Line
	2650 6600 2800 6600
Wire Wire Line
	2650 6700 2800 6700
Wire Wire Line
	2650 6800 2800 6800
Entry Wire Line
	2550 6000 2650 6100
Entry Wire Line
	2550 6100 2650 6200
Entry Wire Line
	2550 6200 2650 6300
Entry Wire Line
	2550 6300 2650 6400
Entry Wire Line
	2550 6600 2650 6500
Entry Wire Line
	2550 6700 2650 6600
Entry Wire Line
	2550 6800 2650 6700
Entry Wire Line
	2550 6900 2650 6800
Wire Wire Line
	3950 6300 3800 6300
Text Label 3800 6100 0    50   ~ 0
Ei0
Text Label 3800 6200 0    50   ~ 0
Ei1
Text Label 3800 6300 0    50   ~ 0
Ei2
Text Label 3800 6400 0    50   ~ 0
Ei3
Text Label 3800 6700 0    50   ~ 0
I14
Text Label 3800 6600 0    50   ~ 0
I13
Text Label 3800 6500 0    50   ~ 0
I12
Text Label 3800 6800 0    50   ~ 0
I15
Wire Wire Line
	10000 5300 10150 5300
Wire Wire Line
	10000 5200 10150 5200
Wire Wire Line
	10000 5100 10150 5100
Wire Wire Line
	10000 5000 10150 5000
Wire Wire Line
	10000 4900 10150 4900
Wire Wire Line
	10000 4800 10150 4800
Wire Wire Line
	10000 4700 10150 4700
Wire Wire Line
	10000 4600 10150 4600
Wire Wire Line
	7450 2950 7700 2950
Text GLabel 7700 3050 0    50   Input ~ 0
PA16
Text GLabel 7700 3150 0    50   Input ~ 0
PA17
Text GLabel 7700 3350 0    50   Input ~ 0
1
Text GLabel 7700 3550 0    50   Input ~ 0
0
Text GLabel 7700 3650 0    50   Input ~ 0
0
Text GLabel 7700 3450 0    50   Input ~ 0
1
Entry Wire Line
	7350 2950 7450 2850
Entry Wire Line
	7350 2850 7450 2750
Entry Wire Line
	7350 2750 7450 2650
Entry Wire Line
	7350 2650 7450 2550
Entry Wire Line
	7350 2550 7450 2450
Entry Wire Line
	7350 2450 7450 2350
Entry Wire Line
	7350 2350 7450 2250
Entry Wire Line
	7350 2250 7450 2150
Entry Wire Line
	7350 2150 7450 2050
Entry Wire Line
	7350 2050 7450 1950
Entry Wire Line
	7350 1950 7450 1850
Entry Wire Line
	7350 1850 7450 1750
Entry Wire Line
	7350 1750 7450 1650
Entry Wire Line
	7350 1650 7450 1550
Entry Wire Line
	7350 1550 7450 1450
Entry Wire Line
	7350 3050 7450 2950
Entry Wire Line
	7350 4500 7250 4600
Entry Wire Line
	7350 4600 7250 4700
Entry Wire Line
	7350 4700 7250 4800
Entry Wire Line
	7350 4800 7250 4900
Entry Wire Line
	7350 4900 7250 5000
Entry Wire Line
	7350 5000 7250 5100
Entry Wire Line
	7350 5100 7250 5200
Entry Wire Line
	7350 4400 7250 4500
Entry Wire Line
	2250 5550 2350 5450
Entry Wire Line
	2250 5650 2350 5550
Entry Wire Line
	750  5450 850  5550
Entry Wire Line
	750  5550 850  5650
Entry Wire Line
	750  5650 850  5750
Entry Wire Line
	750  5750 850  5850
Entry Wire Line
	750  5850 850  5950
Entry Wire Line
	750  5950 850  6050
Entry Wire Line
	7450 4600 7350 4500
Entry Wire Line
	7450 4900 7350 4800
Entry Wire Line
	7450 5200 7350 5100
Entry Wire Line
	7450 5500 7350 5400
Text Label 7450 4600 0    50   ~ 0
PA8
Text Label 7450 4900 0    50   ~ 0
PA9
Text Label 7450 5200 0    50   ~ 0
PA10
Text Label 7450 5500 0    50   ~ 0
PA11
Wire Wire Line
	7450 4600 7600 4600
Wire Wire Line
	7450 4900 7600 4900
Wire Wire Line
	7450 5500 7600 5500
Wire Wire Line
	7450 5200 7600 5200
Text Label 850  5550 0    50   ~ 0
PD0
Text Label 850  5650 0    50   ~ 0
PD1
Text Label 850  5750 0    50   ~ 0
PD2
Text Label 850  5850 0    50   ~ 0
PD3
Text Label 850  5950 0    50   ~ 0
PD4
Text Label 850  6050 0    50   ~ 0
PD5
Text GLabel 8600 5900 2    50   Input ~ 0
~alue
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3510
P 8100 6200
AR Path="/5F6C0B36/5DAE3510" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3510" Ref="#PWR0156"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3510" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3510" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 8100 5950 50  0001 C CNN
F 1 "GNDD" H 8104 6045 50  0000 C CNN
F 2 "" H 8100 6200 50  0001 C CNN
F 3 "" H 8100 6200 50  0001 C CNN
	1    8100 6200
	1    0    0    -1  
$EndComp
Text Label 7450 1450 0    50   ~ 0
PA0
Text Label 7450 1550 0    50   ~ 0
PA1
Text Label 7450 1650 0    50   ~ 0
PA2
Text Label 7450 1750 0    50   ~ 0
PA3
Text Label 7450 1850 0    50   ~ 0
PA4
Text Label 7450 1950 0    50   ~ 0
PA5
Text Label 7450 2050 0    50   ~ 0
PA6
Text Label 7450 2150 0    50   ~ 0
PA7
Text Label 7450 2250 0    50   ~ 0
PA8
Text Label 7450 2350 0    50   ~ 0
PA9
Text Label 7450 2450 0    50   ~ 0
PA10
Text Label 7450 2550 0    50   ~ 0
PA11
Text Label 7450 2650 0    50   ~ 0
PA12
Text Label 7450 2750 0    50   ~ 0
PA13
Text Label 7450 2850 0    50   ~ 0
PA14
Text Label 7450 2950 0    50   ~ 0
PA15
Text Label 2100 5550 0    50   ~ 0
Eo0
Text Label 2100 5650 0    50   ~ 0
Eo1
Text GLabel 1050 6550 0    50   Input ~ 0
0
Text GLabel 1050 6450 0    50   Input ~ 0
~ele
$Comp
L power:VCC #PWR?
U 1 1 5DAE3651
P 8100 1250
AR Path="/5F6C0B36/5DAE3651" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3651" Ref="#PWR0169"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3651" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3651" Ref="#PWR0129"  Part="1" 
F 0 "#PWR0129" H 8100 1100 50  0001 C CNN
F 1 "VCC" H 8117 1423 50  0000 C CNN
F 2 "" H 8100 1250 50  0001 C CNN
F 3 "" H 8100 1250 50  0001 C CNN
	1    8100 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3657
P 1550 5250
AR Path="/5F6C0B36/5DAE3657" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3657" Ref="#PWR0170"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3657" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3657" Ref="#PWR0130"  Part="1" 
F 0 "#PWR0130" H 1550 5100 50  0001 C CNN
F 1 "VCC" H 1567 5423 50  0000 C CNN
F 2 "" H 1550 5250 50  0001 C CNN
F 3 "" H 1550 5250 50  0001 C CNN
	1    1550 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2850 7700 2850
Wire Wire Line
	7450 2750 7700 2750
Wire Wire Line
	7450 2650 7700 2650
Wire Wire Line
	7450 2550 7700 2550
Wire Wire Line
	7450 2450 7700 2450
Wire Wire Line
	7450 2350 7700 2350
Wire Wire Line
	7450 2250 7700 2250
Wire Wire Line
	7450 2150 7700 2150
Wire Wire Line
	7450 2050 7700 2050
$Comp
L 74xx:74LS257 U?
U 1 1 5DAE32AE
P 8100 5200
AR Path="/5F6C0B36/5DAE32AE" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32AE" Ref="U22"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE32AE" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE32AE" Ref="U18"  Part="1" 
F 0 "U18" H 8100 5200 50  0000 C CNN
F 1 "74F257" H 8150 5100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8100 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 8100 5200 50  0001 C CNN
	1    8100 5200
	-1   0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3675
P 8100 4300
AR Path="/5F6C0B36/5DAE3675" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3675" Ref="#PWR0175"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3675" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3675" Ref="#PWR0133"  Part="1" 
F 0 "#PWR0133" H 8100 4150 50  0001 C CNN
F 1 "VCC" H 8117 4473 50  0000 C CNN
F 2 "" H 8100 4300 50  0001 C CNN
F 3 "" H 8100 4300 50  0001 C CNN
	1    8100 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35E5
P 1850 7150
AR Path="/5F6C0B36/5DAE35E5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35E5" Ref="#PWR0157"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE35E5" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE35E5" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 1850 6900 50  0001 C CNN
F 1 "GNDD" H 1854 6995 50  0000 C CNN
F 2 "" H 1850 7150 50  0001 C CNN
F 3 "" H 1850 7150 50  0001 C CNN
	1    1850 7150
	1    0    0    -1  
$EndComp
Text GLabel 8600 5800 2    50   Input ~ 0
hsel
$Comp
L power:GNDD #PWR?
U 1 1 5DAE34BA
P 8100 3850
AR Path="/5F6C0B36/5DAE34BA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE34BA" Ref="#PWR0155"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE34BA" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE34BA" Ref="#PWR0135"  Part="1" 
F 0 "#PWR0135" H 8100 3600 50  0001 C CNN
F 1 "GNDD" H 8104 3695 50  0000 C CNN
F 2 "" H 8100 3850 50  0001 C CNN
F 3 "" H 8100 3850 50  0001 C CNN
	1    8100 3850
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:27C020 U?
U 1 1 5DAE32A8
P 8100 2550
AR Path="/5F6C0B36/5DAE32A8" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32A8" Ref="U14"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE32A8" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE32A8" Ref="U20"  Part="1" 
F 0 "U20" H 8150 2550 50  0000 C CNN
F 1 "27C020" H 8150 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 8100 2550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/doc0570.pdf" H 8100 2550 50  0001 C CNN
	1    8100 2550
	1    0    0    -1  
$EndComp
Text Label 2100 5750 0    50   ~ 0
Eo2
Text Label 2100 5850 0    50   ~ 0
Eo3
Entry Wire Line
	2250 5750 2350 5650
Entry Wire Line
	2250 5850 2350 5750
Text GLabel 2050 6050 2    50   Output ~ 0
mode2
Wire Wire Line
	2050 5550 2250 5550
Wire Wire Line
	2050 5650 2250 5650
Wire Wire Line
	2050 5750 2250 5750
Wire Wire Line
	2050 5850 2250 5850
Text GLabel 10000 5500 2    50   Input ~ 0
~hlle
Text Label 10000 4600 0    50   ~ 0
PD0
Text Label 10000 4700 0    50   ~ 0
PD1
Text Label 10000 4800 0    50   ~ 0
PD2
Text Label 10000 4900 0    50   ~ 0
PD3
Text Label 10000 5000 0    50   ~ 0
PD4
Text Label 10000 5100 0    50   ~ 0
PD5
Text Label 10000 5200 0    50   ~ 0
PD6
Text Label 10000 5300 0    50   ~ 0
PD7
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE33C8
P 9500 5100
AR Path="/5F6C0B36/5DAE33C8" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33C8" Ref="U21"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE33C8" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE33C8" Ref="U17"  Part="1" 
F 0 "U17" H 9500 4900 50  0000 C CNN
F 1 "74F574" H 9500 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9500 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9500 5100 50  0001 C CNN
	1    9500 5100
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE368B
P 9500 5900
AR Path="/5F6C0B36/5DAE368B" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE368B" Ref="#PWR0178"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE368B" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE368B" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 9500 5650 50  0001 C CNN
F 1 "GNDD" H 9504 5745 50  0000 C CNN
F 2 "" H 9500 5900 50  0001 C CNN
F 3 "" H 9500 5900 50  0001 C CNN
	1    9500 5900
	1    0    0    -1  
$EndComp
Entry Wire Line
	10250 5000 10150 4900
Entry Wire Line
	10250 5100 10150 5000
Entry Wire Line
	10250 5200 10150 5100
Entry Wire Line
	10250 5300 10150 5200
Entry Wire Line
	10250 5400 10150 5300
Entry Wire Line
	10250 4700 10150 4600
Entry Wire Line
	10250 4800 10150 4700
Entry Wire Line
	10250 4900 10150 4800
Text GLabel 10000 5600 2    50   Input ~ 0
0
$Comp
L power:VCC #PWR?
U 1 1 5DAE3681
P 9500 4300
AR Path="/5F6C0B36/5DAE3681" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3681" Ref="#PWR0177"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3681" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3681" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 9500 4150 50  0001 C CNN
F 1 "VCC" H 9517 4473 50  0000 C CNN
F 2 "" H 9500 4300 50  0001 C CNN
F 3 "" H 9500 4300 50  0001 C CNN
	1    9500 4300
	1    0    0    -1  
$EndComp
Text GLabel 2250 6250 2    50   Output ~ 0
Q
Entry Bus Bus
	7250 1150 7350 1250
Wire Wire Line
	7450 1450 7700 1450
Wire Wire Line
	7450 1550 7700 1550
Wire Wire Line
	7450 1650 7700 1650
Wire Wire Line
	7450 1750 7700 1750
Wire Wire Line
	7450 1850 7700 1850
Wire Wire Line
	7450 1950 7700 1950
$Comp
L 74xx:74LS574 U?
U 1 1 5DCCEAA0
P 1550 6050
AR Path="/5F6C0B36/5DCCEAA0" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DCCEAA0" Ref="U23"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DCCEAA0" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DCCEAA0" Ref="U25"  Part="1" 
F 0 "U25" H 1550 5850 50  0000 C CNN
F 1 "74F574" H 1550 5750 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1550 6050 50  0001 C CNN
	1    1550 6050
	1    0    0    -1  
$EndComp
Entry Wire Line
	750  6050 850  6150
Entry Wire Line
	750  6150 850  6250
Text Label 850  6150 0    50   ~ 0
PD6
Text Label 850  6250 0    50   ~ 0
PD7
Text GLabel 2050 5950 2    50   Output ~ 0
mode1
$Comp
L Device:LED_ALT D2
U 1 1 5D8249BF
P 2150 6450
AR Path="/5DAA19D5/5D8249BF" Ref="D2"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5D8249BF" Ref="D?"  Part="1" 
AR Path="/5DA1E9BA/5D8249BF" Ref="D2"  Part="1" 
F 0 "D2" V 2150 6350 50  0000 R CNN
F 1 "4300H1LC" V 2098 6333 50  0001 R CNN
F 2 "LED_THT:LED_D5.0mm_Horizontal_O1.27mm_Z3.0mm" H 2150 6450 50  0001 C CNN
F 3 "~" H 2150 6450 50  0001 C CNN
	1    2150 6450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D844A3C
P 2150 6800
AR Path="/62D13D9D/5D844A3C" Ref="R?"  Part="1" 
AR Path="/5DAA19D5/5D844A3C" Ref="R3"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5D844A3C" Ref="R?"  Part="1" 
AR Path="/5DA1E9BA/5D844A3C" Ref="R1"  Part="1" 
F 0 "R1" H 2250 6850 50  0000 L CNN
F 1 "1k" H 2250 6750 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 2190 6790 50  0001 C CNN
F 3 "~" H 2150 6800 50  0001 C CNN
	1    2150 6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 7150 1850 7050
Text GLabel 2050 6150 2    50   Output ~ 0
mode3
Entry Wire Line
	7250 1850 7350 1950
Entry Wire Line
	7250 1950 7350 2050
Entry Wire Line
	7250 2050 7350 2150
Entry Wire Line
	7250 2150 7350 2250
Entry Wire Line
	7250 2250 7350 2350
Entry Wire Line
	7250 2350 7350 2450
Entry Wire Line
	7250 2450 7350 2550
Entry Wire Line
	7250 2550 7350 2650
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE33CE
P 6500 2350
AR Path="/5F6C0B36/5DAE33CE" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33CE" Ref="U20"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE33CE" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE33CE" Ref="U16"  Part="1" 
F 0 "U16" H 6500 2150 50  0000 C CNN
F 1 "74F574" H 6500 2050 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 6500 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6500 2350 50  0001 C CNN
	1    6500 2350
	1    0    0    -1  
$EndComp
Text Label 7100 1850 0    50   ~ 0
PA8
Text Label 7100 1950 0    50   ~ 0
PA9
Text Label 7050 2050 0    50   ~ 0
PA10
Text Label 7050 2150 0    50   ~ 0
PA11
Text Label 7050 2250 0    50   ~ 0
PA12
Text Label 7050 2350 0    50   ~ 0
PA13
Text Label 7050 2450 0    50   ~ 0
PA14
Text Label 7050 2550 0    50   ~ 0
PA15
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35F1
P 6500 3150
AR Path="/5F6C0B36/5DAE35F1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35F1" Ref="#PWR0158"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE35F1" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE35F1" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 6500 2900 50  0001 C CNN
F 1 "GNDD" H 6504 2995 50  0000 C CNN
F 2 "" H 6500 3150 50  0001 C CNN
F 3 "" H 6500 3150 50  0001 C CNN
	1    6500 3150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE367B
P 6500 1550
AR Path="/5F6C0B36/5DAE367B" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE367B" Ref="#PWR0176"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE367B" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE367B" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 6500 1400 50  0001 C CNN
F 1 "VCC" H 6517 1723 50  0000 C CNN
F 2 "" H 6500 1550 50  0001 C CNN
F 3 "" H 6500 1550 50  0001 C CNN
	1    6500 1550
	1    0    0    -1  
$EndComp
Entry Wire Line
	5800 4400 5900 4500
Entry Wire Line
	5800 4500 5900 4600
Entry Wire Line
	5800 4600 5900 4700
Entry Wire Line
	5800 4700 5900 4800
Text Label 5900 4500 0    50   ~ 0
PC0
Text Label 5900 4600 0    50   ~ 0
PC1
Text Label 5900 4700 0    50   ~ 0
PC2
Text Label 5900 4800 0    50   ~ 0
PC3
Entry Wire Line
	5800 5000 5900 4900
Entry Wire Line
	5800 5100 5900 5000
Entry Wire Line
	5800 5200 5900 5100
Entry Wire Line
	5800 5300 5900 5200
Text Label 5900 5100 0    50   ~ 0
PC6
Text Label 5900 5000 0    50   ~ 0
PC5
Text Label 5900 4900 0    50   ~ 0
PC4
Text Label 5900 5200 0    50   ~ 0
PC7
Text GLabel 6100 5500 0    50   Input ~ 0
qclk1
Text GLabel 6100 5400 0    50   Input ~ 0
alu
Text GLabel 5700 1650 1    50   Input ~ 0
PD[0..7]
Text GLabel 4250 2450 0    50   Input ~ 0
~poe
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE3272
P 4750 1950
AR Path="/5F6C0B36/5DAE3272" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3272" Ref="U16"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3272" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3272" Ref="U19"  Part="1" 
F 0 "U19" H 4750 1750 50  0000 C CNN
F 1 "74F574" H 4750 1650 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4750 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4750 1950 50  0001 C CNN
	1    4750 1950
	1    0    0    -1  
$EndComp
Entry Bus Bus
	5500 1250 5600 1150
$Comp
L YATAC-rescue:628128_DIP32_SSOP32-Memory_RAM U15
U 1 1 5DC9C530
P 3150 2250
AR Path="/5DAA19D5/5DC9C530" Ref="U15"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DC9C530" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DC9C530" Ref="U21"  Part="1" 
F 0 "U21" H 3150 2300 50  0000 C CNN
F 1 "AS6C1008" H 3150 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 3150 2250 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 3150 2250 50  0001 C CNN
	1    3150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1250 3150 1150
$Comp
L power:VCC #PWR?
U 1 1 5DAE363F
P 3150 1150
AR Path="/5F6C0B36/5DAE363F" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE363F" Ref="#PWR0166"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE363F" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE363F" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 3150 1000 50  0001 C CNN
F 1 "VCC" H 3167 1323 50  0000 C CNN
F 2 "" H 3150 1150 50  0001 C CNN
F 3 "" H 3150 1150 50  0001 C CNN
	1    3150 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1450 2650 1450
Wire Wire Line
	2450 1550 2650 1550
Wire Wire Line
	2450 1650 2650 1650
Wire Wire Line
	2450 1750 2650 1750
Wire Wire Line
	2450 1850 2650 1850
Wire Wire Line
	2450 1950 2650 1950
Wire Wire Line
	2450 2050 2650 2050
Wire Wire Line
	2450 2150 2650 2150
Wire Wire Line
	2450 2250 2650 2250
Wire Wire Line
	2450 2350 2650 2350
Wire Wire Line
	2450 2450 2650 2450
Wire Wire Line
	2450 2550 2650 2550
Wire Wire Line
	2450 2650 2650 2650
Wire Wire Line
	2450 2750 2650 2750
Wire Wire Line
	2450 2850 2650 2850
Wire Wire Line
	2450 2950 2650 2950
Text GLabel 4050 7200 3    50   Input ~ 0
I[0..15]
Text GLabel 3950 1350 1    50   Input ~ 0
DD[0..7]
$Comp
L 74xx:74LS244 U?
U 1 1 5DAE33FC
P 3300 6600
AR Path="/5F6C0B36/5DAE33FC" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33FC" Ref="U27"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE33FC" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE33FC" Ref="U26"  Part="1" 
F 0 "U26" H 3300 6400 50  0000 C CNN
F 1 "74F244" H 3300 6300 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3300 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 3300 6600 50  0001 C CNN
	1    3300 6600
	-1   0    0    -1  
$EndComp
Text GLabel 2550 7100 3    50   Output ~ 0
PA[0..15]
$Comp
L power:GNDD #PWR?
U 1 1 5DAE34AE
P 3300 7400
AR Path="/5F6C0B36/5DAE34AE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE34AE" Ref="#PWR0153"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE34AE" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE34AE" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 3300 7150 50  0001 C CNN
F 1 "GNDD" H 3304 7245 50  0000 C CNN
F 2 "" H 3300 7400 50  0001 C CNN
F 3 "" H 3300 7400 50  0001 C CNN
	1    3300 7400
	1    0    0    -1  
$EndComp
Text GLabel 3800 7100 2    50   Input ~ 0
~alue
Text GLabel 3800 7000 2    50   Input ~ 0
~eoe
$Comp
L power:VCC #PWR?
U 1 1 5DAE3669
P 3300 5800
AR Path="/5F6C0B36/5DAE3669" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3669" Ref="#PWR0173"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3669" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3669" Ref="#PWR0140"  Part="1" 
F 0 "#PWR0140" H 3300 5650 50  0001 C CNN
F 1 "VCC" H 3317 5973 50  0000 C CNN
F 2 "" H 3300 5800 50  0001 C CNN
F 3 "" H 3300 5800 50  0001 C CNN
	1    3300 5800
	1    0    0    -1  
$EndComp
Entry Bus Bus
	3850 3500 3950 3400
Entry Bus Bus
	2550 3600 2650 3500
$Comp
L power:VCC #PWR?
U 1 1 5F43317A
P 3300 3750
AR Path="/5F6C0B36/5F43317A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5F43317A" Ref="#PWR0146"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5F43317A" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5F43317A" Ref="#PWR0139"  Part="1" 
F 0 "#PWR0139" H 3300 3600 50  0001 C CNN
F 1 "VCC" H 3317 3923 50  0000 C CNN
F 2 "" H 3300 3750 50  0001 C CNN
F 3 "" H 3300 3750 50  0001 C CNN
	1    3300 3750
	1    0    0    -1  
$EndComp
Text GLabel 3800 5050 2    50   Input ~ 0
~aoe
$Comp
L 74xx:74LS574 U?
U 1 1 5F008C5E
P 3300 4550
AR Path="/5F6C0B36/5F008C5E" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5F008C5E" Ref="U26"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5F008C5E" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5F008C5E" Ref="U24"  Part="1" 
F 0 "U24" H 3300 4350 50  0000 C CNN
F 1 "74F574" H 3300 4250 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3300 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3300 4550 50  0001 C CNN
	1    3300 4550
	-1   0    0    -1  
$EndComp
Text GLabel 3800 4950 2    50   Input ~ 0
~ale
Text Label 2650 4750 0    50   ~ 0
DD7
Text Label 2650 4650 0    50   ~ 0
DD6
Text Label 2650 4550 0    50   ~ 0
DD5
Text Label 2650 4450 0    50   ~ 0
DD4
Text Label 2650 4350 0    50   ~ 0
DD3
Text Label 2650 4250 0    50   ~ 0
DD2
Text Label 2650 4150 0    50   ~ 0
DD1
Text Label 2650 4050 0    50   ~ 0
DD0
$Comp
L power:GNDD #PWR?
U 1 1 5F008C47
P 3300 5350
AR Path="/5F6C0B36/5F008C47" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5F008C47" Ref="#PWR0145"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5F008C47" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5F008C47" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 3300 5100 50  0001 C CNN
F 1 "GNDD" H 3304 5195 50  0000 C CNN
F 2 "" H 3300 5350 50  0001 C CNN
F 3 "" H 3300 5350 50  0001 C CNN
	1    3300 5350
	1    0    0    -1  
$EndComp
Entry Wire Line
	2550 4650 2650 4750
Entry Wire Line
	2550 4550 2650 4650
Entry Wire Line
	2550 4450 2650 4550
Entry Wire Line
	2550 4350 2650 4450
Entry Wire Line
	2550 4250 2650 4350
Entry Wire Line
	2550 4150 2650 4250
Entry Wire Line
	2550 4050 2650 4150
Entry Wire Line
	2550 3950 2650 4050
Text GLabel 3650 3050 2    50   Input ~ 0
1
Entry Wire Line
	2350 2250 2250 2150
Entry Wire Line
	2350 3050 2450 2950
Entry Wire Line
	2350 2950 2450 2850
Entry Wire Line
	2350 2850 2450 2750
Entry Wire Line
	2350 2750 2450 2650
Entry Wire Line
	2350 2650 2450 2550
Entry Wire Line
	2350 2550 2450 2450
Entry Wire Line
	2350 2450 2450 2350
Entry Wire Line
	2350 2350 2450 2250
Entry Wire Line
	2350 2250 2450 2150
Entry Wire Line
	2350 2150 2450 2050
Entry Wire Line
	2350 2050 2450 1950
Entry Wire Line
	2350 1950 2450 1850
Entry Wire Line
	2350 1850 2450 1750
Entry Wire Line
	2350 1750 2450 1650
Entry Wire Line
	2350 1650 2450 1550
Entry Wire Line
	2350 1550 2450 1450
Entry Wire Line
	2350 1550 2250 1450
Entry Wire Line
	2350 1650 2250 1550
Entry Wire Line
	2350 1750 2250 1650
Entry Wire Line
	2350 1850 2250 1750
Entry Wire Line
	2350 1950 2250 1850
Entry Wire Line
	2350 2050 2250 1950
Entry Wire Line
	2350 2150 2250 2050
Text Label 3700 1950 0    50   ~ 0
DD5
$Comp
L power:VCC #PWR?
U 1 1 5DAE365D
P 1550 3200
AR Path="/5F6C0B36/5DAE365D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE365D" Ref="#PWR0171"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE365D" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE365D" Ref="#PWR0131"  Part="1" 
F 0 "#PWR0131" H 1550 3050 50  0001 C CNN
F 1 "VCC" H 1567 3373 50  0000 C CNN
F 2 "" H 1550 3200 50  0001 C CNN
F 3 "" H 1550 3200 50  0001 C CNN
	1    1550 3200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3645
P 4750 1150
AR Path="/5F6C0B36/5DAE3645" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3645" Ref="#PWR0167"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3645" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3645" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 4750 1000 50  0001 C CNN
F 1 "VCC" H 4767 1323 50  0000 C CNN
F 2 "" H 4750 1150 50  0001 C CNN
F 3 "" H 4750 1150 50  0001 C CNN
	1    4750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3639
P 1550 1150
AR Path="/5F6C0B36/5DAE3639" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3639" Ref="#PWR0165"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3639" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3639" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 1550 1000 50  0001 C CNN
F 1 "VCC" H 1567 1323 50  0000 C CNN
F 2 "" H 1550 1150 50  0001 C CNN
F 3 "" H 1550 1150 50  0001 C CNN
	1    1550 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE362D
P 5050 5550
AR Path="/5F6C0B36/5DAE362D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE362D" Ref="#PWR0163"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE362D" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE362D" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 5050 5400 50  0001 C CNN
F 1 "VCC" H 5067 5723 50  0000 C CNN
F 2 "" H 5050 5550 50  0001 C CNN
F 3 "" H 5050 5550 50  0001 C CNN
	1    5050 5550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3623
P 6600 4200
AR Path="/5F6C0B36/5DAE3623" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3623" Ref="#PWR0162"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3623" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3623" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 6600 4050 50  0001 C CNN
F 1 "VCC" H 6617 4373 50  0000 C CNN
F 2 "" H 6600 4200 50  0001 C CNN
F 3 "" H 6600 4200 50  0001 C CNN
	1    6600 4200
	1    0    0    -1  
$EndComp
Text GLabel 5500 2350 3    50   Output ~ 0
PA[0..15]
Text Label 2450 2950 0    50   ~ 0
DA15
Text Label 2450 2850 0    50   ~ 0
DA14
Text Label 2450 2750 0    50   ~ 0
DA13
Text Label 2450 2650 0    50   ~ 0
DA12
Text Label 2450 2550 0    50   ~ 0
DA11
Text Label 2450 2450 0    50   ~ 0
DA10
Text Label 2450 2350 0    50   ~ 0
DA9
Text Label 2450 2250 0    50   ~ 0
DA8
Text Label 2450 2150 0    50   ~ 0
DA7
Text Label 2450 2050 0    50   ~ 0
DA6
Text Label 2450 1950 0    50   ~ 0
DA5
Text Label 2450 1850 0    50   ~ 0
DA4
Text Label 2450 1750 0    50   ~ 0
DA3
Text Label 2450 1650 0    50   ~ 0
DA2
Text Label 2450 1550 0    50   ~ 0
DA1
Text Label 2450 1450 0    50   ~ 0
DA0
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3603
P 3150 3250
AR Path="/5F6C0B36/5DAE3603" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3603" Ref="#PWR0161"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3603" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3603" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 3150 3000 50  0001 C CNN
F 1 "GNDD" H 3154 3095 50  0000 C CNN
F 2 "" H 3150 3250 50  0001 C CNN
F 3 "" H 3150 3250 50  0001 C CNN
	1    3150 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35FD
P 1550 2750
AR Path="/5F6C0B36/5DAE35FD" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35FD" Ref="#PWR0160"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE35FD" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE35FD" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 1550 2500 50  0001 C CNN
F 1 "GNDD" H 1554 2595 50  0000 C CNN
F 2 "" H 1550 2750 50  0001 C CNN
F 3 "" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35F7
P 1550 4800
AR Path="/5F6C0B36/5DAE35F7" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35F7" Ref="#PWR0159"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE35F7" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE35F7" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 1550 4550 50  0001 C CNN
F 1 "GNDD" H 1554 4645 50  0000 C CNN
F 2 "" H 1550 4800 50  0001 C CNN
F 3 "" H 1550 4800 50  0001 C CNN
	1    1550 4800
	1    0    0    -1  
$EndComp
Text GLabel 4250 2350 0    50   Input ~ 0
mclk
Text Label 2050 4200 0    50   ~ 0
DA15
Text Label 2050 4100 0    50   ~ 0
DA14
Text Label 2050 4000 0    50   ~ 0
DA13
Text Label 2050 3900 0    50   ~ 0
DA12
Text Label 2050 3800 0    50   ~ 0
DA11
Text Label 2050 3700 0    50   ~ 0
DA10
Text Label 2100 3600 0    50   ~ 0
DA9
Text Label 2100 3500 0    50   ~ 0
DA8
Text Label 2100 2150 0    50   ~ 0
DA7
Text Label 2100 2050 0    50   ~ 0
DA6
Text Label 2100 1950 0    50   ~ 0
DA5
Text Label 2100 1850 0    50   ~ 0
DA4
Text Label 2100 1750 0    50   ~ 0
DA3
Text Label 2100 1650 0    50   ~ 0
DA2
Text Label 2100 1550 0    50   ~ 0
DA1
Text Label 2100 1450 0    50   ~ 0
DA0
Text GLabel 1050 4500 0    50   Input ~ 0
pclk2
Text GLabel 1050 4400 0    50   Input ~ 0
~yle
Text GLabel 1050 2350 0    50   Input ~ 0
~xle
Text GLabel 1050 2450 0    50   Input ~ 0
~xoe
Text Label 850  4200 0    50   ~ 0
PD7
Text Label 850  4100 0    50   ~ 0
PD6
Text Label 850  4000 0    50   ~ 0
PD5
Text Label 850  3900 0    50   ~ 0
PD4
Text Label 850  2150 0    50   ~ 0
PD7
Text Label 850  2050 0    50   ~ 0
PD6
Text Label 850  1950 0    50   ~ 0
PD5
Text Label 850  1850 0    50   ~ 0
PD4
Text Label 850  1750 0    50   ~ 0
PD3
Text Label 850  1650 0    50   ~ 0
PD2
Text Label 850  1550 0    50   ~ 0
PD1
Text Label 850  1450 0    50   ~ 0
PD0
Text Label 5800 2550 0    50   ~ 0
PD7
Text Label 5800 2450 0    50   ~ 0
PD6
Text Label 5800 2350 0    50   ~ 0
PD5
Text Label 5800 2250 0    50   ~ 0
PD4
Text Label 5800 2150 0    50   ~ 0
PD3
Text Label 5800 2050 0    50   ~ 0
PD2
Text Label 5800 1950 0    50   ~ 0
PD1
Text Label 5800 1850 0    50   ~ 0
PD0
Text GLabel 6000 2750 0    50   Input ~ 0
~pgle
Text GLabel 6000 2850 0    50   Input ~ 0
~pgoe
Text Label 4050 2150 0    50   ~ 0
DD7
Text Label 4050 2050 0    50   ~ 0
DD6
Text Label 4050 1950 0    50   ~ 0
DD5
Text Label 4050 1850 0    50   ~ 0
DD4
Text Label 4050 1750 0    50   ~ 0
DD3
Text Label 4050 1650 0    50   ~ 0
DD2
Text Label 4050 1550 0    50   ~ 0
DD1
Text Label 4050 1450 0    50   ~ 0
DD0
Text Label 3700 2150 0    50   ~ 0
DD7
Text Label 3700 2050 0    50   ~ 0
DD6
Text Label 3700 1850 0    50   ~ 0
DD4
Text Label 3700 1750 0    50   ~ 0
DD3
Text Label 3700 1650 0    50   ~ 0
DD2
Text Label 3700 1550 0    50   ~ 0
DD1
Text Label 3700 1450 0    50   ~ 0
DD0
Text Label 5250 2150 0    50   ~ 0
PA7
Text Label 5250 2050 0    50   ~ 0
PA6
Text Label 5250 1950 0    50   ~ 0
PA5
Text Label 5250 1850 0    50   ~ 0
PA4
Text Label 5250 1750 0    50   ~ 0
PA3
Text Label 5250 1650 0    50   ~ 0
PA2
Text Label 5250 1550 0    50   ~ 0
PA1
Text Label 5250 1450 0    50   ~ 0
PA0
Text Label 7100 5200 0    50   ~ 0
PA7
Text Label 7100 5100 0    50   ~ 0
PA6
Text Label 7100 5000 0    50   ~ 0
PA5
Text Label 7100 4900 0    50   ~ 0
PA4
Text Label 7100 4800 0    50   ~ 0
PA3
Text Label 7100 4700 0    50   ~ 0
PA2
Text Label 7100 4600 0    50   ~ 0
PA1
Text Label 7100 4500 0    50   ~ 0
PA0
Text GLabel 2350 1350 1    50   Input ~ 0
DA[0..15]
Entry Wire Line
	750  4100 850  4200
Entry Wire Line
	750  4000 850  4100
Entry Wire Line
	750  3900 850  4000
Entry Wire Line
	750  3800 850  3900
$Comp
L power:GNDD #PWR?
U 1 1 5DAE346C
P 4750 2750
AR Path="/5F6C0B36/5DAE346C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE346C" Ref="#PWR0151"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE346C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE346C" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 4750 2500 50  0001 C CNN
F 1 "GNDD" H 4754 2595 50  0000 C CNN
F 2 "" H 4750 2750 50  0001 C CNN
F 3 "" H 4750 2750 50  0001 C CNN
	1    4750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE345E
P 6600 5800
AR Path="/5F6C0B36/5DAE345E" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE345E" Ref="#PWR0149"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE345E" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE345E" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 6600 5550 50  0001 C CNN
F 1 "GNDD" H 6604 5645 50  0000 C CNN
F 2 "" H 6600 5800 50  0001 C CNN
F 3 "" H 6600 5800 50  0001 C CNN
	1    6600 5800
	1    0    0    -1  
$EndComp
Entry Wire Line
	5800 2550 5700 2450
Entry Wire Line
	5800 2450 5700 2350
Entry Wire Line
	5800 2350 5700 2250
Entry Wire Line
	5800 2250 5700 2150
Entry Wire Line
	5800 2150 5700 2050
Entry Wire Line
	5800 2050 5700 1950
Entry Wire Line
	5800 1950 5700 1850
Entry Wire Line
	5800 1850 5700 1750
Wire Wire Line
	2050 3500 2250 3500
Wire Wire Line
	2050 3600 2250 3600
Wire Wire Line
	2050 3700 2250 3700
Wire Wire Line
	2050 3800 2250 3800
Wire Wire Line
	2050 3900 2250 3900
Wire Wire Line
	2050 4000 2250 4000
Wire Wire Line
	2050 4100 2250 4100
Wire Wire Line
	2050 4200 2250 4200
Entry Wire Line
	2250 3500 2350 3400
Entry Wire Line
	2250 4200 2350 4100
Entry Wire Line
	2250 4100 2350 4000
Entry Wire Line
	2250 4000 2350 3900
Entry Wire Line
	2250 3900 2350 3800
Entry Wire Line
	2250 3800 2350 3700
Entry Wire Line
	2250 3700 2350 3600
Entry Wire Line
	2250 3600 2350 3500
Entry Wire Line
	750  2050 850  2150
Entry Wire Line
	750  1950 850  2050
Entry Wire Line
	750  1850 850  1950
Entry Wire Line
	750  1750 850  1850
Entry Wire Line
	750  1650 850  1750
Entry Wire Line
	750  1550 850  1650
Entry Wire Line
	750  1450 850  1550
Entry Wire Line
	750  1350 850  1450
Wire Wire Line
	3650 1450 3850 1450
Wire Wire Line
	3650 1550 3850 1550
Wire Wire Line
	3650 1650 3850 1650
Wire Wire Line
	3650 1750 3850 1750
Wire Wire Line
	3650 1850 3850 1850
Wire Wire Line
	3650 1950 3850 1950
Wire Wire Line
	3650 2050 3850 2050
Wire Wire Line
	3650 2150 3850 2150
Wire Wire Line
	4050 2150 4250 2150
Wire Wire Line
	4050 2050 4250 2050
Wire Wire Line
	4050 1950 4250 1950
Wire Wire Line
	4050 1850 4250 1850
Wire Wire Line
	4050 1750 4250 1750
Wire Wire Line
	4050 1650 4250 1650
Wire Wire Line
	4050 1550 4250 1550
Wire Wire Line
	4050 1450 4250 1450
Wire Wire Line
	2050 2150 2250 2150
Wire Wire Line
	2050 2050 2250 2050
Wire Wire Line
	2050 1950 2250 1950
Wire Wire Line
	2050 1850 2250 1850
Wire Wire Line
	2050 1750 2250 1750
Wire Wire Line
	2050 1650 2250 1650
Wire Wire Line
	2050 1550 2250 1550
Wire Wire Line
	2050 1450 2250 1450
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE32D4
P 1550 1950
AR Path="/5F6C0B36/5DAE32D4" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32D4" Ref="U24"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE32D4" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE32D4" Ref="U22"  Part="1" 
F 0 "U22" H 1550 1750 50  0000 C CNN
F 1 "74F574" H 1550 1650 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1550 1950 50  0001 C CNN
	1    1550 1950
	1    0    0    -1  
$EndComp
Entry Wire Line
	5500 2250 5400 2150
Entry Wire Line
	5500 2150 5400 2050
Entry Wire Line
	5500 2050 5400 1950
Entry Wire Line
	5500 1950 5400 1850
Entry Wire Line
	5500 1850 5400 1750
Entry Wire Line
	5500 1750 5400 1650
Entry Wire Line
	5500 1650 5400 1550
Entry Wire Line
	5500 1550 5400 1450
Entry Wire Line
	3950 2150 4050 2050
Entry Wire Line
	3950 2050 4050 1950
Entry Wire Line
	3950 1950 4050 1850
Entry Wire Line
	3950 1850 4050 1750
Entry Wire Line
	3950 1750 4050 1650
Entry Wire Line
	3950 1650 4050 1550
Entry Wire Line
	3950 1550 4050 1450
Entry Wire Line
	3950 2250 4050 2150
Text GLabel 2650 3050 0    50   Input ~ 0
DA16
Entry Wire Line
	3950 2250 3850 2150
Entry Wire Line
	3950 2150 3850 2050
Entry Wire Line
	3950 2050 3850 1950
Entry Wire Line
	3950 1950 3850 1850
Entry Wire Line
	3950 1850 3850 1750
Entry Wire Line
	3950 1750 3850 1650
Entry Wire Line
	3950 1650 3850 1550
Entry Wire Line
	3950 1550 3850 1450
Text GLabel 3650 2950 2    50   Input ~ 0
1
Text GLabel 3650 2450 2    50   Input ~ 0
0
Text GLabel 3650 2650 2    50   Input ~ 0
~dwe
Text GLabel 3650 2550 2    50   Input ~ 0
~doe
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE326C
P 1550 4000
AR Path="/5F6C0B36/5DAE326C" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE326C" Ref="U25"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE326C" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE326C" Ref="U23"  Part="1" 
F 0 "U23" H 1550 3800 50  0000 C CNN
F 1 "74F574" H 1550 3700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1550 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1550 4000 50  0001 C CNN
	1    1550 4000
	1    0    0    -1  
$EndComp
Entry Wire Line
	750  3400 850  3500
Entry Wire Line
	750  3500 850  3600
Entry Wire Line
	750  3600 850  3700
Entry Wire Line
	750  3700 850  3800
Text Label 850  3500 0    50   ~ 0
PD0
Text Label 850  3600 0    50   ~ 0
PD1
Text Label 850  3700 0    50   ~ 0
PD2
Text Label 850  3800 0    50   ~ 0
PD3
Wire Wire Line
	4450 6150 4550 6150
Wire Wire Line
	4450 6050 4550 6050
Wire Wire Line
	4450 5950 4550 5950
Wire Wire Line
	4450 5850 4550 5850
Text Label 4450 5850 0    50   ~ 0
FD4
Entry Wire Line
	4350 5750 4450 5850
Entry Wire Line
	4350 5850 4450 5950
Entry Wire Line
	4350 5950 4450 6050
Entry Wire Line
	4350 6050 4450 6150
Text Label 4450 5950 0    50   ~ 0
FD5
Text Label 4450 6050 0    50   ~ 0
FD6
Text Label 4450 6150 0    50   ~ 0
FD7
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3464
P 5050 7150
AR Path="/5F6C0B36/5DAE3464" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3464" Ref="#PWR0150"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3464" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3464" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 5050 6900 50  0001 C CNN
F 1 "GNDD" H 5054 6995 50  0000 C CNN
F 2 "" H 5050 7150 50  0001 C CNN
F 3 "" H 5050 7150 50  0001 C CNN
	1    5050 7150
	1    0    0    -1  
$EndComp
NoConn ~ 5550 6350
$Comp
L 74xx:74LS163 U?
U 1 1 5DAE3479
P 5050 6350
AR Path="/5F6C0B36/5DAE3479" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3479" Ref="U18"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3479" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3479" Ref="U14"  Part="1" 
F 0 "U14" H 5050 6550 50  0000 C CNN
F 1 "74F163" H 5050 6450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5050 6350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 5050 6350 50  0001 C CNN
	1    5050 6350
	1    0    0    -1  
$EndComp
Text GLabel 4550 6650 0    50   Input ~ 0
mclk
Text GLabel 4550 6450 0    50   Input ~ 0
1
Text GLabel 4550 6850 0    50   Input ~ 0
~pgle
Text GLabel 4550 6350 0    50   Input ~ 0
~pcle
Entry Wire Line
	5700 5850 5800 5750
Entry Wire Line
	5700 5950 5800 5850
Entry Wire Line
	5700 6050 5800 5950
Entry Wire Line
	5700 6150 5800 6050
Text Label 5550 6150 0    50   ~ 0
PC7
Text Label 5550 6050 0    50   ~ 0
PC6
Text Label 5550 5950 0    50   ~ 0
PC5
Text Label 5550 5850 0    50   ~ 0
PC4
Wire Wire Line
	5550 5850 5700 5850
Wire Wire Line
	5550 5950 5700 5950
Wire Wire Line
	5550 6050 5700 6050
Wire Wire Line
	5550 6150 5700 6150
Wire Wire Line
	4200 6550 4550 6550
$Comp
L power:VCC #PWR?
U 1 1 5DA9E243
P 9500 1150
AR Path="/5F6C0B36/5DA9E243" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DA9E243" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DA9E243" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DA9E243" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 9500 1000 50  0001 C CNN
F 1 "VCC" H 9517 1323 50  0000 C CNN
F 2 "" H 9500 1150 50  0001 C CNN
F 3 "" H 9500 1150 50  0001 C CNN
	1    9500 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 2150 10150 2150
Wire Wire Line
	10000 2050 10150 2050
Wire Wire Line
	10000 1950 10150 1950
Wire Wire Line
	10000 1850 10150 1850
Wire Wire Line
	10000 1750 10150 1750
Wire Wire Line
	10000 1650 10150 1650
Wire Wire Line
	10000 1550 10150 1550
Wire Wire Line
	10000 1450 10150 1450
Text Label 10000 1450 0    50   ~ 0
PD0
Text Label 10000 1550 0    50   ~ 0
PD1
Text Label 10000 1650 0    50   ~ 0
PD2
Text Label 10000 1750 0    50   ~ 0
PD3
Text Label 10000 1850 0    50   ~ 0
PD4
Text Label 10000 1950 0    50   ~ 0
PD5
Text Label 10000 2050 0    50   ~ 0
PD6
Text Label 10000 2150 0    50   ~ 0
PD7
Entry Wire Line
	10150 1850 10250 1750
Entry Wire Line
	10150 1950 10250 1850
Entry Wire Line
	10150 2050 10250 1950
Entry Wire Line
	10150 2150 10250 2050
Entry Wire Line
	10150 1450 10250 1350
Entry Wire Line
	10150 1550 10250 1450
Entry Wire Line
	10150 1650 10250 1550
Entry Wire Line
	10150 1750 10250 1650
Wire Wire Line
	8500 1450 8700 1450
Wire Wire Line
	8500 1550 8700 1550
Wire Wire Line
	8500 1650 8700 1650
Wire Wire Line
	8500 1750 8700 1750
Wire Wire Line
	8500 1850 8700 1850
Wire Wire Line
	8500 1950 8700 1950
Wire Wire Line
	8500 2050 8700 2050
Wire Wire Line
	8500 2150 8700 2150
Text Label 8900 2150 0    50   ~ 0
FD7
Text Label 8900 2050 0    50   ~ 0
FD6
Text Label 8900 1950 0    50   ~ 0
FD5
Text Label 8900 1850 0    50   ~ 0
FD4
Entry Wire Line
	8800 2250 8700 2150
Entry Wire Line
	8800 2150 8700 2050
Entry Wire Line
	8800 2050 8700 1950
Entry Wire Line
	8800 1950 8700 1850
Entry Wire Line
	8800 1550 8700 1450
Entry Wire Line
	8800 1650 8700 1550
Entry Wire Line
	8800 1750 8700 1650
Entry Wire Line
	8800 1850 8700 1750
Text Label 8900 1450 0    50   ~ 0
FD0
Text Label 8900 1550 0    50   ~ 0
FD1
Text Label 8900 1650 0    50   ~ 0
FD2
Text Label 8900 1750 0    50   ~ 0
FD3
Wire Wire Line
	8900 1450 9000 1450
Wire Wire Line
	8900 1550 9000 1550
Wire Wire Line
	8900 1650 9000 1650
Wire Wire Line
	8900 1750 9000 1750
Wire Wire Line
	8900 1850 9000 1850
Wire Wire Line
	8900 1950 9000 1950
Wire Wire Line
	8900 2050 9000 2050
Wire Wire Line
	8900 2150 9000 2150
Wire Wire Line
	3800 4050 3950 4050
Wire Wire Line
	3800 4150 3950 4150
Wire Wire Line
	3800 4250 3950 4250
Wire Wire Line
	3800 4350 3950 4350
Wire Wire Line
	3800 4450 3950 4450
Wire Wire Line
	3800 4550 3950 4550
Wire Wire Line
	3800 4650 3950 4650
Wire Wire Line
	3800 4750 3950 4750
Wire Bus Line
	2650 3500 3850 3500
Text GLabel 4050 3850 1    50   Input ~ 0
PD[0..7]
Text GLabel 8800 2550 3    50   Output ~ 0
FD[0..7]
Wire Wire Line
	2150 7050 2150 6950
Wire Wire Line
	1550 7050 1550 6850
Connection ~ 1850 7050
Wire Wire Line
	1850 7050 2150 7050
Wire Wire Line
	1550 7050 1850 7050
Wire Wire Line
	7000 2550 7250 2550
Wire Wire Line
	7000 2450 7250 2450
Wire Wire Line
	7000 2350 7250 2350
Wire Wire Line
	7000 2250 7250 2250
Wire Wire Line
	7000 2150 7250 2150
Wire Wire Line
	7000 2050 7250 2050
Wire Wire Line
	7000 1950 7250 1950
Wire Wire Line
	7000 1850 7250 1850
Wire Wire Line
	4450 3850 4550 3850
Wire Wire Line
	4450 3750 4550 3750
Wire Wire Line
	4450 3650 4550 3650
Wire Wire Line
	4450 3550 4550 3550
Text Label 4450 3850 0    50   ~ 0
FD3
Text Label 4450 3750 0    50   ~ 0
FD2
Text Label 4450 3650 0    50   ~ 0
FD1
Text Label 4450 3550 0    50   ~ 0
FD0
Entry Wire Line
	4350 3750 4450 3850
Entry Wire Line
	4350 3650 4450 3750
Entry Wire Line
	4350 3550 4450 3650
Entry Wire Line
	4350 3450 4450 3550
$Comp
L 74xx:74LS163 U?
U 1 1 5DAE328A
P 5050 4050
AR Path="/5F6C0B36/5DAE328A" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE328A" Ref="U17"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE328A" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DAE328A" Ref="U13"  Part="1" 
F 0 "U13" H 5050 4250 50  0000 C CNN
F 1 "74F163" H 5050 4150 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5050 4050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 5050 4050 50  0001 C CNN
	1    5050 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3458
P 5050 4850
AR Path="/5F6C0B36/5DAE3458" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3458" Ref="#PWR0148"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3458" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3458" Ref="#PWR0115"  Part="1" 
F 0 "#PWR0115" H 5050 4600 50  0001 C CNN
F 1 "GNDD" H 5054 4695 50  0000 C CNN
F 2 "" H 5050 4850 50  0001 C CNN
F 3 "" H 5050 4850 50  0001 C CNN
	1    5050 4850
	1    0    0    -1  
$EndComp
Text GLabel 4550 4250 0    50   Input ~ 0
pcent
Text GLabel 4550 4350 0    50   Input ~ 0
mclk
Text GLabel 4550 4150 0    50   Input ~ 0
1
Text GLabel 4550 4550 0    50   Input ~ 0
~pgle
Text GLabel 4550 4050 0    50   Input ~ 0
~pcle
$Comp
L power:VCC #PWR?
U 1 1 5DAE3633
P 5050 3250
AR Path="/5F6C0B36/5DAE3633" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3633" Ref="#PWR0164"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DAE3633" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DAE3633" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5050 3100 50  0001 C CNN
F 1 "VCC" H 5067 3423 50  0000 C CNN
F 2 "" H 5050 3250 50  0001 C CNN
F 3 "" H 5050 3250 50  0001 C CNN
	1    5050 3250
	1    0    0    -1  
$EndComp
Text Label 5550 3550 0    50   ~ 0
PC0
Text Label 5550 3650 0    50   ~ 0
PC1
Text Label 5550 3750 0    50   ~ 0
PC2
Text Label 5550 3850 0    50   ~ 0
PC3
Entry Wire Line
	5800 3950 5700 3850
Entry Wire Line
	5800 3850 5700 3750
Entry Wire Line
	5800 3750 5700 3650
Entry Wire Line
	5800 3650 5700 3550
Wire Wire Line
	5550 3550 5700 3550
Wire Wire Line
	5550 3650 5700 3650
Wire Wire Line
	5550 3750 5700 3750
Wire Wire Line
	5550 3850 5700 3850
Wire Wire Line
	5600 4050 5550 4050
Wire Wire Line
	2050 6250 2150 6250
Wire Wire Line
	2150 6300 2150 6250
Connection ~ 2150 6250
Wire Wire Line
	2150 6250 2250 6250
Text GLabel 4350 3350 1    50   Input ~ 0
FD[0..7]
Text GLabel 4350 5650 1    50   Input ~ 0
FD[0..7]
Wire Wire Line
	2150 6650 2150 6600
Text GLabel 4050 5850 1    50   Input ~ 0
Ei[0..3]
Text GLabel 2350 5350 1    50   Output ~ 0
Eo[0..7]
Wire Wire Line
	8900 4900 8900 4700
Wire Wire Line
	8800 4700 8600 4700
Wire Wire Line
	8800 5000 8800 4700
Wire Wire Line
	8600 4900 8900 4900
Wire Wire Line
	8800 5000 9000 5000
Wire Wire Line
	8900 4700 9000 4700
Wire Wire Line
	8600 4600 9000 4600
Wire Wire Line
	8750 5300 8750 5200
Wire Wire Line
	8750 5200 9000 5200
Wire Wire Line
	8750 5100 8750 5000
Wire Wire Line
	8750 5100 9000 5100
Wire Wire Line
	8600 5000 8750 5000
Wire Wire Line
	8600 5300 8750 5300
Wire Wire Line
	8600 5200 8650 5200
Wire Wire Line
	8650 5200 8650 4800
Wire Wire Line
	8650 4800 9000 4800
Wire Wire Line
	8950 4900 9000 4900
Wire Wire Line
	8950 4900 8950 5500
Wire Wire Line
	8600 5500 8950 5500
Wire Wire Line
	8850 5600 8850 5300
Wire Wire Line
	8850 5300 9000 5300
Wire Wire Line
	8600 5600 8850 5600
Text Label 10000 3100 0    50   ~ 0
PD0
Text Label 10000 3200 0    50   ~ 0
PD1
Text Label 10000 3300 0    50   ~ 0
PD2
Text Label 10000 3400 0    50   ~ 0
PD3
Text Label 10000 3500 0    50   ~ 0
PD4
Text Label 10000 3600 0    50   ~ 0
PD5
Text Label 10000 3700 0    50   ~ 0
PD6
Text Label 10000 3800 0    50   ~ 0
PD7
Entry Wire Line
	10250 3500 10150 3400
Entry Wire Line
	10250 3600 10150 3500
Entry Wire Line
	10250 3700 10150 3600
Entry Wire Line
	10250 3800 10150 3700
Entry Wire Line
	10250 3900 10150 3800
Entry Wire Line
	10250 3200 10150 3100
Entry Wire Line
	10250 3300 10150 3200
Entry Wire Line
	10250 3400 10150 3300
$Comp
L power:GNDD #PWR?
U 1 1 5DC7127C
P 9400 3150
AR Path="/5F6C0B36/5DC7127C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DC7127C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DC7127C" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E9BA/5DC7127C" Ref="#PWR0190"  Part="1" 
F 0 "#PWR0190" H 9400 2900 50  0001 C CNN
F 1 "GNDD" H 9404 2995 50  0000 C CNN
F 2 "" H 9400 3150 50  0001 C CNN
F 3 "" H 9400 3150 50  0001 C CNN
	1    9400 3150
	1    0    0    -1  
$EndComp
Entry Bus Bus
	750  7650 850  7750
Entry Bus Bus
	5700 7750 5800 7650
Entry Bus Bus
	5800 6600 5900 6500
Entry Bus Bus
	10150 6500 10250 6400
Wire Wire Line
	4200 5200 5600 5200
Wire Wire Line
	5600 4050 5600 5200
Wire Wire Line
	4200 5200 4200 6550
Wire Wire Line
	9550 3100 9500 3100
Wire Wire Line
	9950 3100 10150 3100
Wire Wire Line
	9950 3200 10150 3200
Wire Wire Line
	9950 3300 10150 3300
Wire Wire Line
	9950 3400 10150 3400
Wire Wire Line
	9950 3500 10150 3500
Wire Wire Line
	9950 3600 10150 3600
Wire Wire Line
	9950 3700 10150 3700
Wire Wire Line
	9950 3800 10150 3800
Wire Wire Line
	9400 3150 9400 3100
Wire Wire Line
	9400 3100 9500 3100
Connection ~ 9500 3100
Wire Wire Line
	9500 2750 9500 3100
Text GLabel 9000 2450 0    50   Input ~ 0
0
Text GLabel 9000 2350 0    50   Input ~ 0
0
Wire Wire Line
	850  1450 1050 1450
Wire Wire Line
	850  1550 1050 1550
Wire Wire Line
	850  1650 1050 1650
Wire Wire Line
	850  1750 1050 1750
Wire Wire Line
	850  1850 1050 1850
Wire Wire Line
	850  1950 1050 1950
Wire Wire Line
	850  2050 1050 2050
Wire Wire Line
	850  2150 1050 2150
Wire Wire Line
	850  3500 1050 3500
Wire Wire Line
	850  3600 1050 3600
Wire Wire Line
	850  3700 1050 3700
Wire Wire Line
	850  3800 1050 3800
Wire Wire Line
	850  3900 1050 3900
Wire Wire Line
	850  4000 1050 4000
Wire Wire Line
	850  4100 1050 4100
Wire Wire Line
	850  4200 1050 4200
Wire Wire Line
	850  5550 1050 5550
Wire Wire Line
	850  5650 1050 5650
Wire Wire Line
	850  5750 1050 5750
Wire Wire Line
	850  5850 1050 5850
Wire Wire Line
	850  5950 1050 5950
Wire Wire Line
	850  6050 1050 6050
Wire Wire Line
	850  6150 1050 6150
Wire Wire Line
	850  6250 1050 6250
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
	5800 2450 6000 2450
Wire Wire Line
	5800 2550 6000 2550
Wire Wire Line
	5900 4500 6100 4500
Wire Wire Line
	5900 4600 6100 4600
Wire Wire Line
	5900 4700 6100 4700
Wire Wire Line
	5900 4800 6100 4800
Wire Wire Line
	5900 4900 6100 4900
Wire Wire Line
	5900 5000 6100 5000
Wire Wire Line
	5900 5100 6100 5100
Wire Wire Line
	5900 5200 6100 5200
Wire Bus Line
	5900 6500 10150 6500
Wire Bus Line
	5600 1150 7250 1150
Wire Bus Line
	850  7750 5700 7750
Wire Bus Line
	5800 6600 5800 7650
Wire Bus Line
	850  750  10150 750 
$Comp
L 74xx:74LS541 U?
U 1 1 5DA9E23D
P 9500 1950
AR Path="/5F6C0B36/5DA9E23D" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DA9E23D" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D99DA9F/5DA9E23D" Ref="U?"  Part="1" 
AR Path="/5DA1E9BA/5DA9E23D" Ref="U27"  Part="1" 
F 0 "U27" H 9500 1750 50  0000 C CNN
F 1 "74F541" H 9500 1650 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9500 1950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 9500 1950 50  0001 C CNN
	1    9500 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5DC4BE41
P 9750 3500
AR Path="/5DAA3954/5DC4BE41" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5D9A6C5F/5DC4BE41" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BD/5DC4BE41" Ref="RN?"  Part="1" 
AR Path="/5DA1E9BA/5DC4BE41" Ref="RN2"  Part="1" 
F 0 "RN2" V 9100 3400 50  0000 L CNN
F 1 "1k" V 9200 3400 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 10225 3500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 9750 3500 50  0001 C CNN
	1    9750 3500
	0    -1   1    0   
$EndComp
Wire Bus Line
	4350 3350 4350 3750
Wire Bus Line
	4350 5650 4350 6050
Wire Bus Line
	2350 5350 2350 5750
Wire Bus Line
	2550 6600 2550 7100
Wire Bus Line
	4050 5850 4050 6300
Wire Bus Line
	4050 6600 4050 7200
Wire Bus Line
	4050 3850 4050 4650
Wire Bus Line
	5800 3650 5800 4700
Wire Bus Line
	5800 5000 5800 6050
Wire Bus Line
	10250 850  10250 2050
Wire Bus Line
	3950 1350 3950 3400
Wire Bus Line
	5700 1650 5700 2450
Wire Bus Line
	8800 1550 8800 2550
Wire Bus Line
	2550 3600 2550 6300
Wire Bus Line
	5500 1250 5500 2350
Wire Bus Line
	10250 2900 10250 6400
Wire Bus Line
	2350 1350 2350 4100
Wire Bus Line
	7350 1250 7350 5400
Wire Bus Line
	750  850  750  7650
$EndSCHEMATC
