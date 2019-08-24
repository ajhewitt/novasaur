//wjr Nov 2012: includes m1, cosmac, x1802
//wjr Dec 21 2012:includes m1.xr16, xr18
//wjr mar 3, 2013 adding xr18no
//april 10 - looks like xr18.fl was added march 20th.
//april 23 replace xr18 with xr182b
//Oct 2 replace XR18ng with xr18DH
#include "c.h"
#undef yy
#define yy \
xx(alpha/osf,    alphaIR) \
xx(mips/irix,    mipsebIR) \
xx(m1,    		 m1IR) \
xx(xr16,    	 xr16IR) \
xx(xr182b,    	 xr182bIR) \
xx(xr18DH,    	 xr18DHIR) \
xx(xr18no,    	 xr18noIR) \
xx(xr18fl,    	 xr18flIR) \
xx(sparc/sun,    sparcIR) \
xx(sparc/solaris,solarisIR) \
xx(x86/win32,    x86IR) \
xx(x86/linux,    x86linuxIR) \
xx(symbolic/osf, symbolic64IR) \
xx(symbolic/irix,symbolicIR) \
xx(symbolic,     symbolicIR) \
xx(bytecode,     bytecodeIR) \
xx(null,         nullIR)

#undef xx
#define xx(a,b) extern Interface b;
yy

Binding bindings[] = {
#undef xx
#define xx(a,b) #a, &b,
yy
	NULL, NULL
};
#undef yy
#undef xx
