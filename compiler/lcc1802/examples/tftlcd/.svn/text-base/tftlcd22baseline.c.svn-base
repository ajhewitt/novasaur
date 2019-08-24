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
#define LCD_WR    4-3   //clock
#define LCD_RS    3-3   //data/mosi
#define LCD_DC    6-3   //data/command
#define LCD_REST  5-3   //RESET
#define LCD_CS    7-3   //slave select
void lcdfiller(unsigned int, unsigned char);
void LCD_Writ_Bus(unsigned char value){
  int i;
  digitalWrite(LCD_CS,LOW);
  spiSend(value);
  /*
  for(i=0;i<8;i++){
    digitalWrite(LCD_RS,(value&0x80));      //by setting mosi for each bit
    digitalWrite(LCD_WR,HIGH);              //then pulsing the clock
    digitalWrite(LCD_WR,LOW);
    value<<=1; //next bit
  }
  */
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
   printf("aset...");
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
   printf("done\n");
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
        LCD_Write_DATA(0x48);   //was 48 C8	   //48 68??//28 E8 ??

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
}


void Pant(char VL)
{
  int i,j,k;
  Address_set(0,0,240,320);
  digitalWrite(LCD_DC,HIGH);
  digitalWrite(LCD_CS,LOW);
  for(i=0;i<160;i++)
  {
  	lcdfiller(480,VL);
  }
  digitalWrite(LCD_CS,HIGH);
}

void main(){
	PIN4=0;
	LCD_Init();
	while(1){
		Pant(0xFF); //white
	  	Pant(0xE0);	//red
		Pant(0x18);	//blue
		Pant(0x07);	//green
		Pant(0xE7);	//yellow
		Pant(0x00);	//black
	}
}

#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
