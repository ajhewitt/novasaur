
/*****************************************************************************
//  File Name    : bagels5.c
//  Version      : 1
//  Description  : olduino bagels game
//  Author       : WJR with thanks to RWB, Jesse N. Richardson and others
//  Target       : Olduino
//  Compiler     : LCC1802
//  IDE          : TextPad
//  Programmer   : Olduino bootloader via avrdude
//  Adaptated    : July 2014 by Bill Rowe - WJR for the olduino platform
*****************************************************************************/
//14-07-17 bagels2.c converting to sendlit sendconst
//14-07-18 refactoring, using wizcode.h and .c
//14-07-21 bagels5.c bringing in iptable for multiple players
//14-07-23 bagels5b.c introducing player stats, timekeeping
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#define putc(x) out(7,x)
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#include "wiznet.h"  //wiznet definitions
#include "wizcode.h"
#include "secrettable.h"
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
unsigned int pagehits=0; unsigned long uptime;
unsigned char secret[4]="145";
unsigned char guess [4]={0};
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
	printf("I.\n");
	//sendconst(Inst1); 	// Now Send the instructions
	send0(Inst1,sizeof(Inst1)-1); 	// Now Send the instructions
	printf(".I\n");
	sendconst(gform); 	// Now Send the rest of the page
	sendlit("<a href=\"http://goo.gl/p4C0Cg\">Olduino</a>: An Arduino for the First of Us<p>");
	sendconst(trlr); 	// Now Send the rest of the page
	thisip.l=getip();
	thisipslot=getipslot(thisip);//finds or assigns a slot for the ip
	setsecret();
	strcpy((char*)secrets[thisipslot],(char*)secret);
	printf("IP: %d.%d.%d.%d,slot %d,secret %s\n",thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3],thisipslot,secrets[thisipslot]);
}
void sendstats(){
	char strbuf[8]; unsigned int upmins=uptime/60000;unsigned int uphours=upmins/60;
	sendconst("<p>Games Won: ");send0s(itoa(ipgames[thisipslot],strbuf));sendconst("<br>");
	sendconst("Average Tries: ");send0s(itoa(ipturns[thisipslot]/ipgames[thisipslot],strbuf));sendconst("<br>");
	sendconst("<p>Approximate Server Uptime: ");
	if (uphours){
		send0s(itoa(uphours,strbuf));sendconst(" hours, ");
	}
	send0s(itoa(upmins%60,strbuf));sendconst(" minutes<br>");
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
	sendlit("Your Guess Was: "); 	// Now Send the guess
	send0s((char *)guess);
	sendlit("  I say ");
	if (fermi==3){
		sendlit("YOU GOT IT!<P>");
		ipgames[thisipslot]++;//record another win for this IP
		sendconst(pform);
		sendstats();
	} else {//once we're here we're going to send the guess form
		if (pico<0){//flag for duplicate digits
			sendlit("<P>Just to be clear: three digits, no two the same.<P>");
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
	while((len<3) && *from>='0'&&*from<='9'){
		*to++=*from++;
		len++;
	}
	*to=0;
	return len;
}
void bagelsturn(){
	int i, thisipslot, pico=0, fermi=0,guesslen=0;
	thisipslot=getipslot(thisip);
	if (!strncmp(secrets[thisipslot],"999",3)){//if player lost their slot
		bagelsinit();//restart the game
		return;//abort the turn
	}
	ipturns[thisipslot]++;//count his turns;
	printf("IP: %d.%d.%d.%d,slot %d,secret %s\n",thisip.c[0],thisip.c[1],thisip.c[2],thisip.c[3],thisipslot,secrets[thisipslot]);
	strcpy((char*)secret,(char*)secrets[thisipslot]);
	printf("got a guess\n");
	guesslen=cpyguess(guess,buf+8);
	for (i=0;i<3;i++){
		if (guess[i]==secret[i]){
			fermi++;
		}
	}
	if (guess[0]==secret[1]||guess[0]==secret[2]){pico++;}
	if (guess[1]==secret[0]||guess[1]==secret[2]){pico++;}
	if (guess[2]==secret[0]||guess[2]==secret[1]){pico++;}
	if (guesslen!=3||guess[0]==guess[1]||guess[0]==guess[2]||guess[1]==guess[2]){pico=-1;}
	sendrespform(pico, fermi);
}
void handlesession(){	//handle a session once it's established
	unsigned int rsize,strncmpval;
	rsize=recv_size(); printf("**rsz=%d\n",rsize);
	if (rsize>0){
		thisip.l=getip();
		if (recv0(buf,min(24,rsize))>0){ //get enough characters to distinguish the request
			printf("%s\n",buf);
  			if (strncmp((char *)buf,"POST /",6)==0){
  				bagelsinit(); //initialize game, send the form
  				uptime+=311; //250ms allowed for initialization
			}
			else if (strncmp((char *)buf,"GET /favicon",12)==0){
  				sendnak(); //no favicon here
  				uptime+=100; //100ms allowed for nak
			}
  			else if (strncmp((char *)buf,"GET /?G=",8)==0){
				bagelsturn();	//give player his turn
  				uptime+=376; //200ms allowed for each turn
			}
  			else if (strncmp((char *)buf,"GET /",5)==0){
 				bagelsinit(0); //initialize game, send the form
  				uptime+=311; //250ms allowed for initialization
			}
  			else{
				printf("\nmystery meat\n");
 				bagelsinit(0); //initialize game, send the form
  				uptime+=311; //250ms allowed for initialization
			}
		}
	}
  	if (rsize>0) flush(rsize);	//get rid of the received data
	disconnect0();	//in any case, we're done here
	printf("done\n>\n");
}


void main(void){
	int socket0status;
    unsigned char ip_addr[] = {192,168,0,182}; //{169,254,180,2}; //
	delay(100);
	printf("\nOlduino Bagels Server V5\n");
    wiz_Init(ip_addr); //initialize the wiznet chip
	while(1){  // Loop forever
		socket0status=wiz_Read(S0_SR);
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
		delay(100);//delay in ms @1.6mhz
		uptime+=46;//counting ms;
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "wizcode.c"
#include "secrettable.c"
