;==============================================================
;           Simple CP/M Terminal by Martin Eberhard 
;==============================================================
;A command line and configuration file-driven program for
;testing the transfer port link for XMODEM. This program
;uses the same file (XMODEM.CFG) for configuration.
;
;  /An specifies the abort control character. n is an ASCII
;      printable character, but the abort is ^n if n is above
;      ASCII space.
;
;  /E Specifies an enhanced RDR routine that returns with the
;     Z flag set if no character is waiting. Note that this
;     option does not actually select the RDR device as the
;     transfer port. (/X2 does.)
;
;  /In h0 h1 h2... (max h11) Defines assembly code for the
;      custom I/O port (used by the /X3 option), using Intel
;      8080 machine language.
;
;        n = 0 specifies initialization code, to be run when
;              command line and config file parsing are done.
;              All registers may be trashed. This is useful
;              for setting the baud rate, etc.
;
;        n = 1 installs a transmit byte routine.
;              on entry to this routine, the character to send
;              is in c. do not trash de or hl. Sample custom
;              transmit routine (for SOLOS):
;              48        mov   b,c    ;SOLOS wants chr in b
;              3e 01     mvi   a,1    ;serial pseudoport
;              cd 1c c0  call  AOUT   ;output character
;            Encode as follows:
;              /I1 48 3E 01 CD 1C C0
;
;        n = 2 installs a receive status subroutine, which
;              should end with the Z flag set if no character
;              is waiting, and optionally the chr in a. Do not
;              trash any registers except psw. Sample routine:
;              3e 01     mvi   a,1    ;serial pseudoport
;              cd 22 c0  call  AINP   ;input character,
;                                     ;Z set if none
;            Encode as follows:
;              /I2 3E 01 CD 22 C0
;
;        n = 3 installs a receive character routine, assuming a
;              character is waiting. Ends with the character in
;              a. Trashes no registers except psw. If the status
;              rutine returns the character,  (e.g.  for SOLOS),
;              then no /I3 option is required.
;
;  /M Print message on console. This lets you tell the user
;     e.g. what port is set up for direct I/O in XMODEM.CFG
;
;  /O Specifies an output sequence for an I/O port, intended to
;     initialize the direct I/O port. The form of this
;     option is:
;       /O pp h1 h2 ... hn
;     where pp is the port address, and all the subsequent
;     bytes are sent to that port. You can have more than
;     one /O option, allowing you e.g. to initialize the
;     UART and also to set the baud rate.
;
;  /P Defines the direct I/O transfer port (used by the /X2
;     option). The form of this command is:
;       /P ss dd qq rr tt
;       where:
;          ss is the status port (for Rx and Tx)
;          dd is the data port (for both Rx and tx)
;          qq is 00 if the ready bits are true when low
;            and 01 if the ready bits are true when high
;          rr is the receive-ready bit mask
;          tt is the transmit-ready bit mask
;
;     Xmodem assumes that the receive port works like this:
;       RXWAIT: in       <status port>
;               ani      <Rx Mask>
;               jz/jnz   RXWAIT
;               nop
;               in       <data port>
;
;     ..and the transmit port works like this:
;               mov      c,a
;       TXWAIT: in       <status port>
;               ani      <Tx Mask>
;               jz/jnz   TXWAIT
;               mov      a,c
;               out      <data port>
;
;     Any port that can work with these templates will work
;     with Xmodem's /X2 option.
;
;  All variables for the /O and /P commands are in hexidecimal,
;  and must be exactly two characters long. Legal characters
;  are: {0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F} (No lowercase.)
;
;  /Xn Specifies the transfer port:
;      n=0 uses CP/M's CON device. Contrary to CP/M specs,
;          the CON input port must not strip parity.
;
;      n=1 uses CP/M'd RDR and PUN devices. Contrary to CP/M
;          specs, the RDR input port must not strip parity.
;          Also use /E if the RDR driver has been enhanced
;          to return with the Z flag set when no character is
;          waiting. XTERM will not work with /X1 unless /E
;          is also specified.
;
;      n=2 uses direct I/O, which can be set up using the /P
;          option. If no /P option is entered, then /X2 will
;          select a MITS 88-SIO port.
;
;      n=3 uses custom-patched I/O routines, set with the
;          /I option. If no /I option is entered then
;          transfers with /X3 will quit with an error msg.
;
; The following options are ignored by TERMNL because they
; are valid XMODEM options: /c, /K, /Q, /R, /S, /Z
;==============================================================
;PROGRAM NOTES
;
; Assemble with Digital Research's ASM Assembler
;
;Revision History:
;
; 1.1 10 April 2019  M. Eberhard
;  Analyze & report XMODEM.CFG and command line options
;UNDER CONSTRUCTION
;
; 1.0  7 April 2019  M. Eberhard
;  Created to be compatible with XModem 2.8
;
;==============================================================
;---------------------------
;This code's revision number
;---------------------------
VERSION	equ	0101h	;high byte = major revision number
			;low byte = minor version

FALSE	equ	0
TRUE	equ	not FALSE

;----------------
;XMODEM constants
;----------------
BUFFER	equ	0800h	;XMODEM's buffer start address

DTPORT	equ	1	;Default transfer port
			;0 Console (not allowed)
			;1 PUN/RDR
			;2 Direct I/O
			;3 Custom I/O

DENHR	equ	0	;Enhanced RDR default
			;00 normal RDR
			;01 for RDR that returns with
			;..Z set if chr not ready

DEFCRC	equ	0FFh	;Default receive error checking mode
			;0 for checksum, NZ for CRC

;**************
; CP/M Equates
;**************
;------------------------------------------
;BDOS Entry Points and low-memory locations
;------------------------------------------
WBOOT	equ	0000H		;Jump to BIOS warm boot
WBOOTA	equ	WBOOT+1		;Address of Warm Boot
IOBYTE	equ	WBOOT+3
;CDISK	equ	WBOOT+4		;Login drive
BDOS	equ	WBOOT+5		;BDOS Entry Point
BDOSA	equ	WBOOT+6		;First address of BDOS
				;(can overlay up to here)

FCB	equ	WBOOT+5CH	;CP/M file control blk
FCBDR	equ	FCB		;Drive Descriptor
FCBFN	equ	FCB+1		;File name (8 chrs)
FCBFT	equ	FCB+9		;File Type (3 chrs)
FCBNL	equ	11		;File name length
FCBEXT	equ	FCB+12		;File extent within FCB
FCBCLR	equ	24		;# of bytes to clear,
				;starting at FCBEXT
COMBUF	equ	WBOOT+80H	;disk & cmd line buffer
USAREA	equ	WBOOT+100H	;User program area

BLKSIZ	equ	128		;Disk block size

;------------------------------------------
;BDOS Function Codes, passed in register C
;Note: CON, RDR, and PUN I/O are done via
;direct BIOS calls, not BDOS calls.
;------------------------------------------
;BRESET	equ	0	;System Reset
;BCONIN	equ	1	;Read Console Chr
;BCONOT	equ	2	;Type Chr on Console
;BRDRIN	equ	3	;Read Reader Chr
;BPUNOT	equ	4	;Write Punch Chr
;BPRINT	equ	9	;Print $-terminated String
BRDCON	equ	10	;Get Line from Console
;BCONST	equ	11	;Console Status (<>0 IF CHR)
;BDRST	equ	13	;Reset Disk
;BSDISK	equ	14	;select disk
BOPEN	equ	15	;Disk File Open
BCLOSE	equ	16	;Close disk file, FCB at de
BSERCH	equ	17	;Search dir for file, FCB at de
BDELET	equ	19	;delete file, FCB at (de)
BREAD	equ	20	;Read from Disk, 0=OK, <>0=EOF
BWRITE	equ	21	;Write next record, 0=OK, <>0=ERR
BMAKE	equ	22	;Make new file, 0FFH=BAD
;BCDISK	equ	25	;get current disk
BSTDMA	equ	26	;Set disk buffer to (de)

;--------------------------------------------
;BIOS Entry Points, relative to the base
;address in WBOOT. BIOS calls are used
;(instead of BDOS calls) where speed matters.
;--------------------------------------------
CONST	equ	06h	;Console Status
CONIN	equ	09h	;Console Input
CONOUT	equ	0Ch	;Console output
PUNCH	equ	12h	;punch output
READER	equ	15h	;reader input

;-----------------------------------
;Altair 88-SIO Registers and Equates
;(Used as a default direct port.)
;-----------------------------------
SIOSTA	equ	00h		;status port
SIODAT	equ	01h		;data port

SIORDF	equ	00000001b	;-RX Data register full
SIOTDE	equ	10000000b	;-TX Data register empty

;----------------
;ASCII Characters
;----------------
SOH	equ	1		;Start of 128-byte block
;STX	equ	2		;Start of 1K-byte block
CTRLC	equ	3		;Control-C for user-abort
EOT	equ	4		;End Xmodem session
ACK	equ	6		;Xmodem block acknowledge
TAB	equ	9		;horizontal tab
LF	equ	0AH		;Linefeed
CR	equ	0DH		;Carriage return
NAK	equ	15H		;Xmodem block negative ACK
CAN	equ	18h		;Xmodem Cancel
EOF	equ	1Ah		;^Z end of XMODEM.CFG file
QUOTE	equ	2Ch		;single quote
SELCRC	equ	'C'		;selects CRC mode at initiation

;*********************
;* Beginning of Code *
;*********************
	org	USAREA		;normal place for CP/M programs

LSTACK:				;Local Stack in the user area

;==============
;INITIALIZATION
;==============
INIT:	lxi	SP,LSTACK	;use local stack

	call	CILPRT
 db '========================',CR
 db 'XMTERM '
 db ((VERSION AND 0F00h)/256)+'0','.',(VERSION AND 0Fh) +'0'
	db	' By M.Eberhard',CR
 db '========================',CR+80h

;-------------------------------------------------------
;Set the top address of the buffer, in case we don't get
;a /K option. This is actually INIT code, and is placed
;here so that the stack can overwrite it harmlessly.
;-------------------------------------------------------
	lda	BDOSA+1		;msb of start of BDOS
	dcr	a		;last allowed page
	sta	BUFMAX

;-------------------------------------------------------
;look for a configuration file and parse it for options,
;if it exists. Set the DMA address first, since since
;CP/M 1.4 will clobber the DMA address in BOPEN.
;  OPMODE = 01h
;  BYTCNT = 0
;-------------------------------------------------------
	lxi	d,CFGBUF
	mvi	c,BSTDMA	;Set CP/M DMA address
	call	GOBDOS

	lxi	d,CFGFCB	;FCB describes file to open
	mvi	c,BOPEN		;CP/M FILE OPEN function
	call	GOBDOS		;M set if a's msb is set
				;-1 means open failure
				;..meaning no XMODEM.CFG
	cp	PARSE		;CMDCHR will initialize de

;--------------------------
;Parse command line options
;--------------------------
	xra	a		;parse command line next
	sta	OPMODE

	lxi	d,COMBUF	;CP/M cmd line tail
	ldax	d		;1st byte is the byte count
	sta	BYTCNT

	cpi	100		;max input line length
	jnc	BADINP		;..else it clobbers the stack

	inx	d		;first command line chr

	call	PARSE		;finally, find options

;----------------------
;Announce user settings
;----------------------
	lxi	h,CPUMHZ

	sub	a		;test for 8080 or Z80
	jpe	IS8080

	mvi	m,4		;Assume Z80s run 4 MHz

	call	CILPRT
	db	CR,'Z','-'+80h
	jmp	PCPU

IS8080:	call	CILPRT
	db	CR,'8','0'+80h

PCPU:	call	ILPRNT
	db	'80 CPU Detected',CR
	db	'CPU speed',' '+80h

	dcx	h		;REQMHZ
	mov	a,m
	inx	h		;CPUMHZ

	ora	a		;Still default?
	jm	DCPUS		;y: use defaults

	mov	m,a		;n:use requested speed

	call	ILPRNT
	db 'set for',' '+80h
	jmp	DCPUS2
DCPUS:

	call	ILPRNT
	db	'defaulted to',' '+80h
DCPUS2:

	mov	a,m
	ori	'0'	;ASCII
	call	PRINTA
	call	ILPRNT
	db	' MH','z'+80h

	inx	h	;CRCFLG
	call	CILPRT
	db 'Receive error checking:',' '+80h
	mov	a,m
	ora	a
	jz	ANC1

	call	ILPRNT
	db 'CRC','s'+80h
	jmp	ANC2

ANC1:	call	ILPRNT
	db 'Checksum','s'+80h
ANC2:

	inx	h	;PACCNT for quiet mode
	mov	a,m
	ora	a
	jz	ANC3

	call	ILPRNT
	db 'Quiet mode selecte','d'+80h
ANC3:

	inx	h	;BUFMAX
	call	CILPRT
	db 'Last buffer address:',' '+80h
	mov	a,m
	dcr	a
	call	PAHEX
	call	ILPRNT
	db	'FF','h'+80h

	call	CILPRT
	db	'Actual buffer size:',' '+80h

	push	h
	mov	h,m
	mvi	l,0
	lxi	d,-BUFFER
	dad	d
	call	PDEC16
	pop	h

	call	ILPRNT
	db ' byte','s'+80h

	inx	h	;BUFREQ
	mov	a,m
	ora	a
	jz	ANC4

	call	CILPRT
	db 'Requested buffer size:',' '+80h

	push	h
	mov	h,m
	mvi	l,0
	call	PDEC16
	pop	h

	call	ILPRNT
	db ' byte','s'+80h
ANC4:

	inx	h	;XMODE

	mov	a,m
	inr	a
	jz	ANC7

	dcr	a
	jz	ANC5

	call	CILPRT
	db	'Receiv','e'+80h
	jmp	ANC6

ANC5:	call	CILPRT
	db	'Sen','d'+80h

ANC6:	call	ILPRNT
	db ' mode selecte','d'+80h
ANC7:

;--------------------------------------------------------
;Patch RXROUT and TXROUT for the transfer port specified
;by the /X option, or by the default transfer port.
;Also set TIMRLD to the correct value for 1/2 second
;receive timouts, based on XPORT and CPU speed. Flush the
;receiver unless it's RDR that's not modified to return
;with Z set when no chr is waiting.
;On Entry
;  XPORT    ENHRDR     Port
;  FF                default
;   0         x      Console (not allowed)
;   1         0      PUN/Standard RDR
;   1         1      PUN/Enhanced RDR
;   2         x      Direct I/O
;   3         x      Custom I/O
;-------------------------------------------------------
;Check for enhanced RDR if RDR is selected, and quit
;if it's not enhanced. (Can't do terminal if not)
	lda	XPORT
	ora	a		;Default?
	jp	PP1

	call	CILPRT
	db	'Using the default transfer por','t'+80h

	mvi	a,DTPORT	;default value
	sta	XPORT
PP1:

	dcr	a		;RDR port?
	jnz	PP2		;n: ok

	lxi	h,ENHRDR	;Enhanced RDR?
	cmp	m
	jnz	PP2		;y: ok

	call	CMSGXT
 db CR
 db 'Abort: XTMTERM requires RDR to be enhanced (/E option',')'+80h

PP2:

;a=XPORT-1

	lxi	h,PORTAB

	add	a		;*2
	add	a		;*4
	mov	e,a
	mvi	d,0
	dad	d

	mov	e,m
	inx	h
	mov	d,m		;de=RX byte routine addr
	xchg

	shld	RXROUT+1

	xchg
	inx	h
	mov	e,m
	inx	h
	mov	d,m		;de=TX byte routine addr
	xchg
	shld	TXROUT+1

;----------------------------------------
;Check for console port as transfer port,
;Announce port type
;----------------------------------------
	lxi	h,XPORT
	mov	b,m
	dcr	b
	jp	ANNC1

	call	CMSGXT
 db 'Console can',QUOTE,'t be the XMTERM transfer por','t'+80h

ANNC1:	call	CILPRT
	db	'Transfer via',' '+80h
	dcr	b
	jm	ANNC6
	jz	ANNC4

	call	ILPRNT
	db	'custom cod','e'+80h

	mvi	b,4
	lxi	h,IITABL	;Was the port initialized?

ANNC2:	mov	a,m
	inx	h
	ora	a
	jz	ANNC3

	call	CILPRT
	db	'  no /','I'+80h
	mvi	a,'0'+4
	sub	b
	call	PRINTA

	mov	a,b
	sui	2
	cpi	2		;Must have /I1 and /I2
	jnc	ANNC3
	call	ILPRNT
	db	'!'+80h

ANNC3:
	dcr	b
	jnz	ANNC2

	jmp	ANNC7

ANNC4:	call	ILPRNT
	db	'direct I/','O'+80h

	inx	h		;DPINIT
	mov	a,m		;Direct port uninitialized?
	ora	a
	jp	ANNC5

	call	ILPRNT
	db	', which is uninitialized! (No /P option',')'+80h
	jmp	ANNC7
ANNC5:

	call	ILPRNT
	db	' from port',' '+80h

	lda	IMDPRT+1	;data port address
	call	PAHEX

	call	ILPRNT
	db	'/'+80h

	lda	IMODFY+1	;status port address
	call	PAHEX
	jmp	ANNC7

ANNC6:	call	ILPRNT
	db	'enhanced RDR/PU','N'+80h
ANNC7:

;--------------------------
;Announce terminal exit chr
;--------------------------
	call	CILPRT
	db	CR,'Exit XMTERM with',' '+80h

	lda	EXTCHR
	cpi	' '		;control chr?
	jnc	ANNC8

	ori	40h		;make it printable
	mov	b,a

	call	ILPRNT
	db	'^'+80h

	mov	a,b

ANNC8:	call	PRINTA

	call	CILPRT
	db	'-------------------',CR+80h	;Fresh, new line

;----------------------------------------
;Run any user-defined initialization code
;----------------------------------------
	call	CINIT

;*************
;Terminal Loop
;*************
TLOOP:	call	TCONIN		;any console chr?
				;Returns chr in c

TXROUT:	cnz	EXIT		;Y: send C to transfer port
				;(Gets modified)

RXROUT:	call	EXIT		;any transfer port chr?
				;(Gets modified)
	cnz	PRINTA

	jmp	TLOOP

;=====Subroutine========
;Print A as 2 hex digits
;On Entry
;  A = value to print
;Trashes a,bc
;=======================
PAHEX:	mov	b,a		;save digit
	rrc			;hi nibble 1st
	rrc
	rrc
	rrc
	call	PHXNIB
	mov	a,b		;recover lo nibble

;fall into PHXNIB

;------------------------------------
;local subroutine to print hex nibble
;On Entry:
;  Nibble in low 4 of A
;Trashes a
;------------------------------------
PHXNIB:	ani	0Fh		;get low
	cpi	0Ah		;A-F?
	jc	PHX1
	adi	'A'-'9'-1
PHX1:	adi	'0'
	jmp	PRINTA

;***Subroutine*********************
;Print hl in decimal on the console
;with leading zeros suppressed
;Trashes all registers
;**********************************
PDEC16:	lxi	d,00FFh		;d: Suppress leading 0's
				;e: a handy -1
	lxi	b,-10000
	call	DECDIG
	lxi	b,-1000
	call	DECDIG
	lxi	b,-100		;sets b to FF
	call	DECDIG
	mvi    c,(-10) and 0FFh	;b=FF already
	call	DECDIG

	mov	c,e		;bc=-1
	mov	d,e		;always print final 0

;Fall into DECDIG to print the 1's digit

;---Local Subroutine------------------------------
;Divide hl by power of 10 in bc and print
;result, unless it's a leading 0.
;On Entry:
;  hl=Dividend
;  bc=divisor (a negative power of 10)
;  d=0 if all prior digits were 0, 0FFh otherwise
;  e=-1
;On Exit:
;  Quotent is printed, unless it's a leading 0
;  hl=remainder
;  d=0 iff this and all prior digits are 0
;  d=-1 if this digit was not 0
;Trashes psw,c
;-------------------------------------------------
DECDIG:	mov	a,e		;will go 1 too many times

	push	d		;leading 0 state & -1

DIGLP:	mov	d,h		;de gets prev value
	mov	e,l
	inr	a
	dad	b		;subtract power of 10
	jc	DIGLP

	xchg			;hl has remainder
	pop	d		;leading 0 state & -1

	cmp	d		;Leading 0 to suppress?
	rz			;y: done

	mov	d,e		;FF: no more leading 0's

	adi	'0'		;make digit ASCII

;Fall into PRINTA		;(trashes c)

;***Subroutine******************
;Print character in a on console
;On Exit:
; c = printed character
;Trashes psw
;*******************************
PRINTA:	mov	c,a
	mvi	a,CONOUT
	jmp	GOBIOS

;***Subroutine*************************************
;Get a console character, if one is available.
;Quit if it's the exit chr.
;if so
;On Exit:
;  Z set if no chr was waiting
;  Z clear if anything but ^C was waiting
;Trashes a
;**************************************************	
TCONIN:	mvi	a,CONST		;anything on console?
	call	GOBIOS		;(about 200 cycles)
	ora	a		;Z means no chr waiting
	rz

;Chr waiting: fall into GETCON to take a look

;***Subroutine*********************************
;Get console character, abort if it's control-C
;On Exit:
;  chr in c
;  Z cleared
;Trashes a,b
;**********************************************	
GETCON:	mvi	a,CONIN		;read the typed chr
	call	GOBIOS

	mov	c,a
	lda	EXTCHR		;current exit chr
	cmp	c
	rnz			;ignore everything else

;---Exit---
;User abort
;----------
	call	CMSGXT
	db	'--------Bye-------','-'+80h	;User typed ^C

;***Subroutine**************************************
;Print CR, LF, then In-line Message
;The call to ILPRNT is followed by a message string.
;Follow CR's with LF's
;The last message chr has its msb set.
;Trashes psw,c
;***************************************************
CILPRT:	call	ILPRNT		;trashes c
	db	CR+80h		;ILPRNT adds the LF

;Fall into ILPRNT

;***Subroutine**************************************
;Print In-line Message
;The call to ILPRNT is followed by a message string.
;Follow CR's with LF's
;The last message chr has its msb set.
;On Exit:
;  Z cleared
;Trashes psw,c
;***************************************************
ILPRNT:	xthl			;Save hl, get msg addr
	call	HLPRNT
	xthl			;Restore hl,
				;..get return address
	ret

;***Subroutine***********************************
;Print Message at hl
;Follow all CR's with LF's
;On Entry:
;  hl points to the message
;  The last message chr has its msb set.
;On Exit:
;  hl points to the next address past the string
;  Z cleared
;Trashes psw,c
;************************************************
HLPRNT:	mov	a,m		;get a character
	ani	7Fh		;strip end marker

HLPRT1:	call	PRINTA		;returns chr in c

	mvi	a,CR		;just print a CR?
	cmp	c		;c has printed chr
	mvi	a,LF
	jz	HLPRT1		;y: follow with LF

	mov	a,m		;was that the last chr?
	ora	a		;msb was set if so
	inx	h		;Next byte
	jp	HLPRNT		;Do all bytes of msg

	ret

;---RX Byte Routine----------------------------
;Receiver from enhanced BIOS RDR routine, which
;returns with Z set if no character is waiting,
;which allow us to have a timeout here.
;On Exit:
; Z is set if  no chr is available
;----------------------------------------------
RXRDR	mvi	a,READER	;BIOS routine offset

;Fall into GOBIOS

;***Subroutine*********************
;Go call a BIOS driver directly
;On Entry:
;  c=value for BIOS routine, if any
;  a = BIOS call address offset
;On Return:
;  psw as BIOS left it
;  all other regs preserved
;(116 cycles + BIOS time)
;**********************************
GOBIOS:	push	h		;(11)
	push	d		;(11)
	push	b		;(11)

	call	DOBIOS		;(17+26+BIOS time)

	pop	b		;(10)
	pop	d		;(10)
	pop	h		;(10)
	ret			;(10)

;---Local Subroutine---------------
;Go call a BIOS driver directly
;On Entry:
;  c=value for BIOS routine, if any
;  a = BIOS call address offset
;On Return:
;  all regs as BIOS left them
;(26 cycles + BIOS time)
;----------------------------------
DOBIOS:	lhld	WBOOTA		;(16)get BIOS base address
	mov	l,a		;(5)a has jump vector

	pchl			;(5) 'call' BIOS routine

;***Subroutine*********************************
;Call BDOS while preserving all regs except psw
;Flags set according to how BDOS returned a
;Generally, the result is negative if there
;was an error. Often, Z set means OK too.
;**********************************************
GOBDOS:	push	h
	push	d
	push	b
	call	BDOS
	pop	b
	pop	d
	pop	h

	ora	a	;test response
	ret

;---RX Byte Routine-------------------------------
;Generic direct transfer port Input Routine - gets
;modified by MODIO based on selected transfer port
;On Exit:
; Z set if chr not available
; a=chr otherwise
;-------------------------------------------------
RXDRCT:

;The relative position of the following instructions must not
;change because MODIO assumes the positions of the bytes it
;modifies.

IMODFY:	in	SIOSTA	;status port (modified)
	cma		;(Maybe modified to NOP)
	ani	SIORDF	;test ready (clear carry) (modified)
	rz		;low when chr ready

	nop		;(match OMODFY spacing)
	nop
	nop

IMDPRT:	in	SIODAT	;data port (modified)
	ret

;---TX Byte Routine-------
;Transmit c via CP/M PUN
;-------------------------
TXPUN:	mvi	a,PUNCH		;1:BIOS send c to punch
	jmp	GOBIOS		;chr in c, routine in a

;---TX Byte Routine----------------------
;Transmit c via direct I/O, with timeout
;the timeout value doesn't really matter:
;we just shouldn't hang forever here
;----------------------------------------
TXDRCT:	push	h
	lxi	h,0	;about 1.7 second timeout
			;..at 2 MHz

TXWAIT:	dcx	h	;(5)timeout?
	mov	a,h	;(5)
	ora	l	;(4)
	jz	TXBTO	;(10)y: abort

;The relative position of the following instructions must not
;change because MODIO assumes the positions of the bytes it
;modifies.

OMODFY:	in	SIOSTA	;(10+1)status port (modified)
	cma		;(Maybe modified to NOP)
	ani	SIOTDE	;(7)mask (modified)
	jz	TXWAIT

;52 cycles = 26 uS per pass at 2 MHz

	mov	a,c	;recover chr
	out	SIODAT	;data port (modified)

	pop	h
	ret

;****************************************************
;Custom I/O Routines
;These all get modified in INT by the /I options. The
;Modifying code overwrites the error messages that
;are here as defaults. These routines are located
;just after CTABLE.The last one (CINIT, which is in
;the INIT code) must be within 256 bytes of CTABLE.
;****************************************************
;---Table----------------------
;Offsets to custom I/O routines
;Used only when INIT modifies
;the following routines.
;------------------------------
CTABLE:	db	CINIT-CTABLE
	db	CWDAT-(CTABLE+1)
	Db	CRSTAT-(CTABLE+2)
	Db	CRDAT-(CTABLE+3)

;----Custom Port Initialization-----------------------
;Run any user-defined initialization code
;(Up to 12 bytes get filled in here by the /I0 option)
;-----------------------------------------------------
CINIT:	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	ret

;---TX Byte Routine------------------------------
;Custom Send Subroutine
;On Entry:
;  c=chr to send
;  Top of stack = original bc value
;User routine should not trash c
;(Up to 12 bytes will be written at CWDAT by the
;/I1 option, overwriting the error message here.)
;------------------------------------------------
TXCUST:

CWDAT:	call	CMSGXT
	db	'No /I','1'+80h
	db	nop
	db	nop
	db	nop

	mov	a,c		;restore registers
	pop	b
	ret	

;---RX Byte Routine--------------------------------
;Custom Receive Subroutine with timeout
;On Exit:
; Z set if no chr available
; a=chr otherwise
;--------------------------------------------------
RXCUST:
CRSTAT:	call	CMSGXT
	db	'No /I','2'+80h
	db	nop
	db	nop
	db	nop

	rz	

;Get the received data byte
;(Up to 12 bytes will be written at CRDAT by /I3 here)

CRDAT:	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop
	db	nop

	ora	a	;Clear Z
	rnz
	cpi	1	
	ret

;***Subroutine*******************************************
;Parse command line or CFG file options
;On Entry:
;  OPMODE = 00h if reading the tail of the command line
;           01h if reading from XMODEM.CFG
;           80h for end-of-file for XMODEM.CFG
;  BYTCNT has the number of bytes in the buffer or line
;       the command line or from XMODEM.CFG
;  de points to the next input chr, either in the command
;     line or in the current block from XMODEM.CFG. de
;     may be uninitialized if OPMODE<>0 and BYTCNT=0.
;********************************************************
PARSE:
;-----------------------------------------------------------
;Parse all command line options & set variables accordingly. 
;Each option must be preceeded by a '/' Options may be
;preceeded by any reasonable number of spaces, tabs,
;carriage returns and/or line feeds.
;-----------------------------------------------------------
OPTLUP:	call	WSKIP		;skip whitespace
	rc			;end of input input?

	lxi	b,OPTLUP	;create return address
	push	b

	cpi	'?'		;Looking for help?
	jz	HLPEXT

	cpi	';'		;comment?
	jz	COMENT		;y: ignore until CR or LF

	cpi	'/'		;all options start with /
	jnz	BADINP		;error: no /

	call	CMDCHR		;Get an option chr
	jz	BADINP		;Error: nothing after /

;-----------------------------------------------------
;Got an option chr in a. Loop through table of options
;looking for a match. Error exit if not in table.
;  a = option character
;Trashes c,hl
;-----------------------------------------------------
	sta	PAR1		;put option in error msgs
	sta	PAR2		;..in case of errors

	lxi	h,OPTTAB

CHKLUP:	cmp	m		;Match? (alpha order)
	inx	h
	mov	c,m		;get routine address offset
	inx	h
				;Options are in ASCII order
	jc	OPTERR		;illegal option
	jnz	CHKLUP		;No match: keep looking

;-----------------------------------------
;Option match. Go execute option routine
;On Entry:
;  c = option routine adress offset
;  de  points to next cmd byte
;  hl points to next option table entry
;  top-of-stack = return address to OPTLUP
;Command routines preserve/advance de
;-----------------------------------------
	xra	a		;a=b=0 for options
	mov	b,a		;high byte for dad too
	dad	b		;hl=address of routine

	pchl			;go to routine

;***INIT-Only Table**********************************
;Command Line Options Table
;Table entries must be in alphabetical order, and the
;table is terminated with 0FFh. This table must be
;located before the 1st option routine, and within
;256 bytes of the start of the last option routine.
;
;2 bytes per entry:
; Byte 0 = Uppercase legal option letter
; Byte 1 = offset to address of parse routine
;****************************************************
OPTTAB:	db	'A',SABCHR-(OPTTAB+2)	;Set Abort Chr
	db	'C',CCKSUM-(OPTTAB+4)	;IGNORED
	db	'E',CMODR-(OPTTAB+6)	;Enhanced RDR port
	db	'I',CCIO-(OPTTAB+8)	;Custom I/O definition
	db	'K',BUFKB-(OPTTAB+10)	;IGNORED
	db	'M',CMESSG-(OPTTAB+12)	;IGNORED
	db	'O',COUTP-(OPTTAB+14)	;output to port
	db	'P',CPORT-(OPTTAB+16)	;define transfer port
	db	'Q',CQUIET-(OPTTAB+18)	;IGNORED
	db	'R',CSETR-(OPTTAB+20)	;IGNORED
	db	'S',CSETS-(OPTTAB+22)	;IGNORED
	db	'X',CSETX-(OPTTAB+24)	;select transfer port
	db	'Z',CMHZ-(OPTTAB+26)	;IGNORED
	db	0FFh			;end of table

;****************
; Option Routines
;****************

;******------------------------
; /An * Specify abort character
;******
;On Entry:
;  (de)=next command line chr
;On Exit:
;  EXTCHR updated
;------------------------------
SABCHR:	call	CMDCHR		;Get the exit character
	cpi	'@'		;Already a control chr?
	jc	SBC1		;..or below alpha chrs?

	ani	1Fh		;convert alpha to control
SBC1:
	sta	EXTCHR
	ret

;******----------------------
;* /C * Set Rx Checksum Mode
;******
;On Entry:
;  a=b=0
;  (de)=next command line chr
;On Exit:
;  CRCFLG = 0
;----------------------------
CCKSUM:	sta	CRCFLG
	ret

;******----------------------------
;* /E * Specify Enhanced Reader
;****** (RDR returns Z when no chr)
;On Entry:
;  a=b=0
;  (de)=next command line chr
;On Exit:
;  ENHRDR = 1
;----------------------------------
CMODR:	inr	a
	sta	ENHRDR
	ret

;******------------------------------------------------
;* /I * Patch Custom I/O Routine
;******
;  a=b=0
; /I0 hh hh hh... defines init code
; /I1 hh hh hh... defines transmit port routine
; /I2 hh hh hh... defines receive status routine
; /I3 hh hh hh... defines receive data routine
;Max 12 hh digits. (The original intention is to use
;these patches to call some ROM I/O routines, perhaps
;with a couple of registers set up prior to the calls.)
;On Entry:
;  b=0
;  (de)=next command line chr
;On Exit:
;  A Custom Transfer port routine has been written
;  de incremented past /I data
;------------------------------------------------------
CCIO:	call	CMDCHR		;get next command line chr

	sui	'0'		;un-ASCII the chr
	cpi	4		;Valid code at all?
	jnc	BADVAL

;Update the "initialized" flag for this value of n

	mov	c,a		;b=0 already

	lxi	h,IITABL
	dad	b
	mov	m,b		;0

;Get the address of the routine to define, based on a. The
;4-byte table is also the reference for address offsets,
;and is located just before the first modified routine. 
;bc=offset already

	lxi	h,CTABLE
				;bc is table offset
	dad	b		;hl points to table entry

	mov	c,m		;lookup offset in table
	dad	b		;get final address

;Get & install all routine bytes, padding with nops at the end.
;The number of bytes here must match the available space in
;the custom code routines above (which expects 12 bytes).
; hl=address of beginning of routine to be modified.

CIOGET:	mvi	c,12		;max bytes for a routine

CIOG0:	call	GETHEX
	jnc	GIOG1		;any character?
	xra	a		;n: install nop
GIOG1:	mov	m,a

	inx	h
	dcr	c
	jnz	CIOG0

	ret			;note: any more hex values
				;will cause an error in PARSE
;******-------------------------------------
;* /M * print message on console
;******
;On Entry:
;  de points to a string that is terminated
;  by either a CR/LF or the end of the input
;      subsequent bytes are init sequence
;On Exit:
;  de incremented past the end of the line
;-------------------------------------------
CMESSG:	call	ILPRNT		;trashes c
	db	CR+80h		;ILPRNT adds the LF

CMSGLP:	call	CMDCHR		;get next chr
	rz			;end of message string?
	call	PRINTA		;to console
	jmp	CMSGLP

;******-----------------------------------------
;* /O * Output to Port
;******
;On Entry:
;  (de)=next command line chr
;      subsequent bytes are init sequence
;On Exit:
;  Data sequence has been sent to specified port
;  de incremented past /O data
;-----------------------------------------------
COUTP:	call	GTHEXM		;get port number
	sta	IPORT+1

CILOOP:	call	GETHEX		;get an init value
	rc			;done?

IPORT:	out	0		;port address gets modified
	jmp	CILOOP

;******-------------------------------------
;* /P * Define Transfer Port
;******
;On Entry:
;  (de)=next command line chr
;On Exit:
;  Transfer port routines have been modified
;  de incremented past /P data
;  DPINIT=0
;-------------------------------------------
CPORT:	mvi	b,4		;shift 4 bytes in

CPLOOP:	mov	l,h		;l gets status port
	mov	h,c		;h gets data port
	mov	c,a		;c gets jz/jnz flag
	call	GTHEXM		;a gets Rx Ready mask
	dcr	b
	jnz	CPLOOP

	mov	b,a		;b=Rx ready mask
	call	GTHEXM		;get a=Tx ready mask

	push	d		;command pointer

	xchg			;port addrsses to de

	lxi	h,OMODFY+1
	call	MODIO		;modify input routine

	mov	a,b		;Rx ready mask
	lxi	h,IMODFY+1
	call	MODIO		;modify output routine

	pop	d		;command pointer

	xra	a		;remember we've modified
	sta	DPINIT

	ret

;******-----------------------------------
;* /Q * Enables quiet mode
;****** (no pacifiers etc. on the console)
;On Entry:
;  a=b=0
;  (de)=next command line chr
;On Exit:
;  PACCNT=FFh
;-----------------------------------------
CQUIET:	dcr	a		;a=FFh
	sta	PACCNT
	ret

;******----------------------
;* /R * Select receive mode
;******
;On Entry:
;  a=b=0
;  (de)=next command line chr
;On Exit:
;  XMODE = 1
;----------------------------
CSETR:	inr	a	;a=1

;Fall into CSETS to save XMODE

;******----------------------
;* /S * Select send mode
;******
;On Entry:
;  a=b=0
;  (de)=next command line chr
;On Exit:
;  XMODE = 0
;----------------------------
CSETS:	sta	XMODE
	ret

;******----------------------
;* /X * Select transfer port
;******
;On Entry:
;  (de)=next command line chr
;On Exit:
;  XPORT set as specified
;----------------------------
CSETX:	call	CMDCHR

	sui	'0'		;un-ASCII
	cpi	4		;0-3 allowed
	jnc	BADVAL
	sta	XPORT
	ret

;******--------------------------------
;* /Z * Specify CPU speed, in MHz (1-6)
;******
;On Entry:
;  (de)=next command line chr
;On Exit:
;  CPUMHZ updated
;-------------------------------------
CMHZ:	call	CMDCHR

	sui	'1'		;un-ASCII
	cpi	6		;1-6 allowed
	jnc	BADVAL

	inr	a		;make it 1-6
	sta	REQMHZ
	ret

;**********------------------------------------
;* /Kn[n] * Set max buffer k-bytes
;**********
;Use this value to set the upper limit for the
;buffer. If the given value results in an upper
;limit above the beginning of BDOS, then use
;the beginning of BDOS as the limit instead.
;1K is the minimum.
;On Entry:
;  (de)=next command line chr
;On Exit:
;  de advanced past /K value
;  BYTCNT decremented accordingly
;trashes psw,b,hl
;----------------------------------------------
BUFKB:	call	CMDCHR
	call	D2BDIG		;error-exit if not ASCII digit

;We don't yet know whether this is the 1's digit or
;the 10's digit, so assume it could be either.

	mov	b,a		;temp save 1st digit

	add	a		;*2
	add	a		;*4
	add	b		;*5
	add	a		;*10 in case of another digit
	mov	c,a		;temp save 10x digit

				;look for 2nd digit	
	call	CMDCEI		;Z means whitespace, / or EOF
	jZ	BFBK1		;no more digits?

;Convert and incorporate the new low digit

	call	D2BDIG		;1's digit to binary

	add	c		;combine with high digit
	mov	b,a		;both decimal digits

;b=given k-bytes in binary. Check for a reasonable value

BFBK1:	mov	a,b
	dcr	a		;min 1K buffer
	cpi	64		;max value
	jnc	BADVAL

;compute number of pages from number of k-bytes high byte

	mov	a,b
	add	a		;*512
	add	a		;*1024

;remember requested end

	sta	BUFREQ

;compute last allowed page's address

	adi	BUFFER/256
	mov	b,a		;result in b

;b=potential end page address

	lda	BDOSA+1		;page beginning of BDOS

;Choose the smaller of b and a

	cmp	b
	jc	BFK4		;carry means b is bigger
	mov	a,b
BFK4:	dcr	a		;last allowed page

	sta	BUFMAX
	ret

;---Local Subroutine--------------
;Convert digit from ASCII and test
;---------------------------------
D2BDIG:	sui	'0'		;convert from ASCII
	cpi	9+1
	rc			;Valid decimal?

	jmp	BADVAL		;Valid?

;***Subroutine*************************
;Ignore a comment, terminated either
;by the end of the XMODEM.CFG line
;or the end of file/end of command line
;On Entry:
;  de=next command line chr
;**************************************
COMENT:	call	CMDCHR
	jnz	COMENT		;Z means EOF, CR or LF
	ret
	
;***Subroutine************************************
;Skip over whitespace (spaces, tabs, CRs, and LFs)
;in the command line buffer or XMODEM.CFG file
;On Entry:
;  BYTCNT has remaining byte count
;  de points to the next chr in buffer
;On Exit:
;  a = chr from buffer
;  BYTCNT has been decremented
;  de has been advanced
;  hl points to BYTCNT
;  Carry means end of input (and a is not valid)
;*************************************************
WSKIP:	call	CMDTWS
	rc			;end of input?
	jz	WSKIP		;Whitespace?
	ret

;***Subroutine***********************************************
;Get next command line or XMODEM.CFG chr, and test it for end
;of item. End of item is end of input, whitespace, or '/'.
;Whitespace is space, tab, CR, or LF. End of input for
;XMODEM.CFG is either an EOF chr or the EOF  response from
;BDOS. End of input for the command line is when BYTCNT=0.
;On Entry:
;  BYTCNT has remaining byte count
;  de points to the next chr in buffer
;On Exit, not end of input stream:
;  Carry clear
;  Z set if EOF, space, tab, CR, LF, or /
;  Z clear: a has valid chr
;  a = chr from buffer unless whitespace or EOF
;  BYTCNT has been decremented unless /
;  de has been advanced unless /
;  hl points to BYTCNT
;On Exit, end of command line:
;  (End of line for the command line is when BYTCNT=0.)
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;On exit, end of file found in XMODEM.CFG
; (End of file for XMODEM.CFG is either an EOF chr
; or the end-of-file response from the BDOS.)
;  OPMODE=80h
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;************************************************************
CMDCEI:	call	CMDTWS
	rz			;end or whitespace?

	cpi	'/'		;option crammed?
	stc
	cmc			;clear carry
	rnz

;slash (meaning crammed option), so
;back up, set Z for end of item

	dcx	d		;y: back up
	inr	m		;hl=BYTCNT from CMDCHR

	xra	a		;Clear carry, set Z
	ret

;***Subroutine****************************************
;Get next command line or XMODEM.CFG chr and test it
;for end of input or whitespace. Whitespace is space,
;tab, CR, or LF. End of input for XMODEM.CFG is either
;an EOF chr or the end of file response from the BDOS.
;End of input for the command line is when BYTCNT=0.
;On Entry:
;  BYTCNT has remaining byte count
;  de points to the next chr in buffer
;On Exit:
;  a = chr from buffer
;  BYTCNT has been decremented
;  de has been advanced
;  hl points to BYTCNT
;  Carry set means EOF (and a is 0)
;  Z set if EOF, space, tab, CR, or LF
;  Z clear: a has valid chr

;On Exit, not end of input stream:
;  Carry clear
;  Z set if EOF, space, tab, CR, or LF
;  Z clear: a has valid chr
;  a = chr from buffer unless whitespace or EOF
;  BYTCNT has been decremented
;  de has been advanced
;  hl points to BYTCNT
;On Exit, end of command line:
;  (End of line for the command line is when BYTCNT=0.)
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;On exit, end of file found in XMODEM.CFG
; (End of file for XMODEM.CFG is either an EOF chr
; or the end-of-file response from the BDOS.)
;  OPMODE=80h
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;*****************************************************
CMDTWS:	call	CMDCHR		;EOF, CR, LF?
	rz			;Y: done, carry for EOF

	cpi	' '
	rz

	cpi	TAB
	stc			;Clear carry
	cmc			;painfully
	ret			;Z set if TAB	

;***Subroutine*****************************************
;Get next character from the command line or XMODEM.CFG
;-->Entry is at CMDCHR<--
;
;On Entry:
;  OPMODE = 00h if reading the tail of the command line
;           01h if reading from XMODEM.CFG
;           80h for end-of-file for XMODEM.CFG
;  BYTCNT has remaining buffer byte count, <=128
;  de points to the next chr of the input
;On Exit, not end of input stream:
;  Carry clear
;  Z set iff CR or LF found
;  a = chr from COMBUF or XMODEM.CFG, parity stripped
;  de has been advanced and BYTCNT decremented
;    unless at end
;  hl points to BYTCNT
;On Exit, end of command line:
;  (End of line for the command line is when BYTCNT=0.)
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;On exit, end of file found in XMODEM.CFG
; (End of file for XMODEM.CFG is either an EOF chr
; or the end-of-file response from the BDOS.)
;  OPMODE=80h
;  Carry set
;  Z set
;  a=0
;  de invalid
;  BYTCNT is 0
;******************************************************
RDCMD:	inr	m		;BYTCNT=0

	lda	OPMODE		;reading command line?	
	add	a		;00 and 80 will both become 0
	stc
	rz			;y: done, Z and Carry set

;Try to read another block of XMODEM.CFG data

	push	b

	lxi	d,CFGBUF
	push	d

	mvi	c,BSTDMA	;Set CP/M DMA address
	call	GOBDOS

	lxi	d,CFGFCB
	mvi	c,BREAD		;read another sector
	call	GOBDOS		;a=0, Z set if not file end

	pop	d		;CFGBUF
	pop	b

	jnz	CCDONE		;end: go set Z and C

				;No more blocks?
	mvi	m,BLKSIZ	;another XMODEM.CFG block

;================
;Subroutine Entry
;================
CMDCHR:	lxi	h,BYTCNT
	dcr	m		;dec BYTCNT (max was 128)
	jm	RDCMD		;empty: try to get more

	ldax	d		;get buffer chr
	inx	d		;bump buffer pointer

	ani	7Fh		;Strip parity

	cpi	CR
	rz

	cpi	LF
	rz

	cpi	EOF		;file end chr?
	stc
	cmc			;n:clear carry
	rnz

;Exit CMDCHR subroutine: end of file found in XMODEM.CFG

CCDONE:	mvi	a,80h		;remember EOF
	sta	OPMODE

	add	a		;clear a, Set Z and C
	ret

;***Subroutine**********************************
;Modify either the transfer input port routine
;or output port routine. This assumes that both
;routines look like this:
;
; WAIT:	...
; IMODFY or OMODFY:
;	in	<status port>
;	cma     (may get converted to nop)
;	ani	<port ready mask>
;	rz
;
;	<3 bytes>
;	in/out	<data port>
;	...
;	ret	(with Z clear)
;
;On Entry:
;  a = port-ready mask byte
;  c <> 0 if nop needs to be installed
;  d = data port address
;  e = status port address
;  hl = IMODFY+1 or OMODFY+1
;Trashes a,hl
;*********************************************
MODIO:	mov	m,e		;install status port adr

	inx	h		;point to cma location
	inr	c
	dcr	c		;test c for 0
				;Code already has a cma
	jz	MODIO1		;need a nop instead?
	mvi	m,NOP		;y: install nop opcode
MODIO1:

	inx	h		;point to mask location
	inx	h
	mov	m,a		;install status mask

	inx	h		;point to data port loc
	inx	h
	inx	h
	inx	h
	inx	h
	inx	h
	mov	m,d		;install data port adr

	ret

;***Subroutine*************************************
;Get an exactly 2-digit hex value from LINBUF
;On Entry:
;  de points to first hex digit
;On Exit:
;  carry set if no value found, either due to
;    end of input or non-hex chr found on 1st digit
;  a=value
;  de advanced past hex if hex found
;  de pointing to non-hex chr if found on 1st digit
;  BYTCNT decremented accordingly
;Rude jump to BADVAL if bogus hex found on 2nd digit
;***************************************************
GETHEX:	push	h
	call	WSKIP		;skip whitespace, get a chr
				;also sets hl=BYTCNT
				;EOF will be bogus hex

	call	HEX2BN		;convert a=1st digit
	jnc	GHBACK		;bogus digit?

	add	a		;shift high digit
	add	a
	add	a
	add	a		;..into high nibble

	push	b
	mov	b,a		;save high digit

	call	CMDCHR		;get low digit
				;a=0 if end, will fail
	call	HEX2BN		;convert to binary
	jnc	BADVAL		;no digit found or bogus?

	add	b		;combine w/ high digit
				;(clears carry)
	pop	b
	pop	h
	ret			;carry is clear for ret

;non-hex 1st chr found, so backup,
;and return with carry set

GHBACK:	dcx	d		;back up
	inr	m		;BYTCNT
	pop	h
	stc
	ret			;with carry set
		
;***Subroutine************************
;convert a to binary
;On Entry:
;  a=ASCII hex digit
;On Exit:
;  a=chr
;  Carry set if OK, clear if bogus chr
**************************************
HEX2BN:	sui	'0'		;remove ASCII bias
	cpi	10
	rc			;if 0-9 then we're done

	sui	9+('A'-'9')	;should be 0-5 now
	cpi	6		;gap chr or too high?
	rnc			;error: return W/O carry

	sui	0F6h		;add 0Ah, set Carry
	ret

;***Subroutine**************************************
;Get a mandatory 2-digit hex value from LINBUF
;On Entry:
;  de points to first hex digit
;On Exit:
;  a=value
;  de advanced 2
;  Rude exit via BADVAL if no chr or bogus hex found
;***************************************************
GTHEXM:	call	GETHEX
	rnc

;Fall into BADVAL

;***Exit*******************************************
;Bad Value, bad hex character
;Fix everything for CP/M, and return to CP/M
;The character following the / gets pasted in here.
;**************************************************
BADVAL:	call	CILPRT
	db	'/'
PAR1:	db	'&'		;parameter goes here
	db	' bad valu','e'+80h

	jmp	ERRSRC		;command line or .CFG file

;***Exit************************
;Transmitter timeout: the UART's
;CTS signal is probably not true.
;On Entry:
;  a=0
;********************************
TXBTO:	mov	b,a		;b=0: don't close file
	call	CMSGXT
	db	'UART Tx fai','l'+80h

;***Exit*******************************************
;Illegal option. Print message and return to CP/M
;The character following the / gets pasted in here.
;**************************************************
OPTERR:	call	CILPRT		;Exit with this message
	db	'/'
PAR2:	db	'&'		;parameter goes here
	db	' unknow','n'+80h

	jmp	ERRSRC		;command line or .CFG file

;***Exit********************************************
;Input error exits. Print message and return to CP/M
;***************************************************
BADINP:		call	CILPRT
	db	'Jun','k'+80h

;Fall into ERRSRC

;***Exit**************************
;Bad input of some sort. Print the
;source of error and quit to CP/M
;On Entry:
;  OPMODE <>0 if reading .CFG file
;          =0 if command line
;*********************************
ERRSRC:	call	ILPRNT
	db	' in',' '+80h

	lda	OPMODE		;command line or XMODEM.CFG?
	ora	a
	jz	BADCLN

	call	MSGXIT
	db	'XMODEM.CF','G'+80h

BADCLN:	call	MSGXIT
	db	'command lin','e'+80h

;***Exit*******************************************
;Print CRLF, then $-terminated string following the
;call. Fix everything for CP/M, and return to CP/M
;**************************************************
CMSGXT:	call	ILPRNT		;trashes c
	db	CR+80h		;ILPRNT adds the LF

;Fall into MSGXIT

;***Exit******************************************
;Print $-terminated string following the call, fix
;everything for CP/M, and return to CP/M
;*************************************************
MSGXIT:	pop	h		;Get message address
	call	HLPRNT

;Fall into EXIT

;***Exit******************************
;Jump to CP/M's WBOOT at address 0000.
; All exits go through here.
;*************************************
EXIT:	RST	0		;go to CP/M

;***Exit*******************************************
;Print help screen, and then exit. Break up the
;help screen so that it even fits on a 16x64 screen
;**************************************************
HLPEXT:	call	CILPRT		;print this message

;    123456789012345678901234567890123456789012345678901234567890123
 db 'Usage: TERMNL <option list>',CR,LF
 db 'Command line and XMODEM.CFG options:',CR
 db '(* means ignored here)',CR,LF
 db ' /A Specify exit chr',CR
 db ' /R Receive, /S Send *',CR
 db ' /C Receive with checksums, else CRCs *',CR
 db ' /E if CP/M RDR returns with Z set when not ready',CR
 db ' /Knn sets buffer max k-bytes (default: all free RAM) *',CR
 db '   nn is decimal, 0<nn<64',CR,LF
 db '--More-','-'+80h

	call	GETCON		;wait for user input

	call	CILPRT

 db ' /In 8080 code patches for /X3 I/O routines:',CR
 db '  /I0 h0 h1 ...h11: initialize',CR
 db '  /I1 h0 h1 ...h11: Tx data, chr in c',CR
 db '  /I2 h0 h1 ...h11: Rx status, Z set if no chr',CR
 db '  /I3 h0 h1 ...h11: Rx data, chr in a',CR
 db ' /M Console message',CR
 db ' /O pp h0 h1...hn sends hex h1-hn to port pp',CR
 db ' /P ss dd qq rr tt defines direct I/O port:',CR
 db '  ss: status port',CR
 db '  dd: data port',CR
 db '  qq: 00/01 for active low/high ready',CR
 db '  rr: Rx ready bit mask',CR
 db '  tt: Tx ready bit mask',CR
 db 'Values for /I, /O and /P are 2-digit hex',CR,LF
 db '--More-','-'+80h

	call	GETCON		;wait for user input

	call	CMSGXT		;print message and exit to CP/M

 db ' /Q for Quiet mode',CR
 db ' /X sets the transfer port:',CR
 db '  /X0 CP/M CON',CR
 db '  /X1 CP/M RDR/PUN * (default)',CR
 db '  /X2 Direct I/O, defined by /P option',CR
 db '  /X3 Custom code from /I patches',CR
 db '  The transfer port must not strip parity',CR
 db ' /Zm for m MHz CPU. 0<m<7, default depends on CPU type *'
DMHZ: db CR+80h

;***Table**********************************
;Port configuration table
;Three words per entry:
; Word 0 = address of receive byte routine
; Word 1 = address of transmit byte routine
;******************************************
PORTAB:	dw	RXRDR,TXPUN    ;X1 CP/M RDR/PUN
	dw	RXDRCT,TXDRCT  ;X2 Direct, setup with /P
	dw	RXCUST,TXCUST  ;X3 Custom, setup with /I

;******************************************************
;RAM Variables and Storage, all initialized during load
;******************************************************
;------------------------------
EXTCHR:	db	CTRLC	;Exit character
OPMODE:	db	01h	;0 means reading from command line
			;01h means reading from XMODEM.CFG
			;80h means end of file forXMODEM.CFG
BYTCNT:	db	0	;command buffer bytes

XPORT:	db	0FFh	;FF means uninitialized (use default)
DPINIT:	db	0FFh	;FF means dirent port uninitialized
			;(must follow XPORT)

ENHRDR:	db	DENHR	;01 for RDR that returns with
			;..Z set if chr not ready

;These are just used for reporting. DON'T CHANGE THE ORDER.

REQMHZ:	db	0FFh	;Requested CPU speed
CPUMHZ:	db	2	;CPU speed in MHz (for timeouts)
CRCFLG:	db	DEFCRC	;0 for checksum, NZ for CRC
PACCNT:	db	0	;FFh disables pacifiers.
BUFMAX:	db	0	;Max address in BUFFER/256
BUFREQ:	db	0	;Requested max buffer address
XMODE:	db	0FFh	;00: send
			;01: Receive mode
			;FFh: uninitialized

;uninitialized code flags for custom port

IITABL:	db	0FFh	;/I0
	db	0FFh	;/I1
	db	0FFh	;/I2
	db	0FFh	;/I3

;***Table************************
;Configuration File Control Block
;********************************
CFGFCB:	db	0		;(dr) use default drive
	db	'XMODEM  '	;(f1-f8)
	db	'CFG'		;(t1-t3)
	db	0,0,0,0		;(ex,s1,s2,rc)
	dw	0,0,0,0,0,0,0,0	;(d0-d15)
	db	0,0,0,0		;(cr,r0,r1,r2)

;***Buffer****************
;Configuration file buffer
;*************************
CFGBUF:	ds	BLKSIZ

	END
