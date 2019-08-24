unsigned char spixfer(unsigned char movalue){
	asm("	glo 12\n"
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
void shiftOut(unsigned char data){//code to send a byte out via the hardware spi
	unsigned char o, temp,i;
	out(6,data); //put the data in mosr
	for (i=0; i<8;i++){
		out(2,0); //clock it out
	}
}
void LcdWrite(unsigned char dc, unsigned char payload) //flag for data vs command, byte to send out
{
	register unsigned char dummy;
	digitalWrite(lcdcmd,dc); //set data or command
	dummy=spixfer(payload);
}
void LcdWriteN(unsigned char *ptr, unsigned char n)
{
	unsigned char i;
	digitalWrite(lcdcmd,LCD_D); //LcdWriteN only sends out data
	for (i=0;i<n;i++){
		shiftOut(*ptr++);
	}
}

void gotoXY(unsigned char x, unsigned char y)
{
  LcdWrite( 0, 0x80 | x);  // Column.
  LcdWrite( 0, 0x40 | y);  // Row.
}


void LcdInitialise(void)
{
  	digitalWrite(lcdreset,LOW); //reset the LCD
  	digitalWrite(lcdreset,HIGH); //release the reset
  	LcdWrite(LCD_C, 0x20); //send initialization
  	LcdWrite(LCD_C, 0x0C); //					bytes
}

void LcdSet(unsigned char what) //set the whole LCD to a bit pattern
{
  unsigned int index;
  for (index = 0; index <504; index++)
  {
    LcdWrite(LCD_D, what);
  }
}
void LcdClear(){		//clear the LCD to 0's, uses assembly routine below
	lcdWrite(LCD_D,0);	//clear the 1st position and make sure MOSR is clear
	lcdclearer();	//set the rest of the lcd to 0's
}
void hwspilcdasm(){ //asm routines for hardware spi lcd
	asm("	align 32\n"		//make sure lcdclearer jumps will fit on page
		"_lcdclearer:\n" 	//clears last 503 bytes of lcd
		"	ldad R15,503\n"	//number of bytes to clear
		"	sex 3\n"		//allow inline output
		"$$clrloop:\n"		//come back here for more
			"	out 2\n	db 00\n"	//8 cycles of the clock port
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	out 2\n	db 00\n"
			"	dec R15\n"	//decrease counter
			"	glo R15\n	bnz $$clrloop\n" //back for more
			"	ghi R15\n	bnz $$clrloop\n" //til done
		"	sex 2\n"	//reset the X register to normal
		"	cretn\n");	//and we're done

	asm("	align 32\n"	//make sure jumps are on page
		"_LcdWriterN:\n" //enter with pointer to text in R12, count in R13
		"$$wrtrloop:\n"
		"	sex 12\n" 	//point X at the string to be written
		"	out 6\n"  	//send it out to MOSR (also advances R12)
		"	sex 3\n"	//prepare for inline output
		"	out 2\n	db 00\n"	//8 cycles of the clock port
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	out 2\n	db 00\n"
		"	dec R13\n"	//decrease counter
		"	glo R13\n	bnz $$wrtrloop\n" //back for more
		"	ghi R13\n	bnz $$wrtrloop\n" //til done
		"	cretn\n");		//no cleanup needed, we're done here
}
