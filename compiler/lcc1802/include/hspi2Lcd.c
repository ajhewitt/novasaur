//Routines for access to the nokia 5110 LCD over hardware spi 2 - outboard clock
void LcdWrite(unsigned char dc, unsigned char payload) //flag for data vs command, byte to send out
{
	register unsigned char dummy;
	digitalWrite(lcdcmd,dc); //set data or command
	spisend(payload);
}
void LcdWriteN(unsigned char *ptr, unsigned int n)
{
	unsigned char i;
	digitalWrite(lcdcmd,LCD_D); //LcdWriteN only sends out data
	spisendN(ptr,n);
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
	asm("	align 16\n"		//make sure lcdclearer jumps will fit on page
		"_lcdclearer:\n" 	//clears last 503 bytes of lcd
		"	ldad R15,503\n"	//number of bytes to clear
		"	sex 3\n"		//allow inline output
		"$$clrloop:\n"		//come back here for more
			"	out 6\n	db 00\n"	//send a 0
			"	dec R15\n"	//decrease counter
			"	glo R15\n	bnz $$clrloop\n" //back for more
			"	ghi R15\n	bnz $$clrloop\n" //til done
		"	sex 2\n"	//reset the X register to normal
		"	cretn\n");	//and we're done
}
