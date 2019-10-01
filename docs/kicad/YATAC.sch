EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "YATAC78 TTL Computer"
Date "2019-09-30"
Rev "1.0.8"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 5450 2450 0    50   Input ~ 0
~rst
Text GLabel 5450 2750 0    50   Input ~ 0
rclk
$Comp
L 74xx:74LS32 U?
U 2 1 5DA1E72A
P 7050 2100
AR Path="/5CDEEC9F/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DA1E72A" Ref="U3"  Part="2" 
F 0 "U3" H 7050 2100 50  0000 C CNN
F 1 "74F32" H 7050 1900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7050 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7050 2100 50  0001 C CNN
	2    7050 2100
	1    0    0    -1  
$EndComp
Text Label 2400 2100 0    50   ~ 0
I7
Text GLabel 9050 2450 2    50   Output ~ 0
~voe
Text GLabel 8050 2950 0    50   Input ~ 0
~fetch
Text GLabel 8050 3250 0    50   Input ~ 0
dclk
Text GLabel 8050 3350 0    50   Input ~ 0
0
Text GLabel 9050 2650 2    50   Output ~ 0
~pgoe
Text GLabel 9050 2750 2    50   Output ~ 0
~alue
Text GLabel 9050 2350 2    50   Output ~ 0
~xoe
$Comp
L power:VCC #PWR?
U 1 1 5DA1E738
P 8550 2050
AR Path="/5CDEEC9F/5DA1E738" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E738" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E738" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 8550 1900 50  0001 C CNN
F 1 "VCC" H 8567 2223 50  0000 C CNN
F 2 "" H 8550 2050 50  0001 C CNN
F 3 "" H 8550 2050 50  0001 C CNN
	1    8550 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E73E
P 8550 3650
AR Path="/5CDEEC9F/5DA1E73E" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E73E" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E73E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8550 3400 50  0001 C CNN
F 1 "GNDD" H 8554 3495 50  0000 C CNN
F 2 "" H 8550 3650 50  0001 C CNN
F 3 "" H 8550 3650 50  0001 C CNN
	1    8550 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5DA1E744
P 8550 4200
AR Path="/5DA1E744" Ref="#PWR0103"  Part="1" 
AR Path="/5DAA5CD8/5DA1E744" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 8550 4050 50  0001 C CNN
F 1 "VCC" H 8567 4373 50  0000 C CNN
F 2 "" H 8550 4200 50  0001 C CNN
F 3 "" H 8550 4200 50  0001 C CNN
	1    8550 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 1800 3600
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U11"  Part="1" 
F 0 "U11" H 1800 3650 50  0000 C CNN
F 1 "74F138" H 1750 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 1800 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 1800 3600 50  0001 C CNN
	1    1800 3600
	-1   0    0    -1  
$EndComp
Text GLabel 1300 3600 0    50   Output ~ 0
~vle
Text GLabel 1300 3400 0    50   Output ~ 0
~ele
Text GLabel 1300 3900 0    50   Output ~ 0
~pcle
Text GLabel 1300 3300 0    50   Output ~ 0
~xle
Text GLabel 1300 3700 0    50   Output ~ 0
~yle
Text GLabel 1300 3800 0    50   Output ~ 0
~hlle
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 1800 3000
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 1800 2850 50  0001 C CNN
F 1 "VCC" H 1817 3173 50  0000 C CNN
F 2 "" H 1800 3000 50  0001 C CNN
F 3 "" H 1800 3000 50  0001 C CNN
	1    1800 3000
	1    0    0    -1  
$EndComp
Text GLabel 1300 3500 0    50   Output ~ 0
~sle
Text GLabel 1300 4000 0    50   Output ~ 0
~pgle
$Comp
L 74xx:74LS08 U?
U 1 1 5DA1E75E
P 2750 1300
AR Path="/5CDEEC9F/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DA1E75E" Ref="U2"  Part="1" 
F 0 "U2" H 2750 1300 50  0000 C CNN
F 1 "74F08" H 2750 1100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2750 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 2750 1300 50  0001 C CNN
	1    2750 1300
	-1   0    0    1   
$EndComp
Text Label 2650 1700 0    50   ~ 0
DD7
Text GLabel 3050 1200 2    50   Input ~ 0
~rst
Wire Wire Line
	2700 6200 2900 6200
Text Label 2400 3800 0    50   ~ 0
I9
Text GLabel 6750 1800 0    50   Input ~ 0
rclk
Entry Wire Line
	1100 5500 1000 5400
Entry Wire Line
	1100 5600 1000 5500
Entry Wire Line
	1100 5700 1000 5600
Entry Wire Line
	1100 5800 1000 5700
Entry Wire Line
	1100 5900 1000 5800
Entry Wire Line
	1100 6000 1000 5900
Entry Wire Line
	1100 6100 1000 6000
Entry Wire Line
	1100 6200 1000 6100
Entry Wire Line
	2600 5600 2500 5500
Entry Wire Line
	2600 5700 2500 5600
Entry Wire Line
	2600 5800 2500 5700
Entry Wire Line
	2600 6300 2500 6200
Text Label 2700 5500 0    50   ~ 0
I8
Text Label 2700 5600 0    50   ~ 0
I9
Text Label 2700 5700 0    50   ~ 0
I10
Text Label 2700 5800 0    50   ~ 0
I11
Text Label 2700 5900 0    50   ~ 0
I12
Text Label 2700 6000 0    50   ~ 0
I13
Text Label 2700 6100 0    50   ~ 0
I14
Text Label 2700 6200 0    50   ~ 0
I15
Text Label 1100 5500 0    50   ~ 0
PD0
Text Label 1100 5600 0    50   ~ 0
PD1
Text Label 1100 5700 0    50   ~ 0
PD2
Text Label 1100 5800 0    50   ~ 0
PD3
Text Label 1100 5900 0    50   ~ 0
PD4
Text Label 1100 6000 0    50   ~ 0
PD5
Text Label 1100 6100 0    50   ~ 0
PD6
Text Label 1100 6200 0    50   ~ 0
PD7
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 1800 5000
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 1800 4850 50  0001 C CNN
F 1 "VCC" H 1817 5173 50  0000 C CNN
F 2 "" H 1800 5000 50  0001 C CNN
F 3 "" H 1800 5000 50  0001 C CNN
	1    1800 5000
	1    0    0    -1  
$EndComp
Entry Wire Line
	2600 6200 2500 6100
Entry Wire Line
	2600 6100 2500 6000
Entry Wire Line
	2600 6000 2500 5900
Entry Wire Line
	2600 5900 2500 5800
Text GLabel 3900 6400 2    50   Input ~ 0
~ihle
Wire Wire Line
	1100 5500 1300 5500
Wire Wire Line
	1100 5600 1300 5600
Wire Wire Line
	1100 5700 1300 5700
Wire Wire Line
	1100 5800 1300 5800
Wire Wire Line
	1100 5900 1300 5900
Wire Wire Line
	1100 6000 1300 6000
Wire Wire Line
	1100 6100 1300 6100
Wire Wire Line
	1100 6200 1300 6200
Wire Wire Line
	2700 5500 2900 5500
Wire Wire Line
	2700 5600 2900 5600
Wire Wire Line
	2700 5700 2900 5700
Wire Wire Line
	2700 5800 2900 5800
Wire Wire Line
	2700 5900 2900 5900
Wire Wire Line
	2700 6000 2900 6000
Wire Wire Line
	2700 6100 2900 6100
Entry Wire Line
	2700 3700 2600 3800
Entry Wire Line
	2700 3600 2600 3700
Text Label 2700 3600 0    50   ~ 0
I11
Text Label 2700 3700 0    50   ~ 0
I4
Entry Wire Line
	2700 3100 2600 3200
Text Label 2700 3100 0    50   ~ 0
I2
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E7A5
P 7050 1700
AR Path="/5CDEEC9F/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DA1E7A5" Ref="U3"  Part="1" 
F 0 "U3" H 7050 1700 50  0000 C CNN
F 1 "74F32" H 7050 1500 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7050 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7050 1700 50  0001 C CNN
	1    7050 1700
	1    0    0    -1  
$EndComp
Text GLabel 6750 1600 0    50   Input ~ 0
hblank
Text GLabel 1300 1300 0    50   Output ~ 0
PA17
Text GLabel 1300 1500 0    50   Output ~ 0
~fetch
Text GLabel 1300 1600 0    50   Output ~ 0
hsel
Text GLabel 1300 1700 0    50   Output ~ 0
boot
Entry Wire Line
	2500 1900 2600 2000
$Comp
L 74xx:74LS08 U?
U 4 1 5DA1E7B1
P 4500 4400
AR Path="/5DAA3954/5DA1E7B1" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E7B1" Ref="U?"  Part="4" 
AR Path="/5DA1E7B1" Ref="U2"  Part="4" 
F 0 "U2" H 4500 4400 50  0000 C CNN
F 1 "74F08" H 4500 4200 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4500 4400 50  0001 C CNN
	4    4500 4400
	1    0    0    -1  
$EndComp
Text Label 2400 1900 0    50   ~ 0
I5
Entry Wire Line
	2500 2000 2600 2100
Entry Wire Line
	2500 2100 2600 2200
Wire Wire Line
	2300 6200 2350 6200
Wire Wire Line
	3900 6200 4100 6200
Wire Wire Line
	3900 6100 4100 6100
Wire Wire Line
	3900 6000 4100 6000
Wire Wire Line
	3900 5900 4100 5900
Wire Wire Line
	3900 5800 4100 5800
Wire Wire Line
	3900 5700 4100 5700
Wire Wire Line
	3900 5600 4100 5600
Wire Wire Line
	3900 5500 4100 5500
Text GLabel 1300 6400 0    50   Input ~ 0
~ille
Entry Wire Line
	4200 5900 4100 5800
Entry Wire Line
	4200 6000 4100 5900
Entry Wire Line
	4200 6100 4100 6000
Entry Wire Line
	4200 6200 4100 6100
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7C8
P 1800 1100
AR Path="/5CDEEC9F/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7C8" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 1800 950 50  0001 C CNN
F 1 "VCC" H 1817 1273 50  0000 C CNN
F 2 "" H 1800 1100 50  0001 C CNN
F 3 "" H 1800 1100 50  0001 C CNN
	1    1800 1100
	1    0    0    -1  
$EndComp
Text GLabel 1000 5200 1    50   Input ~ 0
PD[0..7]
Text Label 3950 6200 0    50   ~ 0
PD7
Text Label 3950 6100 0    50   ~ 0
PD6
Text Label 3950 6000 0    50   ~ 0
PD5
Text Label 3950 5900 0    50   ~ 0
PD4
Text Label 3950 5800 0    50   ~ 0
PD3
Text Label 3950 5700 0    50   ~ 0
PD2
Text Label 3950 5600 0    50   ~ 0
PD1
Text Label 3950 5500 0    50   ~ 0
PD0
Text Label 2400 6200 0    50   ~ 0
I7
Text Label 2400 6100 0    50   ~ 0
I6
Text Label 2400 6000 0    50   ~ 0
I5
Text Label 2400 5900 0    50   ~ 0
I4
Text Label 2400 5800 0    50   ~ 0
I3
Text Label 2400 5700 0    50   ~ 0
I2
Text Label 2400 5600 0    50   ~ 0
I1
Text Label 2400 5500 0    50   ~ 0
I0
Entry Wire Line
	4200 6300 4100 6200
Entry Wire Line
	4200 5800 4100 5700
Entry Wire Line
	4200 5700 4100 5600
Entry Wire Line
	4200 5600 4100 5500
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 3400 6800
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 3400 6550 50  0001 C CNN
F 1 "GNDD" H 3404 6645 50  0000 C CNN
F 2 "" H 3400 6800 50  0001 C CNN
F 3 "" H 3400 6800 50  0001 C CNN
	1    3400 6800
	1    0    0    -1  
$EndComp
Entry Wire Line
	2600 6200 2700 6100
Entry Wire Line
	2600 6100 2700 6000
Entry Wire Line
	2600 6000 2700 5900
Entry Wire Line
	2600 5900 2700 5800
Entry Wire Line
	2600 5800 2700 5700
Entry Wire Line
	2600 5700 2700 5600
Entry Wire Line
	2600 5600 2700 5500
Entry Wire Line
	2600 6300 2700 6200
Text GLabel 1300 6500 0    50   Input ~ 0
0
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 3400 6000
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U13"  Part="1" 
F 0 "U13" H 3400 5800 50  0000 C CNN
F 1 "74F574" H 3400 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 3400 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 3400 6000 50  0001 C CNN
	1    3400 6000
	-1   0    0    -1  
$EndComp
Entry Wire Line
	2500 3300 2600 3400
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 3400 5200
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 3400 5050 50  0001 C CNN
F 1 "VCC" H 3417 5373 50  0000 C CNN
F 2 "" H 3400 5200 50  0001 C CNN
F 3 "" H 3400 5200 50  0001 C CNN
	1    3400 5200
	1    0    0    -1  
$EndComp
Text GLabel 2600 6500 3    50   Output ~ 0
I[0..15]
Text Label 2400 2000 0    50   ~ 0
I6
Text Label 2400 3500 0    50   ~ 0
I8
Text Label 2400 3400 0    50   ~ 0
I1
Text Label 2400 3300 0    50   ~ 0
I0
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 1800 4300
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 1800 4050 50  0001 C CNN
F 1 "GNDD" H 1804 4145 50  0000 C CNN
F 2 "" H 1800 4300 50  0001 C CNN
F 3 "" H 1800 4300 50  0001 C CNN
	1    1800 4300
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 1800 1800
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U10"  Part="1" 
F 0 "U10" H 1800 1650 50  0000 C CNN
F 1 "PAL16R4" H 1800 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1800 1800 50  0001 C CNN
F 3 "" H 1800 1800 50  0001 C CNN
	1    1800 1800
	-1   0    0    -1  
$EndComp
Entry Wire Line
	2500 3500 2600 3600
Entry Wire Line
	2500 3400 2600 3500
Text GLabel 2300 1600 2    50   Input ~ 0
hblank
Text GLabel 2300 1400 2    50   Input ~ 0
~rst
Text GLabel 2300 1500 2    50   Input ~ 0
pclk1
Text GLabel 2300 2200 2    50   Input ~ 0
0
Text GLabel 3050 1400 2    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 1800 2500
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 1800 2250 50  0001 C CNN
F 1 "GNDD" H 1804 2345 50  0000 C CNN
F 2 "" H 1800 2500 50  0001 C CNN
F 3 "" H 1800 2500 50  0001 C CNN
	1    1800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1900 2500 1900
Wire Wire Line
	2500 2000 2300 2000
Wire Wire Line
	2300 2100 2500 2100
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 2100 4700
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 2600 4650 50  0000 L CNN
F 1 "270" V 2500 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2575 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2100 4700 50  0001 C CNN
	1    2100 4700
	0    -1   -1   0   
$EndComp
Entry Wire Line
	2600 4500 2500 4400
Entry Wire Line
	2600 5200 2500 5100
Entry Wire Line
	2600 4700 2500 4600
Entry Wire Line
	2600 4600 2500 4500
Entry Wire Line
	2600 4900 2500 4800
Entry Wire Line
	2600 4800 2500 4700
Entry Wire Line
	2600 5100 2500 5000
Entry Wire Line
	2600 5000 2500 4900
Wire Wire Line
	2300 4400 2500 4400
Wire Wire Line
	2300 4500 2500 4500
Wire Wire Line
	2300 4600 2500 4600
Wire Wire Line
	2300 4700 2500 4700
Wire Wire Line
	2300 4800 2500 4800
Wire Wire Line
	2300 4900 2500 4900
Wire Wire Line
	2300 5000 2500 5000
Wire Wire Line
	2300 5100 2500 5100
Text Label 2350 4400 0    50   ~ 0
I15
Text Label 2350 4500 0    50   ~ 0
I14
Text Label 2350 4600 0    50   ~ 0
I13
Text Label 2350 4700 0    50   ~ 0
I12
Text Label 2350 4800 0    50   ~ 0
I11
Text Label 2350 4900 0    50   ~ 0
I10
Text Label 2400 5000 0    50   ~ 0
I9
Text Label 2400 5100 0    50   ~ 0
I8
Text GLabel 4050 4200 0    50   Input ~ 0
qclk1
Wire Wire Line
	2350 6200 2350 7050
Wire Wire Line
	2350 7050 4000 7050
Wire Wire Line
	4000 7050 4000 6500
Wire Wire Line
	4000 6500 3900 6500
Connection ~ 2350 6200
Wire Wire Line
	2350 6200 2500 6200
Entry Bus Bus
	1000 7100 1100 7200
Entry Bus Bus
	4100 7200 4200 7100
Wire Bus Line
	1100 7200 4100 7200
Wire Wire Line
	2300 3800 2500 3800
Wire Wire Line
	2300 3500 2500 3500
Wire Wire Line
	2300 3400 2500 3400
Wire Wire Line
	1800 5200 1800 5100
Wire Wire Line
	1800 5100 1900 5100
Connection ~ 1800 5100
Wire Wire Line
	1800 5100 1800 5000
Text GLabel 4800 3600 2    50   Output ~ 0
~aoe
Text GLabel 4800 3200 2    50   Output ~ 0
~dwe
Text GLabel 2900 3900 0    50   Input ~ 0
~ramr
Text GLabel 4050 3400 0    50   Input ~ 0
~ramw
Wire Wire Line
	4200 3500 4150 3500
$Comp
L 74xx:74LS32 U?
U 4 1 5DA1E854
P 4500 4800
AR Path="/5CDEEC9F/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DA1E854" Ref="U3"  Part="4" 
F 0 "U3" H 4500 4800 50  0000 C CNN
F 1 "74F32" H 4500 4600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4500 4800 50  0001 C CNN
	4    4500 4800
	1    0    0    -1  
$EndComp
Text GLabel 3900 3700 2    50   Output ~ 0
~eoe
Wire Wire Line
	2700 3600 2900 3600
Wire Wire Line
	2700 3700 2900 3700
Text GLabel 7450 4400 1    50   Output ~ 0
dclk
Wire Wire Line
	9050 4500 9450 4500
Connection ~ 9100 4600
Wire Wire Line
	9100 4600 9450 4600
Wire Wire Line
	9050 4700 9450 4700
Wire Wire Line
	9050 4800 9450 4800
Connection ~ 9250 4900
Wire Wire Line
	9250 4900 9450 4900
Wire Wire Line
	9050 5000 9450 5000
Wire Wire Line
	9050 5100 9450 5100
Connection ~ 9100 5200
Wire Wire Line
	9100 5200 9450 5200
Wire Wire Line
	8000 4500 8050 4500
$Comp
L power:GNDD #PWR0111
U 1 1 5DA1E86A
P 8550 5700
AR Path="/5DA1E86A" Ref="#PWR0111"  Part="1" 
AR Path="/5DAA5CD8/5DA1E86A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 8550 5450 50  0001 C CNN
F 1 "GNDD" H 8554 5545 50  0000 C CNN
F 2 "" H 8550 5700 50  0001 C CNN
F 3 "" H 8550 5700 50  0001 C CNN
	1    8550 5700
	1    0    0    -1  
$EndComp
Text GLabel 9450 4700 2    50   Output ~ 0
pclk1
Text GLabel 9450 4800 2    50   Output ~ 0
qclk1
Text GLabel 9450 4900 2    50   Output ~ 0
pclk2
Text GLabel 9450 5000 2    50   Output ~ 0
qclk2
Text GLabel 9450 5100 2    50   Output ~ 0
rclk
Text GLabel 9450 5200 2    50   Output ~ 0
sclk
Text GLabel 9450 4500 2    50   Output ~ 0
mclk
Text GLabel 9450 4600 2    50   Output ~ 0
nclk
Wire Wire Line
	9050 4900 9250 4900
Wire Wire Line
	9050 4600 9100 4600
Wire Wire Line
	9050 5200 9100 5200
Wire Wire Line
	8000 4700 8050 4700
Wire Wire Line
	8050 4900 8000 4900
Wire Wire Line
	8000 4900 8000 4700
Wire Wire Line
	9250 4900 9250 6100
Wire Wire Line
	9250 6100 7850 6100
Wire Wire Line
	7850 6100 7850 5100
Wire Wire Line
	7850 5100 8050 5100
$Comp
L 74xx:74LS175 U8
U 1 1 5DA1E882
P 8550 4900
AR Path="/5DA1E882" Ref="U8"  Part="1" 
AR Path="/5DAA5CD8/5DA1E882" Ref="U?"  Part="1" 
F 0 "U8" H 8550 4900 50  0000 C CNN
F 1 "74F175" H 8550 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 8550 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 8550 4900 50  0001 C CNN
	1    8550 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 5400 7450 5600
Wire Wire Line
	7450 5900 7450 6100
Wire Wire Line
	6350 5800 6350 6100
Wire Wire Line
	5200 6200 5200 6100
Connection ~ 5900 6100
Wire Wire Line
	5900 6100 5900 6000
Wire Wire Line
	5200 6100 5900 6100
Wire Wire Line
	5200 6000 5200 6100
$Comp
L Device:R_US R?
U 1 1 5DA1E890
P 5900 5350
AR Path="/62D13D9D/5DA1E890" Ref="R?"  Part="1" 
AR Path="/5DA1E890" Ref="R2"  Part="1" 
AR Path="/5DAA5CD8/5DA1E890" Ref="R?"  Part="1" 
F 0 "R2" H 6000 5400 50  0000 L CNN
F 1 "270" H 6000 5300 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5940 5340 50  0001 C CNN
F 3 "~" H 5900 5350 50  0001 C CNN
	1    5900 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5DA1E896
P 5550 5100
AR Path="/62D13D9D/5DA1E896" Ref="R?"  Part="1" 
AR Path="/5DA1E896" Ref="R1"  Part="1" 
AR Path="/5DAA5CD8/5DA1E896" Ref="R?"  Part="1" 
F 0 "R1" V 5755 5100 50  0000 C CNN
F 1 "1k" V 5664 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5590 5090 50  0001 C CNN
F 3 "~" H 5550 5100 50  0001 C CNN
	1    5550 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5DA1E89C
P 5550 5600
AR Path="/5DA1E89C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5DA1E89C" Ref="Y?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E89C" Ref="Y?"  Part="1" 
F 0 "Y1" H 5550 5868 50  0000 C CNN
F 1 "32M" H 5550 5777 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 5550 5600 50  0001 C CNN
F 3 "~" H 5550 5600 50  0001 C CNN
	1    5550 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5DA1E8A2
P 5200 5850
AR Path="/5DA1E8A2" Ref="C1"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8A2" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8A2" Ref="C?"  Part="1" 
F 0 "C1" H 5315 5896 50  0000 L CNN
F 1 "22p" H 5315 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 5238 5700 50  0001 C CNN
F 3 "~" H 5200 5850 50  0001 C CNN
	1    5200 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5DA1E8A8
P 5900 5850
AR Path="/5DA1E8A8" Ref="C2"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8A8" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8A8" Ref="C?"  Part="1" 
F 0 "C2" H 6015 5896 50  0000 L CNN
F 1 "22p" H 6015 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 5938 5700 50  0001 C CNN
F 3 "~" H 5900 5850 50  0001 C CNN
	1    5900 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5700 5900 5600
Wire Wire Line
	5200 5700 5200 5600
Connection ~ 5200 5600
$Comp
L power:GNDD #PWR0112
U 1 1 5DA1E8B1
P 5200 6200
AR Path="/5DA1E8B1" Ref="#PWR0112"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8B1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8B1" Ref="#PWR?"  Part="1" 
F 0 "#PWR0112" H 5200 5950 50  0001 C CNN
F 1 "GNDD" H 5204 6045 50  0000 C CNN
F 2 "" H 5200 6200 50  0001 C CNN
F 3 "" H 5200 6200 50  0001 C CNN
	1    5200 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5100 5900 5100
Wire Wire Line
	5200 5600 5400 5600
Wire Wire Line
	5700 5600 5900 5600
Connection ~ 5200 6100
$Comp
L Switch:SW_Push SW1
U 1 1 5DA1E8BB
P 6950 5750
AR Path="/5DA1E8BB" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8BB" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5DA1E8BB" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8BB" Ref="SW?"  Part="1" 
F 0 "SW1" V 6900 5950 50  0000 L CNN
F 1 "RST" V 7000 5950 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 6950 5950 50  0001 C CNN
F 3 "~" H 6950 5950 50  0001 C CNN
	1    6950 5750
	0    1    -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 5DA1E8C1
P 7450 5750
AR Path="/5DA1E8C1" Ref="C3"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8C1" Ref="C?"  Part="1" 
AR Path="/62D13D9D/5DA1E8C1" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8C1" Ref="C?"  Part="1" 
F 0 "C3" H 7565 5796 50  0000 L CNN
F 1 "100p" H 7565 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 7488 5600 50  0001 C CNN
F 3 "~" H 7450 5750 50  0001 C CNN
	1    7450 5750
	1    0    0    -1  
$EndComp
$Comp
L Power_Supervisor:TCM809 Q1
U 1 1 5DA1E8C7
P 6450 5400
AR Path="/5DA1E8C7" Ref="Q1"  Part="1" 
AR Path="/5CDEEC9F/5DA1E8C7" Ref="Q?"  Part="1" 
AR Path="/62D13D9D/5DA1E8C7" Ref="Q?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8C7" Ref="Q?"  Part="1" 
F 0 "Q1" H 6600 5550 50  0000 R CNN
F 1 "DS1233" H 7000 5550 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 6050 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 6150 5650 50  0001 C CNN
	1    6450 5400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0113
U 1 1 5DA1E8CD
P 6350 5000
AR Path="/5DA1E8CD" Ref="#PWR0113"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8CD" Ref="#PWR?"  Part="1" 
F 0 "#PWR0113" H 6350 4850 50  0001 C CNN
F 1 "VCC" H 6367 5173 50  0000 C CNN
F 2 "" H 6350 5000 50  0001 C CNN
F 3 "" H 6350 5000 50  0001 C CNN
	1    6350 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5100 5200 5100
Connection ~ 8000 4900
Wire Wire Line
	9100 5200 9100 5950
Wire Wire Line
	9100 5950 8000 5950
Wire Wire Line
	8000 4900 8000 5950
Wire Wire Line
	5900 6100 6350 6100
Text GLabel 7200 5200 1    50   Output ~ 0
~rst
Text GLabel 2900 2750 0    50   Input ~ 0
0
Text GLabel 2900 2550 0    50   Input ~ 0
qclk1
NoConn ~ 3900 2450
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 5950 2550
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U7"  Part="2" 
F 0 "U7" H 5950 2550 50  0000 C CNN
F 1 "74F139" H 5900 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5950 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5950 2550 50  0001 C CNN
	2    5950 2550
	1    0    0    -1  
$EndComp
Text GLabel 3900 2750 2    50   Output ~ 0
~ramw
Text GLabel 3900 2650 2    50   Output ~ 0
~romw
Text GLabel 3900 2550 2    50   Output ~ 0
~ramr
Text GLabel 4800 4000 2    50   Output ~ 0
~doe
Wire Wire Line
	5200 5100 5200 5600
Wire Wire Line
	5900 5600 5900 5500
Connection ~ 5900 5600
Wire Wire Line
	5900 5200 5900 5100
Connection ~ 5900 5100
Connection ~ 5200 5100
Text GLabel 5450 3700 0    50   Input ~ 0
hsel
Text GLabel 5450 3900 0    50   Input ~ 0
qclk1
Text GLabel 6450 3700 2    50   Output ~ 0
~ihle
Text GLabel 6450 3600 2    50   Output ~ 0
~ille
Text GLabel 5450 3600 0    50   Input ~ 0
~fetch
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 5950 3700
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U7"  Part="1" 
F 0 "U7" H 5950 3700 50  0000 C CNN
F 1 "74F139" H 5900 3600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5950 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5950 3700 50  0001 C CNN
	1    5950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1300 2450 1300
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E8F9
P 8550 2850
AR Path="/5CDEEC9F/5DA1E8F9" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F9" Ref="U?"  Part="1" 
AR Path="/5DA1E8F9" Ref="U9"  Part="1" 
F 0 "U9" H 8550 2650 50  0000 C CNN
F 1 "74F574" H 8550 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 8550 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 8550 2850 50  0001 C CNN
	1    8550 2850
	1    0    0    -1  
$EndComp
Text GLabel 9050 3050 2    50   Output ~ 0
~hsync
Text GLabel 8050 3050 0    50   Input ~ 0
~gsync
Wire Wire Line
	4050 3400 4150 3400
Text GLabel 2850 1700 2    50   Input ~ 0
DD[0..7]
$Comp
L 74xx:74LS08 U?
U 2 1 5DA1E903
P 4500 3600
AR Path="/5CDEEC9F/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DA1E903" Ref="U2"  Part="2" 
F 0 "U2" H 4500 3600 50  0000 C CNN
F 1 "74F08" H 4500 3800 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4500 3600 50  0001 C CNN
	2    4500 3600
	1    0    0    -1  
$EndComp
Entry Wire Line
	2500 1800 2600 1900
Text Label 2400 1800 0    50   ~ 0
I4
Wire Wire Line
	2300 1800 2500 1800
Wire Wire Line
	4150 3300 4150 3400
Wire Wire Line
	4150 3300 4200 3300
Wire Wire Line
	2850 1700 2300 1700
$Comp
L 74xx:74LS32 U?
U 3 1 5DA1E90F
P 7050 2500
AR Path="/5CDEEC9F/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DA1E90F" Ref="U3"  Part="3" 
F 0 "U3" H 7050 2500 50  0000 C CNN
F 1 "74F32" H 7050 2300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7050 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7050 2500 50  0001 C CNN
	3    7050 2500
	1    0    0    -1  
$EndComp
Text GLabel 6750 2400 0    50   Input ~ 0
boot
Connection ~ 4150 3400
Wire Wire Line
	4150 3400 4150 3500
NoConn ~ 6450 2450
NoConn ~ 6450 2550
Wire Wire Line
	6950 5450 6950 5400
Wire Wire Line
	6950 6100 6950 6050
Connection ~ 6950 6100
Wire Wire Line
	7200 5400 7200 5200
Connection ~ 6350 6100
Wire Wire Line
	6350 6100 6850 6100
Connection ~ 6950 5400
Wire Wire Line
	6950 6100 7450 6100
Connection ~ 7450 5400
Wire Wire Line
	7450 5400 8050 5400
Connection ~ 7200 5400
Wire Wire Line
	7200 5400 7450 5400
Wire Wire Line
	6950 5400 7200 5400
Wire Wire Line
	6750 5400 6950 5400
Wire Wire Line
	6850 6050 6850 6100
Connection ~ 6850 6100
Wire Wire Line
	6850 6100 6950 6100
Wire Wire Line
	7450 5300 8050 5300
Wire Wire Line
	2300 3300 2500 3300
Text GLabel 5450 2550 0    50   Input ~ 0
~prog
Text Label 2700 2200 0    50   ~ 0
I3
Entry Wire Line
	2700 2200 2600 2300
Wire Wire Line
	2300 6100 2500 6100
Wire Wire Line
	2300 6000 2500 6000
Wire Wire Line
	2300 5900 2500 5900
Wire Wire Line
	2300 5800 2500 5800
Wire Wire Line
	2300 5700 2500 5700
Wire Wire Line
	2300 5600 2500 5600
Wire Wire Line
	2300 5500 2500 5500
Text GLabel 1300 1900 0    50   Output ~ 0
pcent
NoConn ~ 1300 1800
Text GLabel 1300 1400 0    50   Output ~ 0
PA16
Text Label 2700 4500 0    50   ~ 0
I10
Text GLabel 4800 4400 2    50   Output ~ 0
DA16
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E93C
P 4500 3200
AR Path="/5CDEEC9F/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DA1E93C" Ref="U5"  Part="1" 
F 0 "U5" H 4500 3200 50  0000 C CNN
F 1 "74F32" H 4500 3450 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4500 3200 50  0001 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
Entry Wire Line
	2700 4500 2600 4600
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 3400 2550
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U6"  Part="1" 
F 0 "U6" H 3400 2550 50  0000 C CNN
F 1 "74F139" H 3350 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3400 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3400 2550 50  0001 C CNN
	1    3400 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 3400 3700
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U6"  Part="2" 
F 0 "U6" H 3400 3700 50  0000 C CNN
F 1 "74F139" H 3350 3600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 3400 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 3400 3700 50  0001 C CNN
	2    3400 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3700 4200 3700
Wire Wire Line
	3900 3800 4150 3800
Wire Wire Line
	4150 3800 4150 3700
Wire Wire Line
	2700 3100 4200 3100
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 1800 6800
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 1800 6550 50  0001 C CNN
F 1 "GNDD" H 1804 6645 50  0000 C CNN
F 2 "" H 1800 6800 50  0001 C CNN
F 3 "" H 1800 6800 50  0001 C CNN
	1    1800 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 1800 6000
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U12"  Part="1" 
F 0 "U12" H 1800 5800 50  0000 C CNN
F 1 "74F574" H 1800 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 1800 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 1800 6000 50  0001 C CNN
	1    1800 6000
	1    0    0    -1  
$EndComp
Text GLabel 9050 2950 2    50   Output ~ 0
~read
Text GLabel 2900 2450 0    50   Input ~ 0
~read
Entry Wire Line
	2500 3800 2600 3900
Text GLabel 2300 3900 2    50   Input ~ 0
~romw
Text GLabel 2300 4000 2    50   Input ~ 0
qclk1
Text GLabel 1300 2000 0    50   Output ~ 0
~prog
$Comp
L 74xx:74LS08 U?
U 3 1 5DA1E965
P 4500 4000
AR Path="/5CDEEC9F/5DA1E965" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E965" Ref="U?"  Part="3" 
AR Path="/5DA1E965" Ref="U2"  Part="3" 
F 0 "U2" H 4500 4000 50  0000 C CNN
F 1 "74F08" H 4500 3800 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4500 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4500 4000 50  0001 C CNN
	3    4500 4000
	1    0    0    -1  
$EndComp
Text Label 2700 4900 0    50   ~ 0
I5
Text GLabel 4200 4700 0    50   Input ~ 0
~alue
Entry Wire Line
	2700 4900 2600 5000
Wire Wire Line
	2700 4900 4200 4900
Text GLabel 4800 4800 2    50   Output ~ 0
~ale
Text GLabel 3900 3600 2    50   Output ~ 0
~inoe
Wire Wire Line
	3900 3900 4200 3900
Text GLabel 9050 2850 2    50   Output ~ 0
pcoe
Wire Wire Line
	6750 2200 2700 2200
Wire Wire Line
	8000 3900 9100 3900
Wire Wire Line
	8000 3900 8000 4500
Wire Wire Line
	9100 3900 9100 4600
NoConn ~ 6450 3800
NoConn ~ 6450 3900
$Comp
L 74xx:74LS04 U?
U 1 1 5DA1E979
P 5550 4500
AR Path="/5DAA5CD8/5DA1E979" Ref="U?"  Part="1" 
AR Path="/5DA1E979" Ref="U1"  Part="1" 
F 0 "U1" H 5500 4500 50  0000 C CNN
F 1 "74F04" H 5550 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5550 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 5550 4500 50  0001 C CNN
	1    5550 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 5DA1E97F
P 3400 4500
AR Path="/5DAA5CD8/5DA1E97F" Ref="U?"  Part="3" 
AR Path="/5DA1E97F" Ref="U1"  Part="3" 
F 0 "U1" H 3350 4500 50  0000 C CNN
F 1 "74F04" H 3400 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3400 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 3400 4500 50  0001 C CNN
	3    3400 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 4500 5250 4500
Wire Wire Line
	5200 4500 5200 5100
Wire Wire Line
	5850 4500 5900 4500
Wire Wire Line
	5900 4500 5900 5100
Wire Wire Line
	5900 4500 5950 4500
Connection ~ 5900 4500
$Comp
L 74xx:74LS04 U?
U 2 1 5DA1E98B
P 6250 4500
AR Path="/5DAA5CD8/5DA1E98B" Ref="U?"  Part="2" 
AR Path="/5DA1E98B" Ref="U1"  Part="2" 
F 0 "U1" H 6200 4500 50  0000 C CNN
F 1 "74F04" H 6250 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6250 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 4500 50  0001 C CNN
	2    6250 4500
	1    0    0    -1  
$EndComp
Text GLabel 5900 4400 1    50   Output ~ 0
cclk
Wire Wire Line
	5900 4500 5900 4400
Wire Wire Line
	7450 4400 7450 4500
Connection ~ 7450 4500
Wire Wire Line
	7450 4500 7450 5300
$Comp
L 74xx:74LS04 U?
U 4 1 5DA1E996
P 7050 3000
AR Path="/5DAA5CD8/5DA1E996" Ref="U?"  Part="4" 
AR Path="/5DA1E996" Ref="U1"  Part="4" 
F 0 "U1" H 7000 3000 50  0000 C CNN
F 1 "74F04" H 7050 3226 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7050 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7050 3000 50  0001 C CNN
	4    7050 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3000 7400 3000
Wire Wire Line
	7400 3000 7400 2850
Wire Wire Line
	7400 2850 8050 2850
Wire Wire Line
	6700 3000 6750 3000
Text GLabel 6750 2000 0    50   Input ~ 0
qclk1
Wire Wire Line
	6550 4500 7450 4500
Wire Wire Line
	8050 2650 7400 2650
Wire Wire Line
	7350 2500 7400 2500
Wire Wire Line
	7400 2500 7400 2650
Wire Wire Line
	6700 2600 6750 2600
Wire Wire Line
	7350 2100 7550 2100
Wire Wire Line
	8050 2550 7550 2550
Wire Wire Line
	7550 2100 7550 2550
Wire Wire Line
	6700 2600 6700 2650
Wire Wire Line
	6450 2650 6700 2650
Connection ~ 6700 2650
Wire Wire Line
	6700 2650 6700 3000
Wire Wire Line
	8050 2450 7700 2450
Wire Wire Line
	8050 2350 7850 2350
Wire Wire Line
	6450 2750 8050 2750
Wire Wire Line
	4200 4300 4150 4300
Wire Wire Line
	4150 4300 4150 4200
Wire Wire Line
	4150 4100 4200 4100
Wire Wire Line
	4150 4200 4050 4200
Connection ~ 4150 4200
Wire Wire Line
	4150 4200 4150 4100
Wire Wire Line
	2700 4500 3100 4500
Wire Wire Line
	3700 4500 4200 4500
Wire Wire Line
	7350 1700 7700 1700
Wire Wire Line
	7700 1700 7700 2450
Wire Wire Line
	9050 2550 9300 2550
Wire Wire Line
	7850 1700 9300 1700
Wire Wire Line
	9300 1700 9300 2550
Wire Wire Line
	7850 1700 7850 2350
$Sheet
S 9950 1200 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Text Notes 10000 1600 0    150  ~ 0
CPU
$Sheet
S 9950 2200 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Text Notes 10000 2600 0    150  ~ 0
GPU
$Sheet
S 9950 3200 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Text Notes 10050 3600 0    150  ~ 0
I/O
Wire Bus Line
	4200 5600 4200 7100
Wire Bus Line
	1000 5200 1000 7100
Wire Bus Line
	2600 1900 2600 6500
$EndSCHEMATC
