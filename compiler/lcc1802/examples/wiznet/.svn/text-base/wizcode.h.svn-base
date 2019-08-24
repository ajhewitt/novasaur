//14-07-18 wizcode.h - header for routines to address the wiznet w5100
#define disablewiz()   	asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ori 0x80\n	str memaddr\n" \
  							"	sex memaddr\n	out 4\n	sex 2\n"); //high level on 7(SS) disables the w5100 from the spi bus
#define enablewiz()  asm("	ldad memaddr,_PIN4\n	ldn memaddr\n	ani 0x7f\n	str memaddr\n" \
						"	sex memaddr\n	out 4\n	sex 2\n");
#define sendlit(x) send0((unsigned char*)x,sizeof(x)-1)
#define sendconst(x) send0((unsigned char*)x,sizeof(x)-1)
#define selectmask 0x7f;//turns off the top bit in the parallel port
#define deselectmask 0x80;//turns on the top bit in the parallel port
struct SPIsequence{
	unsigned char select;
	unsigned char opcode;
	unsigned int realaddr;
	unsigned char data;
	unsigned char deselect;
} SPINsequence;

union IPaddr{
	long l;
	unsigned char c[4];
};

void wiz_WriteN(unsigned int offaddr,unsigned char *data, unsigned int N);

void wiz_Write(unsigned int addr,unsigned char data);

unsigned char wiz_Read(unsigned int addr);

void wiz_Init(unsigned char ip_addr[]);// Ethernet Setup

void socket0_init(); //initialize socket 0 for http server

void disconnect0(); //disconnect socket 0

void close0();//close socket 0

unsigned int recv0(unsigned char *buf,unsigned int buflen); //receive buflen bytes from socket 0

void flush(int rsize); //flush the receive buffer

unsigned int recv_size(void);//get the size of data available to read

unsigned int send0(unsigned char *buf,unsigned int buflen);//send buflen bytes on socket 0

void sendnak();

void sendack();

int send0s(char* what);//send a string

long getip(); //retrieve the requester's ip and return it as a long
