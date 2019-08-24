%{

/*
	This file is part of lcc-pdp11.md, an lcc machine description for PDP-11.
    Copyright (C) 2004-5 Toby Thain, toby@telegraphics.com.au

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by  
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License  
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

    Version history
    0.1b1, 16 Nov 2004
    0.2b1, 16 Nov 2004 - fix costs on CNST, EQ(BAND(),0)
    0.3b1, 16 Nov 2004 - fix local(), detect framesize==2 in function()
    0.4b1, 16 Nov 2004 - added rules for the BCOMU2(ADDU2(x,1)), lcc's "negate unsigned";
    					 put nonzero costs on INC/DEC rules
    0.5b2, 18 Nov 2004 - shift-by-8 optimisations
    0.6b1, 20 Nov 2004 - fix ASH generation bugs, register saving etc
    0.6b2, 20 Nov 2004 - strip out some "long" rules
    0.7b1,  5 Dec 2004 - delete costs for base address rules.
    					 also fix statics in function scope.
    0.7b2,  5 Dec 2004 - fix JMP/BR rules
    0.7b3,  5 Dec 2004 - improve handling of pointer constants (addresses of globals)
    0.7b4,  5 Dec 2004 - put all CALL variants in rules (don't use emit2)
*/

#include <stdlib.h>
#include "c.h"

#define INTTMP 0x07				/* temps R0/1/2 */
#define INTVAR (0x1f ^ INTTMP)	/* rvars R3/4 */
#define FLTTMP 0x03				/* temps AC0/1 */
#define FLTVAR (0x0f ^ FLTTMP)	/* vars AC2/3 ... not sure how we can use AC4/5 yet */

#define NODEPTR_TYPE Node
#define OP_LABEL(p) ((p)->op)
#define LEFT_CHILD(p) ((p)->kids[0])
#define RIGHT_CHILD(p) ((p)->kids[1])
#define STATE_LABEL(p) ((p)->x.state)

// Declare local routines to be used by IR record here
static void address(Symbol, Symbol, long);
static void blkfetch(int, int, int, int);
static void blkloop(int, int, int, int, int, int[]);
static void blkstore(int, int, int, int);
static void defaddress(Symbol);
static void defconst(int, int, Value);
static void defstring(int, char *);
static void defsymbol(Symbol);
static void doarg(Node);
static void emit2(Node);
static void export(Symbol);
static void clobber(Node);
static void function(Symbol, Symbol[], Symbol[], int);
static void global(Symbol);
static void import(Symbol);
static void local(Symbol);
static void progbeg(int, char **);
static void progend(void);
static void segment(int);
static void space(int);
static void target(Node);

static int memop(Node);
static int cnstrhs(Node);
static int sametree(Node,Node);

// Local vars here 

static Symbol ireg[32],lreg[32],freg[32],quo,rem,iregw,lregw,fregw;

static int cseg = -1;

%}

%start stmt

%term CNSTF4=4113 CNSTF8=8209
%term CNSTI1=1045 CNSTI2=2069 CNSTI4=4117
%term CNSTP2=2071
%term CNSTU1=1046 CNSTU2=2070 CNSTU4=4118

%term ARGB=41
%term ARGF4=4129 ARGF8=8225
%term ARGI2=2085 ARGI4=4133
%term ARGP2=2087
%term ARGU2=2086 ARGU4=4134

%term ASGNB=57
%term ASGNF4=4145 ASGNF8=8241
%term ASGNI1=1077 ASGNI2=2101 ASGNI4=4149
%term ASGNP2=2103
%term ASGNU1=1078 ASGNU2=2102 ASGNU4=4150

%term INDIRB=73
%term INDIRF4=4161 INDIRF8=8257
%term INDIRI1=1093 INDIRI2=2117 INDIRI4=4165
%term INDIRP2=2119
%term INDIRU1=1094 INDIRU2=2118 INDIRU4=4166

%term CVFF4=4209 CVFF8=8305
%term CVFI2=2165 CVFI4=4213

%term CVIF4=4225 CVIF8=8321
%term CVII1=1157 CVII2=2181 CVII4=4229
%term CVIU1=1158 CVIU2=2182 CVIU4=4230

%term CVPU2=2198

%term CVUI1=1205 CVUI2=2229 CVUI4=4277
%term CVUP2=2231
%term CVUU1=1206 CVUU2=2230 CVUU4=4278

%term NEGF4=4289 NEGF8=8385
%term NEGI2=2245 NEGI4=4293

%term CALLB=217
%term CALLF4=4305 CALLF8=8401
%term CALLI2=2261 CALLI4=4309
%term CALLP2=2263
%term CALLU2=2262 CALLU4=4310
%term CALLV=216

%term RETF4=4337 RETF8=8433
%term RETI2=2293 RETI4=4341
%term RETP2=2295
%term RETU2=2294 RETU4=4342
%term RETV=248

%term ADDRGP2=2311

%term ADDRFP2=2327

%term ADDRLP2=2343

%term ADDF4=4401 ADDF8=8497
%term ADDI2=2357 ADDI4=4405
%term ADDP2=2359
%term ADDU2=2358 ADDU4=4406

%term SUBF4=4417 SUBF8=8513
%term SUBI2=2373 SUBI4=4421
%term SUBP2=2375
%term SUBU2=2374 SUBU4=4422

%term LSHI2=2389 LSHI4=4437
%term LSHU2=2390 LSHU4=4438

%term MODI2=2405 MODI4=4453
%term MODU2=2406 MODU4=4454

%term RSHI2=2421 RSHI4=4469
%term RSHU2=2422 RSHU4=4470

%term BANDI2=2437 BANDI4=4485
%term BANDU2=2438 BANDU4=4486

%term BCOMI2=2453 BCOMI4=4501
%term BCOMU2=2454 BCOMU4=4502

%term BORI2=2469 BORI4=4517
%term BORU2=2470 BORU4=4518

%term BXORI2=2485 BXORI4=4533
%term BXORU2=2486 BXORU4=4534

%term DIVF4=4545 DIVF8=8641
%term DIVI2=2501 DIVI4=4549
%term DIVU2=2502 DIVU4=4550

%term MULF4=4561 MULF8=8657
%term MULI2=2517 MULI4=4565
%term MULU2=2518 MULU4=4566

%term EQF4=4577 EQF8=8673
%term EQI2=2533 EQI4=4581
%term EQU2=2534 EQU4=4582

%term GEF4=4593 GEF8=8689
%term GEI2=2549 GEI4=4597
%term GEU2=2550 GEU4=4598

%term GTF4=4609 GTF8=8705
%term GTI2=2565 GTI4=4613
%term GTU2=2566 GTU4=4614

%term LEF4=4625 LEF8=8721
%term LEI2=2581 LEI4=4629
%term LEU2=2582 LEU4=4630

%term LTF4=4641 LTF8=8737
%term LTI2=2597 LTI4=4645
%term LTU2=2598 LTU4=4646

%term NEF4=4657 NEF8=8753
%term NEI2=2613 NEI4=4661
%term NEU2=2614 NEU4=4662

%term JUMPV=584

%term LABELV=600

%term LOADB=233
%term LOADF4=4321 LOADF8=8417
%term LOADI1=1253 LOADI2=2277 LOADI4=4325
%term LOADP2=2279
%term LOADU1=1254 LOADU2=2278 LOADU4=4326

%term VREGP=711

%%

reg:	INDIRI1(VREGP)	"# read reg\n"	1
reg:	INDIRU1(VREGP)	"# read reg\n"	1
reg:	INDIRI2(VREGP)	"# read reg\n"	1
reg:	INDIRU2(VREGP)	"# read reg\n"	1
reg:	INDIRP2(VREGP)	"# read reg\n"	1
freg:	INDIRF4(VREGP)	"# read reg\n"	1
freg:	INDIRF8(VREGP)	"# read reg\n"	1

stmt:	ASGNI1(VREGP,reg)	"# write reg\n"	1
stmt:	ASGNU1(VREGP,reg)	"# write reg\n"	1
stmt:	ASGNI2(VREGP,reg)	"# write reg\n"	1
stmt:	ASGNU2(VREGP,reg)	"# write reg\n"	1
stmt:	ASGNP2(VREGP,reg)	"# write reg\n"	1
stmt:	ASGNF4(VREGP,freg)	"# write reg\n"	1
stmt:	ASGNF8(VREGP,freg)	"# write reg\n"	1

reg:	LOADB(reg)		"# foo\n"
freg:	LOADF4(freg)	"ldf %0,%c\n"			move(a)
freg:	LOADF8(freg)	"ldd %0,%c\n"			move(a)
reg:	LOADI1(reg)		"movb %0,%c ; LOADI1\n"	move(a)
reg:	LOADU1(reg)		"movb %0,%c ; LOADU1\n"	move(a)
reg:	LOADI2(reg)		"mov %0,%c ; LOADI2\n"	move(a)
reg:	LOADU2(reg)		"mov %0,%c ; LOADU2\n"	move(a)
reg:	LOADP2(reg)		"mov %0,%c ; LOADP2\n"	move(a)

stmt:	reg		""

con:	CNSTI1	"%a"	1
con:	CNSTU1	"%a"	1
con:	CNSTI2	"%a"	1
con:	CNSTU2	"%a"	1
con:	CNSTP2	"%a"	1
con:	addrg	"%a"	1

con0:	CNSTI1	"%a"	range(a,0,0)
con0:	CNSTU1	"%a"	range(a,0,0)
con0:	CNSTI2	"%a"	range(a,0,0)
con0:	CNSTU2	"%a" 	range(a,0,0)
con0:	CNSTP2	"%a" 	range(a,0,0)

con1:	CNSTI2	"%a" 	range(a,1,1)
con1:	CNSTU2	"%a" 	range(a,1,1)
con2:	CNSTI2	"%a" 	range(a,2,2)
con2:	CNSTU2	"%a" 	range(a,2,2)
con8:	CNSTI2	"%a" 	range(a,8,8)
con8:	CNSTU2	"%a" 	range(a,8,8)

conm1:	CNSTI2	"%a"	range(a,-1,-1)
consh:	CNSTI2	"%a"	range(a,0,31)
consh:	CNSTU2	"%a"	range(a,0,31)
consc:	CNSTI2	"%a"	range(a,-128,127)

addr:	ADDRGP2			"%a"
addr:	ADDRLP2			"%a(fp)"
addr:	ADDRFP2			"%a(fp)"
addr:	reg				"(%0)"
addr:	ADDU2(reg,con)	"%1 (%0)"
addr:	ADDI2(reg,con)	"%1 (%0)"
addr:	ADDP2(reg,con)	"%1 (%0)"

addrg:	ADDRGP2			"%a"
addrf:	ADDRLP2			"%a"
addrf:	ADDRFP2			"%a"

mem:	addr			"%0"
mem:	INDIRP2(addr)	"@ %0"

reg:	ADDRGP2	"mov # %a,%c ; reg <- ADDRGP2\n"	6
reg:	ADDRLP2	"mov fp,%c\nadd # %a,%c\n"			6
reg:	ADDRFP2	"mov fp,%c\nadd # %a,%c\n"			6
reg:	con0	"clr %c\n"	2
reg:	opd		"mov %0,%c ; reg <- opd\n" 5

opd:	con				" #%0"	2
opd:	reg				"%0"	2
opd:	INDIRI1(mem)	"%0"
opd:	INDIRU1(mem)	"%0"
opd:	INDIRI2(mem)	"%0"
opd:	INDIRU2(mem)	"%0"
opd:	INDIRP2(mem)	"%0"

fopd:	INDIRF4(mem)	"ldf %0,%c\n"
dopd:	INDIRF8(mem)	"ldd %0,%c\n"
fopd:	CNSTF4	" #%a"
dopd:	CNSTF8	" #%a"
fopd:	freg	"%0"
dopd:	freg	"%0"

freg:	fopd	"ldf %0,%c\n"
freg:	dopd	"ldd %0,%c\n"

stmt:	ASGNB(reg,INDIRB(reg))	"# use emit2\n"

stmt:	ASGNI1(mem,opd)		"movb %1,%0 ; ASGNI1\n"	5
stmt:	ASGNU1(mem,opd)		"movb %1,%0 ; ASGNU1\n"	5
stmt:	ASGNI1(mem,con0)	"clrb %0 ; ASGNI1\n"	3
stmt:	ASGNU1(mem,con0)	"clrb %0 ; ASGNU1\n"	3

stmt:	ASGNI2(mem,opd)		"mov %1,%0 ; ASGNI2\n"	5
stmt:	ASGNU2(mem,opd)		"mov %1,%0 ; ASGNU2\n"	5
stmt:	ASGNP2(mem,opd)		"mov %1,%0 ; ASGNP2\n"	5
stmt:	ASGNI2(mem,con0)	"clr %0 ; ASGNI2\n"		2
stmt:	ASGNU2(mem,con0)	"clr %0 ; ASGNU2\n"		2
stmt:	ASGNP2(mem,con0)	"clr %0 ; ASGNP2\n"		2

stmt:	ASGNF4(mem,fopd)	"stf %1,%0 ; ASGNF4\n"	5
stmt:	ASGNF8(mem,dopd)	"stf %1,%0 ; ASGNF8\n"	5

stmt:	ASGNI2(mem,NEGI2(opd))			"neg %0\n"		memop(a)

stmt:	ASGNI2(mem,ADDI2(opd,opd))		"add %2,%0\n"	2|memop(a)
stmt:	ASGNU2(mem,ADDU2(opd,opd))		"add %2,%0\n"	2|memop(a)
stmt:	ASGNP2(mem,ADDP2(opd,opd))		"add %2,%0\n"	2|memop(a)
stmt:	ASGNI2(mem,ADDI2(opd,con1))		"inc %0\n"		memop(a)
stmt:	ASGNU2(mem,ADDU2(opd,con1))		"inc %0\n"		memop(a)
stmt:	ASGNP2(mem,ADDP2(opd,con1))		"inc %0\n"		memop(a)
stmt:	ASGNI2(mem,ADDI2(opd,conm1))	"dec %0\n"		memop(a)
stmt:	ASGNU2(mem,ADDU2(opd,conm1))	"dec %0\n"		memop(a)
stmt:	ASGNP2(mem,ADDP2(opd,conm1))	"dec %0\n"		memop(a)

stmt:	ASGNI2(mem,SUBI2(opd,opd))		"sub %2,%0\n"	2|memop(a)
stmt:	ASGNU2(mem,SUBU2(opd,opd))		"sub %2,%0\n"	2|memop(a)
stmt:	ASGNP2(mem,SUBP2(opd,opd))		"sub %2,%0\n"	2|memop(a)
stmt:	ASGNI2(mem,SUBI2(opd,con1))		"dec %0\n"		memop(a)
stmt:	ASGNU2(mem,SUBU2(opd,con1))		"dec %0\n"		memop(a)
stmt:	ASGNP2(mem,SUBP2(opd,con1))		"dec %0\n"		memop(a)

stmt:	ASGNI2(mem,LSHI2(opd,con1))		"asl %0\n"		memop(a)
stmt:	ASGNU2(mem,LSHU2(opd,con1))		"asl %0\n"		memop(a)
stmt:	ASGNI2(mem,LSHI2(opd,con8))		"swab %0\nclrb %0\n"		memop(a)
stmt:	ASGNU2(mem,LSHU2(opd,con8))		"swab %0\nclrb %0\n"		memop(a)

stmt:	ASGNI2(mem,RSHI2(opd,con1))		"asr %0\n"		memop(a)
stmt:	ASGNU2(mem,RSHU2(opd,con1))		"clc\nror %0\n"	memop(a)
stmt:	ASGNU2(mem,RSHU2(opd,con8))		"clrb %0\nswab %0\n"	memop(a)
stmt:	ASGNI2(mem,DIVI2(opd,con2))		"asr %0\n"		memop(a)
stmt:	ASGNU2(mem,DIVU2(opd,con2))		"clc\nror %0\n"	memop(a)

stmt:	ASGNI2(mem,BANDI2(opd,reg))		"com %2 ; ASGNI2\nbic %2,%0 ; ASGNI2\ncom %2 ; ASGNI2\n" 4|memop(a)
stmt:	ASGNU2(mem,BANDU2(opd,reg))		"com %2 ; ASGNI2\nbic %2,%0 ; ASGNI2\ncom %2 ; ASGNI2\n" 4|memop(a)
stmt:	ASGNI2(mem,BANDI2(opd,BCOMI2(opd)))	"bic %2,%0\n" memop(a)
stmt:	ASGNI2(mem,BANDU2(opd,BCOMU2(opd)))	"bic %2,%0\n" memop(a)

stmt:	ASGNI2(mem,BORI2(opd,opd))		"bis %2,%0\n"	memop(a)
stmt:	ASGNU2(mem,BORU2(opd,opd))		"bis %2,%0\n"	memop(a)

stmt:	ASGNI2(mem,BXORI2(opd,reg))		"xor %2,%0\n"	memop(a)
stmt:	ASGNU2(mem,BXORU2(opd,reg))		"xor %2,%0\n"	memop(a)

stmt:	ASGNI2(mem,BCOMI2(opd))			"com %0\n"		memop(a)
stmt:	ASGNU2(mem,BCOMU2(opd))			"com %0\n"		memop(a)


stmt:	ARGI2(opd)			"mov %0,-(sp) ; ARGI2\n"	2
stmt:	ARGU2(opd)			"mov %0,-(sp) ; ARGU2\n"	2
stmt:	ARGP2(opd)			"mov %0,-(sp) ; ARGP2\n"	2
stmt:	ARGI2(CVII2(opd))	"movb %0,-(sp) ; ARGI2(CVII2)\n"
stmt:	ARGU2(CVIU2(opd))	"movb %0,-(sp) ; ARGU2(CVIU2)\n"
stmt:	ARGI2(CVUI2(opd))	"clr -(sp)\nbisb %0,(sp) ; ARGI2(CVUI2)\n"
stmt:	ARGU2(CVUU2(opd))	"clr -(sp)\nbisb %0,(sp) ; ARGU2(CVUU2)\n"
stmt:	ARGI2(con0)			"clr -(sp) ; ARGI2\n"
stmt:	ARGU2(con0)			"clr -(sp) ; ARGU2\n"
stmt:	ARGP2(con0)			"clr -(sp) ; ARGP2\n"

stmt:	ARGF4(fopd)			"stf %0,-(sp) ; ARGF4\n"
stmt:	ARGF8(dopd)			"std %0,-(sp) ; ARGF8\n"

stmt:	ARGI2(ADDI2(opd,opd))			"mov %0,-(sp)\nadd %1,(sp) ; ARGI2(ADDI1)\n"	3
stmt:	ARGU2(ADDU2(opd,opd))			"mov %0,-(sp)\nadd %1,(sp) ; ARGU2(ADDU2)\n"	3
stmt:	ARGP2(ADDP2(opd,opd))			"mov %0,-(sp)\nadd %1,(sp) ; ARGP2(ADDP2)\n"	3
stmt:	ARGI2(ADDI2(opd,con1))			"mov %0,-(sp)\ninc (sp) ; ARGI2(ADDI1)\n"
stmt:	ARGI2(ADDI2(CVII2(opd),con1))	"movb %0,-(sp)\ninc (sp) ; ARGI2(ADDI2(CVII2))\n"
stmt:	ARGU2(ADDU2(CVIU2(opd),con1))	"movb %0,-(sp)\ninc (sp) ; ARGU2(ADDU2(CVIU2))\n"
stmt:	ARGI2(ADDI2(CVUI2(opd),con1))	"clr -(sp)\nbisb %0,(sp)\ninc (sp) ; ARGI2(ADDI2(CVUI2))\n"
stmt:	ARGU2(ADDU2(CVUU2(opd),con1))	"clr -(sp)\nbisb %0,(sp)\ninc (sp) ; ARGU2(ADDU2(CVUU2))\n"
stmt:	ARGU2(ADDU2(opd,con1))			"mov %0,-(sp)\ninc (sp) ; ARGU2(ADDU2)\n"
stmt:	ARGU2(ADDU2(BCOMU2(opd),con1))	"mov %0,-(sp)\nneg (sp) ; ARGU2(ADDU2(BCOMU2(opd),1))\n"
stmt:	ARGP2(ADDP2(opd,con1))			"mov %0,-(sp)\ninc (sp) ; ARGP2(ADDP2)\n"
stmt:	ARGP2(ADDP2(opd,conm1))			"mov %0,-(sp)\ndec (sp) ; ARGP2(ADDP2)\n"
stmt:	ARGI2(SUBI2(opd,opd))			"mov %0,-(sp)\nsub %1,(sp) ; ARGI2(SUBI1)\n"	3
stmt:	ARGU2(SUBU2(opd,opd))			"mov %0,-(sp)\nsub %1,(sp) ; ARGU2(SUBU2)\n"	3
stmt:	ARGP2(SUBP2(opd,opd))			"mov %0,-(sp)\nsub %1,(sp) ; ARGP2(SUBP2)\n"	3
stmt:	ARGI2(SUBI2(opd,con1))			"mov %0,-(sp)\ndec (sp) ; ARGI2(SUBI1)\n"
stmt:	ARGU2(SUBU2(opd,con1))			"mov %0,-(sp)\ndec (sp) ; ARGU2(SUBU2)\n"
stmt:	ARGP2(SUBP2(opd,con1))			"mov %0,-(sp)\ndec (sp) ; ARGP2(SUBP2)\n"
stmt:	ARGI2(SUBI2(CVII2(opd),con1))	"movb %0,-(sp)\ndec (sp) ; ARGI2(SUBI2(CVII2))\n"
stmt:	ARGU2(SUBU2(CVIU2(opd),con1))	"movb %0,-(sp)\ndec (sp) ; ARGU2(SUBU2(CVIU2))\n"
stmt:	ARGI2(SUBI2(CVUI2(opd),con1))	"clr -(sp)\nbisb %0,(sp)\ndec (sp) ; ARGI2(SUBI2(CVUI2))\n"
stmt:	ARGU2(SUBU2(CVUU2(opd),con1))	"clr -(sp)\nbisb %0,(sp)\ndec (sp) ; ARGU2(SUBU2(CVUU2))\n"
stmt:	ARGI2(BORI2(opd,opd))			"mov %0,-(sp)\nbis %1,(sp) ; ARGI2(BORI2)\n"	3
stmt:	ARGI2(BANDI2(reg,con))			"# give to emit2\n"
stmt:	ARGU2(BANDU2(reg,con))			"# give to emit2\n"
stmt:	ARGU2(BORU2(opd,opd))			"mov %0,-(sp)\nbis %1,(sp) ; ARGU2(BORU2)\n"	3
stmt:	ARGI2(BXORI2(opd,reg))			"mov %0,-(sp)\nxor %1,(sp) ; ARGI2(BXORI2)\n"
stmt:	ARGU2(BXORU2(opd,reg))			"mov %0,-(sp)\nxor %1,(sp) ; ARGU2(BXORU2)\n"
stmt:	ARGI2(LSHI2(opd,con1))			"mov %0,-(sp)\nasl (sp) ; ARGI2(LSHI2)\n"
stmt:	ARGU2(LSHU2(opd,con1))			"mov %0,-(sp)\nasl (sp) ; ARGU2(LSHU2)\n"
stmt:	ARGI2(MULI2(opd,con2))			"mov %0,-(sp)\nasl (sp) ; ARGI2(MULI2)\n"
stmt:	ARGU2(MULU2(opd,con2))			"mov %0,-(sp)\nasl (sp) ; ARGU2(MULU2)\n"
stmt:	ARGI2(RSHI2(opd,con1))			"mov %0,-(sp)\nasr (sp) ; ARGI2(RSHI2)\n"
stmt:	ARGU2(RSHU2(opd,con1))			"mov %0,-(sp)\nclc\nror (sp) ; ARGU2(RSHU2)\n"
stmt:	ARGI2(DIVI2(opd,con2))			"mov %0,-(sp)\nasr (sp) ; ARGI2(DIVI2)\n"
stmt:	ARGU2(DIVU2(opd,con2))			"mov %0,-(sp)\nclc\nror (sp) ; ARGU2(DIVU2)\n"
stmt:	ARGI2(NEGI2(opd))				"mov %0,-(sp)\nneg (sp) ; ARGI2(NEGI2)\n"
stmt:	ARGI2(BCOMI2(opd))				"mov %0,-(sp)\ncom (sp) ; ARGI2(BCOMI2)\n"
stmt:	ARGU2(BCOMU2(opd))				"mov %0,-(sp)\ncom (sp) ; ARGU2(BCOMU2)\n"

stmt:	ARGP2(addrf)	"mov fp,-(sp)\nadd #%0,(sp) ; ARGP2(frame)\n"

freg:	CALLF4(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
freg:	CALLF4(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
freg:	CALLF4(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
freg:	CALLF4(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2
freg:	CALLF8(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
freg:	CALLF8(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
freg:	CALLF8(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
freg:	CALLF8(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2

reg:	CALLI2(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
reg:	CALLI2(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
reg:	CALLI2(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
reg:	CALLI2(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2
reg:	CALLU2(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
reg:	CALLU2(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
reg:	CALLU2(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
reg:	CALLU2(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2
reg:	CALLP2(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
reg:	CALLP2(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
reg:	CALLP2(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
reg:	CALLP2(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2

stmt:	CALLV(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
stmt:	CALLV(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
stmt:	CALLV(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
stmt:	CALLV(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2
stmt:	CALLB(mem)	"jsr pc,%0\n"								(a->syms[0]->u.c.v.u == 0 ? 1 : LBURG_MAX)
stmt:	CALLB(mem)	"jsr pc,%0\ntst (sp)+ ; pop args\n"			(a->syms[0]->u.c.v.u == 2 ? 1 : LBURG_MAX)
stmt:	CALLB(mem)	"jsr pc,%0\ncmp (sp)+,(sp)+ ; pop args\n"	(a->syms[0]->u.c.v.u == 4 ? 1 : LBURG_MAX)
stmt:	CALLB(mem)	"jsr pc,%0\nadd #%a,sp ; pop args\n"		2

stmt:	RETF4(freg)	"# RETF4\n"
stmt:	RETF8(freg)	"# RETF8\n"
stmt:	RETI2(reg)	"# RETI2\n"
stmt:	RETU2(reg)	"# RETU2\n"
stmt:	RETP2(reg)	"# RETP2\n"
stmt:	RETV		"# RETV\n"

freg:	CVFF4(dopd)	"ldcdf %0,%c\n"
freg:	CVFF8(fopd)	"ldcfd %0,%c\n"
reg:	CVFI2(freg)	"stcdi %0,%c\n"
reg:	CVFI4(freg)	"stcdl %0,%c\n"
freg:	CVIF4(reg)	"ldcif %0,%c\n"
freg:	CVIF8(reg)	"ldcid %0,%c\n"

reg:	CVII1(reg)	"mov %0,%c ; CVII1\n" move(a)
reg:	CVIU1(reg)	"mov %0,%c ; CVIU1\n" move(a)
reg:	CVUI1(reg)	"mov %0,%c ; CVUI1\n" move(a)
reg:	CVUU1(reg)	"mov %0,%c ; CVUU1\n" move(a)
reg:	CVII2(opd)	"movb %0,%c ; CVII2\n"	5
reg:	CVIU2(opd)	"movb %0,%c ; CVIU2\n"	5
reg:	CVPU2(reg)	"mov %0,%c ; CVPU2\n" move(a)
reg:	CVUP2(reg)	"mov %0,%c ; CVUP2\n" move(a)
reg:	CVUI2(opd)	"movb %0,%c ; CVUI2\nbic #^o-400,%c ; CVUI2\n"	6
reg:	CVUU2(opd)	"movb %0,%c ; CVUU2\nbic #^o-400,%c ; CVUU2\n"	6

reg:	NEGI2(reg)	"?mov %0,%c\nneg %c\n"	3
freg:	NEGF4(freg)	"?ldf %0,%c\nnegf %c\n"
freg:	NEGF8(freg)	"?ldd %0,%c\nnegd %c\n"

reg:	ADDI2(reg,opd)		"?mov %0,%c\nadd %1,%c\n"	5
reg:	ADDU2(reg,opd)		"?mov %0,%c\nadd %1,%c\n"	5
reg:	ADDP2(reg,opd)		"?mov %0,%c\nadd %1,%c\n"	5
reg:	ADDI2(reg,con1)		"?mov %0,%c\ninc %c\n"	3
reg:	ADDU2(reg,con1)		"?mov %0,%c\ninc %c\n"	3
reg:	ADDP2(reg,con1)		"?mov %0,%c\ninc %c\n"	3
reg:	ADDI2(reg,conm1)	"?mov %0,%c\ndec %c\n"	3
reg:	ADDU2(reg,conm1)	"?mov %0,%c\ndec %c\n"	3
reg:	ADDP2(reg,conm1)	"?mov %0,%c\ndec %c\n"	3

freg:	ADDF4(freg,fopd)	"?ldf %0,%c\naddf %1,%c\n"
freg:	ADDF8(freg,dopd)	"?ldd %0,%c\naddd %1,%c\n"

reg:	SUBI2(reg,opd)		"?mov %0,%c\nsub %1,%c\n"	5
reg:	SUBU2(reg,opd)		"?mov %0,%c\nsub %1,%c\n"	5
reg:	SUBP2(reg,opd)		"?mov %0,%c\nsub %1,%c\n"	5
reg:	SUBI2(reg,con1)		"?mov %0,%c\ndec %c\n"	3
reg:	SUBU2(reg,con1)		"?mov %0,%c\ndec %c\n"	3
reg:	SUBP2(reg,con1)		"?mov %0,%c\ndec %c\n"	3

freg:	SUBF4(freg,fopd)	"?ldf %0,%c\nsubf %1,%c\n"
freg:	SUBF8(freg,dopd)	"?ldd %0,%c\nsubd %1,%c\n"

reg:	LSHI2(reg,opd)		"?mov %0,%c\nash %1,%c\n"	6
reg:	LSHU2(reg,opd)		"?mov %0,%c\nash %1,%c\n"	6
reg:	LSHI2(reg,consh)	"?mov %0,%c\nash #%1,%c\n"	6
reg:	LSHU2(reg,consh)	"?mov %0,%c\nash #%1,%c\n"	6
reg:	LSHI2(reg,con1)		"?mov %0,%c\nasl %c\n"	3
reg:	LSHU2(reg,con1)		"?mov %0,%c\nasl %c\n"	3
reg:	LSHI2(reg,con8)		"?mov %0,%c\nswab %c\nclrb %c\n"	5
reg:	LSHU2(reg,con8)		"?mov %0,%c\nswab %c\nclrb %c\n"	5

reg:	RSHI2(reg,opd)		"?mov %0,%c\n$RSHI %1,%c\n"	6
reg:	RSHU2(reg,opd)		"?mov %0,%c\n$RSHU %1,%c\n"	6
reg:	RSHI2(reg,consh)	"?mov %0,%c\nash #-%1,%c\n"	6
reg:	RSHU2(reg,consh)	"?mov %0,%c\nash #-%1,%c\n"	6
reg:	RSHI2(reg,con1)		"?mov %0,%c\nasr %c\n"	3
reg:	RSHU2(reg,con1)		"?mov %0,%c\nclc\nror %c\n"	3
reg:	RSHU2(reg,con8)		"?mov %0,%c\nclrb %c\nswab %c\n"	5
reg:	RSHI2(reg,consh)	"?mov %0,%c\nash #-%1,%c\n"	3
reg:	RSHU2(reg,consh)	"# emit2 does shift and mask\n"	3

reg:	BANDI2(reg,reg)			"?mov %0,%c ; BANDI2\ncom %1 ; BANDI2\nbic %1,%c ; BANDI2\ncom %1 ; BANDI2\n"	8
reg: 	BANDU2(reg,reg)			"?mov %0,%c ; BANDU2\ncom %1 ; BANDU2\nbic %1,%c ; BANDU2\ncom %1 ; BANDU2\n"	8
reg:	BANDI2(reg,con)			"# emit2 helps out\n"
reg: 	BANDU2(reg,con)			"# emit2 helps out\n"
reg:	BANDI2(reg,BCOMI2(opd))	"?mov %0,%c\nbic %1,%c\n"
reg:	BANDU2(reg,BCOMU2(opd))	"?mov %0,%c\nbic %1,%c\n"
reg:	BANDI2(CVUI2(reg),con)	"# job for emit2\n"
reg:	BANDU2(CVUU2(reg),con)	"# job for emit2\n"
reg:	BANDU2(RSHU2(reg,consh),con)	"# emit2 does shift and mask\n"

reg:	BORI2(reg,opd)	"?mov %0,%c\nbis %1,%c\n"
reg: 	BORU2(reg,opd)	"?mov %0,%c\nbis %1,%c\n"

reg:	BXORI2(reg,reg)	"?mov %0,%c\nxor %1,%c\n"
reg: 	BXORU2(reg,reg)	"?mov %0,%c\nxor %1,%c\n"

reg:	BCOMI2(reg)		"?mov %0,%c\ncom %c\n"	2
reg: 	BCOMU2(reg)		"?mov %0,%c\ncom %c\n"	2

reg:	DIVI2(reg,opd)	"tst r1 ; DIVI2\nsxt r0 ; DIVI2\ndiv %1,r0 ; DIVI2\n"	16
reg:	DIVU2(reg,reg)	"jsr pc,$DIVU ; DIVU2\n"
reg:	DIVI2(reg,con2)	"?mov %0,%c\nasr %c\n"
reg:	DIVU2(reg,con2)	"?mov %0,%c\nclc\nror %c\n"

freg:	DIVF4(freg,fopd)	"?ldf %0,%c\ndivf %1,%c\n"
freg:	DIVF8(freg,dopd)	"?ldd %0,%c\ndivd %1,%c\n"

reg: 	MODI2(reg,opd)	"tst r1 ; MODI2\nsxt r0 ; MODI2\ndiv %1,r0 ; MODI2\n"
reg: 	MODU2(reg,reg)	"jsr pc,$DIVU ; MODU2\n"

reg:	MULI2(reg,opd)	"mul %1,r1 ; MULI2\n"
reg:	MULU2(reg,opd)	"mul %1,r1 ; MULU2\n"

freg:	MULF4(freg,fopd)	"?ldf %0,%c\nmulf %1,%c\n"
freg:	MULF8(freg,dopd)	"?ldd %0,%c\nmuld %1,%c\n"

stmt:	EQI2(opd,opd)	"cmp %0,%1\nbeq %a\n"				8
stmt:	EQU2(opd,opd)	"cmp %0,%1\nbeq %a\n"				8
stmt:	EQI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nbeq %a\n"	5
stmt:	EQI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nbeq %a\n"	5
stmt:	EQI2(CVII2(opd),consc)		"cmpb %0,#%1\nbeq %a\n"		5
stmt:	EQI2(opd,con0)	"tst %0\nbeq %a\n"					3
stmt:	EQU2(opd,con0)	"tst %0\nbeq %a\n"					3
stmt:	EQI2(CVII2(opd),con0)		"tstb %0\nbeq %a\n"			3
stmt:	EQI2(CVUI2(opd),con0)		"tstb %0\nbeq %a\n"			3
stmt:	EQI2(BANDI2(opd,opd),con0)	"bit %1,%0\nbeq %a\n"
stmt:	EQU2(BANDU2(opd,opd),con0)	"bit %1,%0\nbeq %a\n"
stmt:	EQI2(BANDI2(CVII2(opd),opd),con0)	"bitb %1,%0\nbeq %a\n"
stmt:	EQI2(BANDI2(CVUI2(opd),opd),con0)	"bitb %1,%0\nbeq %a\n"
stmt:	EQU2(BANDU2(CVIU2(opd),opd),con0)	"bitb %1,%0\nbeq %a\n"
stmt:	EQU2(BANDU2(CVUU2(opd),opd),con0)	"bitb %1,%0\nbeq %a\n"

stmt:	EQF4(freg,fopd)	"cmpf %0,%1\nbeq %a\n"				8
stmt:	EQF8(freg,dopd)	"cmpd %0,%1\nbeq %a\n"				8

stmt:	NEI2(opd,opd)	"cmp %0,%1\nbne %a\n"				8
stmt:	NEU2(opd,opd)	"cmp %0,%1\nbne %a\n"				8
stmt:	NEI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nbne %a\n"	5
stmt:	NEI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nbne %a\n"	5
stmt:	NEI2(CVII2(opd),consc)		"cmpb %0,#%1\nbne %a\n"		5	
stmt:	NEI2(opd,con0)	"tst %0\nbne %a\n"					3
stmt:	NEU2(opd,con0)	"tst %0\nbne %a\n"					3
stmt:	NEI2(CVII2(opd),con0)		"tstb %0\nbne %a\n"			3
stmt:	NEI2(CVUI2(opd),con0)		"tstb %0\nbne %a\n"			3
stmt:	NEI2(BANDI2(opd,opd),con0)	"bit %1,%0\nbne %a\n"
stmt:	NEU2(BANDU2(opd,opd),con0)	"bit %1,%0\nbne %a\n"
stmt:	NEI2(BANDI2(CVII2(opd),opd),con0)	"bitb %1,%0\nbne %a\n"
stmt:	NEI2(BANDI2(CVUI2(opd),opd),con0)	"bitb %1,%0\nbne %a\n"
stmt:	NEU2(BANDU2(CVIU2(opd),opd),con0)	"bitb %1,%0\nbne %a\n"
stmt:	NEU2(BANDU2(CVUU2(opd),opd),con0)	"bitb %1,%0\nbne %a\n"

stmt:	NEF4(freg,fopd)	"cmpf %0,%1\nbne %a\n"				8
stmt:	NEF8(freg,dopd)	"cmpd %0,%1\nbne %a\n"				8

stmt:	LTI2(opd,opd)	"cmp %0,%1\nblt %a\n"				8
stmt:	LTU2(opd,opd)	"cmp %0,%1\nblo %a\n"				8
stmt:	LTI2(opd,con0)	"tst %0\nbmi %a\n"
stmt:	LTI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nblt %a\n"
stmt:	LTI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nblo %a\n"
stmt:	LTI2(CVII2(opd),consc)		"cmpb %0,#%1\nblt %a\n"		5
stmt:	LTI2(CVII2(opd),con0)		"tstb %0\nbmi %a\n"

stmt:	LTF4(freg,fopd)	"cmpf %0,%1\nblt %a\n"				8
stmt:	LTF8(freg,dopd)	"cmpd %0,%1\nblt %a\n"				8

stmt:	LEI2(opd,opd)	"cmp %0,%1\nble %a\n"				8
stmt:	LEU2(opd,opd)	"cmp %0,%1\nblos %a\n"				8
stmt:	LEI2(opd,con0)	"tst %0\nble %a\n"
stmt:	LEU2(opd,con0)	"tst %0\nbeq %a\n"
stmt:	LEI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nble %a\n"
stmt:	LEI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nblos %a\n"
stmt:	LEI2(CVII2(opd),consc)		"cmpb %0,#%1\nble %a\n"		5
stmt:	LEI2(CVII2(opd),con0)		"tstb %0\nble %a\n"
stmt:	LEI2(CVUI2(opd),con0)		"tstb %0\nbeq %a\n"

stmt:	LEF4(freg,fopd)	"cmpf %0,%1\nble %a\n"				8
stmt:	LEF8(freg,dopd)	"cmpd %0,%1\nble %a\n"				8

stmt:	GTI2(opd,opd)	"cmp %0,%1\nbgt %a\n"				8
stmt:	GTU2(opd,opd)	"cmp %0,%1\nbhi %a\n"				8
stmt:	GTI2(opd,con0)	"tst %0\nbgt %a\n"
stmt:	GTU2(opd,con0)	"tst %0\nbne %a\n"
stmt:	GTI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nbgt %a\n"
stmt:	GTI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nbhi %a\n"
stmt:	GTI2(CVII2(opd),consc)		"cmpb %0,#%1\nbgt %a\n"		5
stmt:	GTI2(CVII2(opd),con0)		"tstb %0\nbgt %a\n"
stmt:	GTI2(CVUI2(opd),con0)		"tstb %0\nbne %a\n"

stmt:	GTF4(freg,fopd)	"cmpf %0,%1\nbgt %a\n"				8
stmt:	GTF8(freg,dopd)	"cmpd %0,%1\nbgt %a\n"				8

stmt:	GEI2(opd,opd)	"cmp %0,%1\nbge %a\n"				8
stmt:	GEU2(opd,opd)	"cmp %0,%1\nbhis %a\n"				8
stmt:	GEI2(opd,con0)	"tst %0\nbpl %a\n"
stmt:	GEI2(CVII2(opd),CVII2(opd))	"cmpb %0,%1\nbge %a\n"
stmt:	GEI2(CVUI2(opd),CVUI2(opd))	"cmpb %0,%1\nbhis %a\n"
stmt:	GEI2(CVII2(opd),consc)		"cmpb %0,#%1\nbge %a\n"		5
stmt:	GEI2(CVII2(opd),con0)		"tstb %0\nbpl %a\n"

stmt:	GEF4(freg,fopd)	"cmpf %0,%1\nbge %a\n"				8
stmt:	GEF8(freg,dopd)	"cmpd %0,%1\nbge %a\n"				8

stmt:	JUMPV(addrg) 	"br %0\n"
stmt:	JUMPV(mem) 		"jmp %0\n"	2

stmt:	LABELV 			"%a:\n"

%%

/* fp instrs:
absf/d
addd
cfcc
clrf/d
cmpf/d
divf/d
ldcdf/fd
ldcif/d
ldclf/d
ldexp
ldf/d
ldfps
modf/d
mulf/d
negf/d
setf/d
seti/l
stcfd/df
stcfi/l
stcdi/l
stexp
stf/d
stfps
stst
subf/d
tstf/d
*/

static int memop(Node p) {
	assert( p && generic(p->op) == ASGN );
	assert( p->kids[0] && p->kids[1] && p->kids[1]->kids[0] );
	if (generic(p->kids[1]->kids[0]->op) == INDIR
	&& sametree(p->kids[0], p->kids[1]->kids[0]->kids[0]))
		return 1;
	else
		return LBURG_MAX;
}

static int cnstrhs(Node p) {
	assert(p && p->kids[1]);
	return generic(p->kids[1]->op) == CNST ? 1 : LBURG_MAX;
}

static int sametree(Node p, Node q) {
	return (p == NULL && q == NULL)
		|| (p && q && p->op == q->op && p->syms[0] == q->syms[0]
			&& sametree(p->kids[0], q->kids[0])
			&& sametree(p->kids[1], q->kids[1]));
}

int ispower2(int x){ /* returns 1 if x is a power of two */
	return !(x & (x-1));
}
int firstbit(int x){ /* returns index of highest bit set (lsb=0) */
	int b;
	for( b = 0 ; x >>= 1 ; )
		++b;
	return b;
}

static void progbeg(int argc, char *argv[]) {
	int i;

    parseflags(argc, argv);

	print("; PDP-11 assembly generated by lcc 4.2\n");
	print("; assemble with MACRO-11\n");
	print(".INCLUDE /LCC.MLB/\n");
	//print(".MCALL $CPYB,$CPYW,$LSH,$RSHI,$RSHU\n");
	print(".RADIX 10\n");
	print("fp=%%5 ; R5 is frame pointer\n");
	print(".ENABL LSB ; file-wide local symbols\n\n");
	//print(".LIST ME ; list macro expansions\n\n");

	for(i=0;i<=7;++i){
		ireg[i] = mkreg("r%d",i,1,IREG);
		freg[i] = mkreg("ac%d",i,1,FREG);
	}

	//quo = mkreg("r0",0,1,IREG); quo->x.regnode->mask |= 2;
	//rem = mkreg("r1",1,1,IREG); rem->x.regnode->mask |= 1;

	for(i=0;i<=3;++i){
		lreg[i] = mkreg("%%%d",i*2,3,IREG);
	}
	tmask[FREG] = FLTTMP; vmask[FREG] = FLTVAR;
	tmask[IREG] = INTTMP; vmask[IREG] = INTVAR;

	iregw = mkwildcard(ireg);
	lregw = mkwildcard(lreg);
	fregw = mkwildcard(freg);
}

static Symbol rmap(int opk) {
	switch (optype(opk)) {
	case B: 
	case P:
		return iregw;
	case I: 
	case U:
		return opsize(opk)==2 ? iregw : 0;
	case F: 
		return fregw;
	default:
		return 0;
	}
}

static void segment(int n) {
/* put everything in default PSECT for now
	if(n != cseg)
		switch(cseg = n){
		case CODE: print(".PSECT\n"); break;
		case BSS: print(".PSECT BSS\n"); break;
		case DATA: print(".PSECT DATA\n"); break;
		case LIT: print(".PSECT LIT\n"); break;
		}
*/
}

static void progend(void) {
    print(".END\n");
}

#define INTCONST(P,V) ( generic(P->op)==CNST && \
	 ( (optype(P->op)==I && P->syms[0]->u.c.v.i==V) \
	|| (optype(P->op)==U && P->syms[0]->u.c.v.u==V) ) )

static void target(Node p) {
	int op = specific(p->op);
	assert(p);
	switch (op) {
	case MUL+I: case MUL+U:
		/*	[ Re,o means the register pair Rn (even) and Rn+1 (odd) ]
			both multiplier (src) and multiplicand (R) are 16 bits
				32-bit product:	MUL src,Re    Re,o <- Re * src
				16-bit product:	MUL src,Ro	Ro <- Ro * src
			We always use R1 for 16-bit multiplicand and product */
		if(!INTCONST(p->kids[1],2)){ /* multiply-by-2 is converted to left shift  */
			rtarget(p, 0, ireg[1]);	/* kids[0] must deliver multiplicand in R1 */
			setreg(p, ireg[1]);	/* product in R1 */
		}
		break;
	case DIV+I: case DIV+U:
		/*	32-bit divide:		DIV src,Re	[dst always even register]
			divisor (src) is 16 bits; dividend (Re,o) is 32 bits
			Note hi word of dividend is R0, lo word R1
				Re <- 16 bit quotient of Re,o / src
				Ro <- 16 bit remainder
			We always use R0 for quotient and dividend */
		if(!INTCONST(p->kids[1],2)){ /* divide-by-2 is converted to right shift  */
			if(op == DIV+U) /* special case for unsigned divide, put divisor in R0 */
				rtarget(p,1,ireg[0]);
			rtarget(p, 0, ireg[1]);	/* kids[0] must deliver dividend into R1 */
			setreg(p, ireg[0]);		/* produces quotient in R0 */
		}
		break;
	case MOD+I: case MOD+U:
		if(op == MOD+U) /* special case for unsigned divide, put divisor in R0 */
			rtarget(p,1,ireg[0]);
		rtarget(p, 0, ireg[1]);	/* kids[0] must deliver dividend into R1 */
		setreg(p, ireg[1]);		/* produces remainder in R1 */
		break;
    case CALL+I: case CALL+U: case CALL+P: case CALL+V:
        setreg(p, opsize(p->op) == 4 ? lreg[0] : ireg[0]);
        break;
    case CALL+F:
    	setreg(p, freg[0]);
    	break;
	case RET+I: case RET+U: case RET+P:
		rtarget(p, 0, ireg[0]);
		break;
	case RET+F:
		rtarget(p, 0, freg[0]);
		break;
	}
}

static void clobber(Node p) {
	assert(p);
	switch (generic(p->op)) {
	case DIV:
		//spill(2,IREG,p); /* the remainder trashes R1 */
		break;
	case MOD:
		//spill(1,IREG,p); /* quotient trashes R0 */
		break;
	}
}

static void emitband(char *dstname,unsigned andmask){
	print("bic #^o%o,%s ; BANDx 0%o\n", ~andmask & 0xffff, dstname, andmask);
}

static void emitrshu(Node p,char *dstname,unsigned andmask){
	Symbol src;
	unsigned shift,mask;
	
	assert(p->kids[1]);
	assert(p->kids[1]->syms[0]);
	assert(generic(p->kids[1]->op) == CNST);
	
	src = ireg[getregnum(p->kids[0])];
	shift = p->kids[1]->syms[0]->u.c.v.u;
//dumptree(p);fputc('\n',stderr);
//fprintf(stderr,"emit2: emitrshu: emitted=%d src=%s dst=%s shift=%d &mask=0%o\n", 
//	p->x.emitted, src->x.name, dstname,shift,andmask);

	if(shift > 15 || !andmask) /* fussy optimisation; this would not normally occur */
		print("clr %s ; RSHU\n",dstname);
	else{
		if (dstname != src->x.name)
			print("mov %s,%s ; RSHU\n", src->x.name, dstname);
		if(shift > 0){
			if(shift == 1)
				print("clc ; RSHU\nror %s ; RSHU\n", dstname);
			else
				print("ash #%d,%s ; RSHU\n", -shift, dstname);
			//mask = ~(andmask & (0xffff >> shift)) & 0xffff;
			emitband(dstname,andmask & (0xffff >> shift));
			//print("bic #^o%o,%s ; RSHU %d, &mask 0%o\n", mask, dstname, shift, andmask);
		}
	}
}

static void emit2(Node p) {
	int op = generic(p->op);
	unsigned shift,mask,size,align,i;
	Symbol src,dst;
	char *m,*d,*s;
	
	switch( op ){
	//default: dumptree(p); fputc('\n',stderr); break; /* debugging only*/
	
	case ASGN:
		//dumptree(p); fputc('\n',stderr);
		if(specific(p->op) == ASGN+B){ /* copy struct, or data block */
			d = ireg[getregnum(p->x.kids[0])]->x.name;
			s = ireg[getregnum(p->x.kids[1])]->x.name;
			size = p->syms[0]->u.c.v.u;
			align = p->syms[1]->u.c.v.u;
			if(align==1 || size<2){
				/* non aligned, or single byte copy: must do byte moves */
				if(size > 8) 
					print("$CPYB %s,%s,%d ; ASGNB\n",s,d,size);
				else{
					/* first byte is just register-indirect, not indexed */
					print("movb  (%s), (%s) ; ASGNB\n",s,d);
					for(i=1;i<=size-1;++i) 
						print("movb %d(%s),%d(%s) ; ASGNB\n",i,s,i,d);
				}
			}else{
				/* word aligned copy */
				if(size > 16) 
					print("$CPYW %s,%s,%d ; ASGNB\n",s,d,size);
				else{
					/* first word is just register-indirect, not indexed */
					print("mov  (%s), (%s) ; ASGNB\n",s,d);
					for(i=2;i<=size-2;i+=2) 
						print("mov %d(%s),%d(%s) ; ASGNB\n",i,s,i,d);
					if(size&1) /* if odd number, copy last byte */
						print("movb %d(%s),%d(%s) ; ASGNB\n",i,s,i,d);
				}
			}
		}
		break;
		
	case ARG: 
		/* stmt: ARGx2(BANDx2(reg,con)) */
		//dumptree(p); fputc('\n',stderr);
		assert( generic(p->kids[0]->op) == BAND 
				&& generic(p->kids[0]->kids[1]->op) == CNST );
		src = ireg[getregnum(p->kids[0]->kids[0])];
		print("mov %s,-(sp) ; ARGx(BANDx)\n",src->x.name);
		emitband("(sp)", p->kids[0]->kids[1]->syms[0]->u.c.v.u);
		break;

	case BAND:
		//dumptree(p);fputc('\n',stderr);
		/* also note possible optimisation of low byte extract, where source and dest differ:
			MOV src,dst; BIC ^O-400,dst = CLR dst; BISB src,dst */
		assert( generic(p->kids[1]->op) == CNST );
		dst = ireg[getregnum(p)];
		mask = p->kids[1]->syms[0]->u.c.v.u;
		if(generic(p->kids[0]->op) == CVU ){
			/* BANDx2(CVUx2(reg),con) */
			/* combine AND mask with shift-clear mask */
			src = ireg[getregnum(p->kids[0]->kids[0])];
			//fprintf(stderr,"emit2: %s <- BANDx(CVUx(%s),0%o)\n",dst->x.name,src->x.name,mask);
			/* always move (to do sign extension) */
			print("movb %s,%s ; BANDx(CVUx)\n", src->x.name, dst->x.name);
			emitband(dst->x.name,mask & 0377);
		}else{
			/* if LHS is an RSHU, we combine the two */
			if(specific(p->kids[0]->op) == RSH+U){
				/*reg:	BANDU2(RSHU2(reg,consh),con) */
				//fprintf(stderr,"emit2: %s <- BANDU2(RSHU2(%s,consh),0%o)\n",dst->x.name,src->x.name,mask);
				emitrshu(p->kids[0], dst->x.name, mask);
			}else{
				/* reg: BANDx(reg,con) */
				src = ireg[getregnum(p->x.kids[0])];
				//fprintf(stderr,"emit2: %s <- BANDU2(%s,0%o)\n",dst->x.name,src->x.name,mask);
				if (dst != src)
					print("mov %s,%s ; BANDx\n", src->x.name, dst->x.name);
				emitband(dst->x.name,mask);
			}
		}
		break;
		
	case CALL:
		/* CALLxx(ADDRGP2) */
		//dumptree(p);fputc('\n',stderr);
		//fprintf(stderr,"## emit2: CALL: p->syms[0]->u.c.v.u = %d\n", p->syms[0]->u.c.v.u);

		assert(generic(p->kids[0]->op) == ADDRG);
		print("jsr pc,%s ; emit2: CALL\n",p->kids[0]->syms[0]->x.name);
		i = p->syms[0]->u.c.v.u;
		if(i == 2) print("tst (sp)+ ; pop arg\n");
		else if(i == 4) print("cmp (sp)+,(sp)+ ; pop args\n");
		else if(i>0) print("add #%d,sp ; pop args\n",i);
		break;
		
	case RSH:
		/* note the following possible optimisations:
		   	left shift by 8 bits = SWAB dst; CLRB dst
		   	right shft by 8 bits = CLRB dst; SWAB dst
		   these would be implemented by templates, for instance:
			reg:	LSHx2(reg,con8)	"swab %c\nclrb %c\n"
			reg:	RSHU2(reg,con8)	"clrb %c\nswab %c\n"
		*/
	
		//dumptree(p);

		/* reg: RSHx(reg,con) */
		/* for unsigned, emit arithmetic shift, then mask out extended sign  */
		assert(generic(p->kids[1]->op) == CNST);
		
		shift = p->kids[1]->syms[0]->u.c.v.u;
		dst = ireg[getregnum(p)];
		if(optype(p->op) == U)
			emitrshu(p, dst->x.name, ~0);
		else
			print("ash #%d,%s ; emit2: RSHI\n",-shift,dst->x.name);

		break;
		
	/* case MUL:
		we could optimise multiply-by-constant using Booth's algorithm,
		e.g. http://cs-alb-pc3.massey.ac.nz/notes/59304/l5.html 
		http://jingwei.eng.hmc.edu/~rwang/e85/lectures/arithmetic_html/node10.html
	*/
		
	}
}

static void doarg(Node p) {
	assert(p && p->syms[0]);
	mkactual(2, p->syms[0]->u.c.v.i);
}

// Block operators not needed
static void blkfetch(int k, int off, int reg, int tmp) {}
static void blkstore(int k, int off, int reg, int tmp) {}
static void blkloop(int dreg, int doff, int sreg, int soff,int size, int tmps[]) {}

static void local(Symbol p) {
	/* always put long locals on stack frame */
	if (  (isint(p->type) && p->type->size==4 && !p->temporary) || askregvar(p, rmap(ttob(p->type))) == 0)
	{
		assert(p->sclass == AUTO);
		offset = roundup(offset + p->type->size,2);
		p->x.offset = -offset;
		/* note, all offsets must have sign in front, so we can pull dirty tricks
		   with assembler address arithmetic later. */
		p->x.name = stringf("-%d",offset);
		//fprintf(stderr,"local(\"%s\") offset=%d\n",p->name,offset);
	}
}

static void function(Symbol f, Symbol caller[], Symbol callee[], int n) {
	int i,j,nargs;
	Symbol fs;
	
    usedmask[IREG] = usedmask[FREG] = 0;
    freemask[IREG] = INTTMP|INTVAR;
    freemask[FREG] = FLTTMP|FLTVAR;

    maxoffset = offset = maxargoffset = 0;

	/* Determine offsets of parameters relative
	   to frame pointer (set up in prologue).
	   This assumes right-to-left pushing of parameters,
	   to facilitate variable-argument functions like printf.
	   With right-to-left, we always know the address
	   of the first parameter, because it is the last pushed,
	   so has highest address on stack and a fixed offset (4)
	   relative to frame pointer. */

	offset = 4;  /* allow for link register word @ 0(SP), and saved FP, after JSR */
	for (nargs = 0; callee[nargs]; nargs++) {
		Symbol p = callee[nargs];
		Symbol q = caller[nargs];
		p->x.offset = q->x.offset = offset;
		p->x.name = q->x.name = stringf("%d", p->x.offset);
		p->sclass = q->sclass = AUTO;
		//fprintf(stderr,"callee/caller[%d]: %s offset=%d\n", nargs,p->name,offset);
		offset += roundup(q->type->size,2);  // PDP-11 system stack is always word aligned
	}
	assert(caller[nargs] == 0);
	offset = maxoffset = 0;
	
	//fputs("...calling gencode()\n",stderr);
	gencode(caller, callee);
	
	framesize = roundup(maxoffset,2);

	// prologue...
	
	
	/*		layout of system stack frame:

			|				|	higher addresses
			+---------------+
			|	argN		|
			|	...			|
			|	arg0		|	<- FP+4
			+---------------+
			|	link reg	|	<- FP+2 = SP after JSR
			+===============+
			|	saved FP	|	<- FP after prologue
			+---------------+
		  /	|	locals		|	<- FP-2
framesize \	|	...			|
		  	+---------------+
			|	saved regs	|
			|	...			|	<- SP after prologue
			+---------------+
			|				|	lower addresses
			
			(Without a dedicated frame pointer, stack offset bookkeeping 
			is unmanageable while parameters are being stacked for a CALL.)
			
			This layout is very similar to that used by RSX-11:
			http://www.ibiblio.org/pub/academic/computer-science/history/pdp-11/language/decus-C/5,7/cx.rno
			
			See here for a survey of subroutine call frame conventions:
			http://www.cs.clemson.edu/~mark/subroutines.html
			http://www.cs.clemson.edu/~mark/subroutines/pdp11.html (PDP-11 specific)
			and here http://cm.bell-labs.com/cm/cs/who/dmr/clcs.html (original PDP-11 C)
	*/
	
	segment(CODE);
    print(".SBTTL %s\n",f->name);
    print("%s:\n",f->x.name);
    if(nargs||framesize){
		print("mov fp,-(sp) ; save frame pointer\n");
		print("mov sp,fp\n"); /* setup frame pointer */
		if(framesize == 2) 
			print("clr -(sp) ; alloc stack frame\n");
		else if(framesize > 2) 
			print("sub #%d,sp ; alloc stack frame\n",framesize);
    }

	/* don't bother saving scratch registers,
	   this is assumed to include return register (R0) */
	usedmask[IREG] &= ~INTTMP; 
	usedmask[FREG] &= ~FLTTMP;	 

	/* save used registers on stack, below stack frame */
	fprintf(stderr,"%16s used=",f->name);
	for(i=usedmask[IREG],j=0;i;i>>=1,++j)
		if(i&1){
			fputc(' ',stderr);
			fputs(ireg[j]->x.name,stderr);
			print("mov %s,-(sp) ; save\n",ireg[j]->x.name);
		}
	fputc('\n',stderr);

	// call front end to emit function body
    //fputs("...calling emitcode()\n",stderr);

    print(";\n");
	emitcode();

	// epilogue...

    print(";\n");
    
    /* restore used registers, in reverse order from save */
	for(i=usedmask[IREG];j;--j)
		if(i & (1<<j))
			print("mov (sp)+,%s ; restore\n",ireg[j]->x.name);

    if(nargs||framesize){
		if(framesize) print("mov fp,sp ; pop stack frame\n");
		print("mov (sp)+,fp ; restore frame pointer\n");
    }
    

	print("rts pc\n\n");
}

static void defsymbol(Symbol p) {
	long v;
	char *q;

	if(p->scope >= LOCAL && p->sclass == STATIC)
		p->x.name = stringf("%d$", genlabel(1));
	else if (p->generated)
		p->x.name = stringf("%s$", p->name);
	else if(p->scope == CONSTANTS && isint(p->type)){
		/* make sure constants are literal decimal (not hex or octal) */
		p->x.name = isunsigned(p->type) ? stringf("%u",p->u.c.v.u) : stringf("%d",p->u.c.v.i);
	}else if(p->scope == GLOBAL || p->sclass == EXTERN){
		/* underscores not allowed in MACRO-11 identifiers; replace with $ */
		q = p->x.name = strdup(p->name);
		for( ; *q ; ++q )
			if(*q == '_')
				*q = '$';
	}

	//fprintf(stderr,"defsymbol(%s = %s)\n",p->x.name,p->name);
}

static void address(Symbol q, Symbol p, long n) {
	/* "initialize p to a symbol that represents an address of the form x+n, 
		where x is the address represented by q and n is positive or negative. 
		Like defsymbol, address initializes p->x, but it does so based on 
		the values of q->x and n. A typical address adds q's stack offset to n 
		for locals and parameters, and sets p->x.name to q->x.name 
		concatenated with +n or -n for other variables.
		... address accepts globals, parameters, and locals, and is called 
		only after these symbols have been initialized by defsymbol,
		function, or local. Also, address is optional: If the function pointer 
		in the interface record is null, the front end will not call address." */

	q->x.offset = p->x.offset + n;
	q->x.name = stringf("%s%s%d",p->x.name,n<0?"":"+",n); 
	
	/*	if it's a frame variable, the basic name is +n(fp) or -n(fp)
		if it's a global, the basic name is just identifier: g
		we need to produce: +o+n(fp) or +o+g  respectively.
		Must have a leading +/- because we may want to textually prefix this with 
		yet another offset, in instruction templates. */
	//q->x.name = stringf("%s%d%s%s", n<0?"":"+",n,(p->x.name[0]=='+' || p->x.name[0]=='-')?"":"+",p->x.name); 
	//fprintf(stderr,"address(%s, %s, %d)\n",q->x.name,p->x.name,n);
}


static void defconst(int suffix, int size, Value v) {
	long val = suffix==I ? v.i : v.u;
	switch(suffix){
	case F:
		if(size==2) 
			print(".FLT2 %.17e\n",v.d); // FIXME
		else if(size==4) 
			print(".FLT4 %.17e\n",v.d); // FIXME
		break;
	case I: 
	case U: 
		if(size==1) 
			print(".BYTE %d\n.EVEN\n",v);
		else if(size==2) 
			print(".WORD %d\n",v);
		else if(size==4) 
			print(".WORD %d ; lo\n.WORD %d ; hi\n",val & 0xffff,val>>16);
		break;
	case P: 
		print(".WORD ^o%o ; ptr\n",v.p); 
		break;
	}
}

static void defaddress(Symbol p) {
	print(".WORD %s\n",p->x.name);
}

static void defstring(int n, char *str) {
	int i;
	for(i=0;i<n;++i){
		if(i%8){
			print(",");
		}else{
			if(i) print("\n");
			print(".BYTE ");
		}
		print("%d",str[i] & 0xff);
	}
	print("\n");
    print(".EVEN\n");
}

static void export(Symbol p) {
    print(".GLOBL %s\n", p->x.name);
}

static void import(Symbol p) {
}

static void global(Symbol p) {
    print("%s:\n", p->x.name);
}

static void space(int n) {
	print(".REPT %d\n.BYTE 0\n.ENDR\n",n);
    print(".EVEN\n");
}

Interface pdp11IR = {
	1, 1, 0,  /* char */
	2, 2, 0,  /* short */
	2, 2, 0,  /* int */
	4, 2, 0,  /* long */
	4, 2, 0,  /* long long */
	4, 2, 0,  /* float */
	8, 2, 0,  /* double */
	8, 2, 0,  /* long double */
	2, 2, 0,  /* T * */
	0, 2, 1,  /* struct */

	1,        /* little_endian */
	1,        /* mulops_calls */
	0,        /* wants_callb */
	0,        /* wants_argb */
	0,        /* left_to_right */
	0,        /* wants_dag */
	0,        /* unsigned_char */

	address,
	blockbeg,
	blockend,
	defaddress,
	defconst,
	defstring,
	defsymbol,
	emit,
	export,
	function,
	gen,
	global,
	import,
	local,
	progbeg,
	progend,
	segment,
	space,
	0, 0, 0, 0, 0, 0, 0,
	{	1, /* max_unaligned_load */
		rmap,
		blkfetch, blkstore, blkloop,
		_label,
		_rule,
		_nts,
		_kids,
		_string,
		_templates,
		_isinstruction,
		_ntname,
		emit2,
		doarg,
		target,
		clobber,
	}
};