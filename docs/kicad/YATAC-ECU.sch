EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "Execution & Control Unit"
Date "2019-09-15"
Rev "1.0.7"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 6150 2450 0    50   Input ~ 0
~rst
Text GLabel 6150 2750 0    50   Input ~ 0
rclk
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 7750 2100
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U4"  Part="2" 
F 0 "U4" H 7750 2100 50  0000 C CNN
F 1 "74F32" H 7750 1900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 2100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7750 2100 50  0001 C CNN
	2    7750 2100
	1    0    0    -1  
$EndComp
Text Label 3100 2100 0    50   ~ 0
I7
Text GLabel 9750 2450 2    50   Output ~ 0
~voe
Text GLabel 8750 2950 0    50   Input ~ 0
~fetch
Text GLabel 8750 3250 0    50   Input ~ 0
dclk
Text GLabel 8750 3350 0    50   Input ~ 0
0
Text GLabel 9750 2650 2    50   Output ~ 0
~pgoe
Text GLabel 9750 2750 2    50   Output ~ 0
~alue
Text GLabel 9750 2350 2    50   Output ~ 0
~xoe
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9250 2050
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9250 1900 50  0001 C CNN
F 1 "VCC" H 9267 2223 50  0000 C CNN
F 2 "" H 9250 2050 50  0001 C CNN
F 3 "" H 9250 2050 50  0001 C CNN
	1    9250 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9250 3650
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9250 3400 50  0001 C CNN
F 1 "GNDD" H 9254 3495 50  0000 C CNN
F 2 "" H 9250 3650 50  0001 C CNN
F 3 "" H 9250 3650 50  0001 C CNN
	1    9250 3650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D34E551
P 9250 4200
AR Path="/5D34E551" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E551" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 9250 4050 50  0001 C CNN
F 1 "VCC" H 9267 4373 50  0000 C CNN
F 2 "" H 9250 4200 50  0001 C CNN
F 3 "" H 9250 4200 50  0001 C CNN
	1    9250 4200
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 2500 3600
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U12"  Part="1" 
F 0 "U12" H 2500 3650 50  0000 C CNN
F 1 "74F138" H 2450 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2500 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2500 3600 50  0001 C CNN
	1    2500 3600
	-1   0    0    -1  
$EndComp
Text GLabel 2000 3600 0    50   Output ~ 0
~vle
Text GLabel 2000 3400 0    50   Output ~ 0
~ele
Text GLabel 2000 3900 0    50   Output ~ 0
~pcle
Text GLabel 2000 3300 0    50   Output ~ 0
~xle
Text GLabel 2000 3700 0    50   Output ~ 0
~yle
Text GLabel 2000 3800 0    50   Output ~ 0
~hlle
$Comp
L power:VCC #PWR?
U 1 1 5DB933D1
P 2500 3000
AR Path="/5CDEEC9F/5DB933D1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933D1" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 2500 2850 50  0001 C CNN
F 1 "VCC" H 2517 3173 50  0000 C CNN
F 2 "" H 2500 3000 50  0001 C CNN
F 3 "" H 2500 3000 50  0001 C CNN
	1    2500 3000
	1    0    0    -1  
$EndComp
Text GLabel 2000 3500 0    50   Output ~ 0
~sle
Text GLabel 1350 4500 0    50   Output ~ 0
~pcmr
Text GLabel 1850 4100 0    50   Output ~ 0
~pgle
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 3450 1300
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U2"  Part="1" 
F 0 "U2" H 3450 1300 50  0000 C CNN
F 1 "74F08" H 3450 1100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3450 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3450 1300 50  0001 C CNN
	1    3450 1300
	-1   0    0    1   
$EndComp
Text Label 3350 1700 0    50   ~ 0
DD7
Text GLabel 3750 1200 2    50   Input ~ 0
~rst
Wire Wire Line
	3400 6200 3600 6200
Text Label 3100 3800 0    50   ~ 0
I9
Text GLabel 7450 1800 0    50   Input ~ 0
rclk
Entry Wire Line
	1800 5500 1700 5400
Entry Wire Line
	1800 5600 1700 5500
Entry Wire Line
	1800 5700 1700 5600
Entry Wire Line
	1800 5800 1700 5700
Entry Wire Line
	1800 5900 1700 5800
Entry Wire Line
	1800 6000 1700 5900
Entry Wire Line
	1800 6100 1700 6000
Entry Wire Line
	1800 6200 1700 6100
Entry Wire Line
	3300 5600 3200 5500
Entry Wire Line
	3300 5700 3200 5600
Entry Wire Line
	3300 5800 3200 5700
Entry Wire Line
	3300 6300 3200 6200
Text Label 3400 5500 0    50   ~ 0
I8
Text Label 3400 5600 0    50   ~ 0
I9
Text Label 3400 5700 0    50   ~ 0
I10
Text Label 3400 5800 0    50   ~ 0
I11
Text Label 3400 5900 0    50   ~ 0
I12
Text Label 3400 6000 0    50   ~ 0
I13
Text Label 3400 6100 0    50   ~ 0
I14
Text Label 3400 6200 0    50   ~ 0
I15
Text Label 1800 5500 0    50   ~ 0
PD0
Text Label 1800 5600 0    50   ~ 0
PD1
Text Label 1800 5700 0    50   ~ 0
PD2
Text Label 1800 5800 0    50   ~ 0
PD3
Text Label 1800 5900 0    50   ~ 0
PD4
Text Label 1800 6000 0    50   ~ 0
PD5
Text Label 1800 6100 0    50   ~ 0
PD6
Text Label 1800 6200 0    50   ~ 0
PD7
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2500 5000
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2500 4850 50  0001 C CNN
F 1 "VCC" H 2517 5173 50  0000 C CNN
F 2 "" H 2500 5000 50  0001 C CNN
F 3 "" H 2500 5000 50  0001 C CNN
	1    2500 5000
	1    0    0    -1  
$EndComp
Entry Wire Line
	3300 6200 3200 6100
Entry Wire Line
	3300 6100 3200 6000
Entry Wire Line
	3300 6000 3200 5900
Entry Wire Line
	3300 5900 3200 5800
Text GLabel 4600 6400 2    50   Input ~ 0
~ihle
Wire Wire Line
	1800 5500 2000 5500
Wire Wire Line
	1800 5600 2000 5600
Wire Wire Line
	1800 5700 2000 5700
Wire Wire Line
	1800 5800 2000 5800
Wire Wire Line
	1800 5900 2000 5900
Wire Wire Line
	1800 6000 2000 6000
Wire Wire Line
	1800 6100 2000 6100
Wire Wire Line
	1800 6200 2000 6200
Wire Wire Line
	3400 5500 3600 5500
Wire Wire Line
	3400 5600 3600 5600
Wire Wire Line
	3400 5700 3600 5700
Wire Wire Line
	3400 5800 3600 5800
Wire Wire Line
	3400 5900 3600 5900
Wire Wire Line
	3400 6000 3600 6000
Wire Wire Line
	3400 6100 3600 6100
Entry Wire Line
	3400 3700 3300 3800
Entry Wire Line
	3400 3600 3300 3700
Text Label 3400 3600 0    50   ~ 0
I11
Text Label 3400 3700 0    50   ~ 0
I4
Entry Wire Line
	3400 3100 3300 3200
Text Label 3400 3100 0    50   ~ 0
I2
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 7750 1700
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U4"  Part="1" 
F 0 "U4" H 7750 1700 50  0000 C CNN
F 1 "74F32" H 7750 1500 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7750 1700 50  0001 C CNN
	1    7750 1700
	1    0    0    -1  
$EndComp
Text GLabel 7450 1600 0    50   Input ~ 0
hblank
Text GLabel 2000 1300 0    50   Output ~ 0
PA17
Text GLabel 2000 1500 0    50   Output ~ 0
~fetch
Text GLabel 2000 1600 0    50   Output ~ 0
hsel
Text GLabel 2000 1700 0    50   Output ~ 0
boot
Entry Wire Line
	3200 1900 3300 2000
$Comp
L 74xx:74LS08 U?
U 4 1 5CED2B25
P 5200 4000
AR Path="/5DAA3954/5CED2B25" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5CED2B25" Ref="U2"  Part="4" 
F 0 "U2" H 5200 4000 50  0000 C CNN
F 1 "74F08" H 5200 3800 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5200 4000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5200 4000 50  0001 C CNN
	4    5200 4000
	1    0    0    -1  
$EndComp
Text Label 3100 1900 0    50   ~ 0
I5
Entry Wire Line
	3200 2000 3300 2100
Entry Wire Line
	3200 2100 3300 2200
Wire Wire Line
	3000 6200 3050 6200
Wire Wire Line
	4600 6200 4800 6200
Wire Wire Line
	4600 6100 4800 6100
Wire Wire Line
	4600 6000 4800 6000
Wire Wire Line
	4600 5900 4800 5900
Wire Wire Line
	4600 5800 4800 5800
Wire Wire Line
	4600 5700 4800 5700
Wire Wire Line
	4600 5600 4800 5600
Wire Wire Line
	4600 5500 4800 5500
Text GLabel 2000 6400 0    50   Input ~ 0
~ille
Entry Wire Line
	4900 5900 4800 5800
Entry Wire Line
	4900 6000 4800 5900
Entry Wire Line
	4900 6100 4800 6000
Entry Wire Line
	4900 6200 4800 6100
$Comp
L power:VCC #PWR?
U 1 1 5D12B0D3
P 2500 1100
AR Path="/5CDEEC9F/5D12B0D3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0D3" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 2500 950 50  0001 C CNN
F 1 "VCC" H 2517 1273 50  0000 C CNN
F 2 "" H 2500 1100 50  0001 C CNN
F 3 "" H 2500 1100 50  0001 C CNN
	1    2500 1100
	1    0    0    -1  
$EndComp
Text GLabel 1700 5200 1    50   Input ~ 0
PD[0..7]
Text Label 4650 6200 0    50   ~ 0
PD7
Text Label 4650 6100 0    50   ~ 0
PD6
Text Label 4650 6000 0    50   ~ 0
PD5
Text Label 4650 5900 0    50   ~ 0
PD4
Text Label 4650 5800 0    50   ~ 0
PD3
Text Label 4650 5700 0    50   ~ 0
PD2
Text Label 4650 5600 0    50   ~ 0
PD1
Text Label 4650 5500 0    50   ~ 0
PD0
Text Label 3100 6200 0    50   ~ 0
I7
Text Label 3100 6100 0    50   ~ 0
I6
Text Label 3100 6000 0    50   ~ 0
I5
Text Label 3100 5900 0    50   ~ 0
I4
Text Label 3100 5800 0    50   ~ 0
I3
Text Label 3100 5700 0    50   ~ 0
I2
Text Label 3100 5600 0    50   ~ 0
I1
Text Label 3100 5500 0    50   ~ 0
I0
Entry Wire Line
	4900 6300 4800 6200
Entry Wire Line
	4900 5800 4800 5700
Entry Wire Line
	4900 5700 4800 5600
Entry Wire Line
	4900 5600 4800 5500
$Comp
L power:GNDD #PWR?
U 1 1 5D12B0B8
P 4100 6800
AR Path="/5CDEEC9F/5D12B0B8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0B8" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 4100 6550 50  0001 C CNN
F 1 "GNDD" H 4104 6645 50  0000 C CNN
F 2 "" H 4100 6800 50  0001 C CNN
F 3 "" H 4100 6800 50  0001 C CNN
	1    4100 6800
	1    0    0    -1  
$EndComp
Entry Wire Line
	3300 6200 3400 6100
Entry Wire Line
	3300 6100 3400 6000
Entry Wire Line
	3300 6000 3400 5900
Entry Wire Line
	3300 5900 3400 5800
Entry Wire Line
	3300 5800 3400 5700
Entry Wire Line
	3300 5700 3400 5600
Entry Wire Line
	3300 5600 3400 5500
Entry Wire Line
	3300 6300 3400 6200
Text GLabel 2000 6500 0    50   Input ~ 0
0
$Comp
L 74xx:74LS574 U?
U 1 1 5D12B0A9
P 4100 6000
AR Path="/5CDEEC9F/5D12B0A9" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0A9" Ref="U11"  Part="1" 
F 0 "U11" H 4100 5800 50  0000 C CNN
F 1 "74F574" H 4100 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4100 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4100 6000 50  0001 C CNN
	1    4100 6000
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3200 3300 3300 3400
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 4100 5200
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 4100 5050 50  0001 C CNN
F 1 "VCC" H 4117 5373 50  0000 C CNN
F 2 "" H 4100 5200 50  0001 C CNN
F 3 "" H 4100 5200 50  0001 C CNN
	1    4100 5200
	1    0    0    -1  
$EndComp
Text GLabel 3300 6500 3    50   Output ~ 0
I[0..15]
Text Label 3100 2000 0    50   ~ 0
I6
Text Label 3100 3500 0    50   ~ 0
I8
Text Label 3100 3400 0    50   ~ 0
I1
Text Label 3100 3300 0    50   ~ 0
I0
$Comp
L power:GNDD #PWR?
U 1 1 5DB932AC
P 2500 4300
AR Path="/5CDEEC9F/5DB932AC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932AC" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 2500 4050 50  0001 C CNN
F 1 "GNDD" H 2504 4145 50  0000 C CNN
F 2 "" H 2500 4300 50  0001 C CNN
F 3 "" H 2500 4300 50  0001 C CNN
	1    2500 4300
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DB93291
P 2500 1800
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U13"  Part="1" 
F 0 "U13" H 2500 1650 50  0000 C CNN
F 1 "PAL16R4" H 2500 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2500 1800 50  0001 C CNN
F 3 "" H 2500 1800 50  0001 C CNN
	1    2500 1800
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3200 3500 3300 3600
Entry Wire Line
	3200 3400 3300 3500
Text GLabel 3000 1600 2    50   Input ~ 0
hblank
Text GLabel 3000 1400 2    50   Input ~ 0
~rst
Text GLabel 3000 1500 2    50   Input ~ 0
pclk1
Text GLabel 3000 2200 2    50   Input ~ 0
0
Text GLabel 3750 1400 2    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2500 2500
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2500 2250 50  0001 C CNN
F 1 "GNDD" H 2504 2345 50  0000 C CNN
F 2 "" H 2500 2500 50  0001 C CNN
F 3 "" H 2500 2500 50  0001 C CNN
	1    2500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1900 3200 1900
Wire Wire Line
	3200 2000 3000 2000
Wire Wire Line
	3000 2100 3200 2100
$Comp
L Device:R_Network08_US RN?
U 1 1 5D3C355B
P 2800 4700
AR Path="/5DAA3954/5D3C355B" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5D3C355B" Ref="RN1"  Part="1" 
F 0 "RN1" V 3300 4650 50  0000 L CNN
F 1 "270" V 3200 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3275 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2800 4700 50  0001 C CNN
	1    2800 4700
	0    -1   -1   0   
$EndComp
Entry Wire Line
	3300 4500 3200 4400
Entry Wire Line
	3300 5200 3200 5100
Entry Wire Line
	3300 4700 3200 4600
Entry Wire Line
	3300 4600 3200 4500
Entry Wire Line
	3300 4900 3200 4800
Entry Wire Line
	3300 4800 3200 4700
Entry Wire Line
	3300 5100 3200 5000
Entry Wire Line
	3300 5000 3200 4900
Wire Wire Line
	3000 4400 3200 4400
Wire Wire Line
	3000 4500 3200 4500
Wire Wire Line
	3000 4600 3200 4600
Wire Wire Line
	3000 4700 3200 4700
Wire Wire Line
	3000 4800 3200 4800
Wire Wire Line
	3000 4900 3200 4900
Wire Wire Line
	3000 5000 3200 5000
Wire Wire Line
	3000 5100 3200 5100
Text Label 3050 4400 0    50   ~ 0
I15
Text Label 3050 4500 0    50   ~ 0
I14
Text Label 3050 4600 0    50   ~ 0
I13
Text Label 3050 4700 0    50   ~ 0
I12
Text Label 3050 4800 0    50   ~ 0
I11
Text Label 3050 4900 0    50   ~ 0
I10
Text Label 3100 5000 0    50   ~ 0
I9
Text Label 3100 5100 0    50   ~ 0
I8
Text GLabel 4750 4200 0    50   Input ~ 0
qclk1
Wire Wire Line
	3050 6200 3050 7050
Wire Wire Line
	3050 7050 4700 7050
Wire Wire Line
	4700 7050 4700 6500
Wire Wire Line
	4700 6500 4600 6500
Connection ~ 3050 6200
Wire Wire Line
	3050 6200 3200 6200
Entry Bus Bus
	1700 7100 1800 7200
Entry Bus Bus
	4800 7200 4900 7100
Wire Bus Line
	1800 7200 4800 7200
Wire Wire Line
	3000 3800 3200 3800
Wire Wire Line
	3000 3500 3200 3500
Wire Wire Line
	3000 3400 3200 3400
Wire Wire Line
	2500 5200 2500 5100
Wire Wire Line
	2500 5100 2600 5100
Connection ~ 2500 5100
Wire Wire Line
	2500 5100 2500 5000
Text GLabel 5500 3600 2    50   Output ~ 0
~aoe
Text GLabel 5500 3200 2    50   Output ~ 0
~dwe
Text GLabel 3600 3900 0    50   Input ~ 0
~ramr
Text GLabel 4750 3400 0    50   Input ~ 0
~ramw
Wire Wire Line
	4900 3500 4850 3500
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 5200 4800
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U4"  Part="4" 
F 0 "U4" H 5200 4800 50  0000 C CNN
F 1 "74F32" H 5200 4600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5200 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5200 4800 50  0001 C CNN
	4    5200 4800
	1    0    0    -1  
$EndComp
Text GLabel 4600 3700 2    50   Output ~ 0
~eoe
Wire Wire Line
	3400 3600 3600 3600
Wire Wire Line
	3400 3700 3600 3700
Text GLabel 8150 4400 1    50   Output ~ 0
dclk
Wire Wire Line
	9750 4500 10150 4500
Connection ~ 9800 4600
Wire Wire Line
	9800 4600 10150 4600
Wire Wire Line
	9750 4700 10150 4700
Wire Wire Line
	9750 4800 10150 4800
Connection ~ 9950 4900
Wire Wire Line
	9950 4900 10150 4900
Wire Wire Line
	9750 5000 10150 5000
Wire Wire Line
	9750 5100 10150 5100
Connection ~ 9800 5200
Wire Wire Line
	9800 5200 10150 5200
Wire Wire Line
	8700 4500 8750 4500
$Comp
L power:GNDD #PWR?
U 1 1 5D34E557
P 9250 5700
AR Path="/5D34E557" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E557" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 9250 5450 50  0001 C CNN
F 1 "GNDD" H 9254 5545 50  0000 C CNN
F 2 "" H 9250 5700 50  0001 C CNN
F 3 "" H 9250 5700 50  0001 C CNN
	1    9250 5700
	1    0    0    -1  
$EndComp
Text GLabel 10150 4700 2    50   Output ~ 0
pclk1
Text GLabel 10150 4800 2    50   Output ~ 0
qclk1
Text GLabel 10150 4900 2    50   Output ~ 0
pclk2
Text GLabel 10150 5000 2    50   Output ~ 0
qclk2
Text GLabel 10150 5100 2    50   Output ~ 0
rclk
Text GLabel 10150 5200 2    50   Output ~ 0
sclk
Text GLabel 10150 4500 2    50   Output ~ 0
mclk
Text GLabel 10150 4600 2    50   Output ~ 0
nclk
Wire Wire Line
	9750 4900 9950 4900
Wire Wire Line
	9750 4600 9800 4600
Wire Wire Line
	9750 5200 9800 5200
Wire Wire Line
	8700 4700 8750 4700
Wire Wire Line
	8750 4900 8700 4900
Wire Wire Line
	8700 4900 8700 4700
Wire Wire Line
	9950 4900 9950 6100
Wire Wire Line
	9950 6100 8550 6100
Wire Wire Line
	8550 6100 8550 5100
Wire Wire Line
	8550 5100 8750 5100
$Comp
L 74xx:74LS175 U?
U 1 1 5D34E56F
P 9250 4900
AR Path="/5D34E56F" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D34E56F" Ref="U8"  Part="1" 
F 0 "U8" H 9250 4900 50  0000 C CNN
F 1 "74F175" H 9250 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9250 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 9250 4900 50  0001 C CNN
	1    9250 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 5400 8150 5600
Wire Wire Line
	8150 5900 8150 6100
Wire Wire Line
	7050 5800 7050 6100
Wire Wire Line
	5900 6200 5900 6100
Connection ~ 6600 6100
Wire Wire Line
	6600 6100 6600 6000
Wire Wire Line
	5900 6100 6600 6100
Wire Wire Line
	5900 6000 5900 6100
$Comp
L Device:R_US R?
U 1 1 5D34E585
P 6600 5350
AR Path="/62D13D9D/5D34E585" Ref="R?"  Part="1" 
AR Path="/5D34E585" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D34E585" Ref="R2"  Part="1" 
F 0 "R2" H 6700 5400 50  0000 L CNN
F 1 "270" H 6700 5300 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6640 5340 50  0001 C CNN
F 3 "~" H 6600 5350 50  0001 C CNN
	1    6600 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D34E58B
P 6250 5100
AR Path="/62D13D9D/5D34E58B" Ref="R?"  Part="1" 
AR Path="/5D34E58B" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D34E58B" Ref="R1"  Part="1" 
F 0 "R1" V 6455 5100 50  0000 C CNN
F 1 "1k" V 6364 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6290 5090 50  0001 C CNN
F 3 "~" H 6250 5100 50  0001 C CNN
	1    6250 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5D34E591
P 6250 5600
AR Path="/5D34E591" Ref="Y?"  Part="1" 
AR Path="/5CDEEC9F/5D34E591" Ref="Y?"  Part="1" 
AR Path="/5DAA5CD8/5D34E591" Ref="Y1"  Part="1" 
F 0 "Y1" H 6250 5868 50  0000 C CNN
F 1 "32M" H 6250 5777 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 6250 5600 50  0001 C CNN
F 3 "~" H 6250 5600 50  0001 C CNN
	1    6250 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E597
P 5900 5850
AR Path="/5D34E597" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E597" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E597" Ref="C1"  Part="1" 
F 0 "C1" H 6015 5896 50  0000 L CNN
F 1 "22p" H 6015 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 5938 5700 50  0001 C CNN
F 3 "~" H 5900 5850 50  0001 C CNN
	1    5900 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E59D
P 6600 5850
AR Path="/5D34E59D" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E59D" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E59D" Ref="C2"  Part="1" 
F 0 "C2" H 6715 5896 50  0000 L CNN
F 1 "22p" H 6715 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 6638 5700 50  0001 C CNN
F 3 "~" H 6600 5850 50  0001 C CNN
	1    6600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5700 6600 5600
Wire Wire Line
	5900 5700 5900 5600
Connection ~ 5900 5600
$Comp
L power:GNDD #PWR?
U 1 1 5D34E5A7
P 5900 6200
AR Path="/5D34E5A7" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5A7" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5A7" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 5900 5950 50  0001 C CNN
F 1 "GNDD" H 5904 6045 50  0000 C CNN
F 2 "" H 5900 6200 50  0001 C CNN
F 3 "" H 5900 6200 50  0001 C CNN
	1    5900 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5100 6600 5100
Wire Wire Line
	5900 5600 6100 5600
Wire Wire Line
	6400 5600 6600 5600
Connection ~ 5900 6100
$Comp
L Switch:SW_Push SW?
U 1 1 5D34E5B1
P 7650 5750
AR Path="/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5B1" Ref="SW1"  Part="1" 
F 0 "SW1" V 7600 5950 50  0000 L CNN
F 1 "RST" V 7700 5950 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 7650 5950 50  0001 C CNN
F 3 "~" H 7650 5950 50  0001 C CNN
	1    7650 5750
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E5B7
P 8150 5750
AR Path="/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/62D13D9D/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5B7" Ref="C3"  Part="1" 
F 0 "C3" H 8265 5796 50  0000 L CNN
F 1 "100p" H 8265 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 8188 5600 50  0001 C CNN
F 3 "~" H 8150 5750 50  0001 C CNN
	1    8150 5750
	1    0    0    -1  
$EndComp
$Comp
L Power_Supervisor:TCM809 Q?
U 1 1 5D34E5BD
P 7150 5400
AR Path="/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/62D13D9D/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5BD" Ref="Q1"  Part="1" 
F 0 "Q1" H 7300 5550 50  0000 R CNN
F 1 "DS1233" H 7700 5550 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 6750 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 6850 5650 50  0001 C CNN
	1    7150 5400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D34E5C4
P 7050 5000
AR Path="/5D34E5C4" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5C4" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 7050 4850 50  0001 C CNN
F 1 "VCC" H 7067 5173 50  0000 C CNN
F 2 "" H 7050 5000 50  0001 C CNN
F 3 "" H 7050 5000 50  0001 C CNN
	1    7050 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5100 5900 5100
Connection ~ 8700 4900
Wire Wire Line
	9800 5200 9800 5950
Wire Wire Line
	9800 5950 8700 5950
Wire Wire Line
	8700 4900 8700 5950
Wire Wire Line
	6600 6100 7050 6100
Text GLabel 7900 5200 1    50   Output ~ 0
~rst
Text GLabel 3600 2750 0    50   Input ~ 0
0
Text GLabel 3600 2550 0    50   Input ~ 0
qclk1
NoConn ~ 4600 2450
$Comp
L 74xx:74LS139 U7
U 2 1 5CEF3946
P 6650 2550
F 0 "U7" H 6650 2550 50  0000 C CNN
F 1 "74ALS139" H 6600 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6650 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6650 2550 50  0001 C CNN
	2    6650 2550
	1    0    0    -1  
$EndComp
Text GLabel 4600 2750 2    50   Output ~ 0
~ramw
Text GLabel 4600 2650 2    50   Output ~ 0
~romw
Text GLabel 4600 2550 2    50   Output ~ 0
~ramr
Text GLabel 5500 4000 2    50   Output ~ 0
~doe
Wire Wire Line
	5900 5100 5900 5600
Wire Wire Line
	6600 5600 6600 5500
Connection ~ 6600 5600
Wire Wire Line
	6600 5200 6600 5100
Connection ~ 6600 5100
Connection ~ 5900 5100
Text GLabel 6150 3700 0    50   Input ~ 0
hsel
Text GLabel 6150 3900 0    50   Input ~ 0
qclk1
Text GLabel 7150 3700 2    50   Output ~ 0
~ihle
Text GLabel 7150 3600 2    50   Output ~ 0
~ille
Text GLabel 6150 3600 0    50   Input ~ 0
~fetch
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 6650 3700
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U7"  Part="1" 
F 0 "U7" H 6650 3700 50  0000 C CNN
F 1 "74ALS139" H 6600 3600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6650 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6650 3700 50  0001 C CNN
	1    6650 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1300 3150 1300
$Comp
L 74xx:74LS574 U?
U 1 1 5D4F75AC
P 9250 2850
AR Path="/5CDEEC9F/5D4F75AC" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D4F75AC" Ref="U9"  Part="1" 
F 0 "U9" H 9250 2650 50  0000 C CNN
F 1 "74F574" H 9250 2550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9250 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9250 2850 50  0001 C CNN
	1    9250 2850
	1    0    0    -1  
$EndComp
Text GLabel 9750 3050 2    50   Output ~ 0
~hsync
Text GLabel 8750 3050 0    50   Input ~ 0
~gsync
Wire Wire Line
	4750 3400 4850 3400
Text GLabel 3550 1700 2    50   Input ~ 0
DD[0..7]
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 1650 4500
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U2"  Part="2" 
F 0 "U2" H 1650 4500 50  0000 C CNN
F 1 "74F08" H 1650 4700 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1650 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1650 4500 50  0001 C CNN
	2    1650 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1950 4100 1850 4100
Text GLabel 1950 4600 2    50   Input ~ 0
~rst
Entry Wire Line
	3200 1800 3300 1900
Text Label 3100 1800 0    50   ~ 0
I4
Wire Wire Line
	3000 1800 3200 1800
Wire Wire Line
	4850 3300 4850 3400
Wire Wire Line
	4850 3300 4900 3300
Wire Wire Line
	3550 1700 3000 1700
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 7750 2500
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U4"  Part="3" 
F 0 "U4" H 7750 2500 50  0000 C CNN
F 1 "74F32" H 7750 2300 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7750 2500 50  0001 C CNN
	3    7750 2500
	1    0    0    -1  
$EndComp
Text GLabel 7450 2400 0    50   Input ~ 0
boot
Connection ~ 4850 3400
Wire Wire Line
	4850 3400 4850 3500
NoConn ~ 7150 2450
NoConn ~ 7150 2550
Wire Wire Line
	7650 5450 7650 5400
Wire Wire Line
	7650 6100 7650 6050
Connection ~ 7650 6100
Wire Wire Line
	7900 5400 7900 5200
Connection ~ 7050 6100
Wire Wire Line
	7050 6100 7550 6100
Connection ~ 7650 5400
Wire Wire Line
	7650 6100 8150 6100
Connection ~ 8150 5400
Wire Wire Line
	8150 5400 8750 5400
Connection ~ 7900 5400
Wire Wire Line
	7900 5400 8150 5400
Wire Wire Line
	7650 5400 7900 5400
Wire Wire Line
	7450 5400 7650 5400
Wire Wire Line
	7550 6050 7550 6100
Connection ~ 7550 6100
Wire Wire Line
	7550 6100 7650 6100
Wire Wire Line
	8150 5300 8750 5300
Wire Wire Line
	3000 3300 3200 3300
Text GLabel 6150 2550 0    50   Input ~ 0
~prog
Text Label 3400 2200 0    50   ~ 0
I3
Entry Wire Line
	3400 2200 3300 2300
Wire Wire Line
	3000 6100 3200 6100
Wire Wire Line
	3000 6000 3200 6000
Wire Wire Line
	3000 5900 3200 5900
Wire Wire Line
	3000 5800 3200 5800
Wire Wire Line
	3000 5700 3200 5700
Wire Wire Line
	3000 5600 3200 5600
Wire Wire Line
	3000 5500 3200 5500
Text GLabel 2000 1900 0    50   Output ~ 0
pcent
NoConn ~ 2000 1800
Text GLabel 2000 1400 0    50   Output ~ 0
PA16
Text Label 3400 4500 0    50   ~ 0
I10
Text GLabel 5500 4400 2    50   Output ~ 0
DA16
$Comp
L 74xx:74LS32 U?
U 1 1 5DCD5A55
P 5200 3200
AR Path="/5CDEEC9F/5DCD5A55" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DCD5A55" Ref="U5"  Part="1" 
AR Path="/5DAA3954/5DCD5A55" Ref="U?"  Part="1" 
F 0 "U5" H 5200 3200 50  0000 C CNN
F 1 "74F32" H 5200 3450 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5200 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5200 3200 50  0001 C CNN
	1    5200 3200
	1    0    0    -1  
$EndComp
Entry Wire Line
	3400 4500 3300 4600
$Comp
L 74xx:74LS139 U6
U 1 1 5CEE0F76
P 4100 2550
F 0 "U6" H 4100 2550 50  0000 C CNN
F 1 "74ALS139" H 4050 2450 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4100 2550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4100 2550 50  0001 C CNN
	1    4100 2550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS139 U?
U 2 1 5DB93139
P 4100 3700
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U6"  Part="2" 
F 0 "U6" H 4100 3700 50  0000 C CNN
F 1 "74ALS139" H 4050 3600 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4100 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4100 3700 50  0001 C CNN
	2    4100 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3700 4900 3700
Wire Wire Line
	4600 3800 4850 3800
Wire Wire Line
	4850 3800 4850 3700
Wire Wire Line
	3400 3100 4900 3100
$Comp
L power:GNDD #PWR?
U 1 1 5D7A2398
P 2500 6800
AR Path="/5CDEEC9F/5D7A2398" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D7A2398" Ref="#PWR0137"  Part="1" 
F 0 "#PWR0137" H 2500 6550 50  0001 C CNN
F 1 "GNDD" H 2504 6645 50  0000 C CNN
F 2 "" H 2500 6800 50  0001 C CNN
F 3 "" H 2500 6800 50  0001 C CNN
	1    2500 6800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS574 U?
U 1 1 5D7A239E
P 2500 6000
AR Path="/5CDEEC9F/5D7A239E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D7A239E" Ref="U10"  Part="1" 
F 0 "U10" H 2500 5800 50  0000 C CNN
F 1 "74F574" H 2500 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2500 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2500 6000 50  0001 C CNN
	1    2500 6000
	1    0    0    -1  
$EndComp
Text GLabel 9750 2950 2    50   Output ~ 0
~read
Text GLabel 3600 2450 0    50   Input ~ 0
~read
Entry Wire Line
	3200 3800 3300 3900
Text GLabel 3000 3900 2    50   Input ~ 0
~romw
Text GLabel 3000 4000 2    50   Input ~ 0
qclk1
Text GLabel 2000 2000 0    50   Output ~ 0
~prog
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 5200 3600
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U2"  Part="3" 
F 0 "U2" H 5200 3600 50  0000 C CNN
F 1 "74F08" H 5200 3400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5200 3600 50  0001 C CNN
	3    5200 3600
	1    0    0    -1  
$EndComp
Text Label 3400 4900 0    50   ~ 0
I5
Text GLabel 4900 4700 0    50   Input ~ 0
~alue
Entry Wire Line
	3400 4900 3300 5000
Wire Wire Line
	3400 4900 4900 4900
Text GLabel 5500 4800 2    50   Output ~ 0
~ale
Text GLabel 4600 3600 2    50   Output ~ 0
~inoe
Wire Wire Line
	4600 3900 4900 3900
$Comp
L 74xx:74LS08 U3
U 4 1 5DDC2C15
P 5200 4400
F 0 "U3" H 5200 4400 50  0000 C CNN
F 1 "74F08" H 5200 4634 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5200 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5200 4400 50  0001 C CNN
	4    5200 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4000 1950 4000
Wire Wire Line
	1950 4000 1950 4100
Wire Wire Line
	1950 4200 2050 4200
Wire Wire Line
	2050 4200 2050 4400
Wire Wire Line
	2050 4400 1950 4400
Connection ~ 1950 4100
Wire Wire Line
	1950 4100 1950 4200
Text GLabel 9750 2850 2    50   Output ~ 0
pcoe
Wire Wire Line
	7450 2200 3400 2200
Wire Wire Line
	8700 3900 9800 3900
Wire Wire Line
	8700 3900 8700 4500
Wire Wire Line
	9800 3900 9800 4600
NoConn ~ 7150 3800
NoConn ~ 7150 3900
$Comp
L 74xx:74LS04 U1
U 1 1 5EB365D5
P 6250 4500
F 0 "U1" H 6200 4500 50  0000 C CNN
F 1 "74F04" H 6250 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6250 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6250 4500 50  0001 C CNN
	1    6250 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS04 U1
U 3 1 5EB448F0
P 4100 4500
F 0 "U1" H 4050 4500 50  0000 C CNN
F 1 "74F04" H 4100 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4100 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 4100 4500 50  0001 C CNN
	3    4100 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4500 5950 4500
Wire Wire Line
	5900 4500 5900 5100
Wire Wire Line
	6550 4500 6600 4500
Wire Wire Line
	6600 4500 6600 5100
Wire Wire Line
	6600 4500 6650 4500
Connection ~ 6600 4500
$Comp
L 74xx:74LS04 U1
U 2 1 5EB39009
P 6950 4500
F 0 "U1" H 6900 4500 50  0000 C CNN
F 1 "74F04" H 6950 4726 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 6950 4500 50  0001 C CNN
	2    6950 4500
	1    0    0    -1  
$EndComp
Text GLabel 6600 4400 1    50   Output ~ 0
cclk
Wire Wire Line
	6600 4500 6600 4400
Wire Wire Line
	8150 4400 8150 4500
Connection ~ 8150 4500
Wire Wire Line
	8150 4500 8150 5300
$Comp
L 74xx:74LS04 U1
U 4 1 5ED03C76
P 7750 3000
F 0 "U1" H 7700 3000 50  0000 C CNN
F 1 "74F04" H 7750 3226 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7750 3000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS04" H 7750 3000 50  0001 C CNN
	4    7750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 3000 8100 3000
Wire Wire Line
	8100 3000 8100 2850
Wire Wire Line
	8100 2850 8750 2850
Wire Wire Line
	7400 3000 7450 3000
Text GLabel 7450 2000 0    50   Input ~ 0
qclk1
Wire Wire Line
	7250 4500 8150 4500
Wire Wire Line
	8750 2650 8100 2650
Wire Wire Line
	8050 2500 8100 2500
Wire Wire Line
	8100 2500 8100 2650
Wire Wire Line
	7400 2600 7450 2600
Wire Wire Line
	8050 2100 8250 2100
Wire Wire Line
	8750 2550 8250 2550
Wire Wire Line
	8250 2100 8250 2550
Wire Wire Line
	7400 2600 7400 2650
Wire Wire Line
	7150 2650 7400 2650
Connection ~ 7400 2650
Wire Wire Line
	7400 2650 7400 3000
Wire Wire Line
	8750 2450 8400 2450
Wire Wire Line
	8750 2350 8550 2350
Wire Wire Line
	7150 2750 8750 2750
Wire Wire Line
	4900 4300 4850 4300
Wire Wire Line
	4850 4300 4850 4200
Wire Wire Line
	4850 4100 4900 4100
Wire Wire Line
	4850 4200 4750 4200
Connection ~ 4850 4200
Wire Wire Line
	4850 4200 4850 4100
Wire Wire Line
	3400 4500 3800 4500
Wire Wire Line
	4400 4500 4900 4500
Wire Wire Line
	8050 1700 8400 1700
Wire Wire Line
	8400 1700 8400 2450
Wire Wire Line
	9750 2550 10000 2550
Wire Wire Line
	8550 1700 10000 1700
Wire Wire Line
	10000 1700 10000 2550
Wire Wire Line
	8550 1700 8550 2350
Wire Bus Line
	4900 5600 4900 7100
Wire Bus Line
	1700 5200 1700 7100
Wire Bus Line
	3300 1900 3300 6500
$EndSCHEMATC
