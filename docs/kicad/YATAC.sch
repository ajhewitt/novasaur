EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "YATAC78 TTL Computer"
Date "2019-10-05"
Rev "1.0.8"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2900 2100 0    50   ~ 0
I7
$Comp
L power:VCC #PWR0103
U 1 1 5DA1E744
P 9150 4200
AR Path="/5DA1E744" Ref="#PWR0103"  Part="1" 
AR Path="/5DAA5CD8/5DA1E744" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 9150 4050 50  0001 C CNN
F 1 "VCC" H 9167 4373 50  0000 C CNN
F 2 "" H 9150 4200 50  0001 C CNN
F 3 "" H 9150 4200 50  0001 C CNN
	1    9150 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DA1E74A
P 2200 3600
AR Path="/5CDEEC9F/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E74A" Ref="U?"  Part="1" 
AR Path="/5DA1E74A" Ref="U9"  Part="1" 
F 0 "U9" H 2200 3650 50  0000 C CNN
F 1 "74F138" H 2150 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2200 3600 50  0001 C CNN
	1    2200 3600
	-1   0    0    -1  
$EndComp
Text GLabel 1700 3600 0    50   Output ~ 0
~vle
Text GLabel 1700 3400 0    50   Output ~ 0
~ele
Text GLabel 1700 3900 0    50   Output ~ 0
~pcle
Text GLabel 1700 3300 0    50   Output ~ 0
~xle
Text GLabel 1700 3700 0    50   Output ~ 0
~yle
Text GLabel 1700 3800 0    50   Output ~ 0
~hlle
$Comp
L power:VCC #PWR?
U 1 1 5DA1E756
P 2200 3000
AR Path="/5CDEEC9F/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E756" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E756" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2200 2850 50  0001 C CNN
F 1 "VCC" H 2217 3173 50  0000 C CNN
F 2 "" H 2200 3000 50  0001 C CNN
F 3 "" H 2200 3000 50  0001 C CNN
	1    2200 3000
	1    0    0    -1  
$EndComp
Text GLabel 1700 3500 0    50   Output ~ 0
~sle
Text GLabel 1700 4000 0    50   Output ~ 0
~pgle
Text Label 3200 1700 0    50   ~ 0
DD7
Text Label 2900 3800 0    50   ~ 0
I9
Entry Wire Line
	1500 5500 1400 5400
Entry Wire Line
	1500 5600 1400 5500
Entry Wire Line
	1500 5700 1400 5600
Entry Wire Line
	1500 5800 1400 5700
Entry Wire Line
	1500 5900 1400 5800
Entry Wire Line
	1500 6000 1400 5900
Entry Wire Line
	1500 6100 1400 6000
Entry Wire Line
	1500 6200 1400 6100
Entry Wire Line
	3100 5600 3000 5500
Entry Wire Line
	3100 5700 3000 5600
Entry Wire Line
	3100 5800 3000 5700
Entry Wire Line
	3100 6300 3000 6200
Text Label 3200 5500 0    50   ~ 0
I8
Text Label 3200 5600 0    50   ~ 0
I9
Text Label 3200 5700 0    50   ~ 0
I10
Text Label 3200 5800 0    50   ~ 0
I11
Text Label 3200 5900 0    50   ~ 0
I12
Text Label 3200 6000 0    50   ~ 0
I13
Text Label 3200 6100 0    50   ~ 0
I14
Text Label 3200 6200 0    50   ~ 0
I15
Text Label 1500 5500 0    50   ~ 0
PD0
Text Label 1500 5600 0    50   ~ 0
PD1
Text Label 1500 5700 0    50   ~ 0
PD2
Text Label 1500 5800 0    50   ~ 0
PD3
Text Label 1500 5900 0    50   ~ 0
PD4
Text Label 1500 6000 0    50   ~ 0
PD5
Text Label 1500 6100 0    50   ~ 0
PD6
Text Label 1500 6200 0    50   ~ 0
PD7
$Comp
L power:VCC #PWR?
U 1 1 5DA1E785
P 2200 5000
AR Path="/5CDEEC9F/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E785" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E785" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 2200 4850 50  0001 C CNN
F 1 "VCC" H 2217 5173 50  0000 C CNN
F 2 "" H 2200 5000 50  0001 C CNN
F 3 "" H 2200 5000 50  0001 C CNN
	1    2200 5000
	1    0    0    -1  
$EndComp
Entry Wire Line
	3100 6200 3000 6100
Entry Wire Line
	3100 6100 3000 6000
Entry Wire Line
	3100 6000 3000 5900
Entry Wire Line
	3100 5900 3000 5800
Wire Wire Line
	1500 5500 1700 5500
Wire Wire Line
	1500 5600 1700 5600
Wire Wire Line
	1500 5700 1700 5700
Wire Wire Line
	1500 5800 1700 5800
Wire Wire Line
	1500 5900 1700 5900
Wire Wire Line
	1500 6000 1700 6000
Wire Wire Line
	1500 6100 1700 6100
Wire Wire Line
	1500 6200 1700 6200
Text GLabel 1700 1300 0    50   Output ~ 0
PA17
Text GLabel 1700 1800 0    50   Output ~ 0
fetch
Text GLabel 1700 1700 0    50   Output ~ 0
hsel
Text GLabel 1700 1600 0    50   Output ~ 0
boot
Entry Wire Line
	3000 1900 3100 2000
Text Label 2900 1900 0    50   ~ 0
I5
Entry Wire Line
	3000 2000 3100 2100
Entry Wire Line
	3000 2100 3100 2200
Wire Wire Line
	4500 6200 4700 6200
Wire Wire Line
	4500 6100 4700 6100
Wire Wire Line
	4500 6000 4700 6000
Wire Wire Line
	4500 5900 4700 5900
Wire Wire Line
	4500 5800 4700 5800
Wire Wire Line
	4500 5700 4700 5700
Wire Wire Line
	4500 5600 4700 5600
Wire Wire Line
	4500 5500 4700 5500
Entry Wire Line
	4800 5900 4700 5800
Entry Wire Line
	4800 6000 4700 5900
Entry Wire Line
	4800 6100 4700 6000
Entry Wire Line
	4800 6200 4700 6100
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7C8
P 2200 1050
AR Path="/5CDEEC9F/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7C8" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7C8" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2200 900 50  0001 C CNN
F 1 "VCC" H 2217 1223 50  0000 C CNN
F 2 "" H 2200 1050 50  0001 C CNN
F 3 "" H 2200 1050 50  0001 C CNN
	1    2200 1050
	1    0    0    -1  
$EndComp
Text GLabel 1400 5200 1    50   Input ~ 0
PD[0..7]
Text Label 4550 6200 0    50   ~ 0
PD7
Text Label 4550 6100 0    50   ~ 0
PD6
Text Label 4550 6000 0    50   ~ 0
PD5
Text Label 4550 5900 0    50   ~ 0
PD4
Text Label 4550 5800 0    50   ~ 0
PD3
Text Label 4550 5700 0    50   ~ 0
PD2
Text Label 4550 5600 0    50   ~ 0
PD1
Text Label 4550 5500 0    50   ~ 0
PD0
Text Label 2900 6200 0    50   ~ 0
I7
Text Label 2900 6100 0    50   ~ 0
I6
Text Label 2900 6000 0    50   ~ 0
I5
Text Label 2900 5900 0    50   ~ 0
I4
Text Label 2900 5800 0    50   ~ 0
I3
Text Label 2900 5700 0    50   ~ 0
I2
Text Label 2900 5600 0    50   ~ 0
I1
Text Label 2900 5500 0    50   ~ 0
I0
Entry Wire Line
	4800 6300 4700 6200
Entry Wire Line
	4800 5800 4700 5700
Entry Wire Line
	4800 5700 4700 5600
Entry Wire Line
	4800 5600 4700 5500
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E7E3
P 4000 6800
AR Path="/5CDEEC9F/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7E3" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7E3" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 4000 6550 50  0001 C CNN
F 1 "GNDD" H 4004 6645 50  0000 C CNN
F 2 "" H 4000 6800 50  0001 C CNN
F 3 "" H 4000 6800 50  0001 C CNN
	1    4000 6800
	1    0    0    -1  
$EndComp
Entry Wire Line
	3100 6200 3200 6100
Entry Wire Line
	3100 6100 3200 6000
Entry Wire Line
	3100 6000 3200 5900
Entry Wire Line
	3100 5900 3200 5800
Entry Wire Line
	3100 5800 3200 5700
Entry Wire Line
	3100 5700 3200 5600
Entry Wire Line
	3100 5600 3200 5500
Entry Wire Line
	3100 6300 3200 6200
Text GLabel 1700 6500 0    50   Input ~ 0
0
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E7F2
P 4000 6000
AR Path="/5CDEEC9F/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F2" Ref="U?"  Part="1" 
AR Path="/5DA1E7F2" Ref="U11"  Part="1" 
F 0 "U11" H 4000 5800 50  0000 C CNN
F 1 "74F574" H 4000 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4000 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4000 6000 50  0001 C CNN
	1    4000 6000
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3000 3300 3100 3400
$Comp
L power:VCC #PWR?
U 1 1 5DA1E7F9
P 4000 5200
AR Path="/5CDEEC9F/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7F9" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E7F9" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 4000 5050 50  0001 C CNN
F 1 "VCC" H 4017 5373 50  0000 C CNN
F 2 "" H 4000 5200 50  0001 C CNN
F 3 "" H 4000 5200 50  0001 C CNN
	1    4000 5200
	1    0    0    -1  
$EndComp
Text GLabel 3100 6500 3    50   Output ~ 0
I[0..15]
Text Label 2900 2000 0    50   ~ 0
I6
Text Label 2900 3500 0    50   ~ 0
I8
Text Label 2900 3400 0    50   ~ 0
I1
Text Label 2900 3300 0    50   ~ 0
I0
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E804
P 2200 4300
AR Path="/5CDEEC9F/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E804" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E804" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 2200 4050 50  0001 C CNN
F 1 "GNDD" H 2204 4145 50  0000 C CNN
F 2 "" H 2200 4300 50  0001 C CNN
F 3 "" H 2200 4300 50  0001 C CNN
	1    2200 4300
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DA1E80A
P 2200 1800
AR Path="/5CDEEC9F/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E80A" Ref="U?"  Part="1" 
AR Path="/5DA1E80A" Ref="U12"  Part="1" 
F 0 "U12" H 2200 1650 50  0000 C CNN
F 1 "PAL16R4" H 2200 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2200 1800 50  0001 C CNN
F 3 "" H 2200 1800 50  0001 C CNN
	1    2200 1800
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3000 3500 3100 3600
Entry Wire Line
	3000 3400 3100 3500
Text GLabel 2700 1600 2    50   Input ~ 0
hblank
Text GLabel 2700 1500 2    50   Input ~ 0
pclk1
Text GLabel 2700 2200 2    50   Input ~ 0
0
Text GLabel 2700 1300 2    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E817
P 2200 2500
AR Path="/5CDEEC9F/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E817" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E817" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 2200 2250 50  0001 C CNN
F 1 "GNDD" H 2204 2345 50  0000 C CNN
F 2 "" H 2200 2500 50  0001 C CNN
F 3 "" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN?
U 1 1 5DA1E820
P 2600 4700
AR Path="/5DAA3954/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E820" Ref="RN?"  Part="1" 
AR Path="/5DA1E820" Ref="RN1"  Part="1" 
F 0 "RN1" V 3100 4650 50  0000 L CNN
F 1 "270" V 3000 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3075 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2600 4700 50  0001 C CNN
	1    2600 4700
	0    -1   -1   0   
$EndComp
Entry Wire Line
	3100 4500 3000 4400
Entry Wire Line
	3100 5200 3000 5100
Entry Wire Line
	3100 4700 3000 4600
Entry Wire Line
	3100 4600 3000 4500
Entry Wire Line
	3100 4900 3000 4800
Entry Wire Line
	3100 4800 3000 4700
Entry Wire Line
	3100 5100 3000 5000
Entry Wire Line
	3100 5000 3000 4900
Wire Wire Line
	2800 4500 3000 4500
Wire Wire Line
	2800 4600 3000 4600
Wire Wire Line
	2800 4700 3000 4700
Wire Wire Line
	2800 4800 3000 4800
Wire Wire Line
	2800 4900 3000 4900
Wire Wire Line
	2800 5000 3000 5000
Wire Wire Line
	2800 5100 3000 5100
Text Label 2850 4400 0    50   ~ 0
I15
Text Label 2850 4500 0    50   ~ 0
I14
Text Label 2850 4600 0    50   ~ 0
I13
Text Label 2850 4700 0    50   ~ 0
I12
Text Label 2850 4800 0    50   ~ 0
I11
Text Label 2850 4900 0    50   ~ 0
I10
Text Label 2900 5000 0    50   ~ 0
I9
Text Label 2900 5100 0    50   ~ 0
I8
Wire Wire Line
	4600 7050 4600 6500
Wire Wire Line
	4600 6500 4500 6500
Wire Wire Line
	2200 5200 2200 5100
Connection ~ 2200 5100
Wire Wire Line
	2200 5100 2200 5000
Wire Wire Line
	9650 4800 9850 4800
Connection ~ 9850 4900
Wire Wire Line
	9850 4900 10050 4900
Wire Wire Line
	9650 5000 10050 5000
Wire Wire Line
	9650 5100 9700 5100
Connection ~ 9700 5200
Wire Wire Line
	9700 5200 10050 5200
$Comp
L power:GNDD #PWR0111
U 1 1 5DA1E86A
P 9150 5700
AR Path="/5DA1E86A" Ref="#PWR0111"  Part="1" 
AR Path="/5DAA5CD8/5DA1E86A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0111" H 9150 5450 50  0001 C CNN
F 1 "GNDD" H 9154 5545 50  0000 C CNN
F 2 "" H 9150 5700 50  0001 C CNN
F 3 "" H 9150 5700 50  0001 C CNN
	1    9150 5700
	1    0    0    -1  
$EndComp
Text GLabel 10050 4700 2    50   Output ~ 0
pclk1
Text GLabel 10050 4800 2    50   Output ~ 0
qclk1
Text GLabel 10050 4900 2    50   Output ~ 0
pclk2
Text GLabel 10050 5000 2    50   Output ~ 0
qclk2
Text GLabel 10050 5100 2    50   Output ~ 0
rclk
Text GLabel 10050 5200 2    50   Output ~ 0
sclk
Text GLabel 10050 4500 2    50   Output ~ 0
mclk
Text GLabel 10050 4600 2    50   Output ~ 0
nclk
Wire Wire Line
	9650 4900 9850 4900
Wire Wire Line
	9650 5200 9700 5200
Wire Wire Line
	8600 4700 8650 4700
Wire Wire Line
	8650 4900 8600 4900
Wire Wire Line
	8600 4900 8600 4700
Wire Wire Line
	9850 4900 9850 6100
Wire Wire Line
	9850 6100 8450 6100
Wire Wire Line
	8450 6100 8450 5100
Wire Wire Line
	8450 5100 8650 5100
$Comp
L 74xx:74LS175 U7
U 1 1 5DA1E882
P 9150 4900
AR Path="/5DA1E882" Ref="U7"  Part="1" 
AR Path="/5DAA5CD8/5DA1E882" Ref="U?"  Part="1" 
F 0 "U7" H 9150 4900 50  0000 C CNN
F 1 "74F175" H 9150 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9150 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 9150 4900 50  0001 C CNN
	1    9150 4900
	1    0    0    -1  
$EndComp
Connection ~ 8600 4900
Wire Wire Line
	9700 5200 9700 5950
Wire Wire Line
	9700 5950 8600 5950
Wire Wire Line
	8600 4900 8600 5950
Text GLabel 3450 1700 2    50   Input ~ 0
DD[0..7]
Entry Wire Line
	3000 1800 3100 1900
Text Label 2900 1800 0    50   ~ 0
I4
Text Label 3200 2100 0    50   ~ 0
I3
Entry Wire Line
	3200 2100 3100 2200
Text GLabel 1700 2000 0    50   Output ~ 0
pcent
Text GLabel 1700 1400 0    50   Output ~ 0
PA16
Text Label 3200 1900 0    50   ~ 0
I10
Entry Wire Line
	3200 1900 3100 2000
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E953
P 2200 6800
AR Path="/5CDEEC9F/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E953" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E953" Ref="#PWR0114"  Part="1" 
F 0 "#PWR0114" H 2200 6550 50  0001 C CNN
F 1 "GNDD" H 2204 6645 50  0000 C CNN
F 2 "" H 2200 6800 50  0001 C CNN
F 3 "" H 2200 6800 50  0001 C CNN
	1    2200 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E959
P 2200 6000
AR Path="/5CDEEC9F/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E959" Ref="U?"  Part="1" 
AR Path="/5DA1E959" Ref="U10"  Part="1" 
F 0 "U10" H 2200 5800 50  0000 C CNN
F 1 "74F574" H 2200 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2200 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2200 6000 50  0001 C CNN
	1    2200 6000
	1    0    0    -1  
$EndComp
Entry Wire Line
	3000 3800 3100 3900
Text GLabel 2700 3900 2    50   Input ~ 0
~romw
Text GLabel 2700 4000 2    50   Input ~ 0
qclk1
$Comp
L Oscillator:CXO_DIP8 X1
U 1 1 5D9CA9D5
P 7800 5300
F 0 "X1" H 8050 5700 50  0000 L CNN
F 1 "ACH-32M" H 7900 5600 50  0000 L CNN
F 2 "Oscillator:Oscillator_DIP-8" H 8250 4950 50  0001 C CNN
F 3 "http://cdn-reichelt.de/documents/datenblatt/B400/OSZI.pdf" H 7700 5300 50  0001 C CNN
	1    7800 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D9CBE89
P 7800 5600
AR Path="/5CDEEC9F/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D9CBE89" Ref="#PWR?"  Part="1" 
AR Path="/5D9CBE89" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 7800 5350 50  0001 C CNN
F 1 "GNDD" H 7804 5445 50  0000 C CNN
F 2 "" H 7800 5600 50  0001 C CNN
F 3 "" H 7800 5600 50  0001 C CNN
	1    7800 5600
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0191
U 1 1 5D9DED2A
P 7800 4800
AR Path="/5D9DED2A" Ref="#PWR0191"  Part="1" 
AR Path="/5DAA5CD8/5D9DED2A" Ref="#PWR?"  Part="1" 
F 0 "#PWR0191" H 7800 4650 50  0001 C CNN
F 1 "VCC" H 7817 4973 50  0000 C CNN
F 2 "" H 7800 4800 50  0001 C CNN
F 3 "" H 7800 4800 50  0001 C CNN
	1    7800 4800
	1    0    0    -1  
$EndComp
Text Notes 3750 4550 0    150  ~ 0
CPU
$Sheet
S 3700 4150 600  600 
U 5DA1E9BA
F0 "sheet5DA1E720" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
Text Notes 4950 4550 0    150  ~ 0
GPU
$Sheet
S 4900 4150 600  600 
U 5DA1E9BD
F0 "sheet5DA1E721" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Text Notes 6200 4550 0    150  ~ 0
I/O
$Sheet
S 6100 4150 600  600 
U 5DA1E9C0
F0 "sheet5DA1E722" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Wire Wire Line
	4500 6400 5300 6400
Text GLabel 6300 5500 2    50   Input ~ 0
read
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E943
P 6850 2400
AR Path="/5DAA5CD8/5DA1E943" Ref="U?"  Part="1" 
AR Path="/5DA1E943" Ref="U5"  Part="1" 
F 0 "U5" H 6850 2400 50  0000 C CNN
F 1 "74F139" H 6800 2300 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6850 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6850 2400 50  0001 C CNN
	1    6850 2400
	1    0    0    -1  
$EndComp
Text GLabel 5300 5700 0    50   Output ~ 0
~ramr
Text GLabel 5300 5600 0    50   Output ~ 0
~romw
Text GLabel 5300 5500 0    50   Output ~ 0
~ramw
NoConn ~ 5300 5800
Text GLabel 6300 5600 2    50   Input ~ 0
pclk1
Text GLabel 6300 5800 2    50   Input ~ 0
0
Text GLabel 7500 1900 0    50   Input ~ 0
sclk
Text GLabel 6200 2750 0    50   Input ~ 0
boot
$Comp
L 74xx:74LS32 U?
U 3 1 5DA1E90F
P 5100 1800
AR Path="/5CDEEC9F/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DA1E90F" Ref="U?"  Part="3" 
AR Path="/5DA1E90F" Ref="U3"  Part="3" 
F 0 "U3" H 5100 1800 50  0000 C CNN
F 1 "74F32" H 5100 1600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 1800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5100 1800 50  0001 C CNN
	3    5100 1800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 4 1 5DA1E854
P 5100 3600
AR Path="/5CDEEC9F/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DA1E854" Ref="U?"  Part="4" 
AR Path="/5DA1E854" Ref="U3"  Part="4" 
F 0 "U3" H 5100 3600 50  0000 C CNN
F 1 "74F32" H 5100 3400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5100 3600 50  0001 C CNN
	4    5100 3600
	1    0    0    1   
$EndComp
Text GLabel 7500 1500 0    50   Input ~ 0
hblank
Text GLabel 6350 2400 0    50   Input ~ 0
alu
NoConn ~ 7350 2400
NoConn ~ 7350 2300
NoConn ~ 5300 6200
NoConn ~ 5300 6300
Text GLabel 6300 6300 2    50   Input ~ 0
hsel
Text GLabel 6300 6500 2    50   Input ~ 0
qclk1
Text GLabel 6300 6200 2    50   Input ~ 0
fetch
Entry Bus Bus
	1400 7250 1500 7350
Entry Bus Bus
	4700 7350 4800 7250
Wire Wire Line
	1500 6400 1500 7200
Wire Wire Line
	1700 6400 1500 6400
Wire Wire Line
	5000 7200 5000 6500
Wire Wire Line
	5000 6500 5300 6500
Wire Wire Line
	2800 4400 3000 4400
Text GLabel 8650 2200 0    50   Input ~ 0
srs1
Text GLabel 9650 2200 2    50   Output ~ 0
~cle
Text GLabel 9650 2700 2    50   Output ~ 0
~poe
Text GLabel 9650 2000 2    50   Output ~ 0
read
Text GLabel 8650 2100 0    50   Input ~ 0
~gsync
Text GLabel 9650 2100 2    50   Output ~ 0
~hsync
$Comp
L 74xx:74LS574 U?
U 1 1 5DA1E8F9
P 9150 2500
AR Path="/5CDEEC9F/5DA1E8F9" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F9" Ref="U?"  Part="1" 
AR Path="/5DA1E8F9" Ref="U8"  Part="1" 
F 0 "U8" H 9150 2300 50  0000 C CNN
F 1 "74F574" H 9150 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9150 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9150 2500 50  0001 C CNN
	1    9150 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DA1E73E
P 9150 3300
AR Path="/5CDEEC9F/5DA1E73E" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E73E" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E73E" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 9150 3050 50  0001 C CNN
F 1 "GNDD" H 9154 3145 50  0000 C CNN
F 2 "" H 9150 3300 50  0001 C CNN
F 3 "" H 9150 3300 50  0001 C CNN
	1    9150 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DA1E738
P 9150 1700
AR Path="/5CDEEC9F/5DA1E738" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E738" Ref="#PWR?"  Part="1" 
AR Path="/5DA1E738" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 9150 1550 50  0001 C CNN
F 1 "VCC" H 9167 1873 50  0000 C CNN
F 2 "" H 9150 1700 50  0001 C CNN
F 3 "" H 9150 1700 50  0001 C CNN
	1    9150 1700
	1    0    0    -1  
$EndComp
Text GLabel 9650 2400 2    50   Output ~ 0
~xoe
Text GLabel 9650 2600 2    50   Output ~ 0
~alue
Text GLabel 9650 2500 2    50   Output ~ 0
~pgoe
Text GLabel 8650 3000 0    50   Input ~ 0
0
Text GLabel 8650 2000 0    50   Input ~ 0
fetch
Text GLabel 9650 2300 2    50   Output ~ 0
~voe
Entry Wire Line
	3200 2900 3100 3000
Entry Wire Line
	3200 2800 3100 2900
Text Label 3200 2900 0    50   ~ 0
I4
Entry Wire Line
	3200 2300 3100 2400
Text Label 3200 2300 0    50   ~ 0
I2
Text Label 3200 3700 0    50   ~ 0
I5
Entry Wire Line
	3200 3700 3100 3800
NoConn ~ 1700 1500
$Comp
L Device:R_US R?
U 1 1 5DDC373A
P 3100 1200
AR Path="/62D13D9D/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D9AFF37/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DA1E9C0/5DDC373A" Ref="R?"  Part="1" 
AR Path="/5DDC373A" Ref="R1"  Part="1" 
F 0 "R1" H 3250 1250 50  0000 C CNN
F 1 "1k" H 3250 1150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 3140 1190 50  0001 C CNN
F 3 "~" H 3100 1200 50  0001 C CNN
	1    3100 1200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5DFC5D92
P 3100 1050
AR Path="/5CDEEC9F/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DFC5D92" Ref="#PWR?"  Part="1" 
AR Path="/5DFC5D92" Ref="#PWR0193"  Part="1" 
F 0 "#PWR0193" H 3100 900 50  0001 C CNN
F 1 "VCC" H 3117 1223 50  0000 C CNN
F 2 "" H 3100 1050 50  0001 C CNN
F 3 "" H 3100 1050 50  0001 C CNN
	1    3100 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1700 3450 1700
Wire Wire Line
	2700 1800 3000 1800
Wire Wire Line
	2700 1900 3000 1900
Wire Wire Line
	2700 2000 3000 2000
Wire Wire Line
	2700 2100 3000 2100
Wire Wire Line
	2700 3800 3000 3800
Wire Wire Line
	2700 3500 3000 3500
Wire Wire Line
	2700 3400 3000 3400
Wire Wire Line
	2700 3300 3000 3300
Wire Wire Line
	3200 5500 3500 5500
Wire Wire Line
	3200 5600 3500 5600
Wire Wire Line
	3200 5700 3500 5700
Wire Wire Line
	3200 5800 3500 5800
Wire Wire Line
	3200 5900 3500 5900
Wire Wire Line
	3200 6200 3500 6200
Wire Wire Line
	3200 6100 3500 6100
Wire Wire Line
	3200 6000 3500 6000
Wire Wire Line
	2700 5500 3000 5500
Wire Wire Line
	2700 5600 3000 5600
Wire Wire Line
	2700 5700 3000 5700
Wire Wire Line
	2200 5100 2400 5100
Wire Wire Line
	2700 5800 3000 5800
Wire Wire Line
	2700 5900 3000 5900
Wire Wire Line
	2700 6000 3000 6000
Wire Wire Line
	2700 6100 3000 6100
Wire Wire Line
	2700 6200 2800 6200
Wire Wire Line
	2800 6200 2800 7050
Connection ~ 2800 6200
Wire Wire Line
	2800 6200 3000 6200
Wire Wire Line
	2800 7050 4600 7050
Wire Wire Line
	1500 7200 5000 7200
Wire Bus Line
	1500 7350 4700 7350
Wire Wire Line
	9650 4600 10050 4600
Wire Wire Line
	8300 5300 8650 5300
$Comp
L 74xx:74LS139 U?
U 1 1 5DA1E8F2
P 5800 5600
AR Path="/5CDEEC9F/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E8F2" Ref="U?"  Part="1" 
AR Path="/5DA1E8F2" Ref="U6"  Part="1" 
F 0 "U6" H 5800 5600 50  0000 C CNN
F 1 "74F139" H 5750 5500 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5800 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5800 5600 50  0001 C CNN
	1    5800 5600
	-1   0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E8DD
P 5800 6300
AR Path="/5DAA5CD8/5DA1E8DD" Ref="U?"  Part="2" 
AR Path="/5DA1E8DD" Ref="U6"  Part="2" 
F 0 "U6" H 5800 6300 50  0000 C CNN
F 1 "74F139" H 5750 6200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 5800 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 5800 6300 50  0001 C CNN
	2    5800 6300
	-1   0    0    -1  
$EndComp
Text GLabel 1700 1900 0    50   Output ~ 0
alu
Text GLabel 8350 5400 0    50   Input ~ 0
1
Text GLabel 7500 1700 0    50   Input ~ 0
rclk
$Comp
L 74xx:74LS86 U1
U 1 1 5DA56D2A
P 9150 3750
F 0 "U1" H 9150 3750 50  0000 C CNN
F 1 "74F86" H 9150 3984 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 9150 3750 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 9150 3750 50  0001 C CNN
	1    9150 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9650 4500 10050 4500
Wire Wire Line
	8650 4500 8600 4500
Wire Wire Line
	8600 4500 8600 3750
Wire Wire Line
	8600 3750 8850 3750
Wire Wire Line
	9700 5100 9700 3850
Wire Wire Line
	9700 3850 9450 3850
Connection ~ 9700 5100
Wire Wire Line
	9700 5100 10050 5100
Wire Wire Line
	9850 3650 9450 3650
Wire Wire Line
	7350 2600 8650 2600
$Comp
L 74xx:74LS86 U1
U 3 1 5DC565A1
P 7800 2900
F 0 "U1" H 7800 2900 50  0000 C CNN
F 1 "74F86" H 7800 3134 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7800 2900 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 7800 2900 50  0001 C CNN
	3    7800 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS86 U1
U 4 1 5DC578F7
P 6850 3000
F 0 "U1" H 6850 3000 50  0000 C CNN
F 1 "74F86" H 6850 3234 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6850 3000 50  0001 C CNN
F 3 "74xx/74ls86.pdf" H 6850 3000 50  0001 C CNN
	4    6850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2600 6300 2600
Wire Wire Line
	6300 2750 6200 2750
Text GLabel 6550 3100 0    50   Input ~ 0
1
Wire Wire Line
	6300 2600 6300 2750
Connection ~ 6300 2750
Wire Wire Line
	6300 2750 6300 2900
Wire Wire Line
	8300 2900 8650 2900
Wire Wire Line
	7350 2500 7450 2500
Wire Wire Line
	8100 2900 8150 2900
Wire Wire Line
	8150 2900 8150 2700
Wire Wire Line
	8150 2700 8650 2700
Wire Wire Line
	8100 2000 8150 2000
Wire Wire Line
	8150 2000 8150 2400
Wire Wire Line
	8150 2400 8650 2400
Wire Wire Line
	8300 2300 8300 1600
Wire Wire Line
	8300 1600 8100 1600
Wire Wire Line
	8300 2300 8650 2300
Wire Wire Line
	7500 2800 7450 2800
Wire Wire Line
	7450 2800 7450 2500
Connection ~ 7450 2500
Wire Wire Line
	7450 2500 8650 2500
Wire Wire Line
	8100 5300 8300 5300
Wire Wire Line
	7150 3000 7500 3000
Wire Wire Line
	6300 2900 6550 2900
Wire Wire Line
	3200 2100 7500 2100
Wire Wire Line
	9650 4700 10050 4700
Wire Wire Line
	9850 4800 9850 3650
Connection ~ 9850 4800
Wire Wire Line
	9850 4800 10050 4800
Connection ~ 8300 5300
Wire Wire Line
	8300 2900 8300 3450
Text GLabel 8500 3450 2    50   Output ~ 0
dclk
Wire Wire Line
	8500 3450 8300 3450
Connection ~ 8300 3450
Wire Wire Line
	8300 3450 8300 5300
$Comp
L power:GNDD #PWR?
U 1 1 5E0603AE
P 4150 1600
AR Path="/5CDEEC9F/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5E0603AE" Ref="#PWR?"  Part="1" 
AR Path="/5E0603AE" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 4150 1350 50  0001 C CNN
F 1 "GNDD" H 4154 1445 50  0000 C CNN
F 2 "" H 4150 1600 50  0001 C CNN
F 3 "" H 4150 1600 50  0001 C CNN
	1    4150 1600
	1    0    0    -1  
$EndComp
$Comp
L YATAC-rescue:SW_Push-Switch SW1
U 1 1 5E0603B4
P 3650 1400
AR Path="/5E0603B4" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5E0603B4" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5E0603B4" Ref="SW?"  Part="1" 
F 0 "SW1" H 3600 1750 50  0000 L CNN
F 1 "Reset" H 3550 1650 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 3650 1600 50  0001 C CNN
F 3 "~" H 3650 1600 50  0001 C CNN
	1    3650 1400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 1400 4150 1400
Wire Wire Line
	3950 1500 4150 1500
Wire Wire Line
	4150 1500 4150 1600
Wire Wire Line
	4150 1500 4150 1400
Connection ~ 4150 1500
Wire Wire Line
	2700 1400 3100 1400
Wire Wire Line
	3100 1350 3100 1400
Wire Wire Line
	2200 1100 2200 1050
Wire Wire Line
	8350 5400 8650 5400
Connection ~ 3100 1400
Wire Wire Line
	3100 1400 3350 1400
Text GLabel 6350 2300 0    50   Input ~ 0
sclk
Text GLabel 4800 1700 0    50   Input ~ 0
pclk1
Text GLabel 5400 1800 2    50   Output ~ 0
DA16
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E7A5
P 7800 1600
AR Path="/5CDEEC9F/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E7A5" Ref="U?"  Part="1" 
AR Path="/5DA1E7A5" Ref="U3"  Part="1" 
F 0 "U3" H 7800 1600 50  0000 C CNN
F 1 "74F32" H 7800 1400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7800 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7800 1600 50  0001 C CNN
	1    7800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3100 4800 3100
Text GLabel 4500 2800 2    50   Output ~ 0
~inoe
Text GLabel 5400 3600 2    50   Output ~ 0
~ale
Text GLabel 4800 3500 0    50   Input ~ 0
~alue
Wire Wire Line
	4750 3000 4750 2900
Wire Wire Line
	4500 3000 4750 3000
Wire Wire Line
	4750 2900 4800 2900
$Comp
L 74xx:74LS139 U?
U 2 1 5DA1E949
P 4000 2900
AR Path="/5CDEEC9F/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E949" Ref="U?"  Part="2" 
AR Path="/5DA1E949" Ref="U5"  Part="2" 
F 0 "U5" H 4000 2900 50  0000 C CNN
F 1 "74F139" H 3950 2800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4000 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4000 2900 50  0001 C CNN
	2    4000 2900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 1 1 5DA1E93C
P 5100 2400
AR Path="/5CDEEC9F/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DAA3954/5DA1E93C" Ref="U?"  Part="1" 
AR Path="/5DA1E93C" Ref="U4"  Part="1" 
F 0 "U4" H 5100 2400 50  0000 C CNN
F 1 "74F32" H 5100 2650 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5100 2400 50  0001 C CNN
	1    5100 2400
	1    0    0    1   
$EndComp
Wire Wire Line
	4750 2600 4750 2700
Connection ~ 4750 2600
Wire Wire Line
	4750 2500 4800 2500
Wire Wire Line
	4750 2500 4750 2600
$Comp
L 74xx:74LS08 U?
U 2 1 5DA1E903
P 5100 3200
AR Path="/5CDEEC9F/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E903" Ref="U?"  Part="2" 
AR Path="/5DA1E903" Ref="U2"  Part="2" 
F 0 "U2" H 5100 3200 50  0000 C CNN
F 1 "74F08" H 5100 3400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5100 3200 50  0001 C CNN
	2    5100 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2600 4750 2600
Text GLabel 5400 3200 2    50   Output ~ 0
~doe
Text GLabel 4500 2900 2    50   Output ~ 0
~eoe
Wire Wire Line
	4800 2700 4750 2700
Text GLabel 4650 2600 0    50   Input ~ 0
~ramw
Text GLabel 3500 3100 0    50   Input ~ 0
~ramr
Text GLabel 5400 2400 2    50   Output ~ 0
~dwe
Text GLabel 5400 2800 2    50   Output ~ 0
~aoe
Text GLabel 4800 3300 0    50   Input ~ 0
qclk1
Text Label 3200 2800 0    50   ~ 0
I11
$Comp
L 74xx:74LS08 U?
U 1 1 5DA1E75E
P 5100 2800
AR Path="/5CDEEC9F/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DA1E75E" Ref="U?"  Part="1" 
AR Path="/5DA1E75E" Ref="U2"  Part="1" 
F 0 "U2" H 5100 2800 50  0000 C CNN
F 1 "74F08" H 5100 2600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5100 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5100 2800 50  0001 C CNN
	1    5100 2800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U?
U 2 1 5DA1E72A
P 7800 2000
AR Path="/5CDEEC9F/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DA1E72A" Ref="U?"  Part="2" 
AR Path="/5DA1E72A" Ref="U3"  Part="2" 
F 0 "U3" H 7800 2000 50  0000 C CNN
F 1 "74F32" H 7800 1800 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7800 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7800 2000 50  0001 C CNN
	2    7800 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3700 4800 3700
Wire Wire Line
	3200 2900 3500 2900
Wire Wire Line
	3200 2800 3500 2800
Wire Wire Line
	3200 2300 4800 2300
Wire Wire Line
	3200 1900 4800 1900
Wire Wire Line
	7500 5300 7400 5300
Wire Wire Line
	7400 5300 7400 4900
Wire Wire Line
	7800 4900 7800 5000
Wire Wire Line
	7400 4900 7800 4900
Wire Wire Line
	7800 4900 7800 4800
Connection ~ 7800 4900
Wire Bus Line
	4800 5600 4800 7250
Wire Bus Line
	1400 5200 1400 7250
Wire Bus Line
	3100 1900 3100 6500
$EndSCHEMATC
