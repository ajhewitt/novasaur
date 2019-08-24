//olduino.c
//Feb 7 2013, changed digitalwrite to out4 instead of out5
//Feb 26 added digitalRead on ef3
//Nov 9 2014 added oneMsBN to soak up one ms adjusted for 4mhz clock
void delay(unsigned int howlong){
	unsigned int i;
	for (i=1;i!=howlong;i++){
		oneMsBN();
	}
}
void olduinoincluder(){
	asm("\tinclude olduino.inc\n");
	asm("	align 8\n"
		"_oneMsBN:		;execute enough instructions  for 1 ms\n");
	#ifndef __CPUSPEED4
	asm("	ldi	(100-15-10-2)/2\n"); //for 1.6mhz 1802
	#else
	asm("	ldi	(250-15-10-2)/2\n"); //for 4mhz 1802
	#endif
	asm("$$mslp: smi	1\n"
		"	bnz	$$mslp\n"
		"	Cretn\n");
}
