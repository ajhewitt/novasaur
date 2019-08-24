//14-11-26 w5500code.h - header for routines to address the wiznet w5500
#define disablewiz()   	asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ori 0x80\n	str memaddr\n" \
  							"	sex memaddr\n	out 4\n	sex 2\n"); //high level on 7(SS) disables the w5100 from the spi bus
#define enablewiz()  asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ani 0x7f\n	str memaddr\n" \
						"	sex memaddr\n	out 4\n	sex 2\n");
#define sendlit(x) send0((unsigned char*)x,sizeof(x)-1)
#define sendconst(x) send0((unsigned char*)x,sizeof(x)-1)

union IPaddr{
	long l;
	unsigned char c[4];
};
union WReg{ //used to retrieve a 16 bit value from the wiznet
	unsigned int i;
	unsigned char c[2];
};
void wizRead(unsigned int addr,unsigned char opcode, void * data, unsigned int len);

long getip();
void wiz_Init(unsigned char ip_addr[]);// Ethernet Setup
void socket0_init(); //initialize socket 0 for http server
unsigned int recv_size(void);
unsigned int send0(unsigned char *buf,unsigned int buflen);
int send0s(char* what);//send a string
void sendnak();
unsigned int recv0(unsigned char *buf,unsigned int buflen);
void flush(unsigned int rsize); //this just gets rid of data that i don't want to process
void wizCmd(unsigned char);
unsigned char wizGetCtl8(unsigned int ctlregaddr);//read a socket 0 8 bit control register
void wizSetCtl8(unsigned int ctlreg, unsigned char val);//write to an 8 bit socket 0 control register
unsigned int wizGetCtl16(unsigned int ctlregaddr);//read a socket 0 16 bit control register
void wizSetCtl16(unsigned int ctlregaddr, unsigned int ctlregvalue);//write to a socket 0 16 bit control register
