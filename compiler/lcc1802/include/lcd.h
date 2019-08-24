//lcd.h routines for the n5110 lcd over spi
void shiftOut(unsigned char);
void LcdWrite(unsigned char, unsigned char); //flag for data vs command, byte to send out
void LcdWriteN(unsigned char*, unsigned char);
void gotoXY(unsigned char, unsigned char);
void LcdInitialise(void);
void LcdClear(unsigned char);
#define lcddata  7 //lcd data goes on pin 7
#define lcdreset 6 //lcd reset pin on bit 2 (active low)
#define lcdcmd   5 //lcd command/data pin on bit 1
#define lcdclk	 4 //lcd clock pin on bit 0
#define LCD_C	0	//lcd command bit is 0 for commands
#define LCD_D	1	//lcd command bit is 1 for data
