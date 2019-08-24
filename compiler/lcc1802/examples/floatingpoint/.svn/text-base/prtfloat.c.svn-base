/*
   print the string "hello World!"
*/
#include <nstdlib.h>
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
static unsigned int my_strlen(char *str)
{
	unsigned int slen = 0 ;
   if (str == 0)
      return 0;

   while (*str != 0) {
      slen++ ;
      str++ ;
   }
   return slen;
}

static unsigned int ftoa(char *outbfr,float flt, unsigned int dec_digits)
{
#define use_leading_plus 0
	unsigned int idx;
	unsigned long mult,wholeNum,decimalNum;
	float fltdec;
   static char local_bfr[128] ;
   char *output = (outbfr == 0) ? local_bfr : outbfr ;
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
   //  construct fractional multiplier for specified number of digits.
   //**************************************************************************
   mult = 1 ;

   for (idx=0; idx < dec_digits; idx++)
      mult *= 10 ;

   printf("mult=%ld\n", mult) ;
   wholeNum = (unsigned long) flt;
   fltdec=flt-wholeNum;
   decimalNum = (unsigned long) ((flt - wholeNum) * mult);
printf("whole=%ld,fltdec=%lx, decimal=%ld\n",wholeNum,fltdec, decimalNum);
   //*******************************************
   //  convert integer portion
   //*******************************************

   idx = 0 ;
   while (wholeNum != 0) {
      tbfr[idx++] = '0' + (wholeNum % 10) ;
      wholeNum /= 10 ;
   }
   // printf("%.3f: whole=%s, dec=%d\n", flt, tbfr, decimalNum) ;
   if (idx == 0) {
      *output++ = '0' ;
   } else {
      while (idx > 0) {
         *output++ = tbfr[idx-1] ;  //lint !e771
         idx-- ;
      }
   }
   if (dec_digits > 0) {
      *output++ = '.' ;

      //*******************************************
      //  convert fractional portion
      //*******************************************
      idx = 0 ;
      while (decimalNum != 0) {
         tbfr[idx++] = '0' + (decimalNum % 10) ;
         decimalNum /= 10 ;
      }
      //  pad the decimal portion with 0s as necessary;
      //  We wouldn't want to report 3.093 as 3.93, would we??
      while (idx < dec_digits) {
         tbfr[idx++] = '0' ;
      }
      // printf("decimal=%s\n", tbfr) ;
      if (idx == 0) {
         *output++ = '0' ;
      } else {
         while (idx > 0) {
            *output++ = tbfr[idx-1] ;
            idx-- ;
         }
      }
   }
   *output = 0 ;

   //  prepare output
   output = (outbfr == 0) ? local_bfr : outbfr ;
   return my_strlen(output) ;
}

//****************************************************************************
#define  PAD_RIGHT   1
#define  PAD_ZERO    2
float pi=3.14159;
char gbuffer[128]={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
int len=66;
void main()
{
	printstr("hello World!\n");
	len=ftoa(gbuffer,pi,4);
	printf("ftoa returns %d, gbuffer contains %s\n",len,gbuffer);
}
#include <nstdlib.c>
