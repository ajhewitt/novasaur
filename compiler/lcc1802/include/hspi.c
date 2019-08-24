//hspi.c - routines for hardware spi on olduino
unsigned char spixfer(unsigned char value){
	//this code depends on the argument being in Reg 12 and returned value in reg 15
	asm("_spiSend:\n" //alias defined with no return value in hspi.h
		"	glo 12\n"
		"	dec 2\n"
		"	str 2\n"
		"	out 6\n"
		"	sex 3\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	sex 2\n"
		"	dec 2\n"
		"	inp 6\n"
		"	plo 15\n"
		"	inc 2\n"
		"	cretn\n");
	//warning the return below is NOT executed. It just prevents a compiler warning
	//the cretn inside the asm block above returns the correct value from the spi transfer
	//sorry.
	return 0;
}
