//simplified variant of stdint.h for lcc1802
//based on http://www.jbox.dk/sanos/source/include/stdint.h.html
#ifndef nSTDINT_H
	#define nSTDINT_H
	#ifndef _INT_T_DEFINED
		#define _INT_T_DEFINED
		typedef signed char int8_t;
		typedef int int16_t;
		typedef long int32_t;
		typedef unsigned char uint8_t;
		typedef unsigned int uint16_t;
		typedef unsigned long uint32_t;
	#endif
typedef unsigned char byte;
typedef unsigned int boolean;
#endif
