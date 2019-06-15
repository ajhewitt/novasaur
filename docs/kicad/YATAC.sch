EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 5
Title "YATAC78 TTL Computer"
Date "2019-05-31"
Rev "0.7"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 7000 5650 600  600 
U 5DAA19D5
F0 "CPU" 50
F1 "YATAC-CPU.sch" 50
$EndSheet
$Sheet
S 8100 5650 600  600 
U 5DAA5CD8
F0 "ECU" 50
F1 "YATAC-ECU.sch" 50
$EndSheet
$Sheet
S 9200 5650 600  600 
U 5DAA3954
F0 "GPU" 50
F1 "YATAC-GPU.sch" 50
$EndSheet
Text Notes 7000 6650 0    45   ~ 0
Top sheet contains main clock circuit used throught the system.
$Comp
L Device:R_Network08_US RN1
U 1 1 6165F43D
P 2100 5000
F 0 "RN1" H 2000 5300 50  0000 L CNN
F 1 "270" H 2000 5200 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 2575 5000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2100 5000 50  0001 C CNN
	1    2100 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN2
U 1 1 616603F5
P 3150 5000
F 0 "RN2" H 3050 5300 50  0000 L CNN
F 1 "270" H 3050 5200 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3625 5000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3150 5000 50  0001 C CNN
	1    3150 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network08_US RN3
U 1 1 61662F7D
P 4200 5000
F 0 "RN3" H 4100 5300 50  0000 L CNN
F 1 "270" H 4100 5200 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 4675 5000 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4200 5000 50  0001 C CNN
	1    4200 5000
	1    0    0    -1  
$EndComp
Entry Wire Line
	1700 5500 1800 5400
Entry Wire Line
	1600 5500 1700 5400
Entry Wire Line
	1900 5500 2000 5400
Entry Wire Line
	1800 5500 1900 5400
Entry Wire Line
	2100 5500 2200 5400
Entry Wire Line
	2000 5500 2100 5400
Entry Wire Line
	2300 5500 2400 5400
Entry Wire Line
	2200 5500 2300 5400
Entry Wire Line
	2750 5500 2850 5400
Entry Wire Line
	2650 5500 2750 5400
Entry Wire Line
	2950 5500 3050 5400
Entry Wire Line
	2850 5500 2950 5400
Entry Wire Line
	3150 5500 3250 5400
Entry Wire Line
	3050 5500 3150 5400
Entry Wire Line
	3350 5500 3450 5400
Entry Wire Line
	3250 5500 3350 5400
Entry Wire Line
	3900 5500 3800 5400
Entry Wire Line
	4600 5500 4500 5400
Entry Wire Line
	4100 5500 4000 5400
Entry Wire Line
	4000 5500 3900 5400
Entry Wire Line
	4300 5500 4200 5400
Entry Wire Line
	4200 5500 4100 5400
Entry Wire Line
	4500 5500 4400 5400
Entry Wire Line
	4400 5500 4300 5400
Text GLabel 1500 5500 0    50   Input ~ 0
DA[0..15]
Text GLabel 4700 5500 2    50   Input ~ 0
PA[0..15]
Wire Wire Line
	1700 5400 1700 5200
Wire Wire Line
	1800 5400 1800 5200
Wire Wire Line
	1900 5400 1900 5200
Wire Wire Line
	2000 5400 2000 5200
Wire Wire Line
	2100 5400 2100 5200
Wire Wire Line
	2200 5400 2200 5200
Wire Wire Line
	2300 5400 2300 5200
Wire Wire Line
	2400 5400 2400 5200
Wire Wire Line
	2750 5400 2750 5200
Wire Wire Line
	2850 5400 2850 5200
Wire Wire Line
	2950 5400 2950 5200
Wire Wire Line
	3050 5400 3050 5200
Wire Wire Line
	3150 5400 3150 5200
Wire Wire Line
	3250 5400 3250 5200
Wire Wire Line
	3350 5400 3350 5200
Wire Wire Line
	3450 5400 3450 5200
Text Label 1700 5400 1    50   ~ 0
DA0
Text Label 1800 5400 1    50   ~ 0
DA1
Text Label 1900 5400 1    50   ~ 0
DA2
Text Label 2000 5400 1    50   ~ 0
DA3
Text Label 2100 5400 1    50   ~ 0
DA4
Text Label 2200 5400 1    50   ~ 0
DA5
Text Label 2300 5400 1    50   ~ 0
DA6
Text Label 2400 5400 1    50   ~ 0
DA7
Text Label 2750 5400 1    50   ~ 0
DA8
Text Label 2850 5400 1    50   ~ 0
DA9
Text Label 2950 5400 1    50   ~ 0
DA10
Text Label 3050 5400 1    50   ~ 0
DA11
Text Label 3150 5400 1    50   ~ 0
DA12
Text Label 3250 5400 1    50   ~ 0
DA13
Text Label 3350 5400 1    50   ~ 0
DA14
Text Label 3450 5400 1    50   ~ 0
DA15
Wire Wire Line
	3800 5400 3800 5200
Wire Wire Line
	3900 5400 3900 5200
Wire Wire Line
	4000 5400 4000 5200
Wire Wire Line
	4100 5400 4100 5200
Wire Wire Line
	4200 5400 4200 5200
Wire Wire Line
	4300 5400 4300 5200
Wire Wire Line
	4400 5400 4400 5200
Wire Wire Line
	4500 5400 4500 5200
Text Label 3800 5400 1    50   ~ 0
PA8
Text Label 3900 5400 1    50   ~ 0
PA9
Text Label 4000 5400 1    50   ~ 0
PA10
Text Label 4100 5400 1    50   ~ 0
PA11
Text Label 4200 5400 1    50   ~ 0
PA12
Text Label 4300 5400 1    50   ~ 0
PA13
Text Label 4400 5400 1    50   ~ 0
PA14
Text Label 4500 5400 1    50   ~ 0
PA15
$Comp
L power:VCC #PWR0201
U 1 1 5CEDC305
P 3800 4700
F 0 "#PWR0201" H 3800 4550 50  0001 C CNN
F 1 "VCC" H 3817 4873 50  0000 C CNN
F 2 "" H 3800 4700 50  0001 C CNN
F 3 "" H 3800 4700 50  0001 C CNN
	1    3800 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4700 3800 4800
$Comp
L power:VCC #PWR0204
U 1 1 5D4B22A2
P 2750 4700
F 0 "#PWR0204" H 2750 4550 50  0001 C CNN
F 1 "VCC" H 2767 4873 50  0000 C CNN
F 2 "" H 2750 4700 50  0001 C CNN
F 3 "" H 2750 4700 50  0001 C CNN
	1    2750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 4700 2750 4800
$Comp
L power:VCC #PWR0205
U 1 1 5D4C867C
P 1700 4700
F 0 "#PWR0205" H 1700 4550 50  0001 C CNN
F 1 "VCC" H 1717 4873 50  0000 C CNN
F 2 "" H 1700 4700 50  0001 C CNN
F 3 "" H 1700 4700 50  0001 C CNN
	1    1700 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4700 1700 4800
$Sheet
S 10300 5650 600  600 
U 62D13D9D
F0 "IO" 50
F1 "YATAC-IO.sch" 50
$EndSheet
Text GLabel 3500 2000 2    50   Output ~ 0
cclk
Text GLabel 3500 2200 2    50   Output ~ 0
dclk
Wire Wire Line
	5300 1000 5300 1700
Wire Wire Line
	4200 1000 5300 1000
Wire Wire Line
	3900 2500 4250 2500
$Comp
L 74xx:74LS04 U?
U 4 1 5D1175A9
P 2950 2400
AR Path="/5DAA3954/5D1175A9" Ref="U?"  Part="4" 
AR Path="/5D1175A9" Ref="U31"  Part="4" 
F 0 "U31" H 2900 2400 50  0000 C CNN
F 1 "74F04" H 3050 2250 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2950 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2950 2400 50  0001 C CNN
	4    2950 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1600 5650 1600
Connection ~ 5300 1700
Wire Wire Line
	5300 1700 5650 1700
Wire Wire Line
	5250 1800 5650 1800
Wire Wire Line
	5250 1900 5650 1900
Connection ~ 5450 2000
Wire Wire Line
	5450 2000 5650 2000
Wire Wire Line
	5250 2100 5650 2100
Wire Wire Line
	5250 2200 5650 2200
Connection ~ 5300 2300
Wire Wire Line
	5300 2300 5650 2300
Wire Wire Line
	4200 1600 4250 1600
$Comp
L power:VCC #PWR0101
U 1 1 5ECE2E58
P 4750 1300
F 0 "#PWR0101" H 4750 1150 50  0001 C CNN
F 1 "VCC" H 4767 1473 50  0000 C CNN
F 2 "" H 4750 1300 50  0001 C CNN
F 3 "" H 4750 1300 50  0001 C CNN
	1    4750 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 671AAE18
P 4750 2800
F 0 "#PWR0102" H 4750 2550 50  0001 C CNN
F 1 "GNDD" H 4754 2645 50  0000 C CNN
F 2 "" H 4750 2800 50  0001 C CNN
F 3 "" H 4750 2800 50  0001 C CNN
	1    4750 2800
	1    0    0    -1  
$EndComp
Text GLabel 5650 1800 2    50   Output ~ 0
pclk1
Text GLabel 5650 1900 2    50   Output ~ 0
qclk1
Text GLabel 5650 2000 2    50   Output ~ 0
pclk2
Text GLabel 5650 2100 2    50   Output ~ 0
qclk2
Text GLabel 5650 2200 2    50   Output ~ 0
rclk
Text GLabel 5650 2300 2    50   Output ~ 0
sclk
Text GLabel 5650 1600 2    50   Output ~ 0
mclk
Text GLabel 5650 1700 2    50   Output ~ 0
nclk
Wire Wire Line
	5250 2000 5450 2000
Wire Wire Line
	5250 1700 5300 1700
Wire Wire Line
	5250 2300 5300 2300
Wire Wire Line
	4200 1800 4250 1800
Wire Wire Line
	4250 2000 4200 2000
Wire Wire Line
	4200 2000 4200 1800
Wire Wire Line
	5450 2000 5450 3200
Wire Wire Line
	5450 3200 4050 3200
Wire Wire Line
	4050 3200 4050 2200
Wire Wire Line
	4050 2200 4250 2200
$Comp
L 74xx:74LS175 U30
U 1 1 5CDF2414
P 4750 2000
F 0 "U30" H 4750 2000 50  0000 C CNN
F 1 "74F175" H 4750 1900 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4750 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 4750 2000 50  0001 C CNN
	1    4750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 2400 1200 2400
Wire Wire Line
	1850 2400 1900 2400
Connection ~ 1900 2400
Wire Wire Line
	1900 2400 1950 2400
Wire Wire Line
	3250 2400 3300 2400
Wire Wire Line
	3500 2200 3300 2200
Wire Wire Line
	3300 2200 3300 2400
Connection ~ 3300 2400
Wire Wire Line
	3300 2400 4250 2400
Text Notes 7050 6050 0    150  ~ 0
CPU
Text Notes 9250 6050 0    150  ~ 0
GPU
Text Notes 8150 6050 0    150  ~ 0
ECU
Text Notes 10400 6050 0    150  ~ 0
I/O
Text GLabel 1800 6200 1    50   Output ~ 0
vdac0r
Text GLabel 2800 6200 1    50   Output ~ 0
vdac0g
Text GLabel 3600 6200 1    50   Output ~ 0
vdac0b
Text GLabel 4700 7100 2    50   Input ~ 0
C[0..7]
Text Label 1800 6850 3    50   ~ 0
C0
Text Label 2000 6850 3    50   ~ 0
C1
Text Label 2400 6850 3    50   ~ 0
C2
Text Label 2800 6850 3    50   ~ 0
C3
Text Label 3000 6850 3    50   ~ 0
C4
Text Label 3400 6850 3    50   ~ 0
C5
Text Label 4000 6850 3    50   ~ 0
C6
Text Label 4500 6850 3    50   ~ 0
C7
Entry Wire Line
	4600 7100 4500 7000
Entry Wire Line
	4100 7100 4000 7000
Entry Wire Line
	3100 7100 3000 7000
Entry Wire Line
	3500 7100 3400 7000
Entry Wire Line
	2900 7100 2800 7000
Entry Wire Line
	2500 7100 2400 7000
Entry Wire Line
	1900 7100 1800 7000
Entry Wire Line
	2100 7100 2000 7000
$Comp
L Device:R_Network07_US RN5
U 1 1 5D025BB1
P 3100 6400
F 0 "RN5" H 3000 6700 50  0000 L CNN
F 1 "1800" H 3000 6600 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 3575 6400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 3100 6400 50  0001 C CNN
	1    3100 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack03_SIP RN?
U 1 1 5EC839D7
P 4100 6450
AR Path="/5DAA3954/5EC839D7" Ref="RN?"  Part="1" 
AR Path="/5EC839D7" Ref="RN6"  Part="1" 
F 0 "RN6" H 4000 6800 50  0000 L CNN
F 1 "820" H 4000 6700 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP6" V 4675 6450 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 4100 6450 50  0001 C CNN
	1    4100 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Network07_US RN4
U 1 1 5D043A60
P 2100 6400
F 0 "RN4" H 2000 6700 50  0000 L CNN
F 1 "1800" H 2000 6600 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP8" V 2575 6400 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2100 6400 50  0001 C CNN
	1    2100 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6650 3900 6700
Wire Wire Line
	3900 6700 4000 6700
Wire Wire Line
	3600 6800 3800 6800
Wire Wire Line
	4100 6700 4100 6650
Wire Wire Line
	4200 6650 4200 6800
Connection ~ 4200 6800
Wire Wire Line
	4200 6800 4400 6800
Wire Wire Line
	2100 6600 2100 6700
Wire Wire Line
	2100 6700 2200 6700
Wire Wire Line
	2400 6700 2400 6600
Wire Wire Line
	2200 6700 2200 6600
Connection ~ 2200 6700
Wire Wire Line
	2200 6700 2300 6700
Wire Wire Line
	2300 6700 2300 6600
Connection ~ 2300 6700
Wire Wire Line
	2300 6700 2400 6700
Wire Wire Line
	1900 6600 1900 6700
Wire Wire Line
	1900 6700 2000 6700
Wire Wire Line
	2000 6700 2000 6600
Wire Wire Line
	3300 6700 3400 6700
Wire Wire Line
	3300 6700 3300 6600
Connection ~ 3300 6700
Wire Wire Line
	3200 6700 3300 6700
Wire Wire Line
	3200 6700 3200 6600
Wire Wire Line
	3400 6700 3400 6600
Connection ~ 3200 6700
Wire Wire Line
	3100 6700 3200 6700
Wire Wire Line
	3100 6600 3100 6700
Wire Wire Line
	3000 6700 3000 6600
Wire Wire Line
	2900 6700 3000 6700
Wire Wire Line
	2900 6600 2900 6700
Wire Wire Line
	1800 7000 1800 6600
Wire Wire Line
	2000 7000 2000 6700
Wire Wire Line
	2400 6700 2400 7000
Wire Wire Line
	2800 7000 2800 6600
Wire Wire Line
	3000 7000 3000 6700
Wire Wire Line
	3400 7000 3400 6700
Wire Wire Line
	3600 6800 3600 6200
Wire Wire Line
	3800 6650 3800 6800
Connection ~ 3800 6800
Wire Wire Line
	3800 6800 4200 6800
Wire Wire Line
	4000 7000 4000 6700
Connection ~ 4000 6700
Wire Wire Line
	4000 6700 4100 6700
Wire Wire Line
	4400 6800 4400 6650
Wire Wire Line
	4500 6650 4500 7000
Connection ~ 3400 6700
Connection ~ 3000 6700
Connection ~ 2400 6700
Connection ~ 2000 6700
Wire Wire Line
	3400 3250 3400 3450
Wire Wire Line
	3400 3750 3400 3950
Wire Wire Line
	2850 3650 2850 3950
Wire Wire Line
	3900 3250 3900 3300
Connection ~ 3900 3250
Wire Wire Line
	3400 3250 3900 3250
Wire Wire Line
	2850 3950 3400 3950
Wire Wire Line
	1900 2400 1900 2850
Connection ~ 1900 2850
Wire Wire Line
	1200 4050 1200 3950
Connection ~ 1900 3950
Wire Wire Line
	1900 3950 1900 3850
Wire Wire Line
	1200 3950 1900 3950
Wire Wire Line
	1200 3850 1200 3950
$Comp
L Device:R_US R?
U 1 1 66F86922
P 1900 3150
AR Path="/62D13D9D/66F86922" Ref="R?"  Part="1" 
AR Path="/66F86922" Ref="R2"  Part="1" 
F 0 "R2" H 2000 3200 50  0000 L CNN
F 1 "270" H 2000 3100 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1940 3140 50  0001 C CNN
F 3 "~" H 1900 3150 50  0001 C CNN
	1    1900 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86918
P 1550 2850
AR Path="/62D13D9D/66F86918" Ref="R?"  Part="1" 
AR Path="/66F86918" Ref="R1"  Part="1" 
F 0 "R1" V 1755 2850 50  0000 C CNN
F 1 "1k" V 1664 2850 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1590 2840 50  0001 C CNN
F 3 "~" H 1550 2850 50  0001 C CNN
	1    1550 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CDF247C
P 1550 3450
AR Path="/5CDF247C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y1" H 1550 3718 50  0000 C CNN
F 1 "30M875" H 1550 3627 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 1550 3450 50  0001 C CNN
F 3 "~" H 1550 3450 50  0001 C CNN
	1    1550 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5CDF2476
P 1200 3700
AR Path="/5CDF2476" Ref="C1"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C1" H 1315 3746 50  0000 L CNN
F 1 "22p" H 1315 3655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 1238 3550 50  0001 C CNN
F 3 "~" H 1200 3700 50  0001 C CNN
	1    1200 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CDF2470
P 1900 3700
AR Path="/5CDF2470" Ref="C2"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C2" H 2015 3746 50  0000 L CNN
F 1 "22p" H 2015 3655 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 1938 3550 50  0001 C CNN
F 3 "~" H 1900 3700 50  0001 C CNN
	1    1900 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3550 1900 3450
Connection ~ 1900 3450
Wire Wire Line
	1200 3550 1200 3450
Connection ~ 1200 3450
$Comp
L power:GNDD #PWR0104
U 1 1 5CDF2455
P 1200 4050
AR Path="/5CDF2455" Ref="#PWR0104"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 1200 3800 50  0001 C CNN
F 1 "GNDD" H 1204 3895 50  0000 C CNN
F 2 "" H 1200 4050 50  0001 C CNN
F 3 "" H 1200 4050 50  0001 C CNN
	1    1200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2850 1900 2850
Wire Wire Line
	1200 3450 1400 3450
Wire Wire Line
	1700 3450 1900 3450
Connection ~ 1200 3950
$Comp
L Switch:SW_Push SW1
U 1 1 5D401B56
P 3900 3600
AR Path="/5D401B56" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5D401B56" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5D401B56" Ref="SW?"  Part="1" 
F 0 "SW1" V 3850 3800 50  0000 L CNN
F 1 "RESET" V 3950 3800 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 3900 3800 50  0001 C CNN
F 3 "~" H 3900 3800 50  0001 C CNN
	1    3900 3600
	0    1    -1   0   
$EndComp
$Comp
L Device:C C3
U 1 1 5D401B5C
P 3400 3600
AR Path="/5D401B5C" Ref="C3"  Part="1" 
AR Path="/5CDEEC9F/5D401B5C" Ref="C?"  Part="1" 
AR Path="/62D13D9D/5D401B5C" Ref="C?"  Part="1" 
F 0 "C3" H 3515 3646 50  0000 L CNN
F 1 "100p" H 3515 3555 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 3438 3450 50  0001 C CNN
F 3 "~" H 3400 3600 50  0001 C CNN
	1    3400 3600
	1    0    0    -1  
$EndComp
$Comp
L Power_Supervisor:TCM809 Q1
U 1 1 5D401B62
P 2950 3250
AR Path="/5D401B62" Ref="Q1"  Part="1" 
AR Path="/5CDEEC9F/5D401B62" Ref="U?"  Part="1" 
AR Path="/62D13D9D/5D401B62" Ref="U?"  Part="1" 
F 0 "Q1" H 3100 3400 50  0000 R CNN
F 1 "DS1233" H 3500 3400 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 2550 3400 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 2650 3500 50  0001 C CNN
	1    2950 3250
	1    0    0    -1  
$EndComp
Connection ~ 3400 3250
$Comp
L power:VCC #PWR0103
U 1 1 5D89910A
P 2850 2850
F 0 "#PWR0103" H 2850 2700 50  0001 C CNN
F 1 "VCC" H 2867 3023 50  0000 C CNN
F 2 "" H 2850 2850 50  0001 C CNN
F 3 "" H 2850 2850 50  0001 C CNN
	1    2850 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3250 3400 3250
Wire Wire Line
	1900 3300 1900 3450
Wire Wire Line
	1900 2850 1900 3000
Wire Wire Line
	1400 2850 1200 2850
Connection ~ 1200 2850
Wire Wire Line
	1200 2850 1200 3450
Wire Wire Line
	1200 2400 1200 2850
Wire Wire Line
	3900 2500 3900 3250
Wire Wire Line
	3400 3950 3800 3950
Wire Wire Line
	3800 3950 3800 3900
Connection ~ 3400 3950
Wire Wire Line
	3800 3950 3900 3950
Wire Wire Line
	3900 3950 3900 3900
Connection ~ 3800 3950
Wire Wire Line
	2600 2400 2550 2400
Wire Wire Line
	2650 2400 2600 2400
Connection ~ 2600 2400
Connection ~ 3900 2500
Connection ~ 4200 2000
Wire Wire Line
	4200 1000 4200 1600
Wire Wire Line
	5300 2300 5300 3050
Wire Wire Line
	5300 3050 4200 3050
Wire Wire Line
	4200 2000 4200 3050
Wire Wire Line
	1900 3950 2850 3950
Connection ~ 2850 3950
Wire Wire Line
	3500 2000 2600 2000
Wire Wire Line
	2600 2000 2600 2400
Text GLabel 3650 1700 0    50   Output ~ 0
~rst
$Comp
L 74xx:74LS04 U?
U 5 1 5CF82007
P 1550 1700
AR Path="/5DAA3954/5CF82007" Ref="U?"  Part="5" 
AR Path="/5CF82007" Ref="U31"  Part="5" 
F 0 "U31" H 1500 1700 50  0000 C CNN
F 1 "74F04" H 1600 1550 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1550 1700 50  0001 C CNN
	5    1550 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U?
U 3 1 5D14B6BD
P 2250 2400
AR Path="/5CDEEC9F/5D14B6BD" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5D14B6BD" Ref="U?"  Part="3" 
AR Path="/5DAA3954/5D14B6BD" Ref="U?"  Part="3" 
AR Path="/5D14B6BD" Ref="U31"  Part="3" 
F 0 "U31" H 2200 2400 50  0000 C CNN
F 1 "74F04" H 2350 2250 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2250 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2250 2400 50  0001 C CNN
	3    2250 2400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U31
U 2 1 5CDF2482
P 1550 2400
AR Path="/5CDF2482" Ref="U31"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U31" H 1500 2400 50  0000 C CNN
F 1 "74F04" H 1600 2250 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1550 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1550 2400 50  0001 C CNN
	2    1550 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 1700 3900 2500
Wire Wire Line
	3650 1700 3900 1700
Text GLabel 1250 1700 0    50   Input ~ 0
1
NoConn ~ 1850 1700
Wire Bus Line
	1900 7100 4700 7100
Wire Bus Line
	3900 5500 4700 5500
Wire Bus Line
	1500 5500 3350 5500
$EndSCHEMATC
