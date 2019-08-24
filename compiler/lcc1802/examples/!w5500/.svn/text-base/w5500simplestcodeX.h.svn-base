//14-11-26 w5500simplestcodeX.h - header for routines to address the wiznet w5500 for multiple sockets
#define sendconstX(whichsocket,x) sendX(whichsocket,(unsigned char*)x,sizeof(x)-1)

union IPaddr{
	long l;
	unsigned char c[4];
};
union WReg{ //used to retrieve a 16 bit value from the wiznet
	unsigned int i;
	unsigned char c[2];
};
void wizReadX(unsigned char whichsocket, unsigned int addr,unsigned char opcode, void * data, unsigned int len);

void wiz_Init(unsigned char ip_addr[]);// Ethernet Setup
void socketX_init(unsigned char whichsocket); //initialize socket for http server
unsigned int sendX(unsigned char whichsocket,unsigned char *buf,unsigned int buflen);
unsigned int recvX(unsigned char whichsocket,unsigned char *buf,unsigned int buflen);
void flushX(unsigned char whichsocket,unsigned int rsize); //this just gets rid of data in socket X that i don't want to process
void wizCmdX(unsigned char whichsocket,unsigned char); //execure a wiznet sommand for socket X & wait for completion
unsigned char wizGetCtl8X(unsigned char whichsocket,unsigned int ctlregaddr);//read a socket X 8 bit control register
void wizSetCtl8X(unsigned char whichsocket,unsigned int ctlreg, unsigned char val);//write to an 8 bit socket X control register
unsigned int wizGetCtl16X(unsigned char whichsocket,unsigned int ctlregaddr);//read a socket X 16 bit control register
void wizSetCtl16X(unsigned char whichsocket,unsigned int ctlregaddr, unsigned int ctlregvalue);//write to a socket X 16 bit control register

//following two defines are for the 1802/olduino only, quick ways of flipping a bit to enable the wiznet chip
#define disablewiz()   	asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ori 0x80\n	str memaddr\n" \
  							"	sex memaddr\n	out 4\n	sex 2\n"); //high level on 7(SS) disables the w5100 from the spi bus
#define enablewiz()  asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ani 0x7f\n	str memaddr\n" \
						"	sex memaddr\n	out 4\n	sex 2\n");
