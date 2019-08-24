
/*****************************************************************************
//  File Name    : olduinoserverhspi2V51.c
//  Version      : 5.1
//  Description  : olduino web server using hardware spi version 2
//  Author       : WJR with thanks to RWB
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Adaptated    : 17 May 2013 by Bill Rowe - WJR for the olduino platform
//  Updated		 : Feb 2014 for the hardware spi interface on the olduino
*****************************************************************************/
//feb 18 2014: 	changed led on/off sequence to use q.
//				moved flush()/disconnect to end of handlesession()
//feb 19 		speed up multi-byte sends, add images
//feb 22		speed up enablewziz, reduce use of strlen
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#define putc(x) out(7,x)
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#include "wiznet.h"  //wiznet definitions
#define disablewiz()   	asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ori 0x80\n	str memaddr\n" \
  							"	sex memaddr\n	out 4\n	sex 2\n"); //high level on 7(SS) disables the w5100 from the spi bus
#define enablewiz()  asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ani 0x7f\n	str memaddr\n" \
						"	sex memaddr\n	out 4\n	sex 2\n");
#define sendlit(x) send0((unsigned char*)x,sizeof(x)-1)
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
int ledmode=0;	//0=off, 1=on
int cmdip[]={0,0,0,182}; //most recent address where a command came from
int pagehits=0;
char strbuf[16];
struct SPIsequence{
	unsigned char opcode;
	unsigned int realaddr;
	unsigned char data;
} SPINpayload;
//struct SPIsequence SPINpayload;
void p4hex(unsigned char uc[4]){
	printf("%cx-%cx%cx:%cx,",uc[0],uc[1],uc[2],uc[3]);
}
void SPI_WriteN(unsigned int offaddr,unsigned char *data, unsigned int N)
{
  //printf("\nSPI_WriteN(%x,%s,%d) ",offaddr,data,N);
  SPINpayload.opcode=WIZNET_WRITE_OPCODE; //prep for sequence of writes
  while(N>0){//for all the bytes to be transferred
  	SPINpayload.realaddr=TXBUFADDR+(offaddr&TX_BUF_MASK);
  	SPINpayload.data=*data;
  	//p4hex(&SPINpayload.opcode);
  	enablewiz();   			// Activate the CS pin
  	spiSendN(&SPINpayload.opcode,4);
  	disablewiz();				// make CS pin not active
  	offaddr++;data++;N--;
  }
}
void SPI_Write2(unsigned int addr,unsigned char data)
{
  enablewiz();   			// Activate the CS pin
  SPINpayload.opcode=WIZNET_WRITE_OPCODE; //prep for sequence of writes
  spiSend(SPINpayload.opcode);   // Send Wiznet W5100 Write OpCode
  SPINpayload.realaddr=addr;
  spiSend(SPINpayload.realaddr >>8); 		// Send Wiznet W5100 Address High Byte
  spiSend(SPINpayload.realaddr & 0x00FF);	// Send Wiznet W5100 Address Low Byte
  spiSend(data);			// Send the data byte
  disablewiz();				// make CS pin not active
}
void SPI_Write(unsigned int addr,unsigned char data)
{
  enablewiz();   			// Activate the CS pin
  spiSend(WIZNET_WRITE_OPCODE);   // Send Wiznet W5100 Write OpCode
  spiSend(addr >>8); 		// Send Wiznet W5100 Address High Byte
  spiSend(addr & 0x00FF);	// Send Wiznet W5100 Address Low Byte
  spiSend(data);			// Send the data byte
  disablewiz();				// make CS pin not active
}
unsigned char SPI_Read(unsigned int addr)
{
  unsigned char value; 	//data returned from spi transmission
  enablewiz();   		// Activate the CS pin
  spiSend(WIZNET_READ_OPCODE);   //Send Wiznet W5100 Write OpCode
  spiSend(addr >>8);	// Send Wiznet W5100 Address High Byte
  spiSend(addr & 0x00FF);  // Send Wiznet W5100 Address Low Byte
  value=spixfer(0xff);	// Send Dummy transmission to read the data
  disablewiz();			// make CS pin inactive
  return(value);
}

void W5100_Init(void){// Ethernet Setup
  unsigned char mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
  unsigned char ip_addr[] = {169,254,180,2}; //{192,168,0,182};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,0,1};
  SPI_Write(MR,0x80);   // setting bit 7 of the mode register does a software reset of the w5100
  delay(1);
  //set the wiznet gateway address register
  SPI_Write(GAR + 0,gtw_addr[0]); SPI_Write(GAR + 1,gtw_addr[1]);
  SPI_Write(GAR + 2,gtw_addr[2]); SPI_Write(GAR + 3,gtw_addr[3]);
  delay(1);
  // Set the Wiznet W5100 MAC address - Source Address Register (SAR): 0x0009 to 0x000E
  SPI_Write(SAR + 0,mac_addr[0]); SPI_Write(SAR + 1,mac_addr[1]);
  SPI_Write(SAR + 2,mac_addr[2]); SPI_Write(SAR + 3,mac_addr[3]);
  SPI_Write(SAR + 4,mac_addr[4]); SPI_Write(SAR + 5,mac_addr[5]);
  delay(1);
  // Set the Wiznet W5100 Sub Mask Address (SUBR): 0x0005 to 0x0008
  SPI_Write(SUBR + 0,sub_mask[0]); SPI_Write(SUBR + 1,sub_mask[1]);
  SPI_Write(SUBR + 2,sub_mask[2]); SPI_Write(SUBR + 3,sub_mask[3]);
  delay(1);
  // Set the Wiznet W5100 IP Address (SIPR): 0x000F to 0x0012
  SPI_Write(SIPR + 0,ip_addr[0]); SPI_Write(SIPR + 1,ip_addr[1]);
  SPI_Write(SIPR + 2,ip_addr[2]); SPI_Write(SIPR + 3,ip_addr[3]);
  delay(1);
  // Set the Wiznet W5100 RX and TX Memory Size, we use 2KB for Rx/Tx 4 channels
  SPI_Write(RMSR,0x55);
  SPI_Write(TMSR,0x55);
  printf("Done Wiznet W5100 Initialization on IP address %d.%d.%d.%d\n\n",SPI_Read(SIPR + 0),SPI_Read(SIPR + 1),SPI_Read(SIPR + 2),SPI_Read(SIPR + 3));
}

void socket0_init(){ //initialize socket 0 for http server
	SPI_Write(S0_MR,MR_TCP);	//set mode register to tcp
	SPI_Write(S0_PORT,((TCP_PORT & 0xFF00) >> 8 ));	//set tcp port to 0050
	SPI_Write(S0_PORT + 1,(TCP_PORT & 0x00FF));
	SPI_Write(S0_CR,CR_OPEN);                   // Open Socket
	delay(10);
    SPI_Write(S0_CR,CR_LISTEN);					//listen to socket
}

void disconnect0(){
   SPI_Write(S0_CR,CR_DISCON); 	//send disconnect command
   while(SPI_Read(S0_CR));		// Wait for Disconecting Process
}

void close0(){

   SPI_Write(S0_CR,CR_CLOSE);    // Send Close Command
   while(SPI_Read(S0_CR));   	// Wait until the S0_CR is clear
}

unsigned int recv0(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr;

    if (buflen <= 0) return 1;

    if (buflen > MAX_BUF)	// If the request size > MAX_BUF,just truncate it
        buflen=MAX_BUF - 2;
    ptr = SPI_Read(S0_RX_RD);     // Read the Rx Read Pointer
    offaddr = (((ptr & 0x00FF) << 8 ) + SPI_Read(S0_RX_RD + 1));
		while(buflen) {//receive individual bytes into the buffer
		  buflen--;
		  realaddr=RXBUFADDR + (offaddr & RX_BUF_MASK);
		  *buf = SPI_Read(realaddr);
		  offaddr++;
		  buf++;
		}
    *buf='\0';        // terminate string

    return 1;
}
void flush(rsize){ //flush the receive buffer
    unsigned int ptr,offaddr;
    ptr = SPI_Read(S0_RX_RD);   // Read the Rx Read Pointer
    offaddr = (((ptr & 0x00FF) << 8 ) + SPI_Read(S0_RX_RD + 1));
	offaddr+=rsize;				//how much to skip
    // Increase the S0_RX_RD value, so it point to the next receive
    SPI_Write(S0_RX_RD,(offaddr >> 8) );
    SPI_Write(S0_RX_RD + 1,(offaddr & 0x00FF));

    SPI_Write(S0_CR,CR_RECV);	// Now Send the RECV command
    delay(5);    				// Wait for Receive Process
}
unsigned int recv_size(void){
  return ((SPI_Read(S0_RX_RSR) & 0x00FF) << 8 ) + SPI_Read(S0_RX_RSR + 1);
}

unsigned int send0(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr,txsize,timeout;
	//printf("send0 %d\n",buflen);
    if (buflen <= 0) return 0;
    // Make sure the TX Free Size Register is available
    txsize=SPI_Read(SO_TX_FSR);
    txsize=(((txsize & 0x00FF) << 8 ) + SPI_Read(SO_TX_FSR + 1));
    timeout=0;
    while (txsize < buflen) {
      delay(1);
     txsize=SPI_Read(SO_TX_FSR);
     txsize=(((txsize & 0x00FF) << 8 ) + SPI_Read(SO_TX_FSR + 1));
     // Timeout for approx 1000 ms
     if (timeout++ > 1000) {
       printf("TX Free Size Error!\n");
       // Disconnect the connection
       disconnect0();
       return 0;
     }
   }

   // Read the Tx Write Pointer
   ptr = SPI_Read(S0_TX_WR);
   offaddr = (((ptr & 0x00FF) << 8 ) + SPI_Read(S0_TX_WR + 1));

	SPI_WriteN(offaddr,buf,buflen);
	offaddr+=buflen;

    // Increase the S0_TX_WR value, so it point to the next transmit
    SPI_Write(S0_TX_WR,(offaddr & 0xFF00) >> 8 );
    SPI_Write(S0_TX_WR + 1,(offaddr & 0x00FF));

    // Now Send the SEND command
    SPI_Write(S0_CR,CR_SEND);
	//printf("W\n");
    // Wait for Sending Process
    while(SPI_Read(S0_CR));
	//printf("D\n");

    return 1;
}
void sendnak(){
	printf("\nSENDNAK\n");
	send0s((unsigned char *)"HTTP/1.1 404 Not Found\r\n\r\n"); 	// Now Send the HTTP Response
}

void sendack(){
	int sendrc;
	static unsigned char ack[]="HTTP/1.0 200 OK\r\n\r\n";
	sendrc=send0(ack,strlen((char *)ack)); 	// Now Send the HTTP Response
}
int send0s(char* what){
	//printf(">>%s\n",what);
	return send0((unsigned char *)what,strlen(what));
}
void sendip(){
	sendlit("Last command from: ");
	send0s(itoa(cmdip[0],strbuf));
	sendlit(".");
	send0s(itoa(cmdip[1],strbuf));
	sendlit(".");
	send0s(itoa(cmdip[2],strbuf));
	sendlit(".");
	send0s(itoa(cmdip[3],strbuf));
	sendlit("<p>");

}
void sendform(){
	int sendrc;
	static unsigned char hdr[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body><span style=\"color:#0000A0\">\r\n"
						"<h1><center>Olduino 1802 Web Server V5.2</center></h1>\r\n";


	static unsigned char postform[]="<p><form method=\"POST\">\r\n"
	//"<strong>Temp: <input type=\"text\" name=\"temp\" size=2 value=\"26\"> "
	//"<sup>O</sup>C<p><input type=\"radio\" name=\"radio\" value=\"0\" >Blinking LED"
	//"<br><input type=\"radio\" name=\"radio\" value=\"1\" checked>Scanning LED"
	"</strong><p>\r\n"
						"<input type=\"submit\" value=\"Toggle LED\">\r\n"
						"</form>";
	static unsigned char getform[]="<p><form method=\"GET\">\r\n"
						"<input type=\"submit\" value=\"LED Status\">\r\n"
						"</form>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";

	printf(">SF\n");
	pagehits+=1;
	sendrc=send0(hdr,sizeof(hdr)-1); 	// Now Send the HTTP Response first part
	printf("0\n");
	//asm("	seq\n");
	//sendrc=send0(fill100,sizeof(fill100)-1); 	// Now Send the HTTP Response first part
	//asm("	req\n");
	//printf("F\n");
	send0s("Pages Served: "); send0s(itoa(pagehits,strbuf)); send0s("<p>");
	printf("1\n");
	if (cmdip[0]!=0)
		sendip();
	printf("2\n");
	sendrc=send0s("LED is ");
	if (ledmode==1)
		send0s("ON\r\n");
	else
		send0s("OFF\r\n");
	sendrc=send0(postform,sizeof(postform)-1); 	// Now Send the "POST" form
	sendrc=send0(getform,sizeof(getform)-1); 	// Now Send the "GET" form
	sendrc=send0(trlr,sizeof(trlr)-1); 	// Now Send the rest of the page
	printf("FS>\n");
}
int strindex(char *s,char *t)
{
  unsigned int i,n;

  n=strlen(t);
  for(i=0;*(s+i); i++) {
    if (strncmp(s+i,t,n) == 0)
      return i;
  }
  return -1;
}
void handlepost(){
	printf(" HP \n");
	if (ledmode==1){
		ledmode=0;
		asm("	req\n");
	} else {
		ledmode=1;
		asm("	seq\n");
	}
	cmdip[0]=SPI_Read(S0_DIPR + 0);cmdip[1]=SPI_Read(S0_DIPR + 1);cmdip[2]=SPI_Read(S0_DIPR + 2);cmdip[3]=SPI_Read(S0_DIPR + 3);
	sendform();
}
void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	//printf("\ngetting received size\n");
	rsize=recv_size();
	printf("**rsz=%d\n",rsize);
	if (rsize>0){
		if (recv0(buf,rsize/*min(12,rsize)*/)>0){
			buf[rsize]=0; printf("%s\n",buf);
			strncmpval=strncmp((char *)buf,"POST /",6);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				handlepost(); //handle a button press
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendnak(); //no favicon here
			}
  			else if (strncmp((char *)buf,"GET /",5)>=0){
 				sendform(); //send the form
			}
  			else{
				printf("\nmystery meat\n");
			}
		}
	}
  	if (rsize>0) flush(rsize);	//get rid of the received data
	disconnect0();	//in any case, we're done here
	printf("done\n>\n");
}

void main(void){
	int socket0status;
	//ledmode=0; digitalWrite(0,LOW); cmdip[0]=0; pagehits=0;
	delay(100);
	printf("\nOlduino Web Server v5.1\n");
    W5100_Init(); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=SPI_Read(S0_SR);
		//printf("s0s=%x ",socket0status);
		switch (socket0status){
			case SOCK_CLOSED: //initial condition
				socket0_init();	//initialize socket 0
				break;
			case SOCK_ESTABLISHED: //someone wants to talk to the server
				handlesession();
				break;
			//following are cases where we have to reset and reopen the socket
			case SOCK_FIN_WAIT: case SOCK_CLOSING: case SOCK_TIME_WAIT:
			case SOCK_CLOSE_WAIT: case SOCK_LAST_ACK:
				close0();
				break;
		}
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
