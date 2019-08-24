void shiftOut(unsigned char data){
	unsigned char o, temp,i;
	temp=data;
	for (i=0; i<8;i++){
		o=temp&(1<<lcddata); //isolate data bit
		OUT4(o|PIN4);  //send it out  (along with whatever was on the port before)
		o=o|(1<<lcdclk); //raise the clock signal
		OUT4(o|PIN4); //clock it out  (along with whatever was on the port before)
		temp=temp<<1;
	}
}
void LcdWrite(unsigned char dc, unsigned char payload) //flag for data vs command, byte to send out
{
	digitalWrite(lcdcmd,dc); //set data or command
	shiftOut(payload);
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
	digitalWrite(lcdclk,0); //make sure the clock signal is low before we write anything else
  	digitalWrite(lcdreset,LOW); //reset the LCD
  	digitalWrite(lcdreset,HIGH); //release the reset
  	LcdWrite(LCD_C, 0x20); //send initialization
  	LcdWrite(LCD_C, 0x0C); //					bytes
}

void LcdClear(unsigned char what)
{
  unsigned int index;
  for (index = 0; index <504; index++)
  {
    LcdWrite(LCD_D, what);
  }
}
