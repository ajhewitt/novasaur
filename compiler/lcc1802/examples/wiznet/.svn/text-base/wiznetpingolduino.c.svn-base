
/*****************************************************************************
//  File Name    : wiznetping.c
//  Version      : 1.0
//  Description  : Wiznet W5100
//  Author       : RWB
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : Atmel AVR Studio 4.17
//  Programmer   : Olduino bootloader via avrdude
//  Adaptation   : 17 May 2013 by Bill Rowe - WJR
*****************************************************************************/
#include <nstdlib.h>
#include <olduino.h>

// Wiznet W5100 Op Code
#define WIZNET_WRITE_OPCODE 0xF0
#define WIZNET_READ_OPCODE 0x0F
// Wiznet W5100 Register Addresses
#define MR   0x0000   // Mode Register
#define GAR  0x0001   // Gateway Address: 0x0001 to 0x0004
#define SUBR 0x0005   // Subnet mask Address: 0x0005 to 0x0008
#define SAR  0x0009   // Source Hardware Address (MAC): 0x0009 to 0x000E
#define SIPR 0x000F   // Source IP Address: 0x000F to 0x0012
#define RTR  0x0017   //Retry Timeout Register
#define RMSR 0x001A   // RX Memory Size Register
#define TMSR 0x001B   // TX Memory Size Register
//olduino definitions for spi constants follow
#define oldsck 5
#define oldmiso 15	//really ef3
#define oldmosi 7
#define oldss 4	//slave select for the ethernet adapter
//arduino defines for spi constants (have to use same pins as hardware because shield is plugged in dirrectly)
//#define ardsck 13
//#define ardmiso 12
//#define ardmosi 11
//#define ardss 10	//slave select for the ethernet adapter
void enablechip () { //pull cs low
  //digitalWrite(sck,LOW); //make sure the clock is low
  //asm("	req	;0 on Q activates ethernet chip\n"); //digitalWrite(encss,LOW); //activate the chip select
  digitalWrite(oldss,LOW);
}

 void disablechip () {
  //asm("	seq	;1 on Q de-activates ethernet chip\n"); //digitalWrite(encss,HIGH); //deactivate the chip select
  digitalWrite(oldss,HIGH);
}


unsigned char xferspi(unsigned char value){
  int i;
  for(i=0;i<8;i++){
    digitalWrite(oldmosi,(value&0x80));      //by setting mosi for each bit
    value=(value<<1)|digitalRead(oldmiso);;
    digitalWrite(oldsck,HIGH);              //then pulsing the clock
    digitalWrite(oldsck,LOW);
  }
  return value;
}


void SPI_Write(unsigned int addr,unsigned char data)
{
  unsigned char value;
  // Activate the CS pin
  enablechip();
  // Start Wiznet W5100 Write OpCode transmission
  value=xferspi(WIZNET_WRITE_OPCODE);
  // Start Wiznet W5100 Address High Bytes transmission
  value=xferspi((addr & 0xFF00)>>8);
  // Start Wiznet W5100 Address Low Bytes transmission
  value=xferspi(addr & 0x00FF);
  // Start Data transmission
  value=xferspi(data);
  // make CS pin not active
  disablechip();
}
unsigned char SPI_Read(unsigned int addr)
{
  unsigned char value; //data returned from spi transmission
  // Activate the CS pin
  enablechip();
  // Start Wiznet W5100 Read OpCode transmission
  value=xferspi(WIZNET_READ_OPCODE);
  // Start Wiznet W5100 Address High Bytes transmission
  value=xferspi((addr & 0xFF00)>>8);
  // Start Wiznet W5100 Address Low Bytes transmission
  value=xferspi(addr & 0x00FF);

  // Send Dummy transmission for reading the data
  value=xferspi(0x00);

  // deactivate cs pin
  disablechip();
  return(value);
}
void W5100_Init(void)
{
  // Ethernet Setup
  unsigned char mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
  //was 0x00,0x16,0x36,0xDE,0x58,0xF6};
  unsigned char ip_addr[] = {192,168,1,179};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,1,1};
  // Setting the Wiznet W5100 Mode Register: 0x0000
  SPI_Write(MR,0x80);            // MR = 0b10000000;
  delay(1);
  //SPI_Write(RTR,7);            // default is 7;
  delay(1);
  printf("Reading MR: %d\n",SPI_Read(MR));
  printf("Reading RTR: %d\n",(SPI_Read(RTR)<<8)+SPI_Read(RTR+1));

  printf("Setting Gateway Address %d.%d.%d.%d\n",gtw_addr[0],gtw_addr[1],
  gtw_addr[2],gtw_addr[3]);
  SPI_Write(GAR + 0,gtw_addr[0]);
  SPI_Write(GAR + 1,gtw_addr[1]);
  SPI_Write(GAR + 2,gtw_addr[2]);
  SPI_Write(GAR + 3,gtw_addr[3]);
  delay(1);
  printf("Reading GAR: %d.%d.%d.%d\n\n",SPI_Read(GAR + 0),SPI_Read(GAR + 1),
          SPI_Read(GAR + 2),SPI_Read(GAR + 3));
  // Setting the Wiznet W5100 Source Address Register (SAR): 0x0009 to 0x000E
  printf("Setting Source Address %x:%x:%x:%x:%x:%x\n",mac_addr[0],mac_addr[1],
          mac_addr[2],mac_addr[3],mac_addr[4],mac_addr[5]);
  SPI_Write(SAR + 0,mac_addr[0]);
  SPI_Write(SAR + 1,mac_addr[1]);
  SPI_Write(SAR + 2,mac_addr[2]);
  SPI_Write(SAR + 3,mac_addr[3]);
  SPI_Write(SAR + 4,mac_addr[4]);
  SPI_Write(SAR + 5,mac_addr[5]);
  delay(1);
  printf("Reading SAR: %x:%x:%x:%x:%x:%x\n\n",SPI_Read(SAR + 0),SPI_Read(SAR + 1),
          SPI_Read(SAR + 2),SPI_Read(SAR + 3),SPI_Read(SAR + 4),SPI_Read(SAR + 5));
  // Setting the Wiznet W5100 Sub Mask Address (SUBR): 0x0005 to 0x0008
  printf("Setting Sub Mask Address %d.%d.%d.%d\n",sub_mask[0],sub_mask[1],
          sub_mask[2],sub_mask[3]);
  SPI_Write(SUBR + 0,sub_mask[0]);
  SPI_Write(SUBR + 1,sub_mask[1]);
  SPI_Write(SUBR + 2,sub_mask[2]);
  SPI_Write(SUBR + 3,sub_mask[3]);
  delay(1);
  printf("Reading SUBR: %d.%d.%d.%d\n\n",SPI_Read(SUBR + 0),SPI_Read(SUBR + 1),
          SPI_Read(SUBR + 2),SPI_Read(SUBR + 3));
  // Setting the Wiznet W5100 IP Address (SIPR): 0x000F to 0x0012
  printf("Setting IP Address %d.%d.%d.%d\n",ip_addr[0],ip_addr[1],
          ip_addr[2],ip_addr[3]);
  SPI_Write(SIPR + 0,ip_addr[0]);
  SPI_Write(SIPR + 1,ip_addr[1]);
  SPI_Write(SIPR + 2,ip_addr[2]);
  SPI_Write(SIPR + 3,ip_addr[3]);
  delay(1);
  printf("Reading SIPR: %d.%d.%d.%d\n\n",SPI_Read(SIPR + 0),SPI_Read(SIPR + 1),
          SPI_Read(SIPR + 2),SPI_Read(SIPR + 3));

  // Setting the Wiznet W5100 RX and TX Memory Size, we use 2KB for Rx/Tx 4 channels
  printf("Setting Wiznet RMSR and TMSR\n\n");
  SPI_Write(RMSR,0x55);
  SPI_Write(TMSR,0x55);

  printf("Done Wiznet W5100 Initialization!\n");
}

void setup(){
  printf("Wiznet 5100 pingmastery begins here!\n");

  printf("Wiznet 5100 initialization\n");
        W5100_Init();

}
void loop(){

}

void main(void){
	printf("miso is %d\n",digitalRead(oldmiso));

	setup();
	printf("loop..");
	delay(1000);
  // Loop forever
  for(;;){
	  loop();
  }

}

/* EOF: wiznetping.c */
#include <olduino.c>
#include <nstdlib.c>