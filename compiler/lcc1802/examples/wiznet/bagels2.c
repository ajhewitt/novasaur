
/*****************************************************************************
//  File Name    : bagels1.c
//  Version      : 5.1
//  Description  : olduino bagels game
//  Author       : WJR with thanks to RWB, Jesse N. Richardson and others
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Adaptated    : July 2014 by Bill Rowe - WJR for the olduino platform
*****************************************************************************/
//14-07-17 bagels2.c converting to sendlit sendconst
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
#define sendconst(x) send0((unsigned char*)x,sizeof(x)-1)
#define MAX_BUF 512
#define TABLE 1	//used to tell senform to display the table
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
int ledmode=0;	//0=off, 1=on
union IPaddr{
	long l;
	unsigned char c[4];
};
#define numslots 32 //how many ip address slots i have
unsigned int nextslot=0; //what is the next one to use
union IPaddr regip[numslots]={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,
							  17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32};//the ips i have registered
union IPaddr cmdip={182};
char cmdname[16];
union IPaddr thisip={182}; //the ip that a form/request came from
unsigned char regname[32][16]={0}; //registered name/country
int pagehits=0;
char strbuf[16];
unsigned char secret[4]="145";
unsigned char guess [4]={0};
struct SPIsequence{
	unsigned char opcode;
	unsigned int realaddr;
	unsigned char data;
} SPINpayload;
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
  unsigned char ip_addr[] = {169,254,180,2}; //{192,168,0,182}; //
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
//send0 may be taking a very long time to send single characters.
unsigned int send0(unsigned char *buf,unsigned int buflen){
    unsigned int ptr,offaddr,realaddr,txsize,timeout;
	printf("send0 %d\n",buflen);
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
	sendlit((unsigned char *)"HTTP/1.1 404 Not Found\r\n\r\n"); 	// Now Send the HTTP Response
}

void sendack(){
	int sendrc;
	static unsigned char ack[]="HTTP/1.0 200 OK\r\n\r\n";
	sendrc=sendconst(ack); 	// Now Send the HTTP Response
}
int send0s(char* what){
	return send0((unsigned char *)what,strlen(what));
}
long getip(){ //retrieve the requester's ip and return it as a long
	union IPaddr thisip;
	thisip.c[0]=SPI_Read(S0_DIPR + 0);thisip.c[1]=SPI_Read(S0_DIPR + 1);thisip.c[2]=SPI_Read(S0_DIPR + 2);thisip.c[3]=SPI_Read(S0_DIPR + 3);
	return thisip.l;
}

unsigned int tbrnd(){//random numbers ala tiny basic R:=R*2345+6789
static unsigned int R=1;
	R=R*2345+6789;
	//printf("%d\n",R);
	return R;
}
void setsecret(){//set the global secret to a 3 digit random number
int i=0,d1=0,d2,d3;
while(d1==0){
	d1=tbrnd()%10;
}
d2=tbrnd()%10;
while(d1==d2){
	d2=tbrnd()%10;
}
d3=tbrnd()%10;
while(d3==d1||d3==d2){
	d3=tbrnd()%10;
}
secret[0]=d1+0x30;secret[1]=d2+0x30;secret[2]=d3+0x30;secret[3]=0;
printf("secret=%s\n",secret);
}
void bagelsinit(){
	int sendrc;
	unsigned int secretnum;
	char strtemp[8];
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body><span style=\"color:#0000A0\">\r\n"
						"<center><h1>Olduino 1802 BAGELS Server</h1></center>";
	static unsigned char Inst1[]=
		"I AM THINKING OF A 3 DIGIT NUMBER.<BR>TRY TO GUESS " //50
		"MY NUMBER AND I WILL GIVE YOU CLUES AS FOLLOWS:<BR>"
		"...PICO - ONE DIGIT IS IN THE WRONG PLACE<BR>"
		"...FERMI - ONE DIGIT IS IN THE CORRECT PLACE<BR>"
        "...BAGELS - NO DIGIT IS CORRECT<P>";
	static unsigned char gform[]="<p><form method=\"GET\">\r\n"
						"<input type=\"text\" name=\"G\">"
						"<input type=\"submit\" value=\"Enter Your Guess\">\r\n"
						"</form>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	int x=sizeof(trlr);
	sendconst(hdr1); 	// Now Send the HTTP Response first part
	sendconst(Inst1); 	// Now Send the instructions
	sendconst(gform); 	// Now Send the rest of the page
	sendlit("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
	sendconst(trlr); 	// Now Send the rest of the page
//	send0(trlr,sizeof(trlr)-1); 	// Now Send the rest of the page
	setsecret();
	printf("%s\n",secret);
}
void sendrespform(int pico, int fermi){
	int sendrc,i;
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body><span style=\"color:#0000A0\">\r\n"
						"<center><h1>Olduino 1802 BAGELS Server</h1></center>";
	static unsigned char gform[]="<p><form method=\"GET\">\r\n"
						"<input type=\"text\" name=\"G\">"
						"<input type=\"submit\" value=\"Enter Your Guess\">\r\n"
						"</form>";
	static unsigned char pform[]="<p><form method=\"PUT\">\r\n"
						"<input type=\"submit\" value=\"Press To Play Again\">\r\n"
						"</form>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconst(hdr1); 	// Now Send the HTTP Response first part
	sendlit("Your Guess Was: "); 	// Now Send the instructions
	send0s((char *)guess);
	sendlit("  I say ");
	if (fermi==3){
		sendlit("YOU GOT IT!<P>");
		sendconst(pform);
	} else {//once we're here we're going to send the guess form
		if (pico<0){//flag for duplicate digits
			sendlit("<P>Oh, maybe I didn't tell you.  No two digits are the same.<P>");
		} else if ((pico+fermi)==0){
			sendlit("Bagels!");
		} else{
			for(i=0;i<pico;i++) sendlit("Pico ");
			for(i=0;i<fermi;i++) sendlit("Fermi ");
		}
		sendlit("<P>");
		sendconst(gform); 	// Now Send the rest of the page
		sendlit("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
		sendconst(trlr); 	// Now Send the rest of the page
	}
}
unsigned int cpyguess(unsigned char *to,unsigned char *from){//copy the guess until space or length limit
	unsigned int len=0;
	while((len<3) && *from!=' ' &&*from!='+' &&*from!='%'){
		*to++=*from++;
		len++;
	}
	*to=0;
	return len;
}
void bagelsturn(){
	int i, pico=0, fermi=0;
	printf("got a guess\n");
	cpyguess(guess,buf+8);
	for (i=0;i<3;i++){
		if (guess[i]==secret[i]){
			fermi++;
		}
	}
	if (guess[0]==secret[1]||guess[0]==secret[2]){pico++;}
	if (guess[1]==secret[0]||guess[1]==secret[2]){pico++;}
	if (guess[2]==secret[0]||guess[2]==secret[1]){pico++;}
	if (guess[0]==guess[1]||guess[0]==guess[2]||guess[1]==guess[2]){pico=-1;}
	sendrespform(pico, fermi);
}
void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	rsize=recv_size(); printf("**rsz=%d\n",rsize);
	if (rsize>0){
		if (recv0(buf,min(24,rsize))>0){ //get enough characters to distinguish the request
			buf[rsize]=0; printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				bagelsinit(); //initialize game, send the form
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendnak(); //no favicon here
			}
  			else if (strncmp((char *)buf,"GET /?G=",8)==0){
				bagelsturn();	//give player his turn
			}
  			else if (strncmp((char *)buf,"GET /",5)==0){
 				bagelsinit(0); //initialize game, send the form
			}
  			else{
				printf("\nmystery meat\n");
 				bagelsinit(0); //initialize game, send the form
			}
		}
	}
  	if (rsize>0) flush(rsize);	//get rid of the received data
	disconnect0();	//in any case, we're done here
	printf("done\n>\n");
}


void main(void){
	int socket0status;
	delay(100);
	printf("\nOlduino Bagels Server\n");
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
		tbrnd();//keep the random number generator cycling
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
