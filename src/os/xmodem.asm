;==============================================================
;               CP/M Xmodem by Martin Eberhard 
;==============================================================
;A command line and configuration file-driven program for
;transferring files to and from a CP/M system using the
;Xmodem protocol, supporting both the original checksum error
;checking, and also the newer Xmodem-CRC error checking
;
;This program has been tested at 115.2 K Baud, running on a
;4 MHz Z80 with 0-wait state memory, and performing direct I/O
;via a CCS 2719A serial board (which is based on the Z80-DART).
;Calculations show that a 2 MHz 8080 ought to be able to send
;and receive up to 76.8K baud (with for example a Cromemco
;TU-ART), so long as there are not too many wait states.
;
; To use Xmodem, type:
;   XMODEM <filename> {option list}
;
; A file name is madatory, and can be any legal CP/M file
; name. If you are receiving with Xmodem and the file already
; exists, then you will be asked if it should be overwritten.
; If you are sending, then the file must exist, obviously.
;
; Xmodem first looks for a file called XMODEM.CFG on CP/M's
; default drive. If found, then this file is parsed for
; options, the same as the command line. XMODEM.CFG is parsed
; first, so that options that are set on the command line will
; override those set in XMODEM.CFG.
;
; XMODEM.CFG and the command line both support the following
; options (though some are less useful on the command line.)
;
;  /R Specifies Receive mode
;
;  /S Specifies Send mode
;
;     If neither /R nor /S is specified then you will be asked.
;
;  /C Selects checksum error checking when receiving;
;     otherwise receiving uses CRC error checking. When
;     sending, the error-checking mode is set by the receiver.
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
;  /Knn sets the maximum buffer size in k-bytes. If no /K
;       option, or if the specified size is larger than the
;       free RAM, then all free RAM will be used.
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
;  /Q Specifies quiet mode, preventing messages and pacifiers
;     from being printed on the console during transfer. This
;     is particularly useful if the port you are using is also
;     the port used for CP/M's console. Otherwise, a '+' will
;     be printed on CON for every succesful block, and a '-'
;     will be printed for every block retry.
;
;  /Xn Specifies the transfer port:
;      n=0 uses CP/M's CON device. Contrary to CP/M specs,
;          the CON input port must not strip parity.
;
;      n=1 uses CP/M'd RDR and PUN devices. Contrary to CP/M
;          specs, the RDR input port must not strip parity.
;          Also use /E if the RDR driver has been enhanced
;          to return with the Z flag set when no character is
;          waiting. (Otherwise, no timeout is possible when
;          waiting for a RDR character.)
;
;      n=2 uses direct I/O, which can be set up using the /P
;          option. If no /P option is entered, then /X2 will
;          select a MITS 88-SIO port.
;
;      n=3 uses custom-patched I/O routines, set with the
;          /I option. If no /I option is entered then
;          transfers with /X3 will just cause errors.
;
;  /Zn Specifies CPU speed in MHz - n is between 1 and 6.
;      The CPU speed used for timeouts while sending or
;      receiving. The default is 2 MHz for an 8080, and 4 MHz
;      for a Z80. (Xmodem can tell the difference.)
;
;   A semicolon begins a comment on a new line. All characters
;   from the ';' until the end of the line will be ignored.
;
; Here is a sample XMODEM.CFG file:
;
;    /MDirect I/O is configured for 88-2SIO port B
;    /P 12 13 01 01 02	;set up for an 88-2SIO Port B
;    /O 12 03 15	;8 bits, 1 stop, no parity
;    /X2		;use direct I/O
;
; You can usually abort a transfer with ^C on the console.
;
;==============================================================
;PROGRAM NOTES
;
;Reducing the buffer size with the /K option can also reduce
;the amount of time consumed by disk accesses.
;
;The /P option modifies code in the direct I/O transmit and
;receive routines. This is because the 8080 has no command to
;IN or OUT with a port that is specified by a register value -
;so self-modifying code is the only way.
;
;Code that is only used during initialization is at the end,
;and gets overwritten by the block buffer. Xmodem uses all
;available RAM (past its 2K runtime code, up through CP/M's
;CCP) for buffering received and transmitted data, to speed up
;transfers by minimizing disk accesses. This allows Xmodem to
;run comfortably in (for example) a 16K-byte CP/M system
;(with 10K of user memory), and still have a decent 8K data
;buffer and reasonably robust options and messages.
;
;The XModem spec calls for a sender to time out after 10
;seconds if it does not receive the ACK after sending a
;complete block. XMODEM.COM holds off the sender while it
;writes to disk by waiting to send the ACK for the most recent
;block. Depending on the BIOS, CP/M can be pretty slow when
;writing to double-density floppy disks (due for example to
;its bloxking/deblocking algorithm, or verified writes). To
;prevent the sender from timing out while Xmodem writes to
;disk, XMODEM.COM receives an occasional Xmodem block while it
;is performing disk writes. To stay within the 10-second
;timeout spec with a slow deblocking algorithm in the BIOS,
;WBPERX should be no arger than about 40. (Hyperterminal is
;happy with a value even higher than 64.) CP/M is usually much
;faster at reading from disk so an equivalent feature is not
;implemented for sending files.
;
;The position of the CRC calculation table (CRCTAB) is forced
;to be on a 256-byte page boundary. Subroutines have been
;shoved around to minimize the number of wasted bytes before
;this table.
;
;This code implicitly assumes that Xmodem blocks are the same
;size as CP/M disk records - 128 bytes each.
;
;This program's help screens will display correctly on displays
;that are 16X64 characters or larger.
;
; Assemble with Digital Research's ASM Assembler
;
;==============================================================
; Thanks to Ward Christensen for inventing Xmodem and keeping
;   it simple.
; Thanks to John Byrns for the Xmodem-CRC extension, which was
;   adopted in Windows Hyperterm.
; Thanks to Keith Petersen, W8SDZ, for a few ideas I borrowed
;   from his XMODEM.ASM V3.2
;==============================================================
;Revision History:
;
; 2.9  14 Novemver 2021  M. Eberhard
;  Eat received characters until the line is idle for 1 second,
;  before receiving a file. Squeeze code a bit to keep it under
;  4 Kbytes.
;
; 2.8  9 April 2019  M. Eberhard
;  Receive blocks occasionally while flushing the buffer to
;  disk, to prevent sender timeout. Recognize CAN chr. Send CAN
;  when aborting reception. Send EOT when aborting during
;  sending. Add /K option. Better abort algorithm. Some
;  improved messages. Squeeze code to keep it under 4K-bytes.
;  Increase the number of bytes for the /I routines from 8 to
;  12 bytes. Eliminate seperate stack for use during INIT.
;  When receiving, chuck the first received chr if it's bogus.
;
; 2.7  9 October 2017  M. Eberhard
;  Fix stack bug when switching stacks
;
; 2.6  10 September 2017
;  Significant speed up by using table-driven CRC algorithm.
;  Make the initialization code modify the jump addresses in
;  RXBYTE and TXBYTE based on the type of transfer port
;  selected, eliminated some subroutine calls, and a few other
;  speed optimizations. Ask user for direction if no /R or /S
;  was specified. Use all RAM (even more than 32K) for the
;  buffer. perform initial buffer fill on Sends (before
;  determining error checking mode), while the disk is still
;  spinning. Flush a byte from the receiver port at the
;  beginning, if possible. Squeeze a bit to keep disk file
;  smaller than 4K-bytes. Tidy up comments and labels.
;
; 2.5  9 May 2017  M. Eberhard
;  Clean up file name in FCB if a command option was crammed
;  against the file name (no spaces) on the command line.
;
; 2.4  4 August 2016  M. Eberhard
;  Fix bug in TXLOOP that would cause sending with checksums
;  to fail. Fix bug causing a spurious block after the 1st
;  buffer-full of received data. (Thanks to Bob Bell for
;  helping find and fix these bugs.) Add /I cmd, and add /X3
;  option for custom port routine patching. (This makes it
;  possible to call external I/O routines, such as SOLOS or
;  POLEX.) Also cleaned up comments.
;
; 2.3  9 Oct 2014 M. Eberhard
;  Eliminate intermediate data buffer. Support CP/M 1.4
;
; 2.2  7 Oct 2014  M. Eberhard
;  fix error-reporting bug, increase stack size for BDOS
;
; 2.1  3 Oct 2014  M. Eberhard
;  Fix bug in reporting the source of an error
;  Speed up RDR/PUN
;  require CR after "Y" on overwrite question
;
; 2.0  1 OCT 2014   M. Eberhard
;  New major release:
;   + Supports a configuration file (XMODEM.CFG), with same
;     options as on the command line
;   + combine features of all 1.0x assembly options
;   + Define direct I/O port in XMODEM.CFG (or on command line)
;   + User-set CPU speed (/Z), overrides 8080/Z80 defaults
;   + Option to delete file on /R, if it already exists
;   + Include which port we are using in announcement prior to
;     Xmodem file transfer
;   + A few new timeouts, to prevent hanging in odd situations
;   + Several other minor enhancements
;
; 1.0x  06 APR 2013 through 27 SEP 2014 M. Eberhard
;  Command-line driven versions Based on Xmodem for CDOS
;  (Z-80), version 1.03 by M. Eberhard
;==============================================================
;---------------------------
;This code's revision number
;---------------------------
VERSION	equ	0209h	;high byte = major revision number
			;low byte = minor version

FALSE	equ	0
TRUE	equ	not FALSE

ERRLIM	equ	10	;Max error-retries. 10 is standard.

DBSIZ	equ	63	;default buffer size (kbytes)
			;(Uses the smaller of this
			;and "all available RAM")

CRSTAL	equ	10	;delay (in seconds) before
			;..receiving when the console
			;..is the transfer port

;The following parameter exists to prevent the sender on
;the other end of the serial port from timing out while
;we do disk writes. See PROGRAM NOTES above.

WBPERX	equ	40	;# of 128-byte disk records to
			;write before requesting
			;another Xmodem block (max=256)

;Timeout values in seconds. Values in parenthesis are
;Xmodem standard values.

SOHTO	equ	10	;(10)sender to send SOH 
NAKTO	equ	90	;(90)receiver to send init NAK
ACKTO	equ	60	;(60)receiver to ACK (or NAK)
			;(time to write to disk)

BLKSIZ	equ	128	;bytes per Xmodem block
			;DO NOT CHANGE. BLKSIZ must be 128

SECSIZ	equ	128	;CP/M logical-sector size must be 128

;Progress pacifiers printed on the console

PACACK	equ	'+'	;Sent/Received a good block
PACNAK	equ	'-'	;Sent/Received a NAK
PACLIN	equ	60	;pacifiers per line

;The following cycle values are used in the timing loops for
;timeouts when transferring via the CON or the RDR and PUN.
;It is ok if they are imperfect - the Xmodem protocol is quite
;tolerant of timing variations. The example BIOS Code below was
;used to estimate these cycle counts for CSTIME and CRTIME.

CSTIME	equ	85	;number of CPU cycles that BIOS uses to
			;..return CON status
CRTIME	equ	95	;number of cpu cycles that BIOS uses to
			;..return with no chr ready for custom
			;..RDR driver

EXTIME	equ	135	;Number of cycles an external receive
			;routine (e.g. SOLOS) will use for testing
			;status, when a chr is not ready.

;===Example BIOS Code==========================================
;Timing est. for getting reader status via custom RDR driver.
;Assume the IOBYTE is implemented, and assume RDR=UR1
;(the desired RDR port)
;This takes 95 8080 cycles.

;	jmp	RDRIN		;(10) BIOS jump vector

;	...

;RDRIN:	lda	IOBYTE		;(13) which reader port?
;	ani	0Ch		;(7)
;	jz	<not taken>	;(10) not RDR=TTY
;	cpi	8		;(7)
;	jc	<not taken>	;(10) not RDR=HSR
;	jz	UR1ST		;(10) RDR=UR1

;	...
	
;UR1ST:	in	<port>		;(10) get reader stat 
;	ani	<mask>		;(7) test, set Z
;	rz			;(11) return from BIOS

;===Example BIOS Code==========================================
;Timing estimate for getting console status.
;Assume the IOBYTE is implemented, and assume CON=CRT
;This takes 85 8080 cycles.

;	jmp	CONST		;(10) BIOS jump vector

;	...

;RDRIN:	lda	IOBYTE		;(13) which CON port?
;	ani	03h		;(7)
;	jz	<not taken>	;(10) not CON=TTY
;	cpi	2		;(7)
;	jc	CRTST		;(10) CON=CRT

;	...
	
;CRTST:	in	<port>		;(10) get reader stat 
;	ani	<mask>		;(7) test, set Z
;	rz			;(11) return from BIOS
;==============================================================

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

;-------------------------------------------------------
;Set the top address of the buffer, in case we don't get
;a /K option. This is actually INIT code, and is placed
;here so that the stack can overwrite it harmlessly.
;-------------------------------------------------------
	lda	BDOSA+1		;msb of start of BDOS
	dcr	a		;last allowed page
	sta	BUFMAX
;--------------------------------------------------------
;Initialize, using code that gets wiped out by the BUFFER
;--------------------------------------------------------
	jmp	INIT

;********************************************************
;The local stack overwrites the above code, and also the
;top of the COMBUF (which is just below USAREA).
;********************************************************
LSTACK	equ	$

;***Function*********************************
;Send a CP/M file in Xmodem format
;On Entry:
;  Disk file is open for reading
;  Initial NAK or SELRC has already been sent
;  FCB is valid
;  BUFCNT = 0
;  XBLOCK = 0
;  BUFMAX = Max address in BUFFER/256
;  PACCNT = 0FFh if quiet mode, 0 otherwise
;  RTORET is set to WAITNK
;********************************************
TXFILE:
;-------------------------------------------------------
;Do initial buffer fill while the disk is still spinning
;-------------------------------------------------------
	call	FILBUF
;------------------------------------------------------
;Get the transfer error checking mode from the receiver
;------------------------------------------------------
	call	GTMODE		;wait for NAK or SELCRC to
				;..determine cksum or CRC mode

	lxi	h,ACKERR	;Timeout return address
	shld	RTORET		;..for RXBYTE
;---------------------------------------------------------
;Transmit the entire file in 128-byte blocks. Whenever the
;buffer is empty, refill it from disk and test for EOF.
;---------------------------------------------------------
TXLOOP:	lhld	BUFCNT		;block count in buffer
	mov	a,h		;16-bit test for 0
	ora	l
	cz	FILBUF		;Empty? go read disk
				;Returns BLKPTR=BUFFER
				;..and hl=BUFCNT=blocks in buf
				;Exit directly if no more data

	dcx	h		;one fewer block in
	shld	BUFCNT		;..the buffer

	lhld	XBLOCK		;inc 16-bit Xmodem block #
	inx	h
	shld	XBLOCK
;---------------------------------------
;Send the block header: SOH, 8-bit Block
;number, Complimented 8-bit block number
;(Block send retry re-entry point)
;On Entry:
;  XBLOCK=16-bit Xmodem block number
;---------------------------------------
TXRTRY:	mvi	a,SOH		;SOH first
	call	TXBYTE

	lda	XBLOCK		;8-bit block number
	call	TXBYTE		;(preserves a)

	cma			;complimented block
	call	TXBYTE
;-------------------------------------------
;Send the next BLKSIZ-byte block from BUFFER
;On Entry:
;  BLKPTR=DMA address
;On Exit:
;  Data checksum is in c
;  16-bit data CRC is in de
;  hl=BLKPTR+128
;-------------------------------------------
	lxi	b,BLKSIZ*256+0	;b=bytes/block,
				;...clear checksum in c

	mov	d,c		;clear CRC in de
	mov	e,c

	lhld	BLKPTR		;(hl) = data in BUFFER

TXBLUP:	mov	a,m		;Get a data byte
	call	TXBYTE		;Send it
;------------------------------------------------------
;(Inline for speed)
;Update the 16-bit CRC and 8-bit checksum with one more
;data byte. Speed matters here. For speed, this code
;assumes that the CRC table is on a page boundary, and
;that the table is split, with the high bytes in the
;first half and the low bytes in the second half.
; a has the byte just transmitted
; c has checksum so far
; de has the CRC so far
;------------------------------------------------------
	push	h		;(11)

	mvi	h,CRCTAB/256	;(7)CRC table addr high byte

	xra	d		;(4)compute lookup address
	mov	l,a		;(5)low byte of lookup

	xra	d		;(4)recover original byte
	add	c		;(4)update checksum too
	mov	c,a		;(5)

	mov	a,m		;(7)compute new CRC high byte			
	xra	e		;(4)using the table
	mov	d,a		;(5)

	inr	h		;(5)low bytes are in the
	mov	e,m		;(5)..other half of the table

	pop	h		;(10)
;-----------------------------------------------------------
;CRC is done. Next byte, unless we have transmitted them all
;-----------------------------------------------------------
	inx	h		;Next byte
	dcr	b
	jnz	TXBLUP		;loop through block
;--------------------------------------------
;Send checksum or 16-bit CRC, based on CRCFLG
;  c= 8-bit checksum
;  de = CRC16
;  CRCFLG <>0 if CRC mode enabled
;  hl=BLKPTR+128
;--------------------------------------------
	lda	CRCFLG		;Checksum or CRC?
	ora	a		;clear Z if CRCFLG
	jz	TXCKSM		;jump to send checksum

	mov	a,d
	call	TXBYTE		;send byte in a
	mov	c,e		;now the 2nd CRC byte

TXCKSM:	mov	a,c		;a=cksum or CRC 2nd byte 
	call	TXBYTE		;send byte in a
;-------------------------------------------
;Wait for the ACK. If none arrives by the
;end of the timeout, or if a NAK is received
;instead of an ACK, then resend the block.
;  hl=BLKPTR+128
;-------------------------------------------
	call	GETACK		;Wait for the ACK
				;a=0, Z set if ACK
	jnz	TXRTRY		;NZ: timeout or NAK

	sta	ERRCNT		;a=0
	shld	BLKPTR		;next block in the buffer
;----------------------------------------------------
;Ack received. Print pacifier, and go send next block
;----------------------------------------------------
	call	PACOK
	jmp	TXLOOP

;***Function*******************************
;Receive Xmodem file & save it to disk
;-->Entry is at RXFILE<--
;On Entry:
;  Carry is clear
;  a=(NAKCHR) (which is NAK or SELCRC),
;    to start the transfer
;  FCB is valid
;  Disk file has been created and is open
;  XBLOCK=0
;  EOFLAG = 00h
;  FCB is valid
;  BUFPTR = BUFFER
;  BUFMAX = Max address in BUFFER/256
;  XBLOCK = 0
;  PACCNT = 0FFh if quiet mode, 0 otherwise
;  RTORET is set to RXSERR
;******************************************
;-------------------------------------------------------
;Loop to receive Xmodem blocks until we get an EOT.
;Flush the buffer whenever it becomes full.
;  XBLOCK=16-bit block number
;EOFLAG = 00h if no EOT yet
;       = FFh if EOT received and it has been ACKed
;-------------------------------------------------------
RXLOOP:	lda	EOFLAG		;msb means EOT's been ACKed
	add	a		;carry means EOT's been ACKed

	mvi	a,ACK
;=====================================
;Routine Entry
;(a=NAKCHR and Carry cleared on entry)
;=====================================
RXFILE:	push	psw		;remember carry
	cnc	TXBYTE		;ack a block
	pop	psw		;carry means EOT's been ACKed

	cnc	RXBLK		;go receive 1 block,
				;unless we got the EOT
			   	;On return, carry means BUFFER
				;..is full or EOT or CAN

	cc	WFLUSH		;Flush if needed
				;Carry set if none flushed
	jnc	RXLOOP

;WFLUSH returned with carry set: success

	call	CILPRT		;Success message
	db	'O','K'+80h

;Fall into RXEND to close the file and report

;***Exit*****************************************
;Close the file. If no blocks were written, then
;erase the empty file; otherwise, print the
;number of blocks received. Then return to CP/M.
;On Entry:
;  XBLOCK = block count 
;************************************************
RXEND:	mvi	c,BCLOSE	;CP/M CLOSE FILE function
	call	FCBDOS		;sets de=FCB
	jm	FCLERR		;-1 meant close error

	lda	XMODE		;Did we ever write?
	add	a		;msb means yes
	jc	RRXCNT

	call	FERASE		;n: erase empty file
	jm	EFEXIT		;BDOS returns FFh if failed

RRXCNT:	call	CILPRT
	db	'Received',' '+80h

;Fall into REPCNT

;***Exit*******************************************
;Report 16-bit block count, and then return to CP/M
;On Entry:
;  XBLOCK = block count 
;  either 'sent ' or 'received ' already printed
;**************************************************
REPCNT:	lhld	XBLOCK
	call	PDEC16		;print block count in decimal

	call	MSGXIT		;print & return to CP/M
	db	' block','s'+80h

;***Subroutine*****************************************
;Get an ACK from the receiver. If we get a NAK, then
;print the NAK pacifier on the console. Opportunity for
;user to abourt (with ^C) if timeout waiting for ACK.
;On Entry:
;  RTORET = ACKERR (RXBYTE eror return adress)
;On Exit:
;  Z set and a=0 if ACK received
;  Abort if CAN received
;  Z clear if NAK received, bogus, or timeout
;  If too many errors, abort
;Good ack: all other registers preserved
;Bad ack: trashes hl
;******************************************************
;-----------------------------------------
;Get a received byte, or timeout. Return
;with Z set and carry clear if it's an ACK
;-----------------------------------------
GETACK:	mvi	a,ACKTO*2	;ACK-wait timeout value
	call	RXBYTE		;go get a character
				;timeout will "return"
				;..to ACKERR

	xri	ACK		;Did we get an ACK?
	rz			;Y: Z set, a=0
;---------------------------------------------
;Is the receiver trying to cancel the session?
;---------------------------------------------
	xri	CAN xor ACK	;Xmodem Cancel chr
	jz	RXCAN		;cancel with a=0

;Fall into ACKERR

;***Subroutine***********************************
;If anything else (including a NAK, or an RXBYTE
;timeout, which jumps to ACKERR), print an error-
;pacifier and return with Z cleared, unless the
;user aborts. If too many errors, then abort.
;On Exit:
;  Z clear
;Trashes a,bc,hl
;************************************************
ACKERR:	call	PACERR		;opportunity to abort,
				;pacifier if allowed
	lxi	h,ERRCNT	;bump error count
	inr	m

	mov	a,m		;too many errors?
	cpi	ERRLIM
	rc			;N: Z cleared for fail

;----Exit------------------------------
;Abort waiting for ACK: Too many errors
;--------------------------------------
	call	CANABT			;Cancel and abort
	db	(ERRLIM/10)+'0'		;too many bad ACKs
	db	(ERRLIM-((ERRLIM/10)*10))+'0'
	db	' ACK error','s'+80h

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

;***Table*******************************
;CRC Calculation Table
;strategically placed on a page boundary
;***************************************
TPAGER	equ	$		;Force page alignment
	org	(TPAGER+255) and 0FF00h

CRCTAB:

;high bytes

db	000h,010h,020h,030h,040h,050h,060h,070h
db	081h,091h,0A1h,0B1h,0C1h,0D1h,0E1h,0F1h
db	012h,002h,032h,022h,052h,042h,072h,062h
db	093h,083h,0B3h,0A3h,0D3h,0C3h,0F3h,0E3h
db	024h,034h,004h,014h,064h,074h,044h,054h
db	0A5h,0B5h,085h,095h,0E5h,0F5h,0C5h,0D5h
db	036h,026h,016h,006h,076h,066h,056h,046h
db	0B7h,0A7h,097h,087h,0F7h,0E7h,0D7h,0C7h
db	048h,058h,068h,078h,008h,018h,028h,038h
db	0C9h,0D9h,0E9h,0F9h,089h,099h,0A9h,0B9h
db	05Ah,04Ah,07Ah,06Ah,01Ah,00Ah,03Ah,02Ah
db	0DBh,0CBh,0FBh,0EBh,09Bh,08Bh,0BBh,0ABh
db	06Ch,07Ch,04Ch,05Ch,02Ch,03Ch,00Ch,01Ch
db	0EDh,0FDh,0CDh,0DDh,0ADh,0BDh,08Dh,09Dh
db	07Eh,06Eh,05Eh,04Eh,03Eh,02Eh,01Eh,00Eh
db	0FFh,0EFh,0DFh,0CFh,0BFh,0AFh,09Fh,08Fh
db	091h,081h,0B1h,0A1h,0D1h,0C1h,0F1h,0E1h
db	010h,000h,030h,020h,050h,040h,070h,060h
db	083h,093h,0A3h,0B3h,0C3h,0D3h,0E3h,0F3h
db	002h,012h,022h,032h,042h,052h,062h,072h
db	0B5h,0A5h,095h,085h,0F5h,0E5h,0D5h,0C5h
db	034h,024h,014h,004h,074h,064h,054h,044h
db	0A7h,0B7h,087h,097h,0E7h,0F7h,0C7h,0D7h
db	026h,036h,006h,016h,066h,076h,046h,056h
db	0D9h,0C9h,0F9h,0E9h,099h,089h,0B9h,0A9h
db	058h,048h,078h,068h,018h,008h,038h,028h
db	0CBh,0DBh,0EBh,0FBh,08Bh,09Bh,0ABh,0BBh
db	04Ah,05Ah,06Ah,07Ah,00Ah,01Ah,02Ah,03Ah
db	0FDh,0EDh,0DDh,0CDh,0BDh,0ADh,09Dh,08Dh
db	07Ch,06Ch,05Ch,04Ch,03Ch,02Ch,01Ch,00Ch
db	0EFh,0FFh,0CFh,0DFh,0AFh,0BFh,08Fh,09Fh
db	06Eh,07Eh,04Eh,05Eh,02Eh,03Eh,00Eh,01Eh

;Low Bytes

db	000h,021h,042h,063h,084h,0A5h,0C6h,0E7h
db	008h,029h,04Ah,06Bh,08Ch,0ADh,0CEh,0EFh
db	031h,010h,073h,052h,0B5h,094h,0F7h,0D6h
db	039h,018h,07Bh,05Ah,0BDh,09Ch,0FFh,0DEh
db	062h,043h,020h,001h,0E6h,0C7h,0A4h,085h
db	06Ah,04Bh,028h,009h,0EEh,0CFh,0ACh,08Dh
db	053h,072h,011h,030h,0D7h,0F6h,095h,0B4h
db	05Bh,07Ah,019h,038h,0DFh,0FEh,09Dh,0BCh
db	0C4h,0E5h,086h,0A7h,040h,061h,002h,023h
db	0CCh,0EDh,08Eh,0AFh,048h,069h,00Ah,02Bh
db	0F5h,0D4h,0B7h,096h,071h,050h,033h,012h
db	0FDh,0DCh,0BFh,09Eh,079h,058h,03Bh,01Ah
db	0A6h,087h,0E4h,0C5h,022h,003h,060h,041h
db	0AEh,08Fh,0ECh,0CDh,02Ah,00Bh,068h,049h
db	097h,0B6h,0D5h,0F4h,013h,032h,051h,070h
db	09Fh,0BEh,0DDh,0FCh,01Bh,03Ah,059h,078h
db	088h,0A9h,0CAh,0EBh,00Ch,02Dh,04Eh,06Fh
db	080h,0A1h,0C2h,0E3h,004h,025h,046h,067h
db	0B9h,098h,0FBh,0DAh,03Dh,01Ch,07Fh,05Eh
db	0B1h,090h,0F3h,0D2h,035h,014h,077h,056h
db	0EAh,0CBh,0A8h,089h,06Eh,04Fh,02Ch,00Dh
db	0E2h,0C3h,0A0h,081h,066h,047h,024h,005h
db	0DBh,0FAh,099h,0B8h,05Fh,07Eh,01Dh,03Ch
db	0D3h,0F2h,091h,0B0h,057h,076h,015h,034h
db	04Ch,06Dh,00Eh,02Fh,0C8h,0E9h,08Ah,0ABh
db	044h,065h,006h,027h,0C0h,0E1h,082h,0A3h
db	07Dh,05Ch,03Fh,01Eh,0F9h,0D8h,0BBh,09Ah
db	075h,054h,037h,016h,0F1h,0D0h,0B3h,092h
db	02Eh,00Fh,06Ch,04Dh,0AAh,08Bh,0E8h,0C9h
db	026h,007h,064h,045h,0A2h,083h,0E0h,0C1h
db	01Fh,03Eh,05Dh,07Ch,09Bh,0BAh,0D9h,0F8h
db	017h,036h,055h,074h,093h,0B2h,0D1h,0F0h

;***Subroutine******************************************
;Receive & validate a block, and see if we got an EOT
;  XBLOCK=16-bit block number of the last block received
;On Entry:
;  BLKPTR = address for next block
;  BUFCNT = number of blocks in the buffer
;  XMODE<1> = 1 iff called from within FLUSH
;   (meaning CCTRLC should not try to flush)
;  BUFMAX = Max address in BUFFER/256
;On Exit (valid block):
;  Carry set if buffer full
;  BLKPTR points to next space
;  BUFCNT incremented
;On Exit, EOF received
;  Carry set
;  EOFLAG = FFh
;  ACK has NOT been sent
;Trashes all registers
;*******************************************************
RXBLK:	xra	a
	sta	ERRCNT		;Clear error count

;---------------------------------------
;Wait for SOH from sender to start
;reception, go investigate anything else
;---------------------------------------

;Bad block retry re-entry point

RXRTRY:	mvi	a,SOHTO*2	;Timeout for SOH
	call	RXBYTE

	cpi	SOH		;Did we get an SOH?
	jnz	NOTSOH		;If not, see what we got
;------------------------------------------------
;Got an SOH at beginning of the block. Now get
;the rest of the block header: 8-bit Block number
;followed by the complemented 8-bit block number
;------------------------------------------------
	mvi	a,NAK		;we have received
	sta	NAKCHR		;..at least one SOH
	sta	RX1ST		;we've received now

	call	RXBYT1		;Get block number
	mov	d,a		;Save block number

	lda	XBLOCK		;8-bit previous block number
	mov	e,a		;..for later

	call	RXBYT1		;complimented block number
	cma			;(4)compliment to compare

	cmp	d		;(4)
	jnz	PURGE		;(10)No match: error
;---------------------------------------------------
;Calculate and remember the difference between this
;block number and the previous block's block number.
;(We calculate this here because we have the time.)
;---------------------------------------------------
	sub	e		;(4)calc the difference
				;0 means same block
				;1 means next block
	sta	RXBDIF		;(7)Save block number diff
;-----------------------------------------------------
;Loop to receive BLKSIZ bytes and store them in the
;next slot in the buffer, computing both the checksum
;and the CRC along the way. Throughout the RXCHR loop:
;  b is the byte counter
;  c accumulates the checksum
;  de accumulates the CRC
;  hl is the buffer memory pointer
;----------------------------------------------------
	lxi	b,BLKSIZ*256+0	;(10)b=bytes, c=0 checksum
	mov	d,c		;(5)Clear CRC too
	mov	e,c		;(5)

	lhld	BLKPTR		;(16)next block in the buffer


RXCHR:	call	RXBYT1		;(17+118)Get one byte of data

	mov	m,a		;(7)Store byte in buffer
;-------------------------------------------------------------
;(Inline for speed: this is the critical path when receiving.)
;Update the 16-bit CRC and 8-bit checksum with one more data
;byte. For speed, this code assumes that the CRC table is on
;a page boundary, and that the table is split, with the high
;bytes in the first half and the low bytes in the second half.
;   a has the newly received byte
;   c has checksum so far
;   de has the CRC so far
;(This loop uses 238 8080 cycles IN-to-IN for direct I/O. with
;a 4 MHz Z80, this will require about 60 uS per byte. 115.2K
;baud sends a byte every 86.8 uS, so we have enough headroom.)
;-------------------------------------------------------------
	push	h		;(11)

	mvi	h,CRCTAB/256	;(7)CRC table addr high byte

	xra	d		;(4)compute lookup address
	mov	l,a		;(5)low byte of lookup

	xra	d		;(4)recover original byte
	add	c		;(4)update checksum too
	mov	c,a		;(5)

	mov	a,m		;(7)compute new CRC high byte			
	xra	e		;(4)..using the table
	mov	d,a		;(5)

	inr	h		;(5)low bytes are in the
	mov	e,m		;(5)..other half of the table

	pop	h		;(10)
;--------------------------------------------------------------
;Next byte, unless we have received all the data for this block
;--------------------------------------------------------------
	inx	h		;(5)next byte
	dcr	b		;(5)
	jnz	RXCHR		;(10)
;-------------------------------------------------------
;We've received all the block's data bytes. Now verify
;either the checksum in c or CRC in de, based on CRCFLG.
;  hl=next buffer address
;-------------------------------------------------------
	lda	CRCFLG		;CRC mode?
	ora	a		;0 means cksum
	jz	RXCKSM

	call	RXBYT1		;Get 1st byte of CRC

	cmp	d		;test the 1st CRC byte
	jnz	RXCERR		;fail: try again, but
				;..first, purge 2nd CRC

	mov	c,e		;put 2nd CRC byte in c

RXCKSM:	call	RXBYT1		;2nd CRC byte or cksum

	cmp	c		;Does it match?
	jnz	RXSERR		;No: error
;------------------------------------------------------
;Got an error-free block. See if it has the block
;number we expected, based on the prior block's number.
;  hl=next buffer address
;  RXBDIF = this block's block number minus the
;    previous block's block number.
;  Carry is clear here.
;------------------------------------------------------
	lda	RXBDIF		;difference between this
				;block's number & the
				;prior block's number
	dcr	a
	jnz	BLKORD		;Nonsequential? (Carry clear)
;-----------------------------------------
;Correct block received. Bump pointers and
;counters, and see if the buffer is full.
;  hl=next buffer address
;-----------------------------------------
	shld	BLKPTR		;next slot in BUFFER
	mov	d,h		;remember for full-test

	lhld	BUFCNT		;bump buffer block count
	inx	h
	shld	BUFCNT
	
	lhld	XBLOCK		;inc 16-bit Xmodem block #
	inx	h
	shld	XBLOCK

;Print good-block pacifier on the console, if enabled

	call	PACOK

;Test for enough room in the buffer for another
;block, and return with carry set if not.
;d = (BLKPTR)/256, the page address for the next block

	lda	BUFMAX
	cmp	d		;carry: not room for another
	ret
;-------------------------------------------------------
;Non-sequential block received without a checksum or CRC
;error. a=FFh if this block has the same block number as
;the previous block (and should be ignored). Otherwise
;abort because blocks hves been irretrievably lost.
;Carry is clear on entry
;-------------------------------------------------------
BLKORD:	inr	a		;was it FFh?
	rz			;y: ignore repeated block
				;..return with carry clear
;---Exit----------------
;Blocks are out of order
;-----------------------
	call	CANABT		;cancel and abort
	db 'Lost block','s'+80h	;out of sequence

;-----------------------------------------------------------
;Received something besides an SOH. If it was an EOT or a
;CAN then send an ACK, set EOFLAG=FFh, and return with carry
;set. If it was a CAN then say so and abort. Ignore a bogus
;chr on the very 1st byte ever received, in case the UART
;receiver had a garbage chr when we started.
;-----------------------------------------------------------
NOTSOH:	lxi	h,RX1ST		;First byte received?
	inr	m
	dcr	m
	jz	PURGE		;y: just ignore bogus chrs

	cpi	CAN		;Cancel?
	jnz	CHKEOT

	call	CILPRT
	db	'Sender cancele','d'+80h

	mvi	a,EOT		;act like we got an EOT
				;..so we will FLUSH

CHKEOT:	cpi	EOT		;End of Xmodem file?
	jnz	PURGE		;n: bogus

	call	TXACK		;returns a=ACK

	sui	ACK+1		;a=FF, carry set
	sta	EOFLAG		;Remember EOT
	ret
;***Subroutine****************************************
;Eat incoming bytes (up to 256 received bytes) until
;the line is quiet for 1 second. (RXBYT1 timeout will
;jump to the address in RTORET, which is set up during
;initialization.)
;Trashes b
;*****************************************************
PURGE:	mvi	b,0		;allow 256 babbling chrs

PRGLUP:	call	RXBYT1		;Receive w/ 1-sec timeout
	dcr	b
	jnz	PRGLUP		;RXBYT1 times out to RXSERR

;---Exit-------------------------------------------
;The transmitter is babbling, unable to synchronize
;with the incoming data stream. Abort with message.
;--------------------------------------------------
	call	CANABT			;Cancel and abort
   db  'Can',QUOTE,',t syn','c'+80h	;can't find SOH
;--------------------------------
;Error on 1st CRC byte. Flush 2nd
;CRC byte, and indicate an error.
;--------------------------------
RXCERR:	call	RXBYT1		;get and chuck 2nd CRC byte
;---------------------------------------------------------
;Send a NAK to indicate receive error. NAKCHR (below) gets
;modified. If we are waiting to start and we are in CRC
;mode (NAKCHR=SELCRC), then send SELCRC instead of NAK.
;---------------------------------------------------------
RXSERR:	call	PACERR		;opportunity to abort,
				;pacifier if allowed
				;trashes bc,hl

	mvi	a,NAK		;This NAK gets modified
NAKCHR	equ	$-1		;..if CRC's

	call	TXBYTE

;Bump error count, and abort if too many errors.
;otherwise, retry the block.

	lxi	h,ERRCNT	;Clear error count
	inr	m		;bump error count

	mov	a,m		;Too many errors?
	cpi	ERRLIM
	jc	RXRTRY		;No: try again

;---Exit------------------------
;Too many errors. Abort cleanly.
;-------------------------------
	call	CANABT		;Cancel and abort
	db  (ERRLIM/10)+'0'	;too many block retries
	db  (ERRLIM-((ERRLIM/10)*10))+'0'
	db  ' bad block','s'+80h

;***Subroutine**********************************************
;Write all data in BUFFER to disk
;Every WBPERX disk writes, stop to receive one Xmodem block,
;often enough that the sender does not time out. Put out.
;(Stop doing this once we receive an Xmodem EOT.) the new
;blocks in the beginning of the BUFFER, where it's already
;been cleared it out by writing to disk. This code assumes
;that disk records are the same size as Xmodem blocks, 12
;bytes each.
;On Entry:
;  BUFCNT = count of blocks currently in BUFFER
;  FCB describes the open file
;  XMODE = 01 if no disk writes yet
;        = 81 if disk writes have ever occured
;On Exit:
;  Carry set if no blocks written
;  BUFCNT=number of new blocks in buffer
;  BLKPTR points to next free space in the buffer
;  XMODE = 81h if disk writes have occured
;Trashes all registers
;***********************************************************
WFLUSH:	lhld	BUFCNT
	mov	a,h
	ora	l
	stc
	rz

	mvi	a,82h		;remember we are flushing
	sta	XMODE		;and that we wrote

	xchg			;de has block count

	lxi	h,0		;reset block count
	shld	BUFCNT

	mvi	h,BUFFER/256	;reset BLKPTR
	shld	BLKPTR		;(BUFFER is page-aligned)
;-----------------------------------------------------
;Loop to write all blocks in the BUFFER to disk. 
; b = WBPERX count-down of received xmodem blocks
;     (to prevent timeout)
; de = number of BUFFER records to write to disk
; hl = pointer for data to write to disk
; BLKPTR = DMA address for new received Xmodem blocks
; BUFCNT counts new Xmodem received blocks
; XMODE = 82h (we will write, currently flushing)
;-----------------------------------------------------
WFLP0:	mvi	b,WBPERX and 0FFh ;interleave counter

;Check for ^C, with XMODE=82, indicating that the ^C
;occured during flush (meaning that the abort routine
;should not attempt to flush the buffer).

	call	CCTRLC		;User abort? trashes c

WFLOOP:	mov	a,d		;de=write record cnt
	ora	e		;any more to send?
	jnz	WFLP1		;y:keep flushing
	
	mvi	a,81h		;no longer flushing
	sta	XMODE
	ret			;done, carry clear
WFLP1:

;Write a disk record at hl to disk

	push	d		;record count

	mov	d,h		;de gets DMA address
	mov	e,l

	mvi	c,BSTDMA	;CP/M SET DMA function
	call	GOBDOS		;de = DMA address

	mvi	c,BWRITE	;Write from buf to disk
	call	FCBDOS		;returns Z for success

	lxi	d,BLKSIZ	;de=block size
	dad	d		;(hl)=next block data

	pop	d		;record count

	jnz	WFAIL		;Oops, write error

	dcx	d		;next block
;----------------------------------------------------
;See if we need to do a block read. Read a block
;if b has counted down to 0.
;Within RXBLK
; BUFPTR = DMA address for new received Xmodem blocks
; BUFCNT counts new received Xmodem blocks
; EOFLAG <> 0 if we've received the Xmodem EOT
; XMODE = 82h (writes occured, currently flushing)
;----------------------------------------------------
	dcr	b
	jnz	WFLOOP

	lda	EOFLAG		;has sender finished?
	ora	a
	jnz	WFLP0

	call	TXACK		;ACK prvious block

	push	h
	push	d
	push	b

	call	RXBLK		;get 1 more block
				;(will never be full)
	pop	b
	pop	d
	pop	h

	jmp	WFLP0		;until all blocks sent

;***Subroutine**************************************
;Read more blocks from the disk and put them in the
;buffer until it is full or there are no more blocks
;On Entry:
;  BUFCNT = 0
;  BUFMAX = Max address in BUFFER/256
;  Buffer start address = BUFFER
;On Exit:
;  BLKPTR = buffer start address
;  BUFCNT=number of 128-byte blocks in the buffer
;  hl=(BUFCNT)
;  EOFLAG set if EOF encountered
;  direct exit to TXEOF if no more data
;Trashes all registers
;***************************************************

;--------------------------------------------------------
;BUFFER is empty: read 128-byte logical disk sectors into
;the buffer until EOF or the buffer is full (up to BDOS)
;--------------------------------------------------------
FILBUF:	lda	EOFLAG		;already seen the EOF?
	ora	a
	jnz	TXEOF		;y: no more data.

	lxi	h,BUFFER
	shld	BLKPTR		;reset pointer for exit
	xchg			;de=address in BUFFER

FBLOOP:	mvi	c,BSTDMA	;de=CP/M DMA address
	call	GOBDOS		;Trashes no registers

	xchg			;pointer to hl, free de

	mvi	c,BREAD		;Logical sector into BUFFER
	call	FCBDOS		;sets de=FCB, Z for success
	jnz	FBEOF		;EOF from CP/M?: no more data


	lxi	d,SECSIZ 	;logical sector size
	dad	d		;next logical sector's address
	xchg			;..into de

	lhld	BUFCNT		;count blocks in buffer. Note:
	inx	h		;this assumes blocks are the
	shld	BUFCNT		;same size as logical sectors.

;Test to see if there's enough room in the buffer for
;another logical disk sector, and return if not.

	lda	BUFMAX		;Page of last allowed address
	cmp	d		;carry set if not room
				;..for another block
	jnc	FBLOOP		;go until all space used

	ret			;with hl=BUFCNT
;-------------------------------------------
;We got an EOF from CP/M. If we read 0
;logical sectors, then send the EOF and end.
;On Entry:
;  a<>0
;  count-down on stack
;  BUFCNT = # of blocks read from disk
;On Exit:
;  hl=(BUFCNT)
;  EOFLAG <> 0
;-------------------------------------------
FBEOF:	sta	EOFLAG		;Set EOF flag

	lhld	BUFCNT		;zero blocks?
	mov	a,h
	ora	l
	rnz			;n: ret with hl=BUFCNT

;Fall into TXEOF to end transmission

;***Exit************************************************
;File send completed. Send EOT'S until we get an ACK
;Then print happy message, report block count anbd exit.
;On Entry:
;  XBLOCK=16-bit block number of the last block sent
;*******************************************************
TXEOF:	mvi	a,EOT		;Send an EOT
	call	TXBYTE

	call	GETACK		;Wait for an ACK
	jnz	TXEOF		;Loop until we get an ACK

	call	CILPRT		;report success
	db	'OK',CR
	db	'Sent',' '+80h

	jmp	REPCNT		;print block count, goto CP/M

;***Subroutine********************************
;Send ACK
;  returns a=ACK
;  flags trashed
;  All other registers preserved
;*********************************************
TXACK:	mvi	a,ACK

;Fall into TXBYTE

;***Subroutine********************************
;Send a to the transfer port, based on XPORT
;and the assembly options.
;This routine gets modified during INIT to
;connect the correct transmit routine.
;On Entry:
;  a = byte to send
;  TXROUT has been modified by initialization,
;    based on the default or a /X option
;On Exit:
;  All registers except flags preserved
;*********************************************
TXBYTE:	push	b
	mov	c,a		;chr to c

TXROUT:	jmp	EXIT		;This gets modified with
				;..the routine address

;***Subroutine************************
;Receive a byte, with 1-second timeout
;On Entry:
;  RTORET = error return address
;On Exit:
;  exit to RTORET if timeout
;  a = received byte if no timeout
;*************************************
RXBYT1:	mvi	a,2		;1-second timeout

;Fall into RXBYTE

;***Subroutine*********************************************
;Receive a byte from the transfer port - from the CON or
;RDR device or a direct I/O port.The RDR port may or may
;not be enhanced to return with Z set if no chr is waiting.
;
;On Entry:
;  RXROUT has been patched by the initialization code,
;    subject to the default port or as set by the /X option
;  a = timeout value in half-seconds
;  RTORET = error return address
;On Exit:
;  exit to RTORET if timeout
;  a = received byte if no timeout
;(118 8080 cycles for direct I/O)
;**********************************************************
RXBYTE:	sta	TIMRH		;(13)Timer high byte
	push	h		;(11)
	lhld	TIMRLD		;(16)start timeout timer

RXROUT:	jmp	EXIT		;(10)This gets modified with
				;..the routine address

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
PRINTA:	mov	c,a		;value to c for PRINTC

;Fall into PRINTC

;***Subroutine******************
;Print character in c on console
;Trashes psw
;*******************************
PRINTC:	mvi	a,CONOUT
	jmp	GOBIOS

;***Subroutine********************************
;Print error pacifier on the console unless
;disabled, giving the user a chance to abort
;On Entry:
;  PACCNT =FFh to disable pacifier printing
;  otherwise, PACCNT = column count-down
;On Exit:
;  PACCNT decremented, and reset to PACCNT,
;  unless it was FFh
;Trashes psw,bc,hl
;*********************************************
PACERR:	mvi	b,PACNAK
	db	21h		;'LXI H' opcode skips 2 bytes

;Hop into PACIFY

;***Subroutine************************************
;Print success pacifier on the console unless
;disabled, giving the user a chance to abort
;On Entry:
;  PACCNT =FFh to disable pacifier printing
;  otherwise, PACCNT = column count-down
;On Exit:
;  PACCNT decremented, and reset to PACCNT,
;  unless it was FFh
;Trashes psw,bc,h
;*************************************************
PACOK:	mvi	b,PACACK

;Fall into PACIFY

;***Subroutine************************************
;Print pacifier on the console unless disabled,
;giving the user a chance to abort
;Print a CR/LF at the end of every PACLIN columns.
;On Entry:
;  PACCNT =FFh to disable pacifier printing
;  otherwise, PACCNT = column count-down
;  b=pacify character
;On Exit:
;  PACCNT decremented, and reset to PACCNT,
;  unless it was FFh
;Trashes psw,c,hl
;*************************************************
PACIFY:	lxi	h,PACCNT
	mov	a,m		;FF means quiet mode
	inr	a
	rz

	dcr	m
	jp	PCFY1

	call	ILPRNT		;new line, trashes c
	db	CR+80h		;ILPRNT adds the LF

	mvi	m,PACLIN

PCFY1:	mov	c,b		;recover pacifier
	call	PRINTC		;..and print it

;Fall into CCTRLC for a user-abort opportunity

;***Subroutine*************************************
;Check for Control-C on the console, and quit if so
;On Exit:
;  Z set if no chr was waiting
;  Z clear if anything but ^C was waiting
;  XMODE<1>=1 iff called from within FLUSH
;        (meaning CANABT should not flush)
;Trashes a
;**************************************************	
CCTRLC:	mvi	a,CONST		;anything on console?
	call	GOBIOS		;(about 200 cycles)
	ora	a		;Z means no chr waiting
	rz

;Chr waiting: fall into GETCON to take a look

;***Subroutine*********************************
;Get console character, abort if it's control-C
;On Exit:
;  chr in a
;  Z cleared
;  XMODE<1>=1 iff called from within FLUSH
;        (meaning CANABT should not flush)
;Trashes a
;**********************************************	
GETCON:	mvi	a,CONIN		;read the typed chr
	call	GOBIOS
	cpi	CTRLC
	rnz			;ignore everything else

;---Exit---
;User abort
;----------
	call	CANABT
	db	'^','C'+80h	;User typed ^C

;***Subroutine*******************************
;Erase file at FCB
;On Exit:
;  de=FCB
;  Flags set according to how BDOS returned a
;  (M flag set if error)
;Trashes psw,c
;********************************************
FERASE:	mvi	c,BDELET

;Fall into FCBDOS

;***Subroutine*******************************
;Call BDOS with de=FCB
;On Exit:
;  de=FCB
;  Flags set according to how BDOS returned a
;********************************************
FCBDOS:	lxi	d,FCB

;Fall into GOBDOS

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

;***Subroutine*********************************************
;Get the error-checking mode: Wait for the initial NAK or
;SELCRC from the receiver. (NAK means we use checksums, and
;SELCRC means we use CRC-16.) Ignore all other characters,
;with a long timeout. Abort if user types Control-C.
;
;This subroutine is not in INIT because it gets called
;after FILBUF has filled the BUFFER and wiped out INIT.
;
;On Entry:
;  RTORET is set to WAITNK
;  PACCNT=FFh if quiet mode or using console for transfers
;   (so don't print messages on console)
;On Succesful Exit:
;  CRCFLG = 0 if NAK received
;  CRCFLG <> 0 if SELCRC received
;  Message printed if not quiet mode
;Trashes psw,bc
;**********************************************************
GTMODE:	mvi	b,NAKTO		;Long timeout

	lda	PACCNT		;for quiet mode test
	mov	c,a

WAITNK:	dcr	b		;Timeout?
	jz	NTOERR		;Y: abort

	call	RXBYT1		;1-second timeout
	xri	NAK		;NAK for checksum?

	sta	CRCFLG		;0 for cksum, NZ otherwise

	jz	PCSNT		;yes:message, done

	xri	SELCRC xor NAK	;'C' for CRC?
	jnz	WAITNK		;No: Keep looking

	inr	c		;Quiet mode?
	rz			;y: no message

;Fall into PCRC

;***Subroutine******************
;Print 'with CRCs'
;On Entry:
; a = initial value for NAKCHR
;     (only used when receiving)
;On Exit:
;  Z flag cleared
;Trashes a,c
;*******************************
PCRC:	sta	NAKCHR		;set CRC initial ACK
				;used only by RXFILE

	call	ILPRNT
	db	' with CRC','s'+80h
	ret

;***Subroutine**********************
;Print 'with checksums' unless quiet
;On Entry:
;  c= FFh if quiet mode
;Trashes a,c
;***********************************
PCSNT:	inr	c		;quiet mode?
	rz			;y: no message

;Fall into PCKSUM

;***Subroutine*********
;Print 'with checksums'
;On Exit:
;  Z flag cleared
;Trashes a,c
;**********************
PCKSUM:	call	ILPRNT
	db	' with checksum','s'+80h
	ret

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

;***Exit****************
;Timeout waiting for NAK
;***********************
NTOERR:	call	CANABT
	db	'Init timeou','t'+80h	

;***Exit*************
;Write fail from CP/M
;********************
WFAIL:	call	CANABT			;Cancel and abort
	db  'Disk write fai','l'+80h	;CP/M error

;***Exit************************
;Transmitter timeout: the UART's
;CTS signal is probably not true.
;On Entry:
;  a=0
;********************************
TXBTO:	mov	b,a		;b=0: don't close file
	call	ABORT
	db	'UART Tx fai','l'+80h

;***Exit**************************************
;Receiver sent us a CAN, so abort with message
;a=0
;*********************************************
RXCAN:	mov	b,a		;0 for no flush
	call	ABORT
	db	'by receive','r'+80h

;***Exit****************************************
;Cancel and Abort - if receiving, send a CAN.
;If sending, send an EOT. Then tidy up and quit.
;On Entry:
; top-of-stack = address of MSB-terminated
; XMODE = 00h if sending
;       = X1h if receiving and not flushing
;       = X2h if flushing when ^C came
;       = 8Xh if we have ever written to disk
;***********************************************
CANABT:	lda	XMODE		;Sending or receiving?
	mov	b,a		;remember for ABORT
	ora	a		;0 means sending

	mvi	a,CAN
	jnz	CAB1
	mvi	a,EOT

CAB1:	call	TXBYTE

;Fall into ABORT to close file and report

;***Exit*****************************************
;Abort - close file if writing, erase it if no
;records were written to disk
;On Entry:
;  b = XMODE (NZ means we need to close the file)
; top-of-stack = address of MSB-terminated
;  XMODE = 0 for sending, <>0 for receiving
;************************************************
ABORT:	call	CILPRT
	db	'ABORT:',' '+80h

	pop	h		;message to print
	call	HLPRNT		;print string at hl

	mov	a,b		;need to close the file?
	ora	a		;0 means sending
	jz	EXIT

;We were receiving an Xmodem file. Flush the
;BUFFER unless we were already flushing when
;we got the ^C from the user
; a = XMODE value <> 0

	sta	EOFLAG		;NZ to prevent interleaved Rx
				;XMODE msb set if we were
				;..writing when ^C came
	ani	02h		;were we already flushing?
	cz	WFLUSH		;n: then flush the buffer

	jmp	RXEND

;***Exit***********
;Error closing file
;******************
FCLERR:	call	CMSGXT
	db	'FILE CLOSE FAIL! May be corrup','t'+80h

;***Exit************************
;Report that the empty file has
;been erased, and return to CP/M
;*******************************
EFEXIT:	call	CMSGXT		;succesful erase
	db	'Empty file erase','d'+80h

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

;---RX Byte Routine--------------------------
;Receive a transfer byte from CON
;On Entry:
;  hl = timer low word
;  TIMRH = timer high byte
;  prior hl is on the stack
;RXBCON loop: 179+CRTIME cycles, and round up
;-->Entry is at RXBCON <---
;--------------------------------------------
CONTO:	equ	50000/((195+CRTIME+9)/10)
RXCLUP:	dcx	h		;(5)
	mov	a,l		;(5)
	ora	h		;(4)
	cz	RXTIMR		;(11) Timeout?

;-----
;Entry
;-----
RXBCON:	mvi	a,CONST		;(7)get console status
	call	GOBIOS		;(116+17+CRTIME)
	ora	a		;(4)nz means chr ready
	jz	RXCLUP		;(10)Go get the chr

	mvi	a,CONIN		;get console chr
	jmp	CRDONE

;---RX Byte Routine--------------
;Receive a transfer byte from RDR
;On Entry:
;  hl = timer low word
;  TIMRH = timer high byte
;  prior hl is on the stack
;--------------------------------
RXRDR:	mvi	a,READER	;BIOS routine offset

;Fall into CRDONE

;----------------------------------
;Get character from BIOS and return
;On Entry:
;  a = BIOS routine offset
;  prior hl is on the stack
;----------------------------------
CRDONE:	pop	h		;chuck timer

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

;---RX Byte Routine----------------------------
;Receiver from enhanced BIOS RDR routine, which
;returns with Z set if no character is waiting,
;which allow us to have a timeout here.
;On Entry:
;  hl = timer low word
;  TIMRH = timer high byte
;  prior hl is on the stack
;RXERDR loop: 175+CRTIME cycles, and round up
;--> Entry is at RXERDR <--
;----------------------------------------------
RDRTO:	equ	50000/((175+CRTIME+9)/10)
RXERLP:	dcx	h		;(5)
	mov	a,l		;(5)
	ora	h		;(4)
	cz	RXTIMR		;(11) Timeout?

RXERDR:	mvi	a,READER	;(7)BIOS routine offset
	call	GOBIOS		;(116+17+BIOS time)
	jz	RXERLP		;(10)nz means chr ready

	pop	h
	ret

;---RX Byte Routine-------------------------------
;Generic direct transfer port Input Routine - gets
;modified by INIT based on selected transfer port
;On Entry:
;  hl = timer low word
;  TIMRH = timer high byte
;  prior hl is on the stack
;--> Entry is it RXDRCT <--
; WAITRX loop = 53 cycles. 0.5S / 53 uS = 9434
;-------------------------------------------------
DIRTO	equ	9434
WAITRX:	dcx	h		;(5)
	mov	a,l		;(5)
	ora	h		;(4)
	cz	RXTIMR		;(11) Timeout?

RXDRCT:

;The relative position of the following instructions must not
;change because MODIO assumes the positions of the bytes it
;modifies.

IMODFY:	in	SIOSTA	;(10+1)status port (modified)
	ani	SIORDF	;(7)test ready (clear carry) (modified)
	jnz	WAITRX	;(10)low when chr ready (modified)

	pop	h	;(10)here to match OMODFY
	in	SIODAT	;(10)data port (modified)
	ret		;(10)

;---TX Byte Routine----------------------
;Transmit via direct I/O, with timeout
;the timeout value doesn't really matter:
;we just shouldn't hang forever here
;----------------------------------------
TXDRCT:	push	h
	lxi	h,0		;about 1.7 second timeout
				;..at 2 MHz

TXWAIT:	dcx	h		;(5)timeout?
	mov	a,h		;(5)
	ora	l		;(4)
	jz	TXBTO		;(10)y: abort

;The relative position of the following instructions must not
;change because MODIO assumes the positions of the bytes it
;modifies.

OMODFY:	in	SIOSTA		;(10+1)status port (modified)
	ani	SIOTDE		;(7)mask (modified)
	jnz	TXWAIT		;(10)may become jnz (modified)

;52 cycles = 26 uS per pass at 2 MHz

	mov	a,c		;recover chr
	out	SIODAT		;data port (modified)

	pop	h
	pop	b
	ret

;---TX Byte Routine-------
;Transmit via CP/M CON
;-------------------------
TXCON:	mvi	a,CONOUT	;BIOS send c to console
	jmp	TXCP

;---TX Byte Routine-------
;Transmit via CP/M PUN
;-------------------------
TXPUN:	mvi	a,PUNCH		;1:BIOS send c to punch

;Fall into TXCP

;----------------------------
;Transmit via CP/M CON or PUN
;----------------------------
TXCP:	call	GOBIOS		;chr in c, routine in a

	mov	a,c		;restore character
	pop	b
	ret

;---Local Subroutine-------------------------------
;Bump timer, test for abort every 1/2 sec
;On Entry:
;  TIMRH = remaining timeout in 0.5 sec units
;  RTORET = (modified) error return address
;  top-of-stack = our return address
;  next-on-stack = hl save value
;  next-on-stack = RXBYTE return address
;On Exit:
;  hl reloaded
;On Timeout:
;   repair stack for call to RXBYTE
;   jump to address in RTORET (which gets modified)
;Trashes psw
;--------------------------------------------------
RXTIMR:	call	CCTRLC		;user abort?

	lxi	h,TIMRH
	dcr	m		;bump timer high byte
	lhld	TIMRLD		;reload timer
	rnz			;return unless timeout

;Timeout: fix stack, "return" from RXBYTE to address in RTORET

	pop	h		;chuck RXTIMR return address
	pop	h		;chuck original hl
	pop	h		;chuck RXBYTE return address

	jmp	PPTIMO	;This address gets modified, and is
RTORET	equ	$-2	;..initialized for UART flush in INIT

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

;---TX Byte Routine------------------------------
;Custom Output Subroutine
;On Entry:
;  c=chr to send
;User routine should not trash c
;(Up to 12 bytes will be written at CWDAT by the
;/I1 option, overwriting the error message here.)
;------------------------------------------------
TXCUST:

CWDAT:	mvi	b,0		;Don't flush
	call	ABORT
	db	'No /I','1'+80h
	db	nop

	mov	a,c		;restore registers
	pop	b
	ret	

;---RX Byte Routine--------------------------------
;Custom Receive Subroutine with timeout
;On Entry:
;  hl = timer low word
;  TIMRH = timer high byte
;  prior hl is on the stack
;--> Entry is at RXCUST <---
;Assume WATCRX loop time is 80 cycles, and round up
;--------------------------------------------------
CUSTO:	equ	50000/((80+EXTIME+9)/10)
WATCRX:	dcx	h		;(5)
	mov	a,l		;(5)
	ora	h		;(4)
	cz	RXTIMR		;(11) Timeout?

RXCUST:
;Wait for data to be ready
;(Up to 12 bytes will be written at CRSTAT by the
;/I2 option, overwriting the error message here.)

CRSTAT:	mvi	b,0		;Don't flush
	call	ABORT
	db	'No /I','2'+80h
	db	nop

	jz	WATCRX
	pop	h

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

	ret

;******************************************************
;RAM Variables and Storage, all initialized during load
;******************************************************
;------------------------------
;Xmodem file transfer variables
;------------------------------
RXBDIF:	db	0	;Received block number minus
			;..previous block's block number
XBLOCK:	dw	0	;16-bit Current block number 
ERRCNT:	db	0	;Error count
RX1ST:	db	0	;0 means 1st chr ever received
TIMRLD:	dw	0001h	;receive timeout value
			;initialized for receiver flush in INIT
TIMRH:	db	0	;high byte of timer

;------------------------
;Disk buffering variables
;------------------------
BLKPTR:	dw	BUFFER	;Points to next block in BUFFER
BUFCNT:	dw	0	;Count of 128-byte blocks in BUFFER
BUFMAX:	db	0	;Max address in BUFFER/256

EOFLAG:	db	0	;EOF flag (0 means no EOF yet)

;---------------------------
;Other initialized variables
;---------------------------
XMODE:	db	0FFh	;00: send
			;X1: Rx, not currently flushing
			;X2: Rx, currently flushing
			;01 or 02: no disk writes yet
			;8x: disk writes have occured 
			;FFh: uninitialized

CRCFLG:	db	SELCRC	;0 for checksum, NZ for CRC
			;init to SELCRC for receiving

PACCNT:	db	0	;Count-down for pacifiers. Init to
			;start new line
			;FFh disables pacifiers.

;*****************************************************
;Buffer for Xmodem blocks. This buffer overwrites the
;following initialization code, as well as CP/M's CCP.
;*****************************************************
;Force the BUFFER to be page-aligned for faster compares

BPAGER	equ	$
BUFFER:	equ	(BPAGER+255) and 0FF00h

;===========================================================
;= The following subroutines and variables are used only   =
;= during the initial command line processing, and get     =
;= wiped out by the BUFFER, once we start transfering data.=
;===========================================================
;-----------------------------------------------------
;Defaulted variables needed only during initialization
;-----------------------------------------------------
OPMODE:	db	0	;0 means reading from command line
			;01h means reading from XMODEM.CFG
			;80h means end of file forXMODEM.CFG
			;..0 means command line
BYTCNT:	db	0	;command buffer bytes
CPUMHZ:	db	2	;CPU speed in MHz (for timeouts)
XPORT:	db	1	;Transfer port defaults to RDR/PUN
ENHRDR:	db	0	;01 for RDR that returns with
			;..Z set if chr not ready

;***INIT-Only Routine************************
;Initialization: parse XMODEM.CFG and command
;line, set up for transmit or receive
;********************************************
INIT:	lxi	SP,LSTACK	;use local stack

;------------------------------------------------------
;Set default CPU speed to 4MHZ and fix the help message
;if a Z80 is detected. Othwerwise, leave it at 2MHz.
;(The user can later change this with /Z option)
;------------------------------------------------------
	sub	a		;test for 8080 or Z80
	jpe	IS8080
	mvi	a,4		;Assume Z80s run 4 MHz
	sta	CPUMHZ
	adi	'0'		;fix default in help
	sta	DMHZ		;..message too
IS8080:
;----------------------------------------------------
;Initialize CP/M's default File Control Block for
;disk transfers: Check for an option crammed against
;the filename in the FCB, and clean it up (by padding
;it with spaces) if necessary. Fill the FCB Extent
;bytes with zeros, as required. Test for options,
;but no filename provided.
;----------------------------------------------------
	lxi	d,FCBNL*256+FCBCLR ;2 counters

	lxi	h,FCBFN		;file name in FCB
	mvi	a,'/'		;option marker

	cmp	m		;options without filename?
	jz	NOFNER		;Y: error exit

FFCB1:	cmp	m
	jnz	FFCB2

	mvi	a,' '
	mov	m,a

	inx	h		;force all future tests
	mov	m,a		;..at FFCB1 to pass
	dcx	h

FFCB2:	inx	h
	dcr	d
	jnz	FFCB1

;Clear the FCB Extent bytes to 0's as required by CP/M
; d=0
; e=FCBCLR
; hl=FCBEXT

FFCB3:	mov	m,d
	inx	h
	dcr	e
	jnz	FFCB3
;----------------------------------------------------
;Skip over the filename in the command line tail to
;find the beginning of command line options. If there
;is no filename, then just print the help screens.
;(The filename can only come from the command line)
;  OPMODE=0
;----------------------------------------------------
	lxi	d,COMBUF	;CP/M cmd line tail
	ldax	d		;1st byte is the byte count
	sta	BYTCNT

	cpi	100		;max input line length
	jnc	BADINP		;..else it clobbers the stack

	inx	d		;point to 1st chr

	call	WSKIP		;skip initial whitespace
	jc	HLPEXT		;Just XMODEM: help

;Scan past the file name, which
;either ends with a space or a '/'

SKPFIL:	call	CMDCEI		;get input, find end of item
	jnz	SKPFIL
;-------------------------------------------------------
;look for a configuration file and parse it for options,
;if it exists. Set the DMA address first, since since
;CP/M 1.4 will clobber the DMA address in BOPEN.
;  de=address of 1st option on the command line
;  hl=BYTCNT
;-------------------------------------------------------
	xra	a
	mov	b,m
	mov	m,a		;BYTCNT=0

	push	h		;BYTCNT
	push	d		;command line pointer
	push	b		;BYTCNT value

	inr	a		;a=1
	sta	OPMODE		;read XMODEM.CFG

	lxi	d,CFGBUF
	mvi	c,BSTDMA	;Set CP/M DMA address
	call	GOBDOS

	lxi	d,CFGFCB	;FCB describes file to open
	mvi	c,BOPEN		;CP/M FILE OPEN function
	call	GOBDOS		;M set if a's msb is set
				;-1 means open failure
				;..meaning no XMODEM.CFG
	cp	PARSE		;CMDCHR will initialize de

	pop	b		;BYTCNT value
	pop	d		;command line pointer
	pop	h		;BYTCNT
	mov	m,b		;restore BYTCNT
;--------------------------
;Parse command line options
;--------------------------
	xra	a		;parse command line next
	sta	OPMODE

	call	PARSE		;finally, find options
;-----------------------------------------------------
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
;--------------------------------------------------------
;Patch RXBYTE and TXBYTE for the transfer port specified
;by the /X option, or by the default transfer port.
;Also set TIMRLD to the correct value for 1/2 second
;receive timouts, based on XPORT and CPU speed. Flush the
;receiver unless it's RDR that's not modified to return
;with Z set when no chr is waiting.
;On Entry
;  XPORT    ENHRDR     Port
;   0         x      Console
;   1         0      PUN/Standard RDR
;   1         1      PUN/Enhanced RDR
;   2         x      Direct I/O
;   3         x      Custom I/O
;-------------------------------------------------------
	lxi	h,PORTAB
	lda	XPORT

	add	a		;*2
	mov	e,a
	add	a		;*4
	add	e		;*6
	mov	e,a
	mvi	d,0
	dad	d

	mov	c,m
	inx	h
	mov	b,m		;bc=timeout value

	inx	h
	mov	e,m
	inx	h
	mov	d,m		;de=RX byte routine addr
	xchg

;Check for enhanced RDR if RDR is selected, and
;flush the reader unless it's the unmodified RDR port
;(which would hang forever waiting for input)

	cpi	6		;RDR port?
	jnz	PP1		;n: hl has correct address

	lda	ENHRDR		;Enhanced RDR?
	ora	a
	jz	PP1		;n: hl has correct address

	lxi	h,RXERDR	;y: update patch

PP1:	shld	RXROUT+1
	cnz	RXBYT1		;flush receiver unless it's
				;..unmodified RDR
PPTIMO:				;(timeout goes to PPTIMO)

	xchg
	inx	h
	mov	e,m
	inx	h
	mov	d,m		;de=TX byte routine addr
	xchg
	shld	TXROUT+1

;Set TIMRLD based on CPU speed and port cycles in bc
;
;  bc = CPU cycles for 0.5 sec loop assuming 1 MHz CPU
;  CPUMHZ = CPU speed, in MHz
	lda	CPUMHZ
	lxi	h,0

ADJMHZ:	dad	b
	dcr	a
	jnz	ADJMHZ

	shld	TIMRLD		;timer reload value

;--------------------------------------
;If neither /R nor /S then ask the user
;--------------------------------------
	lda	XMODE		;did /R or /S get set?
	ora	a		;-1 meant uninitialized
	jp	GOTDIR		;with XMODEnin a

ASKRS:	call	CILPRT
	db	'Send or receive (S/R)?',' '+80h

	call	GETANS

	sui	'R'		;'R' and 'S' are adjacent
	sui	2		;'R' or 'S'?
	jnc	ASKRS		;n: try again

	cma			;0 for send, 1 for receive
	sta	XMODE
GOTDIR:
;----------------------------------------------
;Branch to do transmit- or receive-specific
;initialization, based on XMODE, which is in a
;----------------------------------------------
	call	CILPRT		;Begin message
	db	'File',' '+80h

	lda	XMODE
	ora	a		;Z means receive
	jnz	GORX
;==========================================
;Set up for TXFILE 
; FCB has the file name
; 'File ' has already been printed
; CP/M's DMA address is still CFGBUF
; FCB is set up with the transfer file name
;==========================================
	lxi	h,WAITNK	;timeout return address
	shld	RTORET		;..for RXBYTE

	mvi	c,BOPEN		;CP/M FILE OPEN function
	call	FCBDOS		;set de=FCB, -1 means fail
	jm	FOFAIL

;Continue announcing

	call	ILPRNT
	db	'open',CR
	db	'Sen','d'+80h

	call	ANNCTP		;announce transfer port
;--------------------------------------------------
;Setup is done - go transmit the file
; FCB is valid
; File is open
; File-open message has been printed on the console
;--------------------------------------------------
	jmp	TXFILE
;====================================
;Set up for RXFILE
; FCB has the file name
; 'File ' has already been printed
; CP/M's DMA address is set to CFGBUF
;====================================
GORX:
;--------------------------------------------
;If the file already exists then ask to
;overwrite it. (BSERCH will write a directory
;block at the current DMA address = CFGBUF)
;--------------------------------------------
	mvi	c,BSERCH	;Search directory for file
	call	FCBDOS		;sets de=FCB
	jm	FILNEX		;-1 means not there (ok)

	call	ILPRNT		;continue message
	db	'exists. Overwrite (Y/N)','?'+80h

	call	GETANS		;Get 1-chr response
	cpi	'Y'
	jnz	EXIT

	call	FERASE		;erase existing file
				;returns de=FCB
	call	CILPRT
	db	'File',' '+80h
FILNEX:
;-------------------------------------------------
;Create file on disk (for writing) and report.
;  FCB has file name
;  'File ' has already been printed on the console
;-------------------------------------------------
	call	ILPRNT		;either 'File created'
				;or 'File create error'
	db	'creat','e'+80h

	mvi	c,BMAKE		;CP/M CREATE FILE func
	call	FCBDOS		;sets de=FCB
	jm	FCERR		;-1 means create error
;--------------------------------------
;Tell user that we are ready
;'File create' has already been printed
;--------------------------------------
	call	ILPRNT		;finish message

	db	'd'		;end of 'File created'
	db	CR,'Recei','v'+80h

	call	ANNCTP		;announce port setup
;---------------------------------------------
;Eat up to 256 characters until the line is
;idle for 1 second. Error exit (in PURGE) if
;no timeout before 256 characters are received.
;----------------------------------------------
	lxi	h,RPRGDN	;Timeout return address
	shld	RTORET		;..for RXBYT1 and RXBYTE

	call	PURGE		;go eat chrs
RPRGDN:				;timeout "returns" here
;-------------------------------------------
;Install timeout return address for transfer
;-------------------------------------------
	lxi	h,RXSERR	;Timeout return address
	shld	RTORET		;..for RXBYT1 and RXBYTE
;--------------------------------------------
;Set initial character to NAK or SELCRC, and
;report error checking mode (checksum or CRC)
;--------------------------------------------
	lda	CRCFLG		;CRC or checksum?
	ora	a		;0 means checksum
				;NZ means CRC

				;a=SELCRC here
	cnz	PCRC		;saves a at NAKCHR
				;..prints ' with CRCs'
				;..returns with Z cleared
	cz	PCKSUM		;print ' with checksums'
;-----------------------------------------------
;If the console port is the transfer port then
;stall for a few seconds to give the user time
;to start the Xmodem send on the other end.
;-----------------------------------------------
	lda	XPORT		;console?
	ora	a		;clears carry
	jnz	RXIND

	lda	CPUMHZ		;adjust for CPU speed
	mov	b,a

RIDEL:	lxi	h,8929*CRSTAL	;delay loop time

RIDEL1:	call	CCTRLC		;(about 200 cycles)
	dcx	h		;(5)timeout timer?
	mov	a,l		;(5)Test for 16-bit 0
	ora	h		;(4)clears carry
	jnz	RIDEL1		;(10)

;224 cycles/pass
;1 second = 1,000,000 uS = 2,000,000 cycles
;2,000,000/224 = 8929

	dcr	b
	jnz	RIDEL
RXIND:
;-----------------------------------------
;Prepare to send the initial NAK or SELCRC
;to initiate transfer, and go receive.
;  Carry is clear
;-----------------------------------------
	lda	NAKCHR		;Initial ACK
	jmp	RXFILE

;***INIT-Only Subroutine**************
;Announce transfer port. Disable
;pacifiers if transfer port is CON
;On Entry:
;  XPORT is valid
;  'send' or 'receiv' has been printed
;Trashes psw,c
;*************************************
ANNCTP:	call	ILPRNT
	db	'ing via',' '+80h

	lda	XPORT
	dcr	a
	jm	TVC

	dcr	a
	jm	TVR
	jz	TVD

	call	ILPRNT
	db	'custom cod','e'+80h
	ret

TVD:	call	ILPRNT
	db	'direct I/','O'+80h
	ret

TVR:	call	ILPRNT
	db	'RDR/PU','N'+80h
	ret

;CON: turn off pacifiers

TVC:	sta	PACCNT		;a=FFh
	call	ILPRNT
	db	'CO','N'+80h
	ret

;***INIT-Only Subroutine**************************
;Get a 1-character response (with editing, CR, and
;potential control-C) from the user
;On Exit:
;  a=uppercase response, if 1 chr typed
;  a=ff for no characters typed
;  a=1-9 for 2-10 characters typed (definitely not
;   'Y','N','R', or 'S')
;Trashes c,de
;*************************************************
GETANS:	lxi	d,COMBUF
	mvi	a,BRDCON		;max chrs (10)
	stax	d			;in place for BDOS
	mov	c,a			;BRDCON
	call	GOBDOS			;returns chr count

	inx	d			;COMBUF+1
	ldax	d			;..has the byte count
	dcr	a			;just 1 chr?
	rnz				;n: error exit

	inx	d			;1st and only chr
	ldax	d
	ani	('a'-'A')xor 0FFh	;uppercase
	ret

;***INIT-Only Subroutine*********************************
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
;  c = option routine address offset
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
OPTTAB:	db	'C',CCKSUM-(OPTTAB+2)	;Select checksum mode
	db	'E',CMODR-(OPTTAB+4)	;Enhanced RDR port
	db	'I',CCIO-(OPTTAB+6)	;Custom I/O definition
	db	'K',BUFKB-(OPTTAB+8)	;Max buffer size	
	db	'M',CMESSG-(OPTTAB+10)	;console message
	db	'O',COUTP-(OPTTAB+12)	;output to port
	db	'P',CPORT-(OPTTAB+14)	;define transfer port
	db	'Q',CQUIET-(OPTTAB+16)	;quiet mode
	db	'R',CSETR-(OPTTAB+18)	;select receive mode
	db	'S',CSETS-(OPTTAB+20)	;select receive mode
	db	'X',CSETX-(OPTTAB+22)	;select transfer port
	db	'Z',CMHZ-(OPTTAB+24)	;specify CPU MHz
	db	0FFh			;end of table

;****************
; Option Routines
;****************

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

;*****-------------------------------------------------
; /I * Patch Custom I/O Routine
;*****
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

;Get the address of the routine to define, based on a. The
;4-byte table is also the reference for address offsets,
;and is located just before the first modified routine. 

	lxi	h,CTABLE

	mov	c,a		;0<c<4, b=0 already
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
	sta	CPUMHZ
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

;***INIT-Only Subroutine***************
;Ignore a comment, terminated either
;by the end of the XMODEM.CFG line
;or the end of file/end of command line
;On Entry:
;  de=next command line chr
;**************************************
COMENT:	call	CMDCHR
	jnz	COMENT		;Z means EOF, CR or LF
	ret
	
;***INIT-Only Subroutine*******************************
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

;***INIT-Only Subroutine**************************
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

;***INIT-Only Subroutine*************************************
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

;***INIT-Only Subroutine******************************
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

;***INIT-Only Subroutine************************
;Modify either the transfer input port routine
;or output port routine. This assumes that both
;routines look like this:
;
; WAIT:	...
; IMODFY or OMODFY:
;	in	<status port>
;	ani	<port ready mask>
;	jnz	WAIT	(may get converted to jz)
;
;	pop psw (or other 1-byte cmd)
;	in/out	<data port>
;	...
;	ret
;
;On Entry:
;  a = port-ready mask byte
;  c <> 0 if jz needs to be installed
;  d = data port address
;  e = status port address
;  hl = IMODFY+1 or OMODFY+1
;Trashes a,hl
;*********************************************
MODIO:	mov	m,e		;install status port adr

	inx	h		;point to mask location
	inx	h
	mov	m,a		;install status mask

	inx	h		;point to jnz location
	mov	a,c
	ora	a
				;Code already has a JNZ
	jz	MODIO1		;need a jz instead?
	mvi	m,JZ		;y: install jz opcode
MODIO1:

	inx	h		;point to data port loc
	inx	h
	inx	h
	inx	h
	inx	h
	mov	m,d		;install data port adr

	ret

;***INIT-Only Subroutine***************************
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
		
;***INIT-Only Subroutine**************
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

;***INIT-Only Subroutine****************************
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

;***INIT-Only Exit*********************************
;Bad Value, bad hex character
;Fix everything for CP/M, and return to CP/M
;The character following the / gets pasted in here.
;**************************************************
BADVAL:	call	CILPRT
	db	'/'
PAR1:	db	'&'		;parameter goes here
	db	' bad valu','e'+80h

	jmp	ERRSRC		;command line or .CFG file

;***INIT-Only Exit*********************************
;Illegal option. Print message and return to CP/M
;The character following the / gets pasted in here.
;**************************************************
OPTERR:	call	CILPRT		;Exit with this message
	db	'/'
PAR2:	db	'&'		;parameter goes here
	db	' unknow','n'+80h

	jmp	ERRSRC		;command line or .CFG file

;***INIT-Only Exit**********************************
;Input error exits. Print message and return to CP/M
;***************************************************
BADINP:		call	CILPRT
	db	'Jun','k'+80h

;Fall into ERRSRC

;***INIT-Only Exit****************
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

;***INIT-Only Exit*********************
;Error opening file: Abort with message
; 'File ' has already been printed
;**************************************
FOFAIL:	call	MSGXIT	;Exit w/ this message
	db	'not foun','d'+80h

;***INIT-Only Exit**********************
;Error: File create failed
; 'File create' has already been printed
;***************************************
FCERR:	call	MSGXIT
	db ' fail. Write protect? Dir full','?'+80h

;***INIT-Only Exit****
;No file name provided
;*********************
NOFNER:	call	CMSGXT
	db	'No filenam','e'+80h

;***INIT-Only Exit*********************************
;Print help screen, and then exit. Break up the
;help screen so that it even fits on a 16x64 screen
;**************************************************
HLPEXT:	call	CILPRT		;print this message

;    123456789012345678901234567890123456789012345678901234567890123
 db '========================',CR
 db 'Xmodem '
 db ((VERSION AND 0F00h)/256)+'0','.',(VERSION AND 0Fh) +'0'
	db	' By M.Eberhard',CR
 db '========================',CR
 db 'Usage: XMODEM <file> <option list>',CR
 db '^C aborts',CR,LF
 db 'Command line and XMODEM.CFG options:',CR
 db ' /R Receive, /S Send',CR
 db ' /C Receive with checksums, else CRCs',CR
 db '   (Receiver always sets error check mode)',CR
 db ' /E if CP/M RDR returns with Z set when not ready',CR
 db ' /Knn sets buffer max k-bytes (default: all free RAM)',CR
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
 db '/I, /O and /P values are 2-digit hex',CR,LF
 db '--More-','-'+80h

	call	GETCON		;wait for user input

	call	CMSGXT		;print message and exit to CP/M

 db ' /Q for Quiet; else + means ok block, - means retry',CR
 db ' /X sets the transfer port:',CR
 db '  /X0 CP/M CON *',CR
 db '  /X1 CP/M RDR/PUN * (default)',CR
 db '  /X2 Direct I/O, defined by /P option',CR
 db '  /X3 Custom code from /I patches',CR
 db '  * Must not strip parity',CR
 db ' /Zm for m MHz CPU. 0<m<7, default m='

;This '2' gets changed to '4' if a Z80 is detected.

DMHZ: db '2',CR+80h

;***INIT-Onl* Table************************
;Port configuration table
;Three words per entry:
; Word 0 = timer constant
; Word 1 = address of receive byte routine
; Word 3 = address of transmit byte routine
;******************************************
PORTAB:	dw	CONTO,RXBCON,TXCON   ;X0 CP/M console
	dw	RDRTO,RXRDR,TXPUN    ;X1 CP/M RDR/PUN
	dw	DIRTO,RXDRCT,TXDRCT  ;X2 Direct, setup with /P
	dw	CUSTO,RXCUST,TXCUST  ;X3 Custom, setup with /I

;***INIT-Only Table**************
;Configuration File Control Block
;********************************
CFGFCB:	db	0		;(dr) use default drive
	db	'XMODEM  '	;(f1-f8)
	db	'CFG'		;(t1-t3)
	db	0,0,0,0		;(ex,s1,s2,rc)
	dw	0,0,0,0,0,0,0,0	;(d0-d15)
	db	0,0,0,0		;(cr,r0,r1,r2)

;***INIT-Only Buffer******
;Configuration file buffer
;*************************
CFGBUF:	ds	BLKSIZ

	END
