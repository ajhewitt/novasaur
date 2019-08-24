
/*****************************************************************************
//  File Name    : w5500mule.c
//  Version      : 1
//  Description  : wiznet w5500 test harness
//  Author       : WJR with thanks Karl Lunt & Wiznet
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Created		 : Nov 26, 2014
*****************************************************************************/
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h>
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#include "w5500data.h"  //wiznet definitions
#include "w5500code.h"  //wiznet code definitions
union IPaddr thisip={182}; //the ip that a form/request came from
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data

void sendresp(){
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html>"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Olduino Server on Wiznet W5500</h1></center>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconst(hdr1); 	// Now Send the HTTP Response first part

	sendlit("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
	sendconst(trlr); 	// Now Send the rest of the page
}
void handlesession(){
	unsigned int rsize,strncmpval;
	thisip.l=getip();
	printf("\nsession established!\n");
	printf(" ip %d.%d.%d.%d\n",thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3]); //this would malf if not for promotion
	rsize=wizGetCtl16(SnRX_RSR); printf("**rsz=%d\n",rsize);
asm("	seq\n");
	if (rsize>0){
		sendresp(); //send a response

		flush(rsize);	//get rid of the received data
	} else {
		printf("0 size ignored\n");
	}
	wizCmd(CR_DISCON);
	//printf("done\n>\n");
asm("	req\n");
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {169,254,180,2}; //{192,168,0,182}; //
	delay(100);
	printf("\nW5500 Test Mule V2\n");
	delay(500);
    wiz_Init(ip_addr); //initialize the wiznet chip
    socket0status=wizGetCtl8(SnSR); //get the status on socket 0 to poll for a connection
	//printf("s0s=%cx ",socket0status);
	while(1){  // Loop forever
		socket0status=wizGetCtl8(SnSR);
		//printf("s0s=%cx ",socket0status);
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
#include "w5500code.c"
