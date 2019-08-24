//jan 7 trying a new vararg approach for printf
//feb 27, adding memcmp & memcpy
//mar 28 adding float support
//April 10 moving float constants to nstdlib.c, adding ifndef of nofloats around ftoa
//April 21 adding defs for putx memset
//May 26 adding declare for strlen
unsigned int strlen(char *str);
#define putchar putc
#define puts printstr
char * strcpy(char *, const char*);
void printstr(char*);
void putc(char);
char * itoa(int, char *);
char * ltoa(long, char *);
#ifndef nofloats
char * ftoa(float, char *,unsigned int);
#endif
void printf(char *, ...);
void exit(int); //halt with a numeric error message
#ifndef max
#define max(a,b) (((a) > (b)) ? (a) : (b))
#define min(a,b) (((a) < (b)) ? (a) : (b))
#endif
int memcmp(const void *Ptr1, const void *Ptr2, unsigned int Count);
void *memset(void *s, int c, unsigned int n); //sets n bytes of memory at s to c
void* memcpy(void* dest, const void* src, unsigned int count);
char * dubdabx(long, char *, int);

void putx(unsigned char x); //print an unsigned char as ascii hex
