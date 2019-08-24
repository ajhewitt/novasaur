//hspi2.c - routines for hardware spi on olduino with shield adapter outboard clock
//spixfer sends and receives, spisend output only
//spisendN spireceiveN, multibyte send and receive
//dec 18 cleanup
//Feb 16 fix spelling of spiSend
unsigned char spixfer(unsigned char value){
	//this code depends on the argument being in Reg 12 and returned value in reg 15
	asm("	glo 12\n" //get the char to be sent
		"	dec 2\n"  //make a work area
		"	str 2\n"  //save the character
		"	out 6\n"  //this loads the shift register and starts the outboard clock
		"	dec 2\n"
		"	sex 2\n"  //delay to allow outbound shift to complete
		"	inp 6\n"  //read the shift register
		"	plo 15\n" //leave it in 15
		"	inc 2\n"  //restore the stack
		"	cretn\n");
	//The return below is NOT executed. It just prevents a compiler warning
	//the cretn inside the asm block above returns the value from the spi transfer
	//sorry.
	return 0;
}
void spiSend(unsigned char value){ //this is for output only
	//this code depends on the argument being in Reg 12
	asm("	glo 12\n" //get the char to send
		"	dec 2\n"  //make a work area
		"	str 2\n"  //place the outbound char
		"	out 6\n" //this loads the MOSR and starts the outboard clock
		"	cretn\n"
	);
	//there needs to be a 1 instruction gap before the next spi accesee - return is 12 or so
}
void spiNroutines(){//wrapper for assembly routines
	//spiSendN(unsigned char *, unsigned int n){//send n bytes over spi
	//spiReceiveN(unsigned char *, unsigned int n){//Receive n bytes over spi
		//the assembler loops count on having the buffer address in R12 and a non-zero count in R13
		asm("	align 16\n" //make sure jumps stay on page
			"_spiSendN:\n"
			"	sex 12\n" //point X to the buffer
			"$$spiSendLoop:\n" //we will do this N times
			"	out 6\n"  //this sends out a byte
			"	dec 13\n" //decrement the byte count
			"	glo 13\n" //check bottom byte of counter
			"	bnz $$spiSendLoop\n" //back for more if needed - 4 inst. per byte
			"	ghi 13\n" //check high byte of counter if necessary
			"	bnz $$spiSendLoop\n"
			"	sex 2\n"  //reset X register
			"	cretn\n" //return to caller
		);
		asm("	align 16\n" //make sure jumps stay on page
			"_spiReceiveN:\n"
			"	sex 12\n" //point X to the buffer
			"	dec 12\n" //back off so the first OUT will leave us in the 1st position
			"$$spiRxvLoop:\n" //we will do this N times
			"	out 6\n"  //this sends out garbage and clocks in the 1st character
			"	dec 13\n" //decrement the byte count(and allow shift to complete)
			"	inp 6\n"  //this reads the nth byte into the nth buffer location
			"	glo 13\n" //check bottom byte of counter
			"	bnz $$spiRxvLoop\n" //back for more if needed - 6 inst. per byte
			"	ghi 13\n" //check high byte of counter if necessary
			"	bnz $$spiRxvLoop\n"
			"	sex 2\n"  //reset X register
			"	cretn\n"
		);
} //that's it

