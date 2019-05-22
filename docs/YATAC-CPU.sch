EESchema Schematic File Version 4
LIBS:YATAC1-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "Central Processing Unit"
Date "2019-05-22"
Rev "0.4"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Memory_RAM:628128_DIP32_SSOP32 U?
U 1 1 5DAE324D
P 3300 2150
AR Path="/5F6C0B36/5DAE324D" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE324D" Ref="U32"  Part="1" 
F 0 "U32" H 3300 2150 50  0000 C CNN
F 1 "628128" H 3300 2050 50  0000 C CNN
F 2 "" H 3300 2150 50  0001 C CNN
F 3 "http://www.futurlec.com/Datasheet/Memory/628128.pdf" H 3300 2150 50  0001 C CNN
	1    3300 2150
	1    0    0    -1  
$EndComp
Text GLabel 3800 2450 2    50   Input ~ 0
~doe
Text GLabel 3800 2550 2    50   Input ~ 0
~dwe
Text GLabel 3800 2250 2    50   Input ~ 0
0
Text GLabel 3800 2350 2    50   Input ~ 0
dcs
Entry Wire Line
	4100 1450 4000 1350
Entry Wire Line
	4100 1550 4000 1450
Entry Wire Line
	4100 1650 4000 1550
Entry Wire Line
	4100 1750 4000 1650
Entry Wire Line
	4100 1850 4000 1750
Entry Wire Line
	4100 1950 4000 1850
Entry Wire Line
	4100 2050 4000 1950
Entry Wire Line
	4100 2150 4000 2050
Text GLabel 2800 2950 0    50   Input ~ 0
DA16
Text GLabel 8000 2950 0    50   Input ~ 0
PA16
Text GLabel 8000 3050 0    50   Input ~ 0
~pcoe
Text GLabel 8000 3250 0    50   Input ~ 0
1
Text GLabel 8000 3450 0    50   Input ~ 0
0
Text GLabel 8000 3550 0    50   Input ~ 0
0
Text GLabel 8000 3350 0    50   Input ~ 0
1
$Comp
L 74xx:74LS541 U?
U 1 1 5DAE3266
P 3300 4350
AR Path="/5F6C0B36/5DAE3266" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3266" Ref="U27"  Part="1" 
F 0 "U27" H 3300 4150 50  0000 C CNN
F 1 "74F541" H 3300 4050 50  0000 C CNN
F 2 "" H 3300 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 3300 4350 50  0001 C CNN
	1    3300 4350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE326C
P 1700 3950
AR Path="/5F6C0B36/5DAE326C" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE326C" Ref="U30"  Part="1" 
F 0 "U30" H 1700 3750 50  0000 C CNN
F 1 "74F574" H 1700 3650 50  0000 C CNN
F 2 "" H 1700 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1700 3950 50  0001 C CNN
	1    1700 3950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE3272
P 4900 1850
AR Path="/5F6C0B36/5DAE3272" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3272" Ref="U26"  Part="1" 
F 0 "U26" H 4900 1650 50  0000 C CNN
F 1 "74F574" H 4900 1550 50  0000 C CNN
F 2 "" H 4900 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4900 1850 50  0001 C CNN
	1    4900 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE3278
P 6600 1850
AR Path="/5F6C0B36/5DAE3278" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3278" Ref="U25"  Part="1" 
F 0 "U25" H 6600 1650 50  0000 C CNN
F 1 "74F574" H 6600 1550 50  0000 C CNN
F 2 "" H 6600 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6600 1850 50  0001 C CNN
	1    6600 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS541 U?
U 1 1 5DAE3284
P 6800 5550
AR Path="/5F6C0B36/5DAE3284" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3284" Ref="U21"  Part="1" 
F 0 "U21" H 6800 5350 50  0000 C CNN
F 1 "74F541" H 6800 5250 50  0000 C CNN
F 2 "" H 6800 5550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS541" H 6800 5550 50  0001 C CNN
	1    6800 5550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS163 U?
U 1 1 5DAE328A
P 5100 4400
AR Path="/5F6C0B36/5DAE328A" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE328A" Ref="U19"  Part="1" 
F 0 "U19" H 5100 4400 50  0000 C CNN
F 1 "74F163" H 5200 4300 50  0000 C CNN
F 2 "" H 5100 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 5100 4400 50  0001 C CNN
	1    5100 4400
	1    0    0    -1  
$EndComp
Entry Wire Line
	9000 1350 9100 1250
Entry Wire Line
	9000 2050 9100 1950
Entry Wire Line
	9000 1950 9100 1850
Entry Wire Line
	9000 1850 9100 1750
Entry Wire Line
	9000 1750 9100 1650
Entry Wire Line
	9000 1650 9100 1550
Entry Wire Line
	9000 1550 9100 1450
Entry Wire Line
	9000 1450 9100 1350
Entry Wire Line
	7600 2850 7700 2750
Entry Wire Line
	7600 2750 7700 2650
Entry Wire Line
	7600 2650 7700 2550
Entry Wire Line
	7600 2550 7700 2450
Entry Wire Line
	7600 2450 7700 2350
Entry Wire Line
	7600 2350 7700 2250
Entry Wire Line
	7600 2250 7700 2150
Entry Wire Line
	7600 2150 7700 2050
Entry Wire Line
	7600 2050 7700 1950
Entry Wire Line
	7600 1950 7700 1850
Entry Wire Line
	7600 1850 7700 1750
Entry Wire Line
	7600 1750 7700 1650
Entry Wire Line
	7600 1650 7700 1550
Entry Wire Line
	7600 1550 7700 1450
Entry Wire Line
	7600 1450 7700 1350
Entry Wire Line
	7600 2950 7700 2850
$Comp
L Memory_EPROM:27C020 U?
U 1 1 5DAE32A8
P 8400 2450
AR Path="/5F6C0B36/5DAE32A8" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32A8" Ref="U1"  Part="1" 
F 0 "U1" H 8400 2450 50  0000 C CNN
F 1 "27C020" H 8450 2350 50  0000 C CNN
F 2 "" H 8400 2450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/doc0570.pdf" H 8400 2450 50  0001 C CNN
	1    8400 2450
	1    0    0    -1  
$EndComp
Entry Wire Line
	4100 2150 4200 2050
Entry Wire Line
	4100 1450 4200 1350
Entry Wire Line
	4100 1550 4200 1450
Entry Wire Line
	4100 1650 4200 1550
Entry Wire Line
	4100 1750 4200 1650
Entry Wire Line
	4100 1850 4200 1750
Entry Wire Line
	4100 1950 4200 1850
Entry Wire Line
	4100 2050 4200 1950
Entry Wire Line
	5800 2150 5900 2050
Entry Wire Line
	5800 1450 5900 1350
Entry Wire Line
	5800 1550 5900 1450
Entry Wire Line
	5800 1650 5900 1550
Entry Wire Line
	5800 1750 5900 1650
Entry Wire Line
	5800 1850 5900 1750
Entry Wire Line
	5800 1950 5900 1850
Entry Wire Line
	5800 2050 5900 1950
Entry Wire Line
	5700 1450 5600 1350
Entry Wire Line
	5700 1550 5600 1450
Entry Wire Line
	5700 1650 5600 1550
Entry Wire Line
	5700 1750 5600 1650
Entry Wire Line
	5700 1850 5600 1750
Entry Wire Line
	5700 1950 5600 1850
Entry Wire Line
	5700 2050 5600 1950
Entry Wire Line
	5700 2150 5600 2050
Entry Wire Line
	7600 1450 7500 1350
Entry Wire Line
	7600 1550 7500 1450
Entry Wire Line
	7600 1650 7500 1550
Entry Wire Line
	7600 1750 7500 1650
Entry Wire Line
	7600 1850 7500 1750
Entry Wire Line
	7600 1950 7500 1850
Entry Wire Line
	7600 2050 7500 1950
Entry Wire Line
	7600 2150 7500 2050
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE32D4
P 1700 1850
AR Path="/5F6C0B36/5DAE32D4" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32D4" Ref="U31"  Part="1" 
F 0 "U31" H 1700 1650 50  0000 C CNN
F 1 "74F574" H 1700 1550 50  0000 C CNN
F 2 "" H 1700 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1700 1850 50  0001 C CNN
	1    1700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1350 2400 1350
Wire Wire Line
	2200 1450 2400 1450
Wire Wire Line
	2200 1550 2400 1550
Wire Wire Line
	2200 1650 2400 1650
Wire Wire Line
	2200 1750 2400 1750
Wire Wire Line
	2200 1850 2400 1850
Wire Wire Line
	2200 1950 2400 1950
Wire Wire Line
	2200 2050 2400 2050
Wire Wire Line
	2600 1350 2800 1350
Wire Wire Line
	2600 1450 2800 1450
Wire Wire Line
	2600 1550 2800 1550
Wire Wire Line
	2600 1650 2800 1650
Wire Wire Line
	2600 1750 2800 1750
Wire Wire Line
	2600 1850 2800 1850
Wire Wire Line
	2600 1950 2800 1950
Wire Wire Line
	2600 2050 2800 2050
Wire Wire Line
	2600 2150 2800 2150
Wire Wire Line
	2600 2250 2800 2250
Wire Wire Line
	2600 2350 2800 2350
Wire Wire Line
	2600 2450 2800 2450
Wire Wire Line
	2600 2550 2800 2550
Wire Wire Line
	2600 2650 2800 2650
Wire Wire Line
	2600 2750 2800 2750
Wire Wire Line
	2600 2850 2800 2850
Wire Wire Line
	4200 1350 4400 1350
Wire Wire Line
	4200 1450 4400 1450
Wire Wire Line
	4200 1550 4400 1550
Wire Wire Line
	4200 1650 4400 1650
Wire Wire Line
	4200 1750 4400 1750
Wire Wire Line
	4200 1850 4400 1850
Wire Wire Line
	4200 1950 4400 1950
Wire Wire Line
	4200 2050 4400 2050
Wire Wire Line
	3800 2050 4000 2050
Wire Wire Line
	3800 1950 4000 1950
Wire Wire Line
	3800 1850 4000 1850
Wire Wire Line
	3800 1750 4000 1750
Wire Wire Line
	3800 1650 4000 1650
Wire Wire Line
	3800 1550 4000 1550
Wire Wire Line
	3800 1450 4000 1450
Wire Wire Line
	3800 1350 4000 1350
Wire Wire Line
	5400 2050 5600 2050
Wire Wire Line
	5400 1950 5600 1950
Wire Wire Line
	5400 1850 5600 1850
Wire Wire Line
	5400 1750 5600 1750
Wire Wire Line
	5400 1650 5600 1650
Wire Wire Line
	5400 1550 5600 1550
Wire Wire Line
	5400 1450 5600 1450
Wire Wire Line
	5400 1350 5600 1350
Wire Wire Line
	5900 2050 6100 2050
Wire Wire Line
	5900 1950 6100 1950
Wire Wire Line
	5900 1850 6100 1850
Wire Wire Line
	5900 1750 6100 1750
Wire Wire Line
	5900 1650 6100 1650
Wire Wire Line
	5900 1550 6100 1550
Wire Wire Line
	5900 1450 6100 1450
Wire Wire Line
	5900 1350 6100 1350
Wire Wire Line
	8800 2050 9000 2050
Wire Wire Line
	8800 1950 9000 1950
Wire Wire Line
	8800 1850 9000 1850
Wire Wire Line
	8800 1750 9000 1750
Wire Wire Line
	8800 1650 9000 1650
Wire Wire Line
	8800 1550 9000 1550
Wire Wire Line
	8800 1450 9000 1450
Wire Wire Line
	8800 1350 9000 1350
Entry Wire Line
	900  1250 1000 1350
Entry Wire Line
	900  1350 1000 1450
Entry Wire Line
	900  1450 1000 1550
Entry Wire Line
	900  1550 1000 1650
Entry Wire Line
	900  1650 1000 1750
Entry Wire Line
	900  1750 1000 1850
Entry Wire Line
	900  1850 1000 1950
Entry Wire Line
	900  1950 1000 2050
Wire Wire Line
	1000 2050 1200 2050
Wire Wire Line
	1000 1950 1200 1950
Wire Wire Line
	1000 1850 1200 1850
Wire Wire Line
	1000 1750 1200 1750
Wire Wire Line
	1000 1650 1200 1650
Wire Wire Line
	1000 1550 1200 1550
Wire Wire Line
	1000 1450 1200 1450
Wire Wire Line
	1000 1350 1200 1350
Entry Wire Line
	7600 5150 7500 5050
Entry Wire Line
	7600 5250 7500 5150
Entry Wire Line
	7600 5350 7500 5250
Entry Wire Line
	7600 5450 7500 5350
Entry Wire Line
	7600 5550 7500 5450
Entry Wire Line
	7600 5650 7500 5550
Entry Wire Line
	7600 5750 7500 5650
Entry Wire Line
	7600 5850 7500 5750
Wire Wire Line
	7300 5750 7500 5750
Wire Wire Line
	7300 5650 7500 5650
Wire Wire Line
	7300 5550 7500 5550
Wire Wire Line
	7300 5450 7500 5450
Wire Wire Line
	7300 5350 7500 5350
Wire Wire Line
	7300 5250 7500 5250
Wire Wire Line
	7300 5150 7500 5150
Wire Wire Line
	7300 5050 7500 5050
Entry Wire Line
	4000 3950 4100 3850
Entry Wire Line
	4000 4050 4100 3950
Entry Wire Line
	4000 4150 4100 4050
Entry Wire Line
	4000 4250 4100 4150
Entry Wire Line
	4000 4350 4100 4250
Entry Wire Line
	4000 4450 4100 4350
Entry Wire Line
	4000 4550 4100 4450
Entry Wire Line
	4000 3850 4100 3750
Wire Wire Line
	3800 4550 4000 4550
Wire Wire Line
	3800 4450 4000 4450
Wire Wire Line
	3800 4350 4000 4350
Wire Wire Line
	3800 4250 4000 4250
Wire Wire Line
	3800 4150 4000 4150
Wire Wire Line
	3800 4050 4000 4050
Wire Wire Line
	3800 3950 4000 3950
Wire Wire Line
	3800 3850 4000 3850
Entry Wire Line
	2400 5650 2500 5550
Entry Wire Line
	2400 5750 2500 5650
Entry Wire Line
	2400 5850 2500 5750
Entry Wire Line
	2400 5950 2500 5850
Entry Wire Line
	2400 6050 2500 5950
Entry Wire Line
	2400 6150 2500 6050
Entry Wire Line
	2400 6250 2500 6150
Entry Wire Line
	2400 5550 2500 5450
Wire Wire Line
	2200 6250 2400 6250
Wire Wire Line
	2200 6150 2400 6150
Wire Wire Line
	2200 6050 2400 6050
Wire Wire Line
	2200 5950 2400 5950
Wire Wire Line
	2200 5850 2400 5850
Wire Wire Line
	2200 5750 2400 5750
Wire Wire Line
	2200 5650 2400 5650
Wire Wire Line
	2200 5550 2400 5550
Entry Wire Line
	2500 3550 2400 3450
Entry Wire Line
	2500 3650 2400 3550
Entry Wire Line
	2500 3750 2400 3650
Entry Wire Line
	2500 3850 2400 3750
Entry Wire Line
	2500 3950 2400 3850
Entry Wire Line
	2500 4050 2400 3950
Entry Wire Line
	2500 4150 2400 4050
Entry Wire Line
	2500 4250 2400 4150
Wire Wire Line
	2200 4150 2400 4150
Wire Wire Line
	2200 4050 2400 4050
Wire Wire Line
	2200 3950 2400 3950
Wire Wire Line
	2200 3850 2400 3850
Wire Wire Line
	2200 3750 2400 3750
Wire Wire Line
	2200 3650 2400 3650
Wire Wire Line
	2200 3550 2400 3550
Wire Wire Line
	2200 3450 2400 3450
Wire Wire Line
	9200 3400 9400 3400
Wire Wire Line
	9200 3500 9400 3500
Wire Wire Line
	9200 3600 9400 3600
Wire Wire Line
	9200 3700 9400 3700
Wire Wire Line
	9200 3800 9400 3800
Wire Wire Line
	9200 3900 9400 3900
Wire Wire Line
	9200 4000 9400 4000
Wire Wire Line
	9200 4100 9400 4100
Entry Wire Line
	9100 3300 9200 3400
Entry Wire Line
	9100 3400 9200 3500
Entry Wire Line
	9100 3500 9200 3600
Entry Wire Line
	9100 3600 9200 3700
Entry Wire Line
	9100 3700 9200 3800
Entry Wire Line
	9100 3800 9200 3900
Entry Wire Line
	9100 3900 9200 4000
Entry Wire Line
	9100 4000 9200 4100
Entry Wire Line
	7500 3900 7600 4000
Entry Wire Line
	7500 3800 7600 3900
Entry Wire Line
	7500 3700 7600 3800
Entry Wire Line
	7500 3600 7600 3700
Entry Wire Line
	7500 3500 7600 3600
Entry Wire Line
	7500 3400 7600 3500
Entry Wire Line
	7500 3300 7600 3400
Entry Wire Line
	7500 3200 7600 3300
Wire Wire Line
	10400 1350 10600 1350
Wire Wire Line
	10400 1450 10600 1450
Wire Wire Line
	10400 1550 10600 1550
Entry Wire Line
	10600 1350 10700 1250
Entry Wire Line
	10600 1550 10700 1450
Entry Wire Line
	10600 1450 10700 1350
Wire Wire Line
	9200 1350 9400 1350
Wire Wire Line
	9200 1450 9400 1450
Wire Wire Line
	9200 1550 9400 1550
Wire Wire Line
	9200 1650 9400 1650
Wire Wire Line
	9200 1750 9400 1750
Wire Wire Line
	9200 1850 9400 1850
Wire Wire Line
	9200 1950 9400 1950
Wire Wire Line
	9200 2050 9400 2050
Entry Wire Line
	9100 1250 9200 1350
Entry Wire Line
	9100 1350 9200 1450
Entry Wire Line
	9100 1450 9200 1550
Entry Wire Line
	9100 1550 9200 1650
Entry Wire Line
	9100 1650 9200 1750
Entry Wire Line
	9100 1750 9200 1850
Entry Wire Line
	9100 1850 9200 1950
Entry Wire Line
	9100 1950 9200 2050
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE33C2
P 9900 1850
AR Path="/5F6C0B36/5DAE33C2" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33C2" Ref="U33"  Part="1" 
F 0 "U33" H 9900 1650 50  0000 C CNN
F 1 "74F574" H 9900 1550 50  0000 C CNN
F 2 "" H 9900 1850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9900 1850 50  0001 C CNN
	1    9900 1850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE33C8
P 9900 3900
AR Path="/5F6C0B36/5DAE33C8" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33C8" Ref="U23"  Part="1" 
F 0 "U23" H 9900 3700 50  0000 C CNN
F 1 "74F574" H 9900 3600 50  0000 C CNN
F 2 "" H 9900 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9900 3900 50  0001 C CNN
	1    9900 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE33CE
P 6700 3700
AR Path="/5F6C0B36/5DAE33CE" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33CE" Ref="U22"  Part="1" 
F 0 "U22" H 6700 3500 50  0000 C CNN
F 1 "74F574" H 6700 3400 50  0000 C CNN
F 2 "" H 6700 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 6700 3700 50  0001 C CNN
	1    6700 3700
	1    0    0    -1  
$EndComp
Entry Wire Line
	2500 5850 2600 5950
Entry Wire Line
	2500 5950 2600 6050
Entry Wire Line
	2500 6050 2600 6150
Entry Wire Line
	2500 6150 2600 6250
Entry Wire Line
	2500 6450 2600 6350
Entry Wire Line
	2500 6550 2600 6450
Entry Wire Line
	2500 6650 2600 6550
Entry Wire Line
	2500 6750 2600 6650
Entry Wire Line
	4300 4300 4400 4200
Entry Wire Line
	4300 4000 4400 3900
Entry Wire Line
	4300 4100 4400 4000
Entry Wire Line
	4300 4200 4400 4100
Entry Wire Line
	4300 6450 4400 6350
Entry Wire Line
	4300 6150 4400 6050
Entry Wire Line
	4300 6250 4400 6150
Entry Wire Line
	4300 6350 4400 6250
Wire Wire Line
	2600 6650 2800 6650
Wire Wire Line
	2600 6550 2800 6550
Wire Wire Line
	2600 6450 2800 6450
Wire Wire Line
	2600 6350 2800 6350
Wire Wire Line
	2600 6250 2800 6250
Wire Wire Line
	2600 6150 2800 6150
Wire Wire Line
	2600 6050 2800 6050
Wire Wire Line
	2600 5950 2800 5950
Wire Wire Line
	3800 5950 4000 5950
Wire Wire Line
	3800 6050 4000 6050
Wire Wire Line
	3800 6250 4000 6250
Wire Wire Line
	3800 6350 4000 6350
Wire Wire Line
	3800 6450 4000 6450
Wire Wire Line
	3800 6550 4000 6550
Wire Wire Line
	3800 6650 4000 6650
Entry Wire Line
	4000 6650 4100 6750
Entry Wire Line
	4000 6550 4100 6650
Entry Wire Line
	4000 6450 4100 6550
Entry Wire Line
	4000 6350 4100 6450
Entry Wire Line
	4000 6250 4100 6150
Entry Wire Line
	4000 6150 4100 6050
Entry Wire Line
	4000 6050 4100 5950
Entry Wire Line
	4000 5950 4100 5850
$Comp
L 74xx:74LS244 U?
U 1 1 5DAE33FC
P 3300 6450
AR Path="/5F6C0B36/5DAE33FC" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE33FC" Ref="U28"  Part="1" 
F 0 "U28" H 3300 6250 50  0000 C CNN
F 1 "74F244" H 3300 6150 50  0000 C CNN
F 2 "" H 3300 6450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS244" H 3300 6450 50  0001 C CNN
	1    3300 6450
	-1   0    0    -1  
$EndComp
Entry Wire Line
	5900 3100 6000 3200
Entry Wire Line
	5900 3200 6000 3300
Entry Wire Line
	5900 3300 6000 3400
Entry Wire Line
	5900 3400 6000 3500
Entry Wire Line
	5900 3500 6000 3600
Entry Wire Line
	5900 3600 6000 3700
Entry Wire Line
	5900 3700 6000 3800
Entry Wire Line
	5900 3800 6000 3900
Wire Wire Line
	6000 3900 6200 3900
Wire Wire Line
	6000 3800 6200 3800
Wire Wire Line
	6000 3700 6200 3700
Wire Wire Line
	6000 3600 6200 3600
Wire Wire Line
	6000 3500 6200 3500
Wire Wire Line
	6000 3400 6200 3400
Wire Wire Line
	6000 3300 6200 3300
Wire Wire Line
	6000 3200 6200 3200
Entry Wire Line
	5900 6150 6000 6050
Entry Wire Line
	5900 6250 6000 6150
Entry Wire Line
	5900 6350 6000 6250
Entry Wire Line
	5900 6050 6000 5950
Wire Wire Line
	5700 6350 5900 6350
Wire Wire Line
	5700 6250 5900 6250
Wire Wire Line
	5700 6150 5900 6150
Wire Wire Line
	5700 6050 5900 6050
Entry Wire Line
	5800 3900 5900 4000
Entry Wire Line
	5800 4000 5900 4100
Entry Wire Line
	5800 4100 5900 4200
Entry Wire Line
	5800 4200 5900 4300
Wire Wire Line
	5600 4200 5800 4200
Wire Wire Line
	5600 4100 5800 4100
Wire Wire Line
	5600 4000 5800 4000
Wire Wire Line
	5600 3900 5800 3900
Entry Wire Line
	5900 4950 6000 5050
Entry Wire Line
	5900 5050 6000 5150
Entry Wire Line
	5900 5150 6000 5250
Entry Wire Line
	5900 5250 6000 5350
Entry Wire Line
	6000 5850 6100 5750
Entry Wire Line
	6000 5550 6100 5450
Entry Wire Line
	6000 5650 6100 5550
Entry Wire Line
	6000 5750 6100 5650
Wire Wire Line
	6100 5750 6300 5750
Wire Wire Line
	6100 5650 6300 5650
Wire Wire Line
	6100 5550 6300 5550
Wire Wire Line
	6100 5450 6300 5450
Entry Wire Line
	7600 4650 7700 4550
Entry Wire Line
	7600 4950 7700 4850
Entry Wire Line
	7600 5250 7700 5150
Entry Wire Line
	7600 5550 7700 5450
Wire Wire Line
	10400 3400 10600 3400
Wire Wire Line
	10400 3500 10600 3500
Wire Wire Line
	10400 3600 10600 3600
Wire Wire Line
	10400 3700 10600 3700
Wire Wire Line
	10400 3800 10600 3800
Wire Wire Line
	10400 3900 10600 3900
Wire Wire Line
	10400 4000 10600 4000
Wire Wire Line
	10400 4100 10600 4100
Entry Wire Line
	10600 4100 10700 4200
Entry Wire Line
	10600 4000 10700 4100
Entry Wire Line
	10600 3900 10700 4000
Entry Wire Line
	10600 3800 10700 3900
Entry Wire Line
	10600 3700 10700 3800
Entry Wire Line
	10600 3600 10700 3700
Entry Wire Line
	10600 3500 10700 3600
Entry Wire Line
	10600 3400 10700 3500
Wire Wire Line
	8900 4550 9100 4550
Wire Wire Line
	8900 4650 9100 4650
Wire Wire Line
	8900 4850 9100 4850
Wire Wire Line
	8900 4950 9100 4950
Wire Wire Line
	8900 5150 9100 5150
Wire Wire Line
	8900 5250 9100 5250
Wire Wire Line
	8900 5450 9100 5450
Wire Wire Line
	8900 5550 9100 5550
Entry Wire Line
	9100 5550 9200 5650
Entry Wire Line
	9100 5450 9200 5550
Entry Wire Line
	9100 5250 9200 5350
Entry Wire Line
	9100 5150 9200 5250
Entry Wire Line
	9100 4950 9200 5050
Entry Wire Line
	9100 4850 9200 4950
Entry Wire Line
	9100 4650 9200 4750
Entry Wire Line
	9100 4550 9200 4650
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3458
P 5100 5200
AR Path="/5F6C0B36/5DAE3458" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3458" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 5100 4950 50  0001 C CNN
F 1 "GNDD" H 5104 5045 50  0000 C CNN
F 2 "" H 5100 5200 50  0001 C CNN
F 3 "" H 5100 5200 50  0001 C CNN
	1    5100 5200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE345E
P 6700 6450
AR Path="/5F6C0B36/5DAE345E" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE345E" Ref="#PWR0149"  Part="1" 
F 0 "#PWR0149" H 6700 6200 50  0001 C CNN
F 1 "GNDD" H 6704 6295 50  0000 C CNN
F 2 "" H 6700 6450 50  0001 C CNN
F 3 "" H 6700 6450 50  0001 C CNN
	1    6700 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3464
P 5200 7350
AR Path="/5F6C0B36/5DAE3464" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3464" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 5200 7100 50  0001 C CNN
F 1 "GNDD" H 5204 7195 50  0000 C CNN
F 2 "" H 5200 7350 50  0001 C CNN
F 3 "" H 5200 7350 50  0001 C CNN
	1    5200 7350
	1    0    0    -1  
$EndComp
NoConn ~ 5700 6550
$Comp
L power:GNDD #PWR?
U 1 1 5DAE346C
P 4900 2650
AR Path="/5F6C0B36/5DAE346C" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE346C" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 4900 2400 50  0001 C CNN
F 1 "GNDD" H 4904 2495 50  0000 C CNN
F 2 "" H 4900 2650 50  0001 C CNN
F 3 "" H 4900 2650 50  0001 C CNN
	1    4900 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3472
P 3300 5150
AR Path="/5F6C0B36/5DAE3472" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3472" Ref="#PWR0152"  Part="1" 
F 0 "#PWR0152" H 3300 4900 50  0001 C CNN
F 1 "GNDD" H 3304 4995 50  0000 C CNN
F 2 "" H 3300 5150 50  0001 C CNN
F 3 "" H 3300 5150 50  0001 C CNN
	1    3300 5150
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS163 U?
U 1 1 5DAE3479
P 5200 6550
AR Path="/5F6C0B36/5DAE3479" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE3479" Ref="U20"  Part="1" 
F 0 "U20" H 5200 6550 50  0000 C CNN
F 1 "74F163" H 5300 6450 50  0000 C CNN
F 2 "" H 5200 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS163" H 5200 6550 50  0001 C CNN
	1    5200 6550
	1    0    0    -1  
$EndComp
Entry Wire Line
	900  3350 1000 3450
Entry Wire Line
	900  3450 1000 3550
Entry Wire Line
	900  3550 1000 3650
Entry Wire Line
	900  3650 1000 3750
Entry Wire Line
	900  3750 1000 3850
Entry Wire Line
	900  3850 1000 3950
Entry Wire Line
	900  3950 1000 4050
Entry Wire Line
	900  4050 1000 4150
Wire Wire Line
	1000 4150 1200 4150
Wire Wire Line
	1000 4050 1200 4050
Wire Wire Line
	1000 3950 1200 3950
Wire Wire Line
	1000 3850 1200 3850
Wire Wire Line
	1000 3750 1200 3750
Wire Wire Line
	1000 3650 1200 3650
Wire Wire Line
	1000 3550 1200 3550
Wire Wire Line
	1000 3450 1200 3450
Entry Wire Line
	900  5450 1000 5550
Entry Wire Line
	900  5550 1000 5650
Entry Wire Line
	900  5650 1000 5750
Entry Wire Line
	900  5750 1000 5850
Entry Wire Line
	900  5850 1000 5950
Entry Wire Line
	900  5950 1000 6050
Entry Wire Line
	900  6050 1000 6150
Entry Wire Line
	900  6150 1000 6250
Wire Wire Line
	1000 6250 1200 6250
Wire Wire Line
	1000 6150 1200 6150
Wire Wire Line
	1000 6050 1200 6050
Wire Wire Line
	1000 5950 1200 5950
Wire Wire Line
	1000 5850 1200 5850
Wire Wire Line
	1000 5750 1200 5750
Wire Wire Line
	1000 5650 1200 5650
Wire Wire Line
	1000 5550 1200 5550
Text GLabel 4600 4600 0    50   Input ~ 0
pcent
Text GLabel 4600 4700 0    50   Input ~ 0
mclk
Text GLabel 4700 6850 0    50   Input ~ 0
mclk
Text GLabel 2500 4750 3    50   Input ~ 0
DA[0..15]
Text GLabel 7600 5950 3    50   Input ~ 0
PA[0..15]
Text GLabel 10700 1150 1    50   Output ~ 0
Eo[0..2]
Text GLabel 4100 5850 1    50   Input ~ 0
Ei[0..3]
Text GLabel 4100 6850 3    50   Input ~ 0
I[0..7]
Text GLabel 2500 6850 3    50   Output ~ 0
PA[0..15]
$Comp
L power:GNDD #PWR?
U 1 1 5DAE34AE
P 3300 7250
AR Path="/5F6C0B36/5DAE34AE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE34AE" Ref="#PWR0153"  Part="1" 
F 0 "#PWR0153" H 3300 7000 50  0001 C CNN
F 1 "GNDD" H 3304 7095 50  0000 C CNN
F 2 "" H 3300 7250 50  0001 C CNN
F 3 "" H 3300 7250 50  0001 C CNN
	1    3300 7250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE34B4
P 1700 6850
AR Path="/5F6C0B36/5DAE34B4" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE34B4" Ref="#PWR0154"  Part="1" 
F 0 "#PWR0154" H 1700 6600 50  0001 C CNN
F 1 "GNDD" H 1704 6695 50  0000 C CNN
F 2 "" H 1700 6850 50  0001 C CNN
F 3 "" H 1700 6850 50  0001 C CNN
	1    1700 6850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE34BA
P 8400 3750
AR Path="/5F6C0B36/5DAE34BA" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE34BA" Ref="#PWR0155"  Part="1" 
F 0 "#PWR0155" H 8400 3500 50  0001 C CNN
F 1 "GNDD" H 8404 3595 50  0000 C CNN
F 2 "" H 8400 3750 50  0001 C CNN
F 3 "" H 8400 3750 50  0001 C CNN
	1    8400 3750
	1    0    0    -1  
$EndComp
Text Label 10450 3400 0    50   ~ 0
HL0
Text Label 10450 3500 0    50   ~ 0
HL1
Text Label 10450 3600 0    50   ~ 0
HL2
Text Label 10450 3700 0    50   ~ 0
HL3
Text Label 10450 3800 0    50   ~ 0
HL4
Text Label 10450 3900 0    50   ~ 0
HL5
Text Label 10450 4000 0    50   ~ 0
HL6
Text Label 10450 4100 0    50   ~ 0
HL7
Text Label 8950 4550 0    50   ~ 0
HL0
Text Label 8950 4850 0    50   ~ 0
HL1
Text Label 8950 5150 0    50   ~ 0
HL2
Text Label 8950 5450 0    50   ~ 0
HL3
Text Label 8950 4650 0    50   ~ 0
HL4
Text Label 8950 4950 0    50   ~ 0
HL5
Text Label 8950 5250 0    50   ~ 0
HL6
Text Label 8950 5550 0    50   ~ 0
HL7
Text Label 7700 4550 0    50   ~ 0
PA8
Text Label 7700 4850 0    50   ~ 0
PA9
Text Label 7700 5150 0    50   ~ 0
PA10
Text Label 7700 5450 0    50   ~ 0
PA11
Wire Wire Line
	7700 4550 7900 4550
Wire Wire Line
	7700 4850 7900 4850
Wire Wire Line
	7700 5450 7900 5450
Wire Wire Line
	7700 5150 7900 5150
Text Label 7350 5050 0    50   ~ 0
PA0
Text Label 7350 5150 0    50   ~ 0
PA1
Text Label 7350 5250 0    50   ~ 0
PA2
Text Label 7350 5350 0    50   ~ 0
PA3
Text Label 7350 5450 0    50   ~ 0
PA4
Text Label 7350 5550 0    50   ~ 0
PA5
Text Label 7350 5650 0    50   ~ 0
PA6
Text Label 7350 5750 0    50   ~ 0
PA7
Text Label 6100 5050 0    50   ~ 0
PC0
Text Label 6100 5150 0    50   ~ 0
PC1
Text Label 6100 5250 0    50   ~ 0
PC2
Text Label 6100 5350 0    50   ~ 0
PC3
Text Label 6100 5450 0    50   ~ 0
PC4
Text Label 6100 5550 0    50   ~ 0
PC5
Text Label 6100 5650 0    50   ~ 0
PC6
Text Label 6100 5750 0    50   ~ 0
PC7
Text Label 5650 3900 0    50   ~ 0
PC0
Text Label 5650 4000 0    50   ~ 0
PC1
Text Label 5650 4100 0    50   ~ 0
PC2
Text Label 5650 4200 0    50   ~ 0
PC3
Text Label 5750 6050 0    50   ~ 0
PC4
Text Label 5750 6150 0    50   ~ 0
PC5
Text Label 5750 6250 0    50   ~ 0
PC6
Text Label 5750 6350 0    50   ~ 0
PC7
Text GLabel 4600 6650 0    50   Input ~ 0
1
Text GLabel 4600 4500 0    50   Input ~ 0
1
Text GLabel 4600 4900 0    50   Input ~ 0
~pcclr
Text GLabel 4700 7050 0    50   Input ~ 0
~pcclr
Text Label 4400 6050 0    50   ~ 0
PD4
Text Label 4400 6150 0    50   ~ 0
PD5
Text Label 4400 6250 0    50   ~ 0
PD6
Text Label 4400 6350 0    50   ~ 0
PD7
Text Label 8850 1350 0    50   ~ 0
PD0
Text Label 8850 1450 0    50   ~ 0
PD1
Text Label 8850 1550 0    50   ~ 0
PD2
Text Label 8850 1650 0    50   ~ 0
PD3
Text Label 8850 1750 0    50   ~ 0
PD4
Text Label 8850 1850 0    50   ~ 0
PD5
Text Label 8850 1950 0    50   ~ 0
PD6
Text Label 8850 2050 0    50   ~ 0
PD7
Text Label 9200 1350 0    50   ~ 0
PD0
Text Label 9200 1450 0    50   ~ 0
PD1
Text Label 9200 1550 0    50   ~ 0
PD2
Text Label 9200 1650 0    50   ~ 0
PD3
Text Label 9200 1750 0    50   ~ 0
PD4
Text Label 9200 1850 0    50   ~ 0
PD5
Text Label 9200 1950 0    50   ~ 0
PD6
Text Label 9200 2050 0    50   ~ 0
PD7
Text GLabel 9400 4400 0    50   Input ~ 0
0
Text GLabel 9400 4300 0    50   Input ~ 0
~hlle
Text GLabel 8900 5850 2    50   Input ~ 0
~alue
Text GLabel 8900 5750 2    50   Input ~ 0
hsel
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3510
P 8400 6150
AR Path="/5F6C0B36/5DAE3510" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3510" Ref="#PWR0156"  Part="1" 
F 0 "#PWR0156" H 8400 5900 50  0001 C CNN
F 1 "GNDD" H 8404 5995 50  0000 C CNN
F 2 "" H 8400 6150 50  0001 C CNN
F 3 "" H 8400 6150 50  0001 C CNN
	1    8400 6150
	1    0    0    -1  
$EndComp
Text Label 9200 3400 0    50   ~ 0
PD0
Text Label 9200 3500 0    50   ~ 0
PD1
Text Label 9200 3600 0    50   ~ 0
PD2
Text Label 9200 3700 0    50   ~ 0
PD3
Text Label 9200 3800 0    50   ~ 0
PD4
Text Label 9200 3900 0    50   ~ 0
PD5
Text Label 9200 4000 0    50   ~ 0
PD6
Text Label 9200 4100 0    50   ~ 0
PD7
Text Label 7350 3200 0    50   ~ 0
PA8
Text Label 7350 3300 0    50   ~ 0
PA9
Text Label 7300 3400 0    50   ~ 0
PA10
Text Label 7300 3500 0    50   ~ 0
PA11
Text Label 7300 3600 0    50   ~ 0
PA12
Text Label 7300 3700 0    50   ~ 0
PA13
Text Label 7300 3800 0    50   ~ 0
PA14
Text Label 7300 3900 0    50   ~ 0
PA15
Text Label 7350 1350 0    50   ~ 0
PA0
Text Label 7350 1450 0    50   ~ 0
PA1
Text Label 7350 1550 0    50   ~ 0
PA2
Text Label 7350 1650 0    50   ~ 0
PA3
Text Label 7350 1750 0    50   ~ 0
PA4
Text Label 7350 1850 0    50   ~ 0
PA5
Text Label 7350 1950 0    50   ~ 0
PA6
Text Label 7350 2050 0    50   ~ 0
PA7
Text Label 5450 1350 0    50   ~ 0
PA0
Text Label 5450 1450 0    50   ~ 0
PA1
Text Label 5450 1550 0    50   ~ 0
PA2
Text Label 5450 1650 0    50   ~ 0
PA3
Text Label 5450 1750 0    50   ~ 0
PA4
Text Label 5450 1850 0    50   ~ 0
PA5
Text Label 5450 1950 0    50   ~ 0
PA6
Text Label 5450 2050 0    50   ~ 0
PA7
Text Label 3850 1350 0    50   ~ 0
DD0
Text Label 3850 1450 0    50   ~ 0
DD1
Text Label 3850 1550 0    50   ~ 0
DD2
Text Label 3850 1650 0    50   ~ 0
DD3
Text Label 3850 1750 0    50   ~ 0
DD4
Text Label 3850 1950 0    50   ~ 0
DD6
Text Label 3850 2050 0    50   ~ 0
DD7
Text Label 4200 1350 0    50   ~ 0
DD0
Text Label 4200 1450 0    50   ~ 0
DD1
Text Label 4200 1550 0    50   ~ 0
DD2
Text Label 4200 1650 0    50   ~ 0
DD3
Text Label 4200 1750 0    50   ~ 0
DD4
Text Label 4200 1850 0    50   ~ 0
DD5
Text Label 4200 1950 0    50   ~ 0
DD6
Text Label 4200 2050 0    50   ~ 0
DD7
Text Label 4400 3900 0    50   ~ 0
PD0
Text Label 4400 4000 0    50   ~ 0
PD1
Text Label 4400 4100 0    50   ~ 0
PD2
Text Label 4400 4200 0    50   ~ 0
PD3
Text GLabel 6200 4200 0    50   Input ~ 0
~pgoe
Text GLabel 6200 4100 0    50   Input ~ 0
~pgle
Text Label 5900 1350 0    50   ~ 0
DD0
Text Label 5900 1450 0    50   ~ 0
DD1
Text Label 5900 1550 0    50   ~ 0
DD2
Text Label 5900 1650 0    50   ~ 0
DD3
Text Label 5900 1750 0    50   ~ 0
DD4
Text Label 5900 1850 0    50   ~ 0
DD5
Text Label 5900 1950 0    50   ~ 0
DD6
Text Label 5900 2050 0    50   ~ 0
DD7
Text Label 6000 3200 0    50   ~ 0
PD0
Text Label 6000 3300 0    50   ~ 0
PD1
Text Label 6000 3400 0    50   ~ 0
PD2
Text Label 6000 3500 0    50   ~ 0
PD3
Text Label 6000 3600 0    50   ~ 0
PD4
Text Label 6000 3700 0    50   ~ 0
PD5
Text Label 6000 3800 0    50   ~ 0
PD6
Text Label 6000 3900 0    50   ~ 0
PD7
Text Label 7700 1350 0    50   ~ 0
PA0
Text Label 7700 1450 0    50   ~ 0
PA1
Text Label 7700 1550 0    50   ~ 0
PA2
Text Label 7700 1650 0    50   ~ 0
PA3
Text Label 7700 1750 0    50   ~ 0
PA4
Text Label 7700 1850 0    50   ~ 0
PA5
Text Label 7700 1950 0    50   ~ 0
PA6
Text Label 7700 2050 0    50   ~ 0
PA7
Text Label 7700 2150 0    50   ~ 0
PA8
Text Label 7700 2250 0    50   ~ 0
PA9
Text Label 7700 2350 0    50   ~ 0
PA10
Text Label 7700 2450 0    50   ~ 0
PA11
Text Label 7700 2550 0    50   ~ 0
PA12
Text Label 7700 2650 0    50   ~ 0
PA13
Text Label 7700 2750 0    50   ~ 0
PA14
Text Label 7700 2850 0    50   ~ 0
PA15
Text GLabel 6300 5950 0    50   Input ~ 0
~pcoe
Text GLabel 6300 6050 0    50   Input ~ 0
~pcoe
Text Label 10450 1350 0    50   ~ 0
Eo0
Text Label 10450 1450 0    50   ~ 0
Eo1
Text Label 10450 1550 0    50   ~ 0
Eo2
Text Label 1000 1350 0    50   ~ 0
PD0
Text Label 1000 1450 0    50   ~ 0
PD1
Text Label 1000 1550 0    50   ~ 0
PD2
Text Label 1000 1650 0    50   ~ 0
PD3
Text Label 1000 1750 0    50   ~ 0
PD4
Text Label 1000 1850 0    50   ~ 0
PD5
Text Label 1000 1950 0    50   ~ 0
PD6
Text Label 1000 2050 0    50   ~ 0
PD7
Text Label 1000 3450 0    50   ~ 0
PD0
Text Label 1000 3550 0    50   ~ 0
PD1
Text Label 1000 3650 0    50   ~ 0
PD2
Text Label 1000 3750 0    50   ~ 0
PD3
Text Label 1000 3850 0    50   ~ 0
PD4
Text Label 1000 3950 0    50   ~ 0
PD5
Text Label 1000 4050 0    50   ~ 0
PD6
Text Label 1000 4150 0    50   ~ 0
PD7
Text Label 1000 5550 0    50   ~ 0
PD0
Text Label 1000 5650 0    50   ~ 0
PD1
Text Label 1000 5750 0    50   ~ 0
PD2
Text Label 1000 5850 0    50   ~ 0
PD3
Text Label 1000 5950 0    50   ~ 0
PD4
Text Label 1000 6050 0    50   ~ 0
PD5
Text Label 1000 6150 0    50   ~ 0
PD6
Text Label 1000 6250 0    50   ~ 0
PD7
Text GLabel 1200 2350 0    50   Input ~ 0
~xoe
Text GLabel 1200 2250 0    50   Input ~ 0
~xle
Text GLabel 1200 4350 0    50   Input ~ 0
~yle
Text GLabel 1200 4450 0    50   Input ~ 0
pclk1
Text Label 2250 1350 0    50   ~ 0
DA0
Text Label 2250 1450 0    50   ~ 0
DA1
Text Label 2250 1550 0    50   ~ 0
DA2
Text Label 2250 1650 0    50   ~ 0
DA3
Text Label 2250 1750 0    50   ~ 0
DA4
Text Label 2250 1850 0    50   ~ 0
DA5
Text Label 2250 1950 0    50   ~ 0
DA6
Text Label 2250 2050 0    50   ~ 0
DA7
Text Label 2250 3450 0    50   ~ 0
DA8
Text Label 2250 3550 0    50   ~ 0
DA9
Text Label 2200 3650 0    50   ~ 0
DA10
Text Label 2200 3750 0    50   ~ 0
DA11
Text Label 2200 3850 0    50   ~ 0
DA12
Text Label 2200 3950 0    50   ~ 0
DA13
Text Label 2200 4050 0    50   ~ 0
DA14
Text Label 2200 4150 0    50   ~ 0
DA15
Entry Wire Line
	2500 4650 2600 4550
Entry Wire Line
	2500 3950 2600 3850
Entry Wire Line
	2500 4050 2600 3950
Entry Wire Line
	2500 4150 2600 4050
Entry Wire Line
	2500 4250 2600 4150
Entry Wire Line
	2500 4350 2600 4250
Entry Wire Line
	2500 4450 2600 4350
Entry Wire Line
	2500 4550 2600 4450
Wire Wire Line
	2600 3850 2800 3850
Wire Wire Line
	2600 3950 2800 3950
Wire Wire Line
	2600 4050 2800 4050
Wire Wire Line
	2600 4150 2800 4150
Wire Wire Line
	2600 4250 2800 4250
Wire Wire Line
	2600 4350 2800 4350
Wire Wire Line
	2600 4450 2800 4450
Wire Wire Line
	2600 4550 2800 4550
Text Label 2600 3850 0    50   ~ 0
DA0
Text Label 2600 3950 0    50   ~ 0
DA1
Text Label 2600 4050 0    50   ~ 0
DA2
Text Label 2600 4150 0    50   ~ 0
DA3
Text Label 2600 4250 0    50   ~ 0
DA4
Text Label 2600 4350 0    50   ~ 0
DA5
Text Label 2600 4450 0    50   ~ 0
DA6
Text Label 2600 4550 0    50   ~ 0
DA7
Text Label 3850 3850 0    50   ~ 0
DD0
Text Label 3850 3950 0    50   ~ 0
DD1
Text Label 3850 4050 0    50   ~ 0
DD2
Text Label 3850 4150 0    50   ~ 0
DD3
Text Label 3850 4250 0    50   ~ 0
DD4
Text Label 3850 4350 0    50   ~ 0
DD5
Text Label 3850 4450 0    50   ~ 0
DD6
Text Label 3850 4550 0    50   ~ 0
DD7
Text Label 2250 5550 0    50   ~ 0
DD0
Text Label 2250 5650 0    50   ~ 0
DD1
Text Label 2250 5750 0    50   ~ 0
DD2
Text Label 2250 5850 0    50   ~ 0
DD3
Text Label 2250 5950 0    50   ~ 0
DD4
Text Label 2250 6050 0    50   ~ 0
DD5
Text Label 2250 6150 0    50   ~ 0
DD6
Text Label 2250 6250 0    50   ~ 0
DD7
Text GLabel 1200 6450 0    50   Input ~ 0
~ale
Text GLabel 1200 6550 0    50   Input ~ 0
~aoe
Text Label 2600 5950 0    50   ~ 0
DD0
Text Label 2600 6050 0    50   ~ 0
DD1
Text Label 2600 6150 0    50   ~ 0
DD2
Text Label 2600 6250 0    50   ~ 0
DD3
Text Label 3900 6650 0    50   ~ 0
I6
Text Label 3900 6350 0    50   ~ 0
I0
Text Label 3900 6450 0    50   ~ 0
I1
Text Label 3900 6550 0    50   ~ 0
I2
Text Label 2600 6350 0    50   ~ 0
PA12
Text Label 2600 6450 0    50   ~ 0
PA13
Text Label 2600 6550 0    50   ~ 0
PA14
Text Label 2600 6650 0    50   ~ 0
PA15
Text GLabel 3800 6950 2    50   Input ~ 0
~fnoe
Text GLabel 3800 6850 2    50   Input ~ 0
~eoe
Text GLabel 6100 2350 0    50   Input ~ 0
~alue
Text GLabel 6100 2250 0    50   Input ~ 0
pclk1
Text GLabel 4400 2350 0    50   Input ~ 0
~gcoe
Text GLabel 4400 2250 0    50   Input ~ 0
qclk1
Text Label 3850 5950 0    50   ~ 0
Ei0
Text Label 3850 6050 0    50   ~ 0
Ei1
Text Label 3850 6150 0    50   ~ 0
Ei2
Text Label 3850 6250 0    50   ~ 0
Ei3
Text GLabel 9400 2350 0    50   Input ~ 0
0
Text GLabel 9400 2250 0    50   Input ~ 0
~ele
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35E5
P 9900 2650
AR Path="/5F6C0B36/5DAE35E5" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35E5" Ref="#PWR0157"  Part="1" 
F 0 "#PWR0157" H 9900 2400 50  0001 C CNN
F 1 "GNDD" H 9904 2495 50  0000 C CNN
F 2 "" H 9900 2650 50  0001 C CNN
F 3 "" H 9900 2650 50  0001 C CNN
	1    9900 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35F1
P 6600 4600
AR Path="/5F6C0B36/5DAE35F1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35F1" Ref="#PWR0158"  Part="1" 
F 0 "#PWR0158" H 6600 4350 50  0001 C CNN
F 1 "GNDD" H 6604 4445 50  0000 C CNN
F 2 "" H 6600 4600 50  0001 C CNN
F 3 "" H 6600 4600 50  0001 C CNN
	1    6600 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35F7
P 1700 4750
AR Path="/5F6C0B36/5DAE35F7" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35F7" Ref="#PWR0159"  Part="1" 
F 0 "#PWR0159" H 1700 4500 50  0001 C CNN
F 1 "GNDD" H 1704 4595 50  0000 C CNN
F 2 "" H 1700 4750 50  0001 C CNN
F 3 "" H 1700 4750 50  0001 C CNN
	1    1700 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35FD
P 1700 2650
AR Path="/5F6C0B36/5DAE35FD" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35FD" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 1700 2400 50  0001 C CNN
F 1 "GNDD" H 1704 2495 50  0000 C CNN
F 2 "" H 1700 2650 50  0001 C CNN
F 3 "" H 1700 2650 50  0001 C CNN
	1    1700 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE3603
P 3300 3150
AR Path="/5F6C0B36/5DAE3603" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3603" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 3300 2900 50  0001 C CNN
F 1 "GNDD" H 3304 2995 50  0000 C CNN
F 2 "" H 3300 3150 50  0001 C CNN
F 3 "" H 3300 3150 50  0001 C CNN
	1    3300 3150
	1    0    0    -1  
$EndComp
Text GLabel 2800 4750 0    50   Input ~ 0
~xroe
Text GLabel 2800 4850 0    50   Input ~ 0
~xroe
Text Label 2600 1350 0    50   ~ 0
DA0
Text Label 2600 1450 0    50   ~ 0
DA1
Text Label 2600 1550 0    50   ~ 0
DA2
Text Label 2600 1650 0    50   ~ 0
DA3
Text Label 2600 1750 0    50   ~ 0
DA4
Text Label 2600 1850 0    50   ~ 0
DA5
Text Label 2600 1950 0    50   ~ 0
DA6
Text Label 2600 2050 0    50   ~ 0
DA7
Text Label 2600 2150 0    50   ~ 0
DA8
Text Label 2600 2250 0    50   ~ 0
DA9
Text Label 2600 2350 0    50   ~ 0
DA10
Text Label 2600 2450 0    50   ~ 0
DA11
Text Label 2600 2550 0    50   ~ 0
DA12
Text Label 2600 2650 0    50   ~ 0
DA13
Text Label 2600 2750 0    50   ~ 0
DA14
Text Label 2600 2850 0    50   ~ 0
DA15
Text GLabel 4600 6550 0    50   Input ~ 0
~pcle
Text GLabel 4600 4400 0    50   Input ~ 0
~pcle
Text GLabel 5700 2250 3    50   Output ~ 0
PA[0..15]
$Comp
L power:VCC #PWR?
U 1 1 5DAE3623
P 6800 4750
AR Path="/5F6C0B36/5DAE3623" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3623" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 6800 4600 50  0001 C CNN
F 1 "VCC" H 6817 4923 50  0000 C CNN
F 2 "" H 6800 4750 50  0001 C CNN
F 3 "" H 6800 4750 50  0001 C CNN
	1    6800 4750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE362D
P 5200 5750
AR Path="/5F6C0B36/5DAE362D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE362D" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 5200 5600 50  0001 C CNN
F 1 "VCC" H 5217 5923 50  0000 C CNN
F 2 "" H 5200 5750 50  0001 C CNN
F 3 "" H 5200 5750 50  0001 C CNN
	1    5200 5750
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3633
P 5100 3600
AR Path="/5F6C0B36/5DAE3633" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3633" Ref="#PWR0164"  Part="1" 
F 0 "#PWR0164" H 5100 3450 50  0001 C CNN
F 1 "VCC" H 5117 3773 50  0000 C CNN
F 2 "" H 5100 3600 50  0001 C CNN
F 3 "" H 5100 3600 50  0001 C CNN
	1    5100 3600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3639
P 1700 1050
AR Path="/5F6C0B36/5DAE3639" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3639" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 1700 900 50  0001 C CNN
F 1 "VCC" H 1717 1223 50  0000 C CNN
F 2 "" H 1700 1050 50  0001 C CNN
F 3 "" H 1700 1050 50  0001 C CNN
	1    1700 1050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE363F
P 3300 1150
AR Path="/5F6C0B36/5DAE363F" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE363F" Ref="#PWR0166"  Part="1" 
F 0 "#PWR0166" H 3300 1000 50  0001 C CNN
F 1 "VCC" H 3317 1323 50  0000 C CNN
F 2 "" H 3300 1150 50  0001 C CNN
F 3 "" H 3300 1150 50  0001 C CNN
	1    3300 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3645
P 4900 1050
AR Path="/5F6C0B36/5DAE3645" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3645" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 4900 900 50  0001 C CNN
F 1 "VCC" H 4917 1223 50  0000 C CNN
F 2 "" H 4900 1050 50  0001 C CNN
F 3 "" H 4900 1050 50  0001 C CNN
	1    4900 1050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE364B
P 6600 1050
AR Path="/5F6C0B36/5DAE364B" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE364B" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 6600 900 50  0001 C CNN
F 1 "VCC" H 6617 1223 50  0000 C CNN
F 2 "" H 6600 1050 50  0001 C CNN
F 3 "" H 6600 1050 50  0001 C CNN
	1    6600 1050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3651
P 8400 1150
AR Path="/5F6C0B36/5DAE3651" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3651" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 8400 1000 50  0001 C CNN
F 1 "VCC" H 8417 1323 50  0000 C CNN
F 2 "" H 8400 1150 50  0001 C CNN
F 3 "" H 8400 1150 50  0001 C CNN
	1    8400 1150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3657
P 9900 1050
AR Path="/5F6C0B36/5DAE3657" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3657" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 9900 900 50  0001 C CNN
F 1 "VCC" H 9917 1223 50  0000 C CNN
F 2 "" H 9900 1050 50  0001 C CNN
F 3 "" H 9900 1050 50  0001 C CNN
	1    9900 1050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE365D
P 1700 3150
AR Path="/5F6C0B36/5DAE365D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE365D" Ref="#PWR0171"  Part="1" 
F 0 "#PWR0171" H 1700 3000 50  0001 C CNN
F 1 "VCC" H 1717 3323 50  0000 C CNN
F 2 "" H 1700 3150 50  0001 C CNN
F 3 "" H 1700 3150 50  0001 C CNN
	1    1700 3150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3663
P 1700 5250
AR Path="/5F6C0B36/5DAE3663" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3663" Ref="#PWR0172"  Part="1" 
F 0 "#PWR0172" H 1700 5100 50  0001 C CNN
F 1 "VCC" H 1717 5423 50  0000 C CNN
F 2 "" H 1700 5250 50  0001 C CNN
F 3 "" H 1700 5250 50  0001 C CNN
	1    1700 5250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3669
P 3300 5650
AR Path="/5F6C0B36/5DAE3669" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3669" Ref="#PWR0173"  Part="1" 
F 0 "#PWR0173" H 3300 5500 50  0001 C CNN
F 1 "VCC" H 3317 5823 50  0000 C CNN
F 2 "" H 3300 5650 50  0001 C CNN
F 3 "" H 3300 5650 50  0001 C CNN
	1    3300 5650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE366F
P 3300 3550
AR Path="/5F6C0B36/5DAE366F" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE366F" Ref="#PWR0174"  Part="1" 
F 0 "#PWR0174" H 3300 3400 50  0001 C CNN
F 1 "VCC" H 3317 3723 50  0000 C CNN
F 2 "" H 3300 3550 50  0001 C CNN
F 3 "" H 3300 3550 50  0001 C CNN
	1    3300 3550
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3675
P 8400 4250
AR Path="/5F6C0B36/5DAE3675" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3675" Ref="#PWR0175"  Part="1" 
F 0 "#PWR0175" H 8400 4100 50  0001 C CNN
F 1 "VCC" H 8417 4423 50  0000 C CNN
F 2 "" H 8400 4250 50  0001 C CNN
F 3 "" H 8400 4250 50  0001 C CNN
	1    8400 4250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE367B
P 6700 2900
AR Path="/5F6C0B36/5DAE367B" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE367B" Ref="#PWR0176"  Part="1" 
F 0 "#PWR0176" H 6700 2750 50  0001 C CNN
F 1 "VCC" H 6717 3073 50  0000 C CNN
F 2 "" H 6700 2900 50  0001 C CNN
F 3 "" H 6700 2900 50  0001 C CNN
	1    6700 2900
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DAE3681
P 9900 3100
AR Path="/5F6C0B36/5DAE3681" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE3681" Ref="#PWR0177"  Part="1" 
F 0 "#PWR0177" H 9900 2950 50  0001 C CNN
F 1 "VCC" H 9917 3273 50  0000 C CNN
F 2 "" H 9900 3100 50  0001 C CNN
F 3 "" H 9900 3100 50  0001 C CNN
	1    9900 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DAE368B
P 9900 4700
AR Path="/5F6C0B36/5DAE368B" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE368B" Ref="#PWR0178"  Part="1" 
F 0 "#PWR0178" H 9900 4450 50  0001 C CNN
F 1 "GNDD" H 9904 4545 50  0000 C CNN
F 2 "" H 9900 4700 50  0001 C CNN
F 3 "" H 9900 4700 50  0001 C CNN
	1    9900 4700
	1    0    0    -1  
$EndComp
Text Label 3850 1850 0    50   ~ 0
DD5
Entry Wire Line
	2500 2050 2400 1950
Entry Wire Line
	2500 1950 2400 1850
Entry Wire Line
	2500 1850 2400 1750
Entry Wire Line
	2500 1750 2400 1650
Entry Wire Line
	2500 1650 2400 1550
Entry Wire Line
	2500 1550 2400 1450
Entry Wire Line
	2500 1450 2400 1350
Entry Wire Line
	2500 1450 2600 1350
Entry Wire Line
	2500 1550 2600 1450
Entry Wire Line
	2500 1650 2600 1550
Entry Wire Line
	2500 1750 2600 1650
Entry Wire Line
	2500 1850 2600 1750
Entry Wire Line
	2500 1950 2600 1850
Entry Wire Line
	2500 2050 2600 1950
Entry Wire Line
	2500 2150 2600 2050
Entry Wire Line
	2500 2250 2600 2150
Entry Wire Line
	2500 2350 2600 2250
Entry Wire Line
	2500 2450 2600 2350
Entry Wire Line
	2500 2550 2600 2450
Entry Wire Line
	2500 2650 2600 2550
Entry Wire Line
	2500 2750 2600 2650
Entry Wire Line
	2500 2850 2600 2750
Entry Wire Line
	2500 2950 2600 2850
Entry Wire Line
	2500 2150 2400 2050
Entry Bus Bus
	900  7450 1000 7550
Entry Bus Bus
	4200 7550 4300 7450
Entry Bus Bus
	4000 5400 4100 5300
Entry Bus Bus
	4300 3200 4400 3100
Entry Bus Bus
	4100 3000 4200 2900
Entry Bus Bus
	5700 2900 5800 2800
Entry Bus Bus
	10600 5650 10700 5550
Wire Bus Line
	1000 7550 4200 7550
Text GLabel 10400 1950 2    50   Output ~ 0
mode0
Text GLabel 10400 2050 2    50   Output ~ 0
mode1
Text GLabel 10400 1750 2    50   Output ~ 0
vsync
Text GLabel 10400 1850 2    50   Output ~ 0
vblank
$Comp
L power:GNDD #PWR?
U 1 1 5DAE35EB
P 6500 2750
AR Path="/5F6C0B36/5DAE35EB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA19D5/5DAE35EB" Ref="#PWR0179"  Part="1" 
F 0 "#PWR0179" H 6500 2500 50  0001 C CNN
F 1 "GNDD" H 6504 2595 50  0000 C CNN
F 2 "" H 6500 2750 50  0001 C CNN
F 3 "" H 6500 2750 50  0001 C CNN
	1    6500 2750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS257 U?
U 1 1 5DAE32AE
P 8400 5150
AR Path="/5F6C0B36/5DAE32AE" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE32AE" Ref="U24"  Part="1" 
F 0 "U24" H 8400 5150 50  0000 C CNN
F 1 "74F257" H 8450 5050 50  0000 C CNN
F 2 "" H 8400 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS257" H 8400 5150 50  0001 C CNN
	1    8400 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4000 6150 3800 6150
Text GLabel 2250 5150 1    50   Input ~ 0
DD[0..7]
Wire Wire Line
	5600 4400 5700 4400
Wire Wire Line
	5700 4400 5700 5450
Wire Wire Line
	6500 2750 6500 2700
Wire Wire Line
	6500 2700 6600 2700
Wire Wire Line
	6600 4600 6600 4550
Wire Wire Line
	6600 4550 6700 4550
Wire Wire Line
	6800 6350 6800 6400
Wire Wire Line
	6800 6400 6700 6400
Wire Wire Line
	6700 6400 6700 6450
Wire Wire Line
	4650 6750 4650 5450
Wire Wire Line
	4650 5450 5700 5450
Wire Wire Line
	4650 6750 4700 6750
Wire Wire Line
	4600 6550 4700 6550
Wire Wire Line
	4600 6650 4700 6650
Wire Wire Line
	4400 6050 4700 6050
Wire Wire Line
	4400 6150 4700 6150
Wire Wire Line
	4400 6250 4700 6250
Wire Wire Line
	4400 6350 4700 6350
Wire Bus Line
	9200 5650 10600 5650
Wire Bus Line
	4200 2900 5700 2900
Wire Bus Line
	4400 3100 5900 3100
Wire Wire Line
	6600 2700 6600 2650
Wire Wire Line
	6700 4550 6700 4500
Wire Wire Line
	4400 3900 4600 3900
Wire Wire Line
	4400 4000 4600 4000
Wire Wire Line
	4400 4100 4600 4100
Wire Wire Line
	4400 4200 4600 4200
Wire Wire Line
	7100 1350 7500 1350
Wire Wire Line
	7100 1450 7500 1450
Wire Wire Line
	7100 1550 7500 1550
Wire Wire Line
	7100 1650 7500 1650
Wire Wire Line
	7100 1750 7500 1750
Wire Wire Line
	7100 1850 7500 1850
Wire Wire Line
	7100 1950 7500 1950
Wire Wire Line
	7100 2050 7500 2050
Wire Wire Line
	7700 1350 8000 1350
Wire Wire Line
	7700 1450 8000 1450
Wire Wire Line
	7700 1550 8000 1550
Wire Wire Line
	7700 1650 8000 1650
Wire Wire Line
	7700 1750 8000 1750
Wire Wire Line
	7700 2850 8000 2850
Wire Wire Line
	7700 2750 8000 2750
Wire Wire Line
	7700 2650 8000 2650
Wire Wire Line
	7700 2550 8000 2550
Wire Wire Line
	7700 2450 8000 2450
Wire Wire Line
	7700 2350 8000 2350
Wire Wire Line
	7700 2250 8000 2250
Wire Wire Line
	7700 2150 8000 2150
Wire Wire Line
	7700 2050 8000 2050
Wire Wire Line
	7700 1950 8000 1950
Wire Wire Line
	7700 1850 8000 1850
Wire Wire Line
	7200 3300 7500 3300
Wire Wire Line
	7200 3400 7500 3400
Wire Wire Line
	7200 3500 7500 3500
Wire Wire Line
	7200 3600 7500 3600
Wire Wire Line
	7200 3700 7500 3700
Wire Wire Line
	7200 3800 7500 3800
Wire Wire Line
	7200 3900 7500 3900
$Comp
L 74xx:74LS574 U?
U 1 1 5DAE327E
P 1700 6050
AR Path="/5F6C0B36/5DAE327E" Ref="U?"  Part="1" 
AR Path="/5DAA19D5/5DAE327E" Ref="U29"  Part="1" 
F 0 "U29" H 1700 5850 50  0000 C CNN
F 1 "74F574" H 1700 5750 50  0000 C CNN
F 2 "" H 1700 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1700 6050 50  0001 C CNN
	1    1700 6050
	1    0    0    -1  
$EndComp
Wire Bus Line
	1000 750  9000 750 
Entry Bus Bus
	900  850  1000 750 
Entry Bus Bus
	9000 750  9100 850 
Entry Bus Bus
	2250 5300 2350 5400
Wire Bus Line
	2250 5150 2250 5300
Wire Bus Line
	2350 5400 2500 5400
Connection ~ 2500 5400
Wire Bus Line
	2500 5400 4000 5400
Entry Bus Bus
	5900 3100 6000 3000
Text GLabel 6000 2900 1    50   Output ~ 0
PD[0..7]
Wire Bus Line
	6000 3000 6000 2900
Wire Wire Line
	7200 3200 7500 3200
Wire Wire Line
	6000 5050 6300 5050
Wire Wire Line
	6000 5150 6300 5150
Wire Wire Line
	6000 5250 6300 5250
Wire Wire Line
	6000 5350 6300 5350
$Comp
L 74xx:74LS00 U?
U 4 1 5CF33C64
P 10700 2750
AR Path="/62D13D9D/5CF33C64" Ref="U?"  Part="4" 
AR Path="/5DAA19D5/5CF33C64" Ref="U7"  Part="4" 
F 0 "U7" H 10700 2750 50  0000 C CNN
F 1 "74F00" H 10700 2550 50  0001 C CNN
F 2 "" H 10700 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 10700 2750 50  0001 C CNN
	4    10700 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	10400 1650 10800 1650
Text GLabel 10600 2450 1    50   Input ~ 0
qclk2
Text GLabel 10500 3100 0    50   Output ~ 0
dcs
Wire Wire Line
	10800 1650 10800 2450
Wire Wire Line
	10500 3100 10700 3100
Wire Wire Line
	10700 3100 10700 3050
Wire Bus Line
	10700 1150 10700 1450
Wire Bus Line
	4100 5850 4100 6150
Wire Bus Line
	4100 6450 4100 6850
Wire Bus Line
	2500 6450 2500 6850
Wire Bus Line
	5900 3100 5900 3800
Wire Bus Line
	5900 4000 5900 5250
Wire Bus Line
	6000 5550 6000 6250
Wire Bus Line
	9200 4650 9200 5650
Wire Bus Line
	10700 3500 10700 5550
Wire Bus Line
	2500 5400 2500 6150
Wire Bus Line
	5700 1450 5700 2250
Wire Bus Line
	5800 1450 5800 2800
Wire Bus Line
	4100 1450 4100 5300
Wire Bus Line
	9100 850  9100 4000
Wire Bus Line
	4300 3200 4300 7450
Wire Bus Line
	7600 1450 7600 5950
Wire Bus Line
	900  850  900  7450
Wire Bus Line
	2500 1450 2500 4750
$EndSCHEMATC
