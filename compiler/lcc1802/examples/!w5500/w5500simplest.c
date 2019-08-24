
/*****************************************************************************
//  File Name    : w5500simplest.c
//  Version      : 1
//  Description  : Simplest Functional Web Server With Wiznet w5500
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		 : Dec 10, 2014
*****************************************************************************/
//15-02-20 added delays after send, put missing > int hdr1, address to 10.0.0.
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500simplestcode.h"  //wiznet code definitions
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
void sendresp(){
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html>"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Simplest Server on Wiznet W5500<br>(Hello World!)</h1></center>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconst(hdr1); 	// Now Send the HTTP Response first part
	//sendconst("+++++++++1+++++++++2+++++++++3+++++++++4+++++++++5");
	sendconst(trlr); 	// Now Send the rest of the page
}
void handlesession(){
	unsigned int rsize;
	rsize=wizGetCtl16(SnRX_RSR); //get the size of the received data
	if (rsize>0){
		sendresp(); //send a response
		delay(5);
		flush(rsize);	//get rid of the received data
		delay(5);
	}
	delay(5);
	wizCmd(CR_DISCON);
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {10,0,0,180};//{169,254,180,2};
	delay(500);
    wiz_Init(ip_addr); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=wizGetCtl8(SnSR); //socket 0 status
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
				wizCmd(CR_CLOSE);
				break;
		}
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "w5500simplestcode.c"
