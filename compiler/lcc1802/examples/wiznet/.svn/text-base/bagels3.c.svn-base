
/*****************************************************************************
//  File Name    : bagels3.c
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
//14-07-18 refactoring, using wizcode.h and .c
#define	nofloats			//not using floating point
#include <nstdlib.h> //for printf etc.
#define putc(x) out(7,x)
#include <olduino.h> //for digitalRead, digitalWrite, delay
#include <hspi2.h> //hardware spi header
#include "wiznet.h"  //wiznet definitions
#include "wizcode.h"
unsigned int send0f(unsigned char *buf,unsigned int buflen);
#define MAX_BUF 512
unsigned char buf[MAX_BUF];			//memory buffer for incoming & outgoing data
int pagehits=0;
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
	printf("I.\n");
	//sendconst(Inst1); 	// Now Send the instructions
	send0(Inst1,sizeof(Inst1)-1); 	// Now Send the instructions
	printf(".I\n");
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
    unsigned char ip_addr[] = {169,254,180,2}; //{192,168,0,182}; //
	delay(100);
	printf("\nOlduino Bagels Server V3\n");
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
		delay(100);
	}
}
#include <olduino.c>
#include <nstdlib.c>
#include <hspi2.c>
#include "wizcode.c"
