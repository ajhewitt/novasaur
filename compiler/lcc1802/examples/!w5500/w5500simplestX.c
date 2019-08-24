
/*****************************************************************************
//  File Name    : w5500simplestX.c
//  Version      : 1
//  Description  : Simplest Functional Web Server With Wiznet w5500
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		 : Dec 10, 2014
*****************************************************************************/
//15-08-21  adapted for multiple sockets
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500simplestcodeX.h"  //wiznet code definitions
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
void sendresp(unsigned char whichsocket){
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html>"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Simplest Server on Wiznet W5500<br>(Hello World!)</h1></center>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconstX(whichsocket,hdr1); 	// Now Send the HTTP Response first part
	//sendconst("+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5");
	sendconstX(whichsocket,trlr); 	// Now Send the rest of the page
}
void handlesession(unsigned char whichsocket){
	unsigned int rsize;
	rsize=wizGetCtl16X(whichsocket, SnRX_RSR); //get the size of the received data
	if (rsize>0){
		sendresp(whichsocket); //send a response
		delay(5);
		flushX(whichsocket,rsize);	//get rid of the received data
		delay(5);
	}
	delay(5);
	wizCmdX(whichsocket,CR_DISCON);
}

void main(void){
	unsigned char socketXstatus;
	unsigned char whichsocket=0;//start with socket 0
	unsigned char gotsocket;//socket which just received data
    unsigned char ip_addr[] = {10,0,0,180};//{169,254,180,2};
	delay(500);
    wiz_Init(ip_addr); //initialize the wiznet chip
	while(1){  // Loop forever
		socketXstatus=wizGetCtl8X(whichsocket,SnSR); //active socket status
		switch (socketXstatus){
			case SOCK_CLOSED: //initial condition
				socketX_init(whichsocket);	//initialize socket 0
				break;
			case SOCK_ESTABLISHED: //someone wants to talk to the server
				gotsocket=whichsocket;
				whichsocket^=1; //alternate sockets
				socketX_init(whichsocket); //prepare it to listen while we're busy
				handlesession(gotsocket);
				break;
			//following are cases where we have to reset and reopen the socket
			case SOCK_FIN_WAIT: case SOCK_CLOSING: case SOCK_TIME_WAIT:
			case SOCK_CLOSE_WAIT: case SOCK_LAST_ACK:
				wizCmdX(whichsocket,CR_CLOSE);
				break;
		}
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "w5500simplestcodeX.c"
