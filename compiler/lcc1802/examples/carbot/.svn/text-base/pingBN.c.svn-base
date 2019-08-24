unsigned int	pingQ(){ //read an ultrasonic ping distance sensor
//pulsing the Q line high then low starts the ultrasonic sensor
//it responds in around a ms with a pulse on EF1 with a length equal to the echo time
//the distance in cm is approximately (flight time in microseconds) /29 (inverse speed of sound in us/cm)/2 (round trip)
//with the mc running at 1.6mhz, each instruction is about 10 us
// so a 3 inst. loop yields a rough result in cm for the round trip
//with the mc running at 4mhz each instruction is about 4 us and you need a 7 instruction loop
	asm("	req\n	req\n"	//make sure Q is low
		"	seq\n"	//begin a short pulse
		"	seq\n	seq\n	seq\n	seq\n"	//extend the pulse to 20 us
		"	req\n" //end the short pulse
		"	ldaD R15,0\n"
		"	lbr yn1\n"	//branch to aligned code area
		"	align 8\n" //align for short branches
		"yn1: b1 yn1\n"	//wait for the return pulse to start
		"nn1: inc R15\n"	//count pulse length
		"	sex sp\n"	//soak up one instruction time
	);
#ifdef __CPUSPEED4 //need to add 4 more instruction times for faster cpu
	asm("	sex sp\n	sex sp\n	sex sp\n	sex sp\n");
#endif
	asm("	bn1 nn1\n"	//keep counting while return pulse is high
		"	Cretn\n"		//return to caller with count in r15
	);
//the cretn above returns the count to the caller.
	return 0; //not executed - just prevents an error message
}
