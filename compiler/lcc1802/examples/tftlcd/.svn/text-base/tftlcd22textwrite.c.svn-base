/*==========================================================================
Test program for ElecFreaks TFT01-2.2SP, which use SPI serial port and 240x320 pixel.
The driver is ILI9341.

Bill Rowe February/March 2014
==========================================================================*/
#include <olduino.h>
#include <nstdlib.h>
#define putc(x) out(7,x)
#include <hspi2.h>
#include <fastdw.h>
//#define fastdwon(bit) digitalWrite(bit,HIGH)
//#define fastdwoff(bit) digitalWrite(bit,LOW)
#include "smallfont.h"
#define LCD_DC    6-3   //data/command
#define LCD_REST  5-3   //RESET
#define LCD_CS    7-3   //slave select
void lcdfiller(unsigned int, unsigned char);
void fontcol(unsigned char);
void fontcel(unsigned char*);
unsigned int txtcol=0; txtrow=0; //initial row&column for text

void LCD_Writ_Bus(unsigned char value){
  fastdwoff(LCD_CS); //digitalWrite(LCD_CS,LOW);
  spiSend(value);
  fastdwon(LCD_CS);	//digitalWrite(LCD_CS,HIGH);
}

void LCD_Write_COM(char VL)
{
  fastdwoff(LCD_DC);	//digitalWrite(LCD_DC,LOW);
  LCD_Writ_Bus(VL);
}

void LCD_Write_DATA(char VL)
{
  fastdwon(LCD_DC);	//digitalWrite(LCD_DC,HIGH);
  LCD_Writ_Bus(VL);
}
void Address_set(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2)
{
   unsigned int params[2]; //address parameters to be sent
   //printf("aset...%d,%d,%d,%d...",x1,y1,x2,y2);
   fastdwoff(LCD_CS); //select LCD
   fastdwoff(LCD_DC); //turn data bit off for command
   spisend(0x2a); //LCD_Write_COM(0x2a);
   params[0]=x1; params[1]=x2;
   fastdwon(LCD_DC); //turn data bit on
   spisendN((unsigned char *) params,4);
   fastdwoff(LCD_DC); //turn data bit off for command
   spisend(0x2b);	//LCD_Write_COM(0x2b);
   params[0]=y1; params[1]=y2;
   fastdwon(LCD_DC); //turn data bit on
   spisendN((unsigned char *) params,4);
   fastdwoff(LCD_DC); //turn data bit off for command
   spisend(0x2c); //send the "Write Memory Start" command
   fastdwon(LCD_CS); //de-select LCD
}


void LCD_Init(void)
{
    digitalWrite(LCD_REST,LOW);
	delay(10);
    digitalWrite(LCD_REST,HIGH);
        LCD_Write_COM(0xCB);
        LCD_Write_DATA(0x39);
        LCD_Write_DATA(0x2C);
        LCD_Write_DATA(0x00);
        LCD_Write_DATA(0x34);
        LCD_Write_DATA(0x02);

        LCD_Write_COM(0xCF);
        LCD_Write_DATA(0x00);
        LCD_Write_DATA(0XC1);
        LCD_Write_DATA(0X30);

        LCD_Write_COM(0xE8);
        LCD_Write_DATA(0x85);
        LCD_Write_DATA(0x00);
        LCD_Write_DATA(0x78);

        LCD_Write_COM(0xEA);
        LCD_Write_DATA(0x00);
        LCD_Write_DATA(0x00);

        LCD_Write_COM(0xED);
        LCD_Write_DATA(0x64);
        LCD_Write_DATA(0x03);
        LCD_Write_DATA(0X12);
        LCD_Write_DATA(0X81);

        LCD_Write_COM(0xF7);
        LCD_Write_DATA(0x20);

        LCD_Write_COM(0xC0);    //Power control
        LCD_Write_DATA(0x23);   //VRH[5:0]

        LCD_Write_COM(0xC1);    //Power control
        LCD_Write_DATA(0x10);   //SAP[2:0];BT[3:0]

        LCD_Write_COM(0xC5);    //VCM control
        LCD_Write_DATA(0x3e);   //Contrast
        LCD_Write_DATA(0x28);

        LCD_Write_COM(0xC7);    //VCM control2
        LCD_Write_DATA(0x86);   //--

        LCD_Write_COM(0x36);    // Memory Access Control
        LCD_Write_DATA(0xE8);   //was 48 //C8=Y=L->R, X=T->B	   //48 68??//28 E8 ??
        						//E8 is X=Left->Right 0-319, Y=Top->Bottom 0-239

        LCD_Write_COM(0x3A);
        LCD_Write_DATA(0x55);

        LCD_Write_COM(0xB1);
        LCD_Write_DATA(0x00);
        LCD_Write_DATA(0x18);

        LCD_Write_COM(0xB6);    // Display Function Control
        LCD_Write_DATA(0x08);
        LCD_Write_DATA(0x82);
        LCD_Write_DATA(0x27);
        LCD_Write_COM(0x11);    //Exit Sleep
        delay(120);

        LCD_Write_COM(0x29);    //Display on
        LCD_Write_COM(0x2c);
printf("init done\n");
}

void hwspilcdasm(){ //asm routines for hardware spi lcd
	asm("	align 16\n"		//make sure lcdclearer jumps will fit on page
		"_lcdfiller:\n" 	//fills R12 cells(2 bytes each) of lcd with R13.0
		"$$clrloop:\n"		//come back here for more
			"	dec 2\n	glo 13\n	str 2\n	out 6\n"	//send a fill byte
			"	dec 2\n	out 6\n"	//send a fill byte again
			"	dec R12\n"	//decrease counter
			"	glo R12\n	bnz $$clrloop\n" //back for more
			"	ghi R12\n	bnz $$clrloop\n" //til done
		"	cretn\n");	//and we're done
	asm("	align 16\n"		//make sure lcdclearer jumps will fit on page
		"_lcdclearer:\n" 	//fills full lcd with 0's
			"	ldaD R8,240*320/4\n" //#cells  /4
			"	ldi 0\n	dec 2\n	str 2\n" //set up the work area
			"	cpy2 R9,2\n	sex 9\n"	//point a temp reg at it and make that X
		"$$clrloop:\n"		//come back here for more
			"	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n	out 6\n	dec 9\n"	//send 8 0's
			"	dec R8\n"	//decrease counter
			"	glo R8\n	bnz $$clrloop\n" //back for more
			"	ghi R8\n	bnz $$clrloop\n" //til done
			"	inc R2\n"	//release work area
		"	cretn\n");	//and we're done
	asm("	align 64\n"

		"_fontcel:\n"			//fontcel(* byte) sends twelve rows of an 8 bit bitmapped font
			"	sex 3\n"		//for inline output
			"	ldi 12\n	plo 9\n" //row count
			"$$nextbyte:\n"
			"	lda 12\n	plo 10\n"		//next byte to be serialized
			"	ldi 8\n		plo 8\n" //bit count
			"$$nextbit:\n"
			"	glo 10\n"		//byte to be seriallized
			"	shl\n	plo 10\n	bdf $$sendbit\n"
			"	out 6\n	db 000\n	sex 3\n	out 6\n	db 000\n"	//darken it
			"	br $$testcount\n"	//see if we're done
			"$$sendbit:\n"
			"	out 6\n	db 255\n	sex 3\n	out 6\n	db 255\n"	//light it up
			"$$testcount:\n"	//see if we're done
			"	dec 8\n	glo 8\n	bnz $$nextbit\n"	//done the bits?
			"	dec 9\n	glo 9\n	bnz $$nextbyte\n"	//done the bytes?
			"	sex 2\n"		//restore normal x reg before exit
			"	cretn\n");
}


void gnewline(){
  txtcol=0;
  txtrow++;
  if (txtrow>29){
	  txtrow=0;
  }
}
void gpchar(unsigned char c){
  unsigned char* whichcell=SmallFont+4+(c-' ')*12;
  //printf("fontcell begins at at %x\n",whichcell);
  asm("	seq\n");
  Address_set(txtcol*8,txtrow*12,txtcol*8+7,txtrow*12+11);
  fastdwon(LCD_DC);//digitalWrite(LCD_DC,HIGH);
  fastdwoff(LCD_CS);//digitalWrite(LCD_CS,LOW);
  fontcel(whichcell); //fontcell(c);
  fastdwon(LCD_CS);//digitalWrite(LCD_CS,HIGH);
  txtcol++;
  if (txtcol>39){
	  txtcol=0;
	  txtrow++;
	  if (txtrow>29){
		  txtrow=0;
	  }
}
  asm("	req\n");
}
void gpstr(unsigned char * str){
	while(*str){
		gpchar(*str++);

	}
}
void LCD_Clear(){
  Address_set(0,0,319,239);
  fastdwon(LCD_DC);//sending data
  fastdwoff(LCD_CS); //select the LCD
  lcdclearer();
  fastdwon(LCD_CS);
  txtrow=0; txtcol=0;
}


void main(){
	PIN4=0;
	LCD_Init();
	LCD_Clear();
  	gpstr((unsigned char *)"   __ __         __            ___      ");
  	//gnewline();
  	gpstr((unsigned char *)"  / // /__ _____/ /__  ___ _  / _ \\_    ");
  	//gnewline();
  	gpstr((unsigned char *)" / _  / _ `/ __/  \'_/ / _ `/ / // / _ `/");//" // /");
  	//gnewline();
  	gpstr((unsigned char *)"/_//_/\\_,_/\\__/_/\\_\\  \\_,_/ /____/\\_,_/\\");//"_, / ");
  	//gnewline();
  	gpstr((unsigned char *)"retro edition                         /_");//"__/ ");
  	//gnewline();
	while(1);
}

#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
