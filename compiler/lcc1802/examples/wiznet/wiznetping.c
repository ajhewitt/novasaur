/*****************************************************************************
//  File Name    : wiznetping.c
//  Version      : 1.0
//  Description  : Wiznet W5100
//  Author       : RWB
//  Target       : AVRJazz Mega168 Board
//  Compiler     : AVR-GCC 4.3.2; avr-libc 1.6.6 (WinAVR 20090313)
//  IDE          : Atmel AVR Studio 4.17
//  Programmer   : AVRJazz Mega168 STK500 v2.0 Bootloader
//               : AVR Visual Studio 4.17, STK500 programmer
//  Last Updated : 01 July 2010
*****************************************************************************/
#include <avr/io.h>
#include <string.h>
#include <stdio.h>
#include <util/delay.h>

#define BAUD_RATE 19200
// AVRJazz Mega168/328 SPI I/O
#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define SPI_CS   PORTB2
// Wiznet W5100 Op Code
#define WIZNET_WRITE_OPCODE 0xF0
#define WIZNET_READ_OPCODE 0x0F
// Wiznet W5100 Register Addresses
#define MR   0x0000   // Mode Register
#define GAR  0x0001   // Gateway Address: 0x0001 to 0x0004
#define SUBR 0x0005   // Subnet mask Address: 0x0005 to 0x0008
#define SAR  0x0009   // Source Hardware Address (MAC): 0x0009 to 0x000E
#define SIPR 0x000F   // Source IP Address: 0x000F to 0x0012
#define RMSR 0x001A   // RX Memory Size Register
#define TMSR 0x001B   // TX Memory Size Register
void uart_init(void)
{
  UBRR0H = (((F_CPU/BAUD_RATE)/16)-1)>>8;	// set baud rate
  UBRR0L = (((F_CPU/BAUD_RATE)/16)-1);
  UCSR0B = (1<<RXEN0)|(1<<TXEN0); 		// enable Rx & Tx
  UCSR0C=  (1<<UCSZ01)|(1<<UCSZ00);  	       // config USART; 8N1
}
void uart_flush(void)
{
  unsigned char dummy;
  while (UCSR0A & (1<<RXC0)) dummy = UDR0;
}
int uart_putch(char ch,FILE *stream)
{
   if (ch == '\n')
    uart_putch('\r', stream);
   while (!(UCSR0A & (1<<UDRE0)));
   UDR0=ch;
   return 0;
}
int uart_getch(FILE *stream)
{
   unsigned char ch;
   while (!(UCSR0A & (1<<RXC0)));
   ch=UDR0;  

   /* Echo the Output Back to terminal */
   uart_putch(ch,stream);       

   return ch;
}
void ansi_cl(void)
{
  // ANSI clear screen: cl=\E[H\E[J
  putchar(27);
  putchar('[');
  putchar('H');
  putchar(27);
  putchar('[');
  putchar('J');
}
void ansi_me(void)
{
  // ANSI turn off all attribute: me=\E[0m
  putchar(27);
  putchar('[');
  putchar('0');
  putchar('m');
}
void SPI_Write(unsigned int addr,unsigned char data)
{
  // Activate the CS pin
  SPI_PORT &= ~(1<<SPI_CS);
  // Start Wiznet W5100 Write OpCode transmission
  SPDR = WIZNET_WRITE_OPCODE;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));
  // Start Wiznet W5100 Address High Bytes transmission
  SPDR = (addr & 0xFF00) >> 8;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));
  // Start Wiznet W5100 Address Low Bytes transmission
  SPDR = addr & 0x00FF;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));   

  // Start Data transmission
  SPDR = data;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));
  // CS pin is not active
  SPI_PORT |= (1<<SPI_CS);
}
unsigned char SPI_Read(unsigned int addr)
{
  // Activate the CS pin
  SPI_PORT &= ~(1<<SPI_CS);
  // Start Wiznet W5100 Read OpCode transmission
  SPDR = WIZNET_READ_OPCODE;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));
  // Start Wiznet W5100 Address High Bytes transmission
  SPDR = (addr & 0xFF00) >> 8;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));
  // Start Wiznet W5100 Address Low Bytes transmission
  SPDR = addr & 0x00FF;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));   

  // Send Dummy transmission for reading the data
  SPDR = 0x00;
  // Wait for transmission complete
  while(!(SPSR & (1<<SPIF)));  

  // CS pin is not active
  SPI_PORT |= (1<<SPI_CS);
  return(SPDR);
}
void W5100_Init(void)
{
  // Ethernet Setup
  unsigned char mac_addr[] = {0x00,0x16,0x36,0xDE,0x58,0xF6};
  unsigned char ip_addr[] = {192,168,2,10};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,2,1};
  // Setting the Wiznet W5100 Mode Register: 0x0000
  SPI_Write(MR,0x80);            // MR = 0b10000000;
  _delay_ms(1);
  printf("Reading MR: %d\n\n",SPI_Read(MR));
  // Setting the Wiznet W5100 Gateway Address (GAR): 0x0001 to 0x0004
  printf("Setting Gateway Address %d.%d.%d.%d\n",gtw_addr[0],gtw_addr[1],\
          gtw_addr[2],gtw_addr[3]);
  SPI_Write(GAR + 0,gtw_addr[0]);
  SPI_Write(GAR + 1,gtw_addr[1]);
  SPI_Write(GAR + 2,gtw_addr[2]);
  SPI_Write(GAR + 3,gtw_addr[3]);
  _delay_ms(1);
  printf("Reading GAR: %d.%d.%d.%d\n\n",SPI_Read(GAR + 0),SPI_Read(GAR + 1),\
          SPI_Read(GAR + 2),SPI_Read(GAR + 3));
  // Setting the Wiznet W5100 Source Address Register (SAR): 0x0009 to 0x000E
  printf("Setting Source Address %.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n",mac_addr[0],mac_addr[1],\
          mac_addr[2],mac_addr[3],mac_addr[4],mac_addr[5]);
  SPI_Write(SAR + 0,mac_addr[0]);
  SPI_Write(SAR + 1,mac_addr[1]);
  SPI_Write(SAR + 2,mac_addr[2]);
  SPI_Write(SAR + 3,mac_addr[3]);
  SPI_Write(SAR + 4,mac_addr[4]);
  SPI_Write(SAR + 5,mac_addr[5]);
  _delay_ms(1);
  printf("Reading SAR: %.2x:%.2x:%.2x:%.2x:%.2x:%.2x\n\n",SPI_Read(SAR + 0),SPI_Read(SAR + 1),\
          SPI_Read(SAR + 2),SPI_Read(SAR + 3),SPI_Read(SAR + 4),SPI_Read(SAR + 5));
  // Setting the Wiznet W5100 Sub Mask Address (SUBR): 0x0005 to 0x0008
  printf("Setting Sub Mask Address %d.%d.%d.%d\n",sub_mask[0],sub_mask[1],\
          sub_mask[2],sub_mask[3]);
  SPI_Write(SUBR + 0,sub_mask[0]);
  SPI_Write(SUBR + 1,sub_mask[1]);
  SPI_Write(SUBR + 2,sub_mask[2]);
  SPI_Write(SUBR + 3,sub_mask[3]);
  _delay_ms(1);
  printf("Reading SUBR: %d.%d.%d.%d\n\n",SPI_Read(SUBR + 0),SPI_Read(SUBR + 1),\
          SPI_Read(SUBR + 2),SPI_Read(SUBR + 3));
  // Setting the Wiznet W5100 IP Address (SIPR): 0x000F to 0x0012
  printf("Setting IP Address %d.%d.%d.%d\n",ip_addr[0],ip_addr[1],\
          ip_addr[2],ip_addr[3]);
  SPI_Write(SIPR + 0,ip_addr[0]);
  SPI_Write(SIPR + 1,ip_addr[1]);
  SPI_Write(SIPR + 2,ip_addr[2]);
  SPI_Write(SIPR + 3,ip_addr[3]);
  _delay_ms(1);
  printf("Reading SIPR: %d.%d.%d.%d\n\n",SPI_Read(SIPR + 0),SPI_Read(SIPR + 1),\
          SPI_Read(SIPR + 2),SPI_Read(SIPR + 3));

  // Setting the Wiznet W5100 RX and TX Memory Size, we use 2KB for Rx/Tx 4 channels
  printf("Setting Wiznet RMSR and TMSR\n\n");
  SPI_Write(RMSR,0x55);
  SPI_Write(TMSR,0x55);
  printf("Done Wiznet W5100 Initialized!\n");
}
// Assign I/O stream to UART
FILE uart_str = FDEV_SETUP_STREAM(uart_putch, uart_getch, _FDEV_SETUP_RW);
int main(void){
  // Set the PORTD as Output:
  DDRD=0xFF;
  PORTD=0x00;
   // Define Output/Input Stream
  stdout = stdin = &uart_str;
  // Initial UART Peripheral
  uart_init();
  // Clear Screen
  ansi_me();
  ansi_cl();
  ansi_me();
  ansi_cl();
  uart_flush();
  // Initial the AVR ATMega168/328 SPI Peripheral
  // Set MOSI (PORTB3),SCK (PORTB5) and PORTB2 (SS) as output, others as input
  SPI_DDR = (1<<PORTB3)|(1<<PORTB5)|(1<<PORTB2);
  // CS pin is not active
  SPI_PORT |= (1<<SPI_CS);
  // Enable SPI, Master Mode 0, set the clock rate fck/2
  SPCR = (1<<SPE)|(1<<MSTR);
  SPSR |= (1<<SPI2X);
  // Initial the Wiznet W5100
  printf("Wiznet W5100 Init\n\n");
  W5100_Init();
  // Loop forever
  for(;;){
  }
  return 0;
}
/* EOF: wiznetping.c */
