
/*****************************************************************************
//  File Name    : w5500bagels2.c
//  Version      : 1
//  Description  : Bagels Number Guessing Game for Wiznet w5500
//  Author       : Bill Rowe
//  Target       : Olduino
//  Compiler     : LCC1802
//  Created		 : Feb 3, 2015
*****************************************************************************/
//15-02-04 added scoring and congratulations
//15-02-20 added test for <3 digits entered
//15-03-01 changed constants in random number generator
#include <nstdlib.h> //for printf etc.
#include <cpu1802spd4port7.h> //defines processor type, speed, and host port
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
//end of olduino/1802 specific declares
#include "w5500data.h"  //wiznet definitions
#include "w5500code.h"  //wiznet code definitions
#include "..\wiznet\secrettable.h"  //wiznet code definitions
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
unsigned char secret[4]="145";
unsigned char guess [4]={0};
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
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body OnLoad=\"document.mf.G.focus();\">"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Olduino 1802 BAGELS Server On Wiznet W5500</h1>"
						"</center>";
	static unsigned char Inst1[]=
		"I AM THINKING OF A 3 DIGIT NUMBER.<BR>TRY TO GUESS " //50
		"MY NUMBER AND I WILL GIVE YOU CLUES AS FOLLOWS:<BR>"
		"...PICO - ONE DIGIT IS IN THE WRONG PLACE<BR>"
		"...FERMI - ONE DIGIT IS IN THE CORRECT PLACE<BR>"
        "...BAGELS - NO DIGIT IS CORRECT<P>";
	static unsigned char gform[]="<p><form name=\"mf\" method=\"GET\">\r\n"
						"<input type=\"text\" name=\"G\">"
						"<input type=\"submit\" value=\"Enter Your Guess\">\r\n"
						"</form>";
	static unsigned char trlr[]="</body></html>\r\n\r\n";
	sendconst(hdr1); 	// Now Send the HTTP Response first part
	sendconst(Inst1); 	// Now Send the instructions
	sendconst(gform); 	// Now Send the rest of the page
	sendconst("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
	sendconst(trlr); 	// Now Send the rest of the page
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
	static unsigned char hdr1[]="HTTP/1.0 200 OK\r\nContent-Type: text/html\r\n\r\n"
						"<html><body OnLoad=\"document.mf.G.focus();\">"
						"<span style=\"color:#0000A0\">\r\n"
						"<center><h1>Olduino 1802 BAGELS Server 2.2</h1></center>";
	static unsigned char gform[]="<p><form name=\"mf\" method=\"GET\">\r\n"
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
		congratulate();
		sendconst(pform);
		sendlit("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
		sendconst(trlr); 	// Now Send the rest of the page
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
	int i, /*ipslot,*/ pico=0, fermi=0;
	thisipslot=getipslot(thisip);
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
}

void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	rsize=wizGetCtl16(SnRX_RSR); printf("**rsz=%d\n",rsize);
	if (rsize>0){
		thisip.l=getip();
		if (recv0(buf,min(64,rsize))>0){ //get enough characters to distinguish the request
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
}

void main(void){
	unsigned char socket0status;
    unsigned char ip_addr[] = {192,168,1,182};//{169,254,180,2};//{10,0,0,180};//
    printf("Olduino 1802 BAGELS Server 2.2\n");
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
		tbrnd(); //cycle the generator
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "w5500code.c"
#include "..\wiznet\secrettable.c"  //wiznet code definitions
