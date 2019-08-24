//lcd.h routines for the n5110 lcd over hardware spi
//Nov 9, remove data and clock pins
void LcdWrite(unsigned char, unsigned char); //flag for data vs command, byte to send out
void LcdWriteN(unsigned char*, unsigned int);
void gotoXY(unsigned char, unsigned char);
void LcdInitialise(void);
void LcdClear();
void LcdSet(unsigned char);
#define lcdreset 5 //lcd reset pin - was 6
#define lcdcmd   6 //lcd command/data - was 5
#define LCD_C	0	//lcd command bit is 0 for commands
#define LCD_D	1	//lcd command bit is 1 for data
#define clock8 " out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n out 2\n\ db 00\n"
