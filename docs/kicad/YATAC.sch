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
Wire Wire Line
	1300 1500 1200 1500
Text GLabel 2850 1900 2    50   Output ~ 0
cclk
Text GLabel 2850 2100 2    50   Output ~ 0
dclk
$Comp
L 74xx:74LS04 U?
U 5 1 5CF82007
P 2300 1500
AR Path="/5DAA3954/5CF82007" Ref="U?"  Part="5" 
AR Path="/5CF82007" Ref="U31"  Part="5" 
F 0 "U31" H 2250 1500 50  0000 C CNN
F 1 "74F04" H 2350 1350 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2300 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2300 1500 50  0001 C CNN
	5    2300 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2600 1500 2700 1500
Wire Wire Line
	3750 1500 3750 900 
Wire Wire Line
	4850 900  4850 1600
Wire Wire Line
	3750 900  4850 900 
Wire Wire Line
	2900 3250 3050 3250
$Comp
L power:VCC #PWR0103
U 1 1 5D89910A
P 2500 2750
F 0 "#PWR0103" H 2500 2600 50  0001 C CNN
F 1 "VCC" H 2517 2923 50  0000 C CNN
F 2 "" H 2500 2750 50  0001 C CNN
F 3 "" H 2500 2750 50  0001 C CNN
	1    2500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 2850 2500 2750
Wire Wire Line
	3450 2400 3450 1500
Connection ~ 3450 2400
Wire Wire Line
	3450 2400 3800 2400
Connection ~ 3450 3250
Wire Wire Line
	3450 3250 3450 2400
Connection ~ 3050 3250
Wire Wire Line
	3450 3250 3450 3300
Wire Wire Line
	3050 3250 3450 3250
Wire Wire Line
	3450 3750 3450 3700
Wire Wire Line
	3050 3750 3050 3650
Wire Wire Line
	2500 3750 2500 3650
$Comp
L Power_Supervisor:TCM809 Q1
U 1 1 5D401B62
P 2600 3250
AR Path="/5D401B62" Ref="Q1"  Part="1" 
AR Path="/5CDEEC9F/5D401B62" Ref="U?"  Part="1" 
AR Path="/62D13D9D/5D401B62" Ref="U?"  Part="1" 
F 0 "Q1" H 2750 3400 50  0000 R CNN
F 1 "DS1233-15" H 3300 3400 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 2200 3400 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 2300 3500 50  0001 C CNN
	1    2600 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3350 3050 3250
$Comp
L Device:C C3
U 1 1 5D401B5C
P 3050 3500
AR Path="/5D401B5C" Ref="C3"  Part="1" 
AR Path="/5CDEEC9F/5D401B5C" Ref="C?"  Part="1" 
AR Path="/62D13D9D/5D401B5C" Ref="C?"  Part="1" 
F 0 "C3" H 3165 3546 50  0000 L CNN
F 1 "100p" H 3165 3455 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 3088 3350 50  0001 C CNN
F 3 "~" H 3050 3500 50  0001 C CNN
	1    3050 3500
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5D401B56
P 3450 3500
AR Path="/5D401B56" Ref="SW1"  Part="1" 
AR Path="/5CDEEC9F/5D401B56" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5D401B56" Ref="SW?"  Part="1" 
F 0 "SW1" V 3404 3648 50  0000 L CNN
F 1 "RESET" V 3495 3648 50  0000 L CNN
F 2 "Button_Switch_THT:SW_PUSH-12mm_Wuerth-430476085716" H 3450 3700 50  0001 C CNN
F 3 "~" H 3450 3700 50  0001 C CNN
	1    3450 3500
	0    1    -1   0   
$EndComp
Text GLabel 3000 1500 0    50   Output ~ 0
~rst
Wire Wire Line
	1900 1500 2000 1500
$Comp
L 74xx:74LS04 U?
U 4 1 5D1175A9
P 1600 1500
AR Path="/5DAA3954/5D1175A9" Ref="U?"  Part="4" 
AR Path="/5D1175A9" Ref="U31"  Part="4" 
F 0 "U31" H 1550 1500 50  0000 C CNN
F 1 "74F04" H 1700 1350 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1600 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1600 1500 50  0001 C CNN
	4    1600 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 1500 5200 1500
Connection ~ 4850 1600
Wire Wire Line
	4850 1600 5200 1600
Wire Wire Line
	4800 1700 5200 1700
Wire Wire Line
	4800 1800 5200 1800
Connection ~ 5000 1900
Wire Wire Line
	5000 1900 5200 1900
Wire Wire Line
	4800 2000 5200 2000
Wire Wire Line
	4800 2100 5200 2100
Connection ~ 4850 2200
Wire Wire Line
	4850 2200 5200 2200
Wire Wire Line
	3750 1500 3800 1500
$Comp
L power:VCC #PWR0101
U 1 1 5ECE2E58
P 4300 1200
F 0 "#PWR0101" H 4300 1050 50  0001 C CNN
F 1 "VCC" H 4317 1373 50  0000 C CNN
F 2 "" H 4300 1200 50  0001 C CNN
F 3 "" H 4300 1200 50  0001 C CNN
	1    4300 1200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 671AAE18
P 4300 2700
F 0 "#PWR0102" H 4300 2450 50  0001 C CNN
F 1 "GNDD" H 4304 2545 50  0000 C CNN
F 2 "" H 4300 2700 50  0001 C CNN
F 3 "" H 4300 2700 50  0001 C CNN
	1    4300 2700
	1    0    0    -1  
$EndComp
Text GLabel 5200 1700 2    50   Output ~ 0
pclk1
Text GLabel 5200 1800 2    50   Output ~ 0
qclk1
Text GLabel 5200 1900 2    50   Output ~ 0
pclk2
Text GLabel 5200 2000 2    50   Output ~ 0
qclk2
Text GLabel 5200 2100 2    50   Output ~ 0
rclk
Text GLabel 5200 2200 2    50   Output ~ 0
sclk
Text GLabel 5200 1500 2    50   Output ~ 0
mclk
Text GLabel 5200 1600 2    50   Output ~ 0
nclk
Wire Wire Line
	4800 1900 5000 1900
Wire Wire Line
	4800 1600 4850 1600
Wire Wire Line
	4800 2200 4850 2200
Wire Wire Line
	4850 2200 4850 2950
Wire Wire Line
	4850 2950 3750 2950
Wire Wire Line
	3750 2950 3750 1900
Connection ~ 3750 1900
Wire Wire Line
	3750 1700 3800 1700
Wire Wire Line
	3800 1900 3750 1900
Wire Wire Line
	3750 1900 3750 1700
Wire Wire Line
	5000 1900 5000 3100
Wire Wire Line
	5000 3100 3600 3100
Wire Wire Line
	3600 3100 3600 2100
Wire Wire Line
	3600 2100 3800 2100
$Comp
L 74xx:74LS175 U30
U 1 1 5CDF2414
P 4300 1900
F 0 "U30" H 4300 1900 50  0000 C CNN
F 1 "74F175" H 4300 1800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4300 1900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 4300 1900 50  0001 C CNN
	1    4300 1900
	1    0    0    -1  
$EndComp
Connection ~ 1250 3750
Wire Wire Line
	1750 3250 1950 3250
Wire Wire Line
	1250 3250 1450 3250
Wire Wire Line
	1250 2300 1250 2750
Wire Wire Line
	1300 2300 1250 2300
Wire Wire Line
	1250 2750 1450 2750
Wire Wire Line
	1750 2750 1950 2750
$Comp
L power:GNDD #PWR0104
U 1 1 5CDF2455
P 1250 3850
AR Path="/5CDF2455" Ref="#PWR0104"  Part="1" 
AR Path="/5CDEEC9F/5CDF2455" Ref="#PWR?"  Part="1" 
F 0 "#PWR0104" H 1250 3600 50  0001 C CNN
F 1 "GNDD" H 1254 3695 50  0000 C CNN
F 2 "" H 1250 3850 50  0001 C CNN
F 3 "" H 1250 3850 50  0001 C CNN
	1    1250 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2850 1950 2750
Connection ~ 1250 2750
Wire Wire Line
	1250 2750 1250 3250
Connection ~ 1250 3250
Wire Wire Line
	1250 3350 1250 3250
Wire Wire Line
	1950 3250 1950 3150
Connection ~ 1950 3250
Wire Wire Line
	1950 3350 1950 3250
$Comp
L Device:C C2
U 1 1 5CDF2470
P 1950 3500
AR Path="/5CDF2470" Ref="C2"  Part="1" 
AR Path="/5CDEEC9F/5CDF2470" Ref="C?"  Part="1" 
F 0 "C2" H 2065 3546 50  0000 L CNN
F 1 "22p" H 2065 3455 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 1988 3350 50  0001 C CNN
F 3 "~" H 1950 3500 50  0001 C CNN
	1    1950 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5CDF2476
P 1250 3500
AR Path="/5CDF2476" Ref="C1"  Part="1" 
AR Path="/5CDEEC9F/5CDF2476" Ref="C?"  Part="1" 
F 0 "C1" H 1365 3546 50  0000 L CNN
F 1 "22p" H 1365 3455 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 1288 3350 50  0001 C CNN
F 3 "~" H 1250 3500 50  0001 C CNN
	1    1250 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5CDF247C
P 1600 3250
AR Path="/5CDF247C" Ref="Y1"  Part="1" 
AR Path="/5CDEEC9F/5CDF247C" Ref="Y?"  Part="1" 
F 0 "Y1" H 1600 3518 50  0000 C CNN
F 1 "30.875" H 1600 3427 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 1600 3250 50  0001 C CNN
F 3 "~" H 1600 3250 50  0001 C CNN
	1    1600 3250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U31
U 1 1 5CDF2488
P 1600 2300
AR Path="/5CDF2488" Ref="U31"  Part="1" 
AR Path="/5CDEEC9F/5CDF2488" Ref="U?"  Part="1" 
F 0 "U31" H 1550 2300 50  0000 C CNN
F 1 "74F04" H 1650 2150 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1600 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 1600 2300 50  0001 C CNN
	1    1600 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86918
P 1600 2750
AR Path="/62D13D9D/66F86918" Ref="R?"  Part="1" 
AR Path="/66F86918" Ref="R1"  Part="1" 
F 0 "R1" V 1805 2750 50  0000 C CNN
F 1 "1k" V 1714 2750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1640 2740 50  0001 C CNN
F 3 "~" H 1600 2750 50  0001 C CNN
	1    1600 2750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 66F86922
P 1950 3000
AR Path="/62D13D9D/66F86922" Ref="R?"  Part="1" 
AR Path="/66F86922" Ref="R2"  Part="1" 
F 0 "R2" H 2050 3050 50  0000 L CNN
F 1 "270" H 2050 2950 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1990 2990 50  0001 C CNN
F 3 "~" H 1950 3000 50  0001 C CNN
	1    1950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 3650 1250 3750
Wire Wire Line
	1250 3750 1950 3750
Wire Wire Line
	1950 3750 1950 3650
Connection ~ 1950 3750
Wire Wire Line
	1250 3850 1250 3750
Connection ~ 1950 2750
Wire Wire Line
	1950 1900 1950 2300
Wire Wire Line
	1950 2300 1950 2750
$Comp
L 74xx:74LS04 U31
U 2 1 5CDF2482
P 2300 2300
AR Path="/5CDF2482" Ref="U31"  Part="2" 
AR Path="/5CDEEC9F/5CDF2482" Ref="U?"  Part="2" 
F 0 "U31" H 2250 2300 50  0000 C CNN
F 1 "74F04" H 2350 2150 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 2300 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 2300 2300 50  0001 C CNN
	2    2300 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 2300 1950 2300
Connection ~ 1950 2300
Wire Wire Line
	1950 2300 2000 2300
Wire Wire Line
	2600 2300 2650 2300
Wire Wire Line
	3450 1500 3000 1500
Connection ~ 2500 3750
Connection ~ 3050 3750
Wire Wire Line
	3050 3750 3450 3750
Wire Wire Line
	2500 3750 3050 3750
Wire Wire Line
	1950 3750 2500 3750
Wire Wire Line
	1950 1900 2850 1900
Wire Wire Line
	2850 2100 2650 2100
Wire Wire Line
	2650 2100 2650 2300
Connection ~ 2650 2300
Wire Wire Line
	2650 2300 3800 2300
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
Text GLabel 2700 1500 2    50   Input ~ 0
1
NoConn ~ 1200 1500
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
Wire Bus Line
	3900 5500 4700 5500
Wire Bus Line
	1900 7100 4700 7100
Wire Bus Line
	1500 5500 3350 5500
$EndSCHEMATC
