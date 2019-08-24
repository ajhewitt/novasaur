//jan 7 trying a new vararg approach for printf
//jan 29 cleaning up itoa and ltoa before trying double dabble
//feb 6 switched to double dabble for ltoa. ltoa and itoa now return char *
//feb 17 switched printstr to out(5,x) from out5(x) - putc/out5 still used elsewhere
//feb 27, adding memcmp & memcpy
//mar 28 including float in printf
//April 4 changing prtflt/ftoa to use dubdabx routine from ltoa, add digit count to dubdabx
//April 10 #ifdef nofloats used to exclude float code in nstdlib
//May 26 2013 added strncmp from apple source
//June 25 removed static keyword from strlen
//Sept 29 - adding include for assembly versions of strcpy, strcmp for dhrystone optimization
//Nov 23 added scungy %cx hack for printing single char as hex.
//jan 29 - changing out(5,x) to putc(x)
 int strncmp(const char *s1, const char *s2, unsigned int n)
/* ANSI sez:
 *   The `strncmp' function compares not more than `n' characters (characters
 *   that follow a null character are not compared) from the array pointed to
 *   by `s1' to the array pointed to by `s2'.
 *   The `strncmp' function returns an integer greater than, equal to, or less
 *   than zero, according as the possibly null-terminated array pointed to by
 *   `s1' is greater than, equal to, or less than the possibly null-terminated
 *   array pointed to by `s2'.  [4.11.4.4]
 */
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
}

unsigned int strlen(char *str)
{
	unsigned int slen = 0 ;
	while (*str != 0) {
      slen++ ;
      str++ ;
   }
   return slen;
}
void printstr(char *ptr){
    while(*ptr) putc(*ptr++); //jan 29
}
#ifndef nofloats
static const float round_nums[8] = {
   0.5,
   0.05,
   0.005,
   0.0005,
   0.00005,
   0.000005,
   0.0000005,
   0.00000005
} ;
static const float mult_nums[8] = {
   1,
   10,
   100,
   1000,
   10000,
   100000,
   1000000,
   10000000
};
char * ftoa(float flt, char *outbfr,unsigned int dec_digits)
{
#define use_leading_plus 0
	unsigned int idx;
	float mult;
	long wholeNum,decimalNum;
   char *output = outbfr ;
   char tbfr[40] ;
   //*******************************************
   //  extract negative info
   //*******************************************
   if (flt < 0.0) {
      *output++ = '-' ;
      flt *= -1.0 ;
   } else {
      if (use_leading_plus) {
         *output++ = '+' ;
      }
   }

   //  handling rounding by adding .5LSB to the floating-point data
   if (dec_digits < 8) {
      flt += round_nums[dec_digits] ;
   }

   //**************************************************************************
   //  get fractional multiplier for specified number of digits.
   //**************************************************************************
	mult=mult_nums[dec_digits];

   wholeNum = flt;
   decimalNum = ((flt - wholeNum) * mult);
	//printf("whole=%ld,fltdec=%lx, decimal=%ld\n",wholeNum,fltdec, decimalNum);

   //*******************************************
   //  convert integer portion
   //*******************************************
   strcpy(output,dubdabx(wholeNum,output,1));
   output+=strlen(output);
   // printf("%.3f: whole=%s, dec=%d\n", flt, tbfr, decimalNum) ;
   if (dec_digits > 0) {
		*output++ = '.' ;
		//*******************************************
		//  convert fractional portion
		//*******************************************
		strcpy(output,dubdabx(decimalNum,output,dec_digits));
	}

   return outbfr;
}
#endif
char * itoa(int s, char *buffer){ //convert an integer to printable ascii in a buffer supplied by the caller
	unsigned int r,k,n;
	unsigned int flag=0;
	char * bptr; bptr=buffer;
	if (s<0){
		*bptr='-';bptr++;
		n=-s;
	} else{
		n=s;
	}
	k=10000;
	while(k>0){
		for(r=0;k<=n;r++,n-=k); // was r=n/k
		if (flag || r>0||k==1){
			*bptr=('0'+r);bptr++;
			flag='y';
		}
		//n=n-r*k;
		k=k/10;
	}

	*bptr='\0';
	return buffer;
}
char * ltoa(long s, char *buffer){ //convert a long integer to printable ascii in a buffer supplied by the caller
	char* bptr=buffer;
	if (s<0){
		*bptr++='-';
		s=-s;
	}
	strcpy(bptr,dubdabx(s,bptr,1)); //uses assembler double-dabble routine
	return buffer;
}
void printint(int s){ //print an integer
	char buffer[8];
	itoa(s,buffer);
	printstr(buffer);
}
void printlint(long s){ //print a long integer
	char buffer[12];
	printstr(ltoa(s,buffer));
}
#ifndef nofloats
void printflt(float s){ //print a float
	char buffer[20]; //need room for two longs and the .
	printstr(ftoa(s,buffer,3));
}
#endif
void putxn(unsigned char x){ //print a nibble as ascii hex
	if (x<10){
		putc(x+'0');
	} else {
		putc(x+'A'-10);
	}
}
void putx(unsigned char x){ //print a unsigned char as ascii hex
	putxn(x>>4);
	putxn(x & 0x0F);
}
void printf(char *ptr,...){ //limited implementation of printf
//								supports only c,d,s,x,l formats without width or other qualifiers
	unsigned char c,xord;
	int argslot=0;	//used to align longs
	int * this=(int *)&ptr;
	this++; argslot++; //advance argument pointer and slot #
    while(*ptr) {
		c=*ptr++;
		if (c!='%'){
			putc(c);
		} else{
			c=*ptr++;
			switch (c){
				case 'i': case 'd':
					printint(*this++);
					argslot+=1; //next argument slot
					break;
				case 's':
					printstr((char*) *this++);
					argslot+=1; //next argument slot
					break;
				case 'c'://scungy support for hex printing as %cx
					if (*ptr=='x'){ //if there's an x
						ptr++; //skip over the x
						putx(((unsigned int) *this++)&255); //print 1 byte as hex
					} else{
						putc((unsigned int) *this++);		//print as char
					}
					argslot+=1; //next argument slot
					break;
				case 'x': case 'X':
					putx(((unsigned int) *this)>>8);
					putx(((unsigned int) *this++)&255);
					argslot+=1; //next argument slot
					break;
				case 'l': //longs can be dec or hex
					if (*ptr){ //as long as there's something there
						xord=*ptr++;
						if (argslot&1) {
							this++;
							argslot++;
						}
						if(xord=='d'){
							printlint(*(long *)this);//treats "this" as a pointer to long
							this+=2;				// and advances it 4 bytes
						} else{
							putx(((unsigned int) *this)>>8);
							putx(((unsigned int) *this++)&255);
							putx(((unsigned int) *this)>>8);
							putx(((unsigned int) *this++)&255);
						}
						argslot+=2;
						break;
					}
#ifndef nofloats
				case 'f': //float
					if (*ptr){ //as long as there's something there
						if (argslot&1) { //adjust alignment
							this++;
							argslot++;
						}
						printflt(*(float *)this);//treats "this" as a pointer to float
						this+=2;				// and advances it 4 bytes
						argslot+=2;
						break;
					}
#endif
				default:
					putc('%');putc(c);
			} //switch
		} //%
	} //while
} //prtf
void exit(int code){
	printf("exit %d\n",code);
	while(1);
}
int memcmp(const void *Ptr1, const void *Ptr2, unsigned int Count){
	unsigned char* p1; unsigned char *p2;
    int v = 0;
    p1 = (unsigned char *)Ptr1;
    p2 = (unsigned char *)Ptr2;

    while(Count-- > 0 && v == 0) {
        v = *(p1++) - *(p2++);
    }

    return v;
}
void* memcpy(void* dest, const void* src, unsigned int count) {
        char* dst8 = (char*)dest;
        char* src8 = (char*)src;

        while (count--) {
            *dst8++ = *src8++;
        }
        return dest;
    }

void *memset(void *s, int c, unsigned int n) //sets memory at s to c for n bytes
{
    unsigned char* p=s;
    while(n--)
        *p++ = (unsigned char)c;
    return s;
}
void nstdlibincluder(){
	asm("\tinclude nstdlib.inc\n"); //strcpy, strcmp
}
