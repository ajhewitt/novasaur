
/*****************************************************************************
//  File Name    : olduinoserver.c
//  Version      : 4.2
//  Description  : olduino web server
//  Author       : WJR with thanks to RWB
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Adaptated    : 17 May 2013 by Bill Rowe - WJR for the olduino platform
*****************************************************************************/
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <fastspi.h> //fastspi header
#include "wiznet.h"  //wiznet definitions
#define disablewiz() asm("\tseq\n"); //high level on Q disables the w5100 from the spi bus
#define enablewiz()  asm("\treq\n");

#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
int ledmode=0;	//0=off, 1=on
int cmdip[]={0,0,0,182}; //most recent address where a command came from
int pagehits=0;
char strbuf[16];
void SPI_Write(unsigned int addr,unsigned char data)
{
  enablewiz();   			// Activate the CS pin
  sendwizwrt(); //was shiftoutf(WIZNET_WRITE_OPCODE);   // Send Wiznet W5100 Write OpCode
  shiftoutf(addr >>8); 		// Send Wiznet W5100 Address High Byte
  shiftoutf(addr & 0x00FF);	// Send Wiznet W5100 Address Low Byte
  shiftoutf(data);			// Send the data byte
  disablewiz();				// make CS pin not active
}
unsigned char SPI_Read(unsigned int addr)
{
  unsigned char value; 	//data returned from spi transmission
  enablewiz();   		// Activate the CS pin
  sendwizrd(); //shiftoutf(WIZNET_READ_OPCODE);   //Send Wiznet W5100 Write OpCode
  shiftoutf(addr >>8);	// Send Wiznet W5100 Address High Byte
  shiftoutf(addr & 0x00FF);  // Send Wiznet W5100 Address Low Byte
  value=shiftinf();	// Send Dummy transmission to read the data
  disablewiz();			// make CS pin inactive
  return(value);
}

void W5100_Init(void){// Ethernet Setup
  unsigned char mac_addr[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
  unsigned char ip_addr[] = {192,168,1,184};
  unsigned char sub_mask[] = {255,255,255,0};
  unsigned char gtw_addr[] = {192,168,1,1};
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

    while(buflen) {
      buflen--;
      // Calculate the real W5100 physical Tx Buffer Address
      realaddr = TXBUFADDR + (offaddr & TX_BUF_MASK);
      // Copy the application data to the W5100 Tx Buffer
      SPI_Write(realaddr,*buf);
      offaddr++;
      buf++;
    }

    // Increase the S0_TX_WR value, so it point to the next transmit
    SPI_Write(S0_TX_WR,(offaddr & 0xFF00) >> 8 );
    SPI_Write(S0_TX_WR + 1,(offaddr & 0x00FF));

    // Now Send the SEND command
    SPI_Write(S0_CR,CR_SEND);

    // Wait for Sending Process
    while(SPI_Read(S0_CR));

    return 1;
}
void sendnak(){
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
	send0s("Last command from: ");
	send0s(itoa(cmdip[0],strbuf));
	send0s(".");
	send0s(itoa(cmdip[1],strbuf));
	send0s(".");
	send0s(itoa(cmdip[2],strbuf));
	send0s(".");
	send0s(itoa(cmdip[3],strbuf));
	send0s("<p>");

}
void sendform(){
	int sendrc;
	static char hdr[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body><span style=\"color:#0000A0\">\r\n"
						"<h1><center>Olduino 1802 Web Server V4.2</center></h1>\r\n";

	static char postform[]="<p><form method=\"POST\">\r\n"
						"<input type=\"submit\" value=\"Toggle LED\">\r\n"
						"</form>";
	static char getform[]="<p><form method=\"GET\">\r\n"
						"<input type=\"submit\" value=\"LED Status\">\r\n"
						"</form>";
	static char trlr[]="</body></html>\r\n\r\n";

	//printf(">SF\n");
	pagehits+=1;
	sendrc=send0s(hdr); 	// Now Send the HTTP Response first part
	//printf("0\n");
	send0s("Pages Served: "); send0s(itoa(pagehits,strbuf)); send0s("<p>");
	//printf("1\n");
	if (cmdip[0]!=0)
		sendip();
	//printf("2\n");
	sendrc=send0s("LED is ");
	if (ledmode==1)
		send0s("ON\r\n");
	else
		send0s("OFF\r\n");
	sendrc=send0s(postform); 	// Now Send the "POST" form
	sendrc=send0s(getform); 	// Now Send the "GET" form
	sendrc=send0s(trlr); 	// Now Send the rest of the page
	//printf("FS>\n");
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
	if (ledmode==1){
		ledmode=0;
		digitalWrite(0,LOW);
	} else {
		ledmode=1;
		digitalWrite(0,HIGH);
	}
	cmdip[0]=SPI_Read(S0_DIPR + 0);cmdip[1]=SPI_Read(S0_DIPR + 1);cmdip[2]=SPI_Read(S0_DIPR + 2);cmdip[3]=SPI_Read(S0_DIPR + 3);
	sendform();
}
void handlesession(){	//handle a session once it's established
	unsigned int rsize;
	rsize=recv_size();
	//printf("rsz=%d\n<\n",rsize);
	if (rsize>0){
		if (recv0(buf,min(12,rsize))>0){
			//printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0)
  				handlepost(); //handle a button press
			else if (strncmp((char *)buf,"GET /favicon",12)==0)
  				sendnak(); //no favicon here
  			else if (strncmp((char *)buf,"GET /",5)>=0)
  				sendform(); //send the form
  			flush(rsize);	//get rid of the received data
			disconnect0();	//in any case, we're done here
		}
	}
	//printf("done\n>\n");
}

void main(void){
	int socket0status;
	//ledmode=0; digitalWrite(0,LOW); cmdip[0]=0; pagehits=0;
	delay(100);
	printf("\nOlduino Web Server v4.2\n");
    W5100_Init(); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=SPI_Read(S0_SR);
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
#include "fastspi.c"
