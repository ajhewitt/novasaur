
/*****************************************************************************
//  File Name    : olduinoserver4W5500.c
//  Version      : 4.3
//  Description  : olduino LED server
//  Author       : WJR with thanks to RWB
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Adaptated    : 17 May 2013 by Bill Rowe - WJR for the olduino platform
//  Revised 	 : 22 Aug 2015 for the W5500
*****************************************************************************/
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#include "w5500data.h"  //wiznet definitions
#include "w5500code.h"  //wiznet code definitions

#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
int ledmode=0;	//0=off, 1=on
union IPaddr cmdip,sessip; //most recent address where a command came from, current session ip
int pages=0,sessions=0;
char strbuf[16];
void sendip(unsigned char * ip){
	send0s(itoa(ip[0],strbuf));
	sendlit(".");
	send0s(itoa(ip[1],strbuf));
	sendlit(".");
	send0s(itoa(ip[2],strbuf));
	sendlit(".");
	send0s(itoa(ip[3],strbuf));
}

void sendCip(){
	send0s("Last command from: ");
	sendip(cmdip.c);
	send0s("<p>");

}
void sendform(){
	int sendrc;
	static char hdr[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body><span style=\"color:#0000A0\">\r\n"
						"<h1><center>Olduino 1802 Web Server V4.3.1</center></h1>\r\n";

	static char postform[]="<p><form method=\"POST\">\r\n"
						"<input type=\"submit\" value=\"Toggle Q LED\">\r\n"
						"</form>";
	static char getform[]="<p><form method=\"GET\">\r\n"
						"<input type=\"submit\" value=\"Q LED Status\">\r\n"
						"</form>";
	static char trlr[]="</body></html>\r\n\r\n";

	//printf(">SF\n");
	pages+=1;
	sendrc=send0s(hdr); 	// Now Send the HTTP Response first part
	//printf("0\n");
	send0s("Pages Served: "); send0s(itoa(pages,strbuf)); send0s("<p>");
	//printf("1\n");
	if (cmdip.c[0]!=0)
		sendCip();
	//printf("2\n");
	sendrc=send0s("Q LED is ");
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
		asm(" req\n"); //Q led off
	} else {
		ledmode=1;
		asm(" seq\n"); //Q led on
	}
	cmdip.l=getip();
	sendform();
}
void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	unsigned int tries=10;
	rsize=wizGetCtl16(SnRX_RSR); //get the size of the received data
	while(rsize==0 && tries-->0){
		delay(20);
		printf("re-size ");
		rsize=wizGetCtl16(SnRX_RSR); //retry size of the received data
	}
	printf("**rsz=%d\n",rsize);
	if (rsize>0){
		sessip.l=getip();
		if (recv0(buf,min(16,rsize))>0){ //get enough characters to distinguish the request
			printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				handlepost(); //toggle LED, send the form
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendnak(); //no favicon here
			}
  			else if (strncmp((char *)buf,"GET /",5)==0){
 				sendform(); //send the form
			}
  			else{
				printf("\nmystery meat\n");
 				sendform(); //initialize game, send the form
			}
		}
		printf("flushing %d\n",rsize);
		if (rsize>0) flush(rsize);	//get rid of the received data
	}
	wizCmd(CR_DISCON);// Disconnect the connection- we're done here
	printf("done\n>\n");
	sessions++;
}
void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {192,168,1,182};//{169,254,180,2};//{10,0,0,180};//
    unsigned int SFWs=0; //count of times we've seen SOCK_FIN_WAIT
    printf("Olduino LED Server on W5500 4.3.1\n");
	delay(500);
    wiz_Init(ip_addr); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=wizGetCtl8(SnSR); //socket 0 status
		switch (socket0status){
			case SOCK_CLOSED: //initial condition
				SFWs=0;
				socket0_init();	//initialize socket 0
				break;
			case SOCK_ESTABLISHED: //someone wants to talk to the server
				SFWs=0;
				handlesession();
				printf("%d sessions, %d pages\n",sessions,pages);
				break;
			//following are cases where we have to reset and reopen the socket
			case SOCK_FIN_WAIT:
				printf("SOCK_FIN_WAIT:");
				if (++SFWs>2){
					printf(" lost patience, closing\n");
					wizCmd(CR_CLOSE);
				}else{
					printf(" ignoring\n");
				}
				break;
			case SOCK_CLOSING: case SOCK_TIME_WAIT:
			case SOCK_CLOSE_WAIT: case SOCK_LAST_ACK:
				SFWs=0;
				wizCmd(CR_CLOSE);
				break;
		}
		delay(10);
	}
}

#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "w5500code.c"
