//screen /dev/tty.usbserial-FTWUA7K0 57600
/*****************************************************************************
//  File Name    : livegraphics.c
//  Version      : 1
//  Description  : Olduino dynamic image generation demo with Wiznet w5500
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		   : April4, 2015
*****************************************************************************/
//15-03-13 created based on bagels3 with change to doughnuts
//15-03-16 fixed logic error in response analysis
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#define nofloats //don't include code for floating point math and printing
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500code.h"  //wiznet code definitions
#include "livegraphics.h"
#include "starshipicon.h"
#include "starship128-2.h"
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
unsigned int sessions=0,intros=0, statics=0, dynamics=0;
char pnbuf[8];
unsigned int tbrnd(){//random numbers ala tiny basic R:=R*2345+6789
	static unsigned int R=1;
	R=R*58653+13849;//R=R*2345+6789;
	//printf("%d\n",R);
	return R;
}

void graphinit(){
	int sendrc;
	intros++;
	sendconst(hdr1a);send0s(itoa(intros,pnbuf)); sendconst(hdr1b); 	// Now Send the HTTP Response first part
	sendconst(Inst1); 	// Now Send the instructions
	sendconst(olduinolink);
	sendconst(trlr); 	// Now Send the trailer
	thisip.l=getip();
		printf("IP: %d.%d.%d.%d\n",
		thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3]);
}
void sendip(unsigned char * ip){
	char strbuf[4];
	send0s(itoa(ip[0],strbuf));
	sendlit(".");
	send0s(itoa(ip[1],strbuf));
	sendlit(".");
	send0s(itoa(ip[2],strbuf));
	sendlit(".");
	send0s(itoa(ip[3],strbuf));
}

void sendfavicon(){
	printf("sending the icon\n");
	sendconst(iconhdr); 	// Now Send a header
	sendbin(starshipicon);//and the binary data!
}
void sendbmp(){
	statics++;
	printf("sending the bmp\n");
	asm(" seq\n");
	sendconst(httpbmphdr); 	// Now Send a header
	sendbin(starshipbmp);//and the binary data!
	asm(" req\n");
}
void send1861bmp(){
	int row=0,cycle=0;
	dynamics++;
	printf("sending the bmp\n");
	asm(" seq\n");
	sendconst(httpbmphdr); 	// Now Send an http header
	sendbin(starship1861hdr);//and the fixed part of thebinary data!
	for (row=0;row<24;row++){
		printf("\rrow %d@%x->%cx\n",row,starship1861bin[row],starship1861bin[row][0]);
		for (cycle=0;cycle<4;cycle++){
			sendbin(starship1861bin[row]);//and the rest of the binary data!
		}
	}
	asm(" req\n");
}

void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	unsigned int tries=10;
	sessions++;
	rsize=wizGetCtl16(SnRX_RSR); //get the size of the received data
	while(rsize==0 && tries-->0){
		delay(20);
		printf("re-size ");
		rsize=wizGetCtl16(SnRX_RSR); //retry size of the received data
	}
	printf("**rsz=%d\n",rsize);
	if (rsize>0){
		thisip.l=getip();
		if (recv0(buf,min(16,rsize))>0){ //get enough characters to distinguish the request
			printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				graphinit(); //initialize game, send the form
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendfavicon();
			}
			else if (strncmp((char *)buf,"GET /bitmap",11)==0){
		  		sendbmp();
			}
			else if (strncmp((char *)buf,"GET /1861",9)==0){
		  		send1861bmp();
			}
  			else if (strncmp((char *)buf,"GET /T",6)==0){
 				//graphpeek(); //show the IP table
			}
  			else if (strncmp((char *)buf,"GET /",5)==0){
 				graphinit(0); //initialize, send instructions
			}
  			else{
				printf("\nmystery meat\n");
 				graphinit(0); //initialize, send instructions
			}
		}
	}
	printf("flushing %d\n",rsize);
  	if (rsize>0) flush(rsize);	//get rid of the received data
	wizCmd(CR_DISCON);// Disconnect the connection- we're done here
	printf("done\n>\n");
	sessions++;
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {10,0,0,180};//{192,168,1,182};//{169,254,180,2};//
    unsigned int SFWs=0; //count of times we've seen SOCK_FIN_WAIT
    printf("Olduino 1802 Dynamic Image Generation on Comcast\n");
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
				printf("%d sessions, %d intros, %d static bmps, %d dynamic bmps\n",sessions,intros,statics,dynamics);
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
		tbrnd(); //cycle the generator
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "w5500code.c"
