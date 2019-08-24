
/*****************************************************************************
//  File Name    : w5500simplinst.c
//  Version      : 1
//  Description  : Simplest Functional Web Server With Wiznet w5500
//                 instrumented with diagnostic prints
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		 : February, 2014
//  15-03-09 adding some instrumentation
*****************************************************************************/
//15-04-21 change discon to close, reduce main loop delay to 10ms
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500simplestcode.h"  //wiznet code definitions
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
union IPaddr thisip={182};
long getip(){ //retrieve the requester's ip and return it as a long
	union IPaddr thisip;
	wizRead(SnDIPR,WIZNET_READ_S0R,thisip.c,4);
	return thisip.l;
}
void sendresp(){
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html>"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Simplest Server on Wiznet W5500<br>(Hello World!)</h1></center";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconst(hdr1); 	// Now Send the HTTP Response first part
	sendconst(trlr); 	// Now Send the rest of the page
}
void handlesession(){
	unsigned int rsize;
	unsigned int tries=10;
	rsize=wizGetCtl16(SnRX_RSR); //get the size of the received data
	printf("SSN %d\n",rsize);
	thisip.l=getip();
	printf("IP: %d.%d.%d.%d\n",
		thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3]);
	while(rsize==0 && tries-->0){
		printf("retry rsize ");

		rsize=wizGetCtl16(SnRX_RSR); //retry size of the received data
		delay(20);
	}

	if (tries<10) printf(" %d\n",rsize);
	if (rsize>0){
		sendresp(); //send a response
		flush(rsize);	//get rid of the received data
	}
	printf("closing\n");
	wizCmd(CR_CLOSE);//was CR_DISCON
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {192,168,1,182};//{10,0,0,182};//{169,254,180,2};
    unsigned int SFWs=0;
	delay(500);
    wiz_Init(ip_addr); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=wizGetCtl8(SnSR); //socket 0 status
		//printf("%cx ",socket0status);
		switch (socket0status){
			case SOCK_CLOSED: //initial condition
				SFWs=0;
				socket0_init();	//initialize socket 0
				break;
			case SOCK_ESTABLISHED: //someone wants to talk to the server
				SFWs=0;
				handlesession();
				break;
			//following are cases where we have to reset and reopen the socket
			case SOCK_FIN_WAIT:
				printf("SOCK_FIN_WAIT:");
			//	if (++SFWs>2){
			//		printf(" lost patience, closing\n");
			//		wizCmd(CR_CLOSE);
			//	}else{
			//		printf(" ignoring\n");
			//	}
			//	break;
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
#include "w5500simplestcode.c"
