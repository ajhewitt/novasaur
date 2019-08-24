
/*****************************************************************************
//  File Name    : doughnuts.c
//  Version      : 1
//  Description  : Bagels Number Guessing Game for Wiznet w5500
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		 : Mar 12, 2015
*****************************************************************************/
//15-03-13 created based on bagels3 with change to doughnuts
//15-03-16 fixed logic error in response analysis
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500code.h"  //wiznet code definitions
#include "..\wiznet\secrettable.h"  //code definitions for the table of secrets
#include "doughnuts.h"
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
unsigned char secret[4]="145";
unsigned char guess [4]={0};
unsigned int pages=0; games=0; sessions=0;
char pnbuf[8];
unsigned int tbrnd(){//random numbers ala tiny basic R:=R*2345+6789
	static unsigned int R=1;
	R=R*58653+13849;//R=R*2345+6789;
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
	games++;
	pages++;
	sendconst(hdr1a);send0s(itoa(pages,pnbuf)); sendconst(hdr1b); 	// Now Send the HTTP Response first part
	sendconst(Inst1); 	// Now Send the instructions
	sendconst(Inst2); 	// Now Finish the instructions
	sendconst(gform); 	// Now Send the rest of the page
	sendconst(olduinolink);
	sendconst(trlr); 	// Now Send the trailer
	thisip.l=getip();
	thisipslot=getipslot(thisip);//finds or assigns a slot for the ip
	setsecret();
	strcpy((char*)secrets[thisipslot],(char*)secret);
	printf("IP: %d.%d.%d.%d,slot %d,secret %s\n",
		thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3],thisipslot,secrets[thisipslot]);
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
void sendtable(){
	unsigned int i;
	char buf[8];
	sendlit("<b>Client Table/Secret/Games/Turns</b><br>");
	for (i=0;i<numslots;i++){
		if (regip[i].c[0]!=0){
			sendip(regip[i].c);
			sendlit("/");
			send0s((char *)secrets[i]);
			sendlit("/");
			send0s(itoa(ipgames[i],buf));
			sendlit("/");
			send0s(itoa(ipturns[i],buf));
			sendlit("<br>");
		}
	}
}
//unsigned char secrets[numslots][4]={0}; //secret numbers for each registered ip
//unsigned int ipturns[numslots];//number of moves for the IP
//unsigned int ipgames[numslots];//number of games won by IP
void bagelspeek(){//show the ip table
	int sendrc,i;
	pages++;
	sendconst(hdr1a);send0s(itoa(pages,pnbuf)); sendconst(hdr1b); 	// Now Send the HTTP Response first part
	sendtable();
	sendconst(trlr); 	// Now Send the rest of the page

}
void congratulate(){
	char strbuf[8];
	ipgames[thisipslot]++;//increment win count
	sendconst("You have won ");
		send0s(itoa(ipgames[thisipslot],strbuf));
	sendconst(" games ");
	if (ipgames[thisipslot]>maxipgames){//high scode
		maxipgames=ipgames[thisipslot];
		maxip=thisip;
		sendconst(" - A new high score!");
	}else{
		sendconst("<p>");
		sendconst("High score is "); sendip(maxip.c); sendconst(" with ");
		send0s(itoa(maxipgames,strbuf));
		sendconst(" wins<p>");
	}
}
void sendrespform(int pico, int fermi){
	int sendrc,i;
	pages++;
	sendconst(hdr1a);send0s(itoa(pages,pnbuf)); sendconst(hdr1b); 	// Now Send the HTTP Response first part
	sendconst("Your Guess Was: "); 	// Now Send the response
	send0s((char *)guess);
	sendlit("  I say ");
	if (fermi==3){
		sendlit("YOU GOT IT!<P>");
		congratulate();
		sendconst(pform);
		sendconst(olduinolink);
		sendconst(trlr); 	// Now Send the rest of the page
	} else {//once we're here we're going to send the guess form
		if (pico<0){//flag for duplicate digits
			sendlit("<P>Oh, maybe I didn't tell you.  No two digits are the same.<P>");
		} else if ((pico+fermi)==0){
			sendlit("Doughnuts!");
		} else{
			for(i=0;i<pico;i++) sendlit("Pico ");
			for(i=0;i<fermi;i++) sendlit("Fermi ");
		}
		sendlit("<P>");
		sendconst(gform); 	// Now Send the guess form
		sendconst(Reminder);//send the reminder
		sendconst(Inst2);
		sendconst(olduinolink);
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
	int i, /*ipslot,*/ pico=0, fermi=0;
	thisipslot=getipslot(thisip);
	if(strcmp(secrets[thisipslot],"999")){//as long as we have an actual secret
		ipturns[thisipslot]++; //count the turn
		printf("Guess: %d.%d.%d.%d,slot %d,secret %s\n",
			thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3],thisipslot,secrets[thisipslot]);
		strcpy((char*)secret,(char*)secrets[thisipslot]);
		cpyguess(guess,buf+8);
		for (i=0;i<3;i++){
			if (guess[i]==secret[i]){
				fermi++;
			}
		}
		if (guess[0]==secret[1]||guess[0]==secret[2]){pico++;}
		if (guess[1]==secret[0]||guess[1]==secret[2]){pico++;}
		if (guess[2]==secret[0]||guess[2]==secret[1]){pico++;}
		if (guess[0]==guess[1]||guess[0]==guess[2]||guess[1]==guess[2]||strlen((char *)guess)!=3){pico=-1;}
		sendrespform(pico, fermi);
	}else{
		printf("Uninitialized secret for IP %d.%d.%d.%d in slot %d\n",
			thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3],thisipslot);
		bagelsinit();
	}
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
		thisip.l=getip();
		if (recv0(buf,min(16,rsize))>0){ //get enough characters to distinguish the request
			printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				bagelsinit(); //initialize game, send the form
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendnak(); //no favicon here
			}
  			else if (strncmp((char *)buf,"GET /?G=",8)==0){
				bagelsturn();	//give player his turn
			}
  			else if (strncmp((char *)buf,"GET /T",6)==0){
 				bagelspeek(); //show the IP table
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
	printf("flushing %d\n",rsize);
  	if (rsize>0) flush(rsize);	//get rid of the received data
	wizCmd(CR_DISCON);// Disconnect the connection- we're done here
	printf("done\n>\n");
	sessions++;
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {192,168,1,182};//{169,254,180,2};//{10,0,0,180};//
    unsigned int SFWs=0; //count of times we've seen SOCK_FIN_WAIT
    printf("Olduino 1802 Doughnuts Server 1.2\n");
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
				printf("%d sessions, %d games, %d pages\n",sessions,games,pages);
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
#include "..\wiznet\secrettable.c"  //wiznet code definitions
