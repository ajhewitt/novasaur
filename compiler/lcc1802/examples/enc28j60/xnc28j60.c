//first attempt at olduino interface to enc28j60 ethernet module
#include "mytypes.h"
#define nofloats 1
#include <nstdlib.h>
#include <olduino.h>

#include "enc.h"
#include "net.h"
#include "tcpip.h"
#include "webutil.h"
#include "util.h"

static uint8_t mymac[] = {
  0x74,0x69,0x69,0x2D,0x30,0x31 };
uint8_t myip[4]={ 192,168,1,191 };   // my ip address
uint8_t mymask[4]; // my net mask
uint8_t gwip[4];   // gateway
uint8_t dhcpip[4]; // dhcp server
uint8_t dnsip[4];  // dns server
uint8_t hisip[4];  // dns result
uint16_t hisport = 80; // tcp port to browse to

uint8_t buffer[700];

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

  printf("readRegByte(ECON1) returns: %x\n",readRegByte(ECON1));
  printf("readRegByte(EREVID) returns: %x\n",readRegByte(EREVID));
  printf("readRegByte(ESTAT) returns: %x\n",readRegByte(ESTAT));
  printf("MACtail readback: %x:%x\n",readRegByte(MAADR1),readRegByte(MAADR0));

  printf("and we're done\n");
}

void loop () {
	uint16_t len,pos;
  len = encpacketReceive();
  //printf("%d",len);
  pos = tcppacketLoop(len);
  //printf("/%d ",pos);
  //delay(100);
}

void main(){
	asm("	seq	;1 on Q de-activates ethernet chip\n"); //digitalWrite(encss,HIGH); //deactivate the chip select
	printf("encmule - watch my Q!\n");
	setup();
	while(1){
		loop();
	}
}

#include "enc.c"

#include "tcpip.c"

#include "util.c"
#include "webutil.c"
#include <nstdlib.c>
#include <olduino.c>

