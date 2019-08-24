/*==========================================================================
The LCD connection is the same as Nokia LCD5110 and  is a“8 Bit Pant Demo“

Just for ElecFreaks TFT01-2.2SP, which use SPI serial port and 240x320 pixel.
The driver is ILI9341.

by Elecfreaks
==========================================================================*/
#include <olduino.h>
#include <nstdlib.h>
#define putc(x) out(7,x)
#include <hspi2.h>
//#include "starmap.h"
#include "smallfont.h"
#define LCD_WR    4-3   //clock
#define LCD_RS    3-3   //data/mosi
#define LCD_DC    6-3   //data/command
#define LCD_REST  5-3   //RESET
#define LCD_CS    7-3   //slave select
void lcdfiller(unsigned int, unsigned char);
void lcdstamper(unsigned int, unsigned char*);
void fontcol(unsigned char);
unsigned int txtcol=0; txtrow=0; //initial row&column for text
unsigned char A[80]={
					255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
					255,255,0,0,0,0,0,0,255,255,0,0,0,0,0,0,
					255,255,0,0,0,0,0,0,255,255,0,0,0,0,0,0,
					255,255,0,0,0,0,0,0,255,255,0,0,0,0,0,0,
					255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255
					};
unsigned int rand(unsigned int limit){
	static seed=7;
	seed=(seed*7)%101;
	return(seed-1)%limit+1;
}

void LCD_Writ_Bus(unsigned char value){
  digitalWrite(LCD_CS,LOW);
  spiSend(value);
  digitalWrite(LCD_CS,HIGH);
}

void LCD_Write_COM(char VL)
{
  digitalWrite(LCD_DC,LOW);
  LCD_Writ_Bus(VL);
}

void LCD_Write_DATA(char VL)
{
  digitalWrite(LCD_DC,HIGH);
  LCD_Writ_Bus(VL);
}

void Address_set(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2)
{
   //printf("aset...%d,%d,%d,%d...",x1,y1,x2,y2);
   LCD_Write_COM(0x2a);
   LCD_Write_DATA(x1>>8);
   LCD_Write_DATA(x1);
   LCD_Write_DATA(x2>>8);
   LCD_Write_DATA(x2);

   LCD_Write_COM(0x2b);
   LCD_Write_DATA(y1>>8);
   LCD_Write_DATA(y1);
   LCD_Write_DATA(y2>>8);
   LCD_Write_DATA(y2);

   LCD_Write_COM(0x2C);
   //printf("done\n");
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
		"_lcdfiller:\n" 	//fills R12 bytes of lcd with R13.0
		"$$clrloop:\n"		//come back here for more
			"	dec 2\n	glo 13\n	str 2\n	out 6\n"	//send a fill byte
			"	dec R12\n"	//decrease counter
			"	glo R12\n	bnz $$clrloop\n" //back for more
			"	ghi R12\n	bnz $$clrloop\n" //til done
		"	cretn\n");	//and we're done
	asm("	align 16\n"		//make sure lcdstamp jumps will fit on page
		"_lcdstamper:\n" 	//fills R12 bytes of lcd with R13%(doubled)
		"	sex 13\n"	//temporary x reg
		"$$stmploop:\n"		//come back here for more
			"	out 6\n"	//send a fill byte
			"	dec 13\n	out 6\n" //send it again
			"	dec R12\n"	//decrease counter
			"	glo R12\n	bnz $$stmploop\n" //back for more
			"	ghi R12\n	bnz $$stmploop\n" //til done
		"	cretn\n");	//and we're done
	asm("	align 16\n"
		"_fontcol:\n"			//fontcol(byte) sends one column of an 8 bit bitmapped font
			"	sex 3\n"		//for inline output
			"	ldi 8\n	plo 8\n" //bit count
			"$$nextbit:\n"
			"	glo 12\n"		//byte to be seriallized
			"	shl\n	plo 12\n	bdf $$sendbit\n"
			"	out 6\n	db 000\n	sex 3\n	out 6\n	db 000\n"	//darken it
			"	br $$testcount\n"	//see if we're done
			"$$sendbit:\n"
			"	out 6\n	db 255\n	sex 3\n	out 6\n	db 255\n"	//light it up
			"$$testcount:\n"	//see if we're done
			"	dec 8\n	glo 8\n	bnz $$nextbit\n"
			"	sex 2\n"		//restore normal x reg before exit
			"	cretn\n");
}


void Pant(char VL)
{
  Address_set(0,0,80,160);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  lcdfiller(160*80,VL);
  digitalWrite(LCD_CS,HIGH);
}
void paintpart(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2,char VL)
{
  printf("paintpart(%d,%d,%d,%d,%d)\n",x1,y2,x2,y2,VL);
  Address_set(x1,y1,x2,y2);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  lcdfiller((x2-x1)*(y2-y1)*2,VL);
  digitalWrite(LCD_CS,HIGH);
}
void stampart(unsigned int x1,unsigned int y1,unsigned int x2,unsigned int y2,unsigned char * stamp)
{
  printf("stampart(%d,%d,%d,%d,%x)\n",x1,y2,x2,y2,stamp);
  Address_set(x1,y1,x2,y2);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  lcdstamper((x2-x1)*(y2-y1),stamp);
  digitalWrite(LCD_CS,HIGH);
}
void fontcell(unsigned char c){
	unsigned int i;
  unsigned char * font=SmallFont+4+(c-' ')*12;
  for (i=12;i!=0; i--){
	  fontcol(* font++);
  }
}
void gpchar(unsigned char c){
/*
	  Address_set(0,0,7,15);
	  digitalWrite(LCD_DC,HIGH);
	  digitalWrite(LCD_CS,LOW);
	  fontcell('!');
	  digitalWrite(LCD_CS,HIGH);
*/
  asm("	seq\n");
  Address_set(txtcol*8,txtrow*16,txtcol*8+7,txtrow*16+15);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  fontcell(c);
  digitalWrite(LCD_CS,HIGH);
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
void main(){
	unsigned int x,y,r;
	unsigned int qx[]={0,60,120,180};  //screen quadrants
	unsigned int qy[]={0,80,160,240};
	unsigned char clr[]={0xff,0xE0,0x18,0xE7};//white, red, blue, yellow
	PIN4=0;
	LCD_Init();
			//R,C,R,C
			printf("A\n");
  	gpchar('A');
  	gpchar('B');
  	gpchar('C');
  	gpchar('D');
  	gpchar('E');
  	gpchar('F');
  	gpchar('G');
  	gpchar('H');
  	gpchar('I');
  	gpchar('J');
			printf("J\n");
	while(1);
/*
  Address_set(0,0,7,15);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  fontcell('!');
  digitalWrite(LCD_CS,HIGH);
  Address_set(8,0,15,15);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  fontcell('A');
  digitalWrite(LCD_CS,HIGH);
  Address_set(16,0,23,15);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  fontcell('B');
  digitalWrite(LCD_CS,HIGH);
  while(1);
*/
  //fontcol(0x00);fontcol(0x00);fontcol(0x20);fontcol(0x20);fontcol(0x20);fontcol(0x20);fontcol(0x20);fontcol(0x20);fontcol(0x00);fontcol(0x20);fontcol(0x00);fontcol(0x00); // !
  //fontcol(0xFF);fontcol(0x88);fontcol(0x88);fontcol(0x88);fontcol(0xFF);
  //lcdfiller(420,255);
  //SPIsendN(A,80);
  //fontcol(0xFF);fontcol(0x88);fontcol(0x88);fontcol(0x88);fontcol(0xFF);
  //fontcol(SmallFont[4+('!'-' ')*12+1]);fontcol(SmallFont[4+('!'-' ')*12+2]);fontcol(SmallFont[4+('!'-' ')*12+2]);fontcol(SmallFont[4+('!'-' ')*12+3]);fontcol(SmallFont[4+('!'-' ')*12+4]);
  Address_set(0,6,7,10);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  SPIsendN(A,80);
  digitalWrite(LCD_CS,HIGH);
  while(1);

	while(1){
		//r=rand(4);
		//x=qx[r-1];y=qy[r-1];
		x=qx[(rand(4)-1)];y=qy[(rand(4)-1)];
		//stampart(x,y,x+15,y+15,starmap);
		paintpart(x,y,x+60,y+80,clr[rand(4)-1]);
		/*
		Pant(0xFF);
	  	Pant(0xF0);
		Pant(0xE0);
		Pant(0x05);
		Pant(0x1F);
		Pant(0x00);
		*/
	}
}

#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
