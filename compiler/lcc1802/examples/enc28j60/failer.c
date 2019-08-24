
#include "mytypes.h"
#define nofloats 1
#include <nstdlib.h>
#include <olduino.h>
/*
#include "enc.h"
#include "net.h"
#include "tcpip.h"
#include "webutil.h"
#include "util.h"
*/
static uint8_t mymac[] = {
  0x74,0x69,0x69,0x2D,0x30,0x31 };
uint8_t myip[4]={ 192,168,1,191 };   // my ip address
/*
uint8_t mymask[4]; // my net mask
uint8_t gwip[4];   // gateway
uint8_t dhcpip[4]; // dhcp server
uint8_t dnsip[4];  // dns server
uint8_t hisip[4];  // dns result
uint16_t hisport = 80; // tcp port to browse to
*/
uint8_t buffer[700];
/*
#define sck 5
#define miso 15	//really ef3
#define mosi 7
//#define encss 4	//slave select for the ethernet adapter

void setup () {
  printf("\nEnc28j60 first try\n");

  printf("MAC & IP ");
  hexDump(mymac,6);
  hexDump(myip,4);

  if (ethbegin(700) == 0)
    printf( "Failed to access Ethernet controller\n");


  printf("and we're done\n");
}



void mysetqOn(){
	asm("	seq\n");
}
void main()
{
	while(1){
		mysetqOn();
		delay(500);
		setqOff();
		delay(500);
	}
}
*/
#include "tcpipfail.c"
#include "olduino.c" //for the delay routine
