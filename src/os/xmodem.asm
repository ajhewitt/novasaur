;======================================================
;        CP/M XMODEM 1.01 by Martin Eberhard
;======================================================
; Compact XMODEM file transfer program for CP/M 2.2
;
; Supports both regular XMODEM checksums and XMODEM-CRC
;
; See help the message near the end of this code for
; program usage
;
; Assemble with Digital Research's ASM Assembler
;
; Designed to run on a 2 MHz 8080 or a 4 MHz Z80,
; communicating via CP/M's RDR: and PUN: drivers.
;
; CPM's BIOS RDR: driver must be modified to return
; with Z set if no character is available, and return
; with the received byte in A and Z cleared otherwise.
; (A standard CP/M RDR: driver will hang forever
; waiting for input. You can select a standard RDR:
; driver by setting CSTRDR to FALSE.)
;
; Additionally (and regardless of CSTRDR), the RDR: and
; PUN: devices must work with 8-bit data, although the
; CP/M documentation specifies that the RDR: function
; should strip the high (parity) bit.
;
; The CON:, RDR: and PUN: BIOS routines must not trash
; registers other than the accumulator.
;
; CUSTOMIZATION: You can easily replace the RDR: and
; PUN: calls with routines that access your I/O port
; directly - see comments in the TXBYTE and RXBYTE
; subroutines, and also in the INIT subroutine.
; (search for 'CUSTOMIZATION')
;
; Timimg loops are used for the various XMODEM time-
; outs. The firmware distinguishes between the 8080
; and Z80 instruction sets by looking at the parity bit
; in the corner-case where the two processors behave
; differently. If it's an 8080, then 2MHz timing is
; assumed. If it's a Z80, then 4 MHz timing is assumed.
;
; Note: All of the code that is only used during
; initialization is at the end, and gets overwritten by
; the sector buffer. This allows this program to run in
; as little as 8K of user memory, despite a large 6K
; buffer and reasonably robust options and messages.
;
; Based on XMODEM for CDOS version 1.03 by M. Eberhard
;
; Thanks to Ward Christensen for inventing XMODEM and
;   keeping it simple.
; Thanks to John Byrns for the XMODEM-CRC extension,
;    which was adopted in Windows Hyperterm.
; Thanks to Keith Petersen, W8SDZ, for a few ideas I
;   borrowed from his XMODEM.ASM V3.2
;
; Revision History:
;  Rev   Date       Author      Comments
; 1.00 06APR2013 M.Eberhard  ported
; 1.01 09APR2013 M.Eberhard  Squeezed to fit in 2k file
;                            fix access to other drives
;
; To Do (maybe):
;  use all available RAM for buffers
;  Retries on disk errors
;  command line option to turn pacifiers off
;======================================================
FALSE   equ     0
TRUE    equ     -1

;*************************
; Program Option Switches
;*************************
CSTRDR  equ     TRUE    ;FALSE: unmodified BIOS RDR
                        ;driver. XMODEM will hang with-
                        ;out timeout if no input from
                        ;RDR. TRUE:modified RDR driver.
                        ;XMODEM will timeout neatly if
                        ;no input from RDR.

ERRLIM  equ     10      ;Max # of error-retries 10
                        ;is standard.

;Timeout values in seconds. Values in parenthesis are
;XMODEM standard values.

SOHTO   equ     10      ;(10)sender to send SOH
NAKTO   equ     90      ;(90)receiver to send init NAK
ACKTO   equ     60      ;(60)receiver to ACK (or NAK)
                        ;(time to write to disk)

SBUFSZ  equ     48      ;blocks per disk read/write
        ;buffer size = SBUFSIZ * 128 bytes
        ;multiples of 16 work well with CP/M

BLKSIZ  equ     128     ;bytes per XMODEM block
        ;DO NOT CHANGE. BLKSIZ should be 128!

PACIFY  equ     TRUE    ;true to print pacifiers

;Progress pacifiers printed on the console

PACACK  equ     '+'     ;Received an ACK
PACNAK  equ     '-'     ;Received a NAK
PACBLK  equ     '+'     ;Received a good block
PACRSD  equ     '-'     ;Requested a resend

;**************
; CP/M Equates
;**************
;------------------------------------------
;BDOS Entry Points and low-memory locations
;------------------------------------------
WBOOT   equ     0000H           ;JUMP TO BIOS WARM BOOT
WBOOTA  equ     WBOOT+1         ;ADDRESS OF WARM BOOT
IOBYTE  equ     WBOOT+3
;CDISK  equ     WBOOT+4         ;LOGIN DRIVE
BDOS    equ     WBOOT+5         ;BDOS Entry Point

FCB     equ     WBOOT+5CH       ;CP/M file control blk
FCBDR   equ     FCB             ;Drive Descriptor
FCBFN   equ     FCB+1           ;File name (8 chrs)
FCBFT   equ     FCB+9           ;File Type (3 chrs)
FCBEXT  equ     FCB+12          ;File extent within FCB
FCBCLR  equ     24              ;# of bytes to clear,
                                ;starting at FCBEXT

COMBUF  equ     WBOOT+80H       ;disk & cmd line buffer
USAREA  equ     WBOOT+100H      ;User program area

BLKBUF  equ     COMBUF  ;We reuse 128-byte CP/M cmd/disk
                        ;..buffer to buffer XMODEM blocks
;-------------------------------------------
; BDOS Function Codes, passed in register C
; Note: CON:, RDR:, and PUN: I/O is done via
; direct BIOS calls, not BDOS calls.
;-------------------------------------------
;BRESET equ     0       ;System Reset
;BCONIN equ     1       ;Read Console Chr
;BCONOT equ     2       ;Type Chr on Console
;BRDRIN equ     3       ;Read Reader Chr
;BPUNOT equ     4       ;Write Punch Chr
BPRINT  equ     9       ;Print $-terminated String
;BRDCON equ     10      ;Get Line from Console
;BCONST equ     11      ;Console Status (<>0 IF CHR)
;BDRST  equ     13      ;Reset Disk
BSDISK  equ     14      ;select disk
BOPEN   equ     15      ;Disk File Open
BCLOSE  equ     16      ;Close disk file, FCB at de
BSERCH  equ     17      ;Search dir for file, FCB at de
BDELET  equ     19      ;delete file, FCB at (de)
BREAD   equ     20      ;Read from Disk, 0=OK, <>0=EOF
BWRITE  equ     21      ;Write next record, 0=OK, <>0=ERR
BMAKE   equ     22      ;Make new file, 0FFH=BAD
BCDISK  equ     25      ;get current disk
BSTDMA  equ     26      ;Set disk buffer to (de)

;---------------------------------------------------------
; BIOS Entry Points, relative to the base address in WBOOT
;---------------------------------------------------------
CONST   equ     06h     ;Console Status
CONIN   equ     09h     ;Console Input
CONOUT  equ     0Ch     ;Console output
PUNCH   equ     12h     ;punch output
READER  equ     15h     ;reader input

;******************
; ASCII Characters
;******************
SOH     equ     1       ;Start of XMODEM block
CTRLC   equ     3       ;Control-C for user-abort
EOT     equ     4       ;End XMODEM session
ACK     equ     6       ;XMODEM block acknowledge
NAK     equ     15H     ;XMODEM block negative ACK
LF      equ     0AH     ;Linefeed
CR      equ     0DH     ;Carriage return
SELCRC  equ     'C'     ;selects CRC mode at initiation

;*********************
;* Beginning of Code *
;*********************
        ORG     USAREA  ;normal place for CP/M programs

;--------------------------------
;Save CP/M SP, create local stack
;--------------------------------
        lxi     h,0
        dad     sp              ;hl=CP/M stack pointer
        shld    stack           ;CP/M SP on local stack
        lxi     SP,STACK        ;SP=local stack

;----------------------------------------------------
;Initialize, using code that gets wiped out by SECBUF
;ret with a=1 for receive, 2 for send
;----------------------------------------------------
        call    INIT

;--------------------------------------------------
; Send or receive, based on XMODE,  set by /S or /C
;--------------------------------------------------
        dcr     a               ;so 0 means receive
        jz      RXFILE

;       fall into TXFILE

;*****Function*****************************************
; Send a CP/M file in XMODEM format
; On Entry:
;      FCB is valid
;******************************************************
TXFILE: call    FOPEN   ;Open file specified in FCB
                        ;& print message on console

        call    GTMODE  ;wait for NAK or SELCRC to
                        ;..determine cksum or CRC mode

;---------------------------------------------
;Transmit all sectors of the file:
;Read a sector from the disk, and test for EOF
;---------------------------------------------
TXLOOP: call    RDSECT          ;Read sector from disk
        jc      TXEOF           ;C set means EOF

        lhld    CURBLK          ;inc 16-bit block count
        inx     h
        shld    CURBLK

        xra     a               ;Clear error count
        sta     ERRCNT

;---------------------------------
;Send block header: SOH, Block
;number, Complimented block number
;---------------------------------
TXRPT:  mvi     a,SOH           ;SOH first
        call    TXBYTE

        lda     CURBLK          ;8-bit block number
        call    TXBYTE          ;(preserves A)

        cma                     ;complimented block no
        call    TXBYTE

;------------------------------------
;Send a BLKSIZ-byte block from BLKBUF
; On Entry:
;   BLKBUF has a sector full of data
; On Exit:
;   Data checksum is in C
;   16-bit data CRC is in CRC16
;------------------------------------
        lxi     h,0             ;clr CRC for new block
        shld    CRC16

        lxi     b,BLKSIZ*256+0  ;b=bytes/block,
                                ;...clear cksum in C

        lxi     h,BLKBUF        ;Point to block

TXBLUP: mov     a,m             ;Get a data byte
        call    TXBYTE          ;Send it, do cksum

        call    CALCRC          ;combine a into the CRC

        inx     h               ;Next byte
        dcr     b
        jnz     TXBLUP          ;loop through block

;--------------------------------------------
;Send checksum or 16-bit CRC, based on CRCFLG
; c= 8-bit checksum
; de= 16-bit CRC
; CRCFLG <>0 if CRC mode enabled
;--------------------------------------------
        lda     CRCFLG          ;Checksum or CRC?
        ora     a               ;clear Z if CRCFLG
        jz      TXBDON          ;jump to send checksum

        lhld    CRC16           ;get calculated CRC
        mov     a,h
        call    TXBYTE          ;send byte in a
        mov     c,l             ;now the 2nd CRC byte

TXBDON: mov     a,c             ;a=cksum or CRC 2nd byte
        call    TXBYTE          ;send byte in a

;-------------------------------------------
;Wait for the ACK. If none arrives by the
;end of the timeout, or if a NAK is received
;instead of an ACK, then resend block.
;-------------------------------------------
        call    GETACK          ;Wait for the ACK
                                ;Z flag set if ACK
        jnz     TXRPT           ;NZ: timeout or NAK

;---------------------------------------------------
;Ack received. Print pacifier, and go for next block
;---------------------------------------------------
      IF PACIFY
        mvi     c,PACACK        ;pacifier on console
        call    TYPEC
      ENDIF
        jmp     TXLOOP

;---------------------------------------------------
;File send completed. Send EOT'S intil we get an ACK
;---------------------------------------------------
TXEOF:  mvi     a,EOT           ;Send an EOT
        call    TXBYTE

        call    GETACK          ;Wait for an ACK
        jnz     TXEOF           ;Loop until an ACK

;------------------------------
;Send happy termination message
;------------------------------
        call    ILPRT
        db      TXSLEN
TXSMSG: db      CR,LF,'Transmit done'
TXSLEN  equ     $-TXSMSG

;----------------------------------------------
;Report succesfull block count & return to CP/M
;----------------------------------------------
TXCNT:  call    ILPRT
        db      TXCLEN
TXCMSG: db      CR,LF,'Sent '
TXCLEN  equ     $-TXCMSG

        jmp     REPCNT  ;print block count, goto CP/M

;*****Function*****************************************
; Receive XMODEM file & save it to disk
; On Entry:
;       FCB is valid
;******************************************************
RXFILE: call    CREATE  ;create & open file on disk

;----------------------------------------------------
;Receive & validate a block, and see if we got an EOT
;----------------------------------------------------
RXLOOP: call    GETBLK  ;Receive an XMODEM block
        jc      RXEOT   ;C set means EOT received

;---------------------------------------------------
;Save the received block, bump current block counter
;---------------------------------------------------
        call    WBLOCK          ;Write block to SECBUF

        lhld    CURBLK          ;inc 16-bit block count
        inx     h
        shld    CURBLK

;------------------------------------------------
;Good block received. Print pacifier on console,
;then send ACK and loop back to get another block
;------------------------------------------------
      IF PACIFY
        mvi     c,PACBLK        ;pacifier on console
        call    TYPEC
      ENDIF

        call    TXACK           ;Send XMODEM ACK

        jmp     RXLOOP          ;LOOP until EOF

;----------------------------------
;Received EOT. Flush SECBUF and end
;----------------------------------
RXEOT:  call    WFLUSH  ;Write all blocks in SECBUF
        call    TXACK   ;ACK this sector
        call    FCLOSE  ;Close CP/M file

;-------------------------------------------------
;Send happy termination message and return to CP/M
;-------------------------------------------------
        call    ILPRT
        db      RXCLEN
RXCMSG: db      CR,LF,'Receive done'
RXCLEN  equ     $-RXCMSG

;       fall into RRXCNT

;*****Exit*********************************************
;Exit: Report the number of blocks succesfully
;received, and then return to CP/M
;******************************************************
RRXCNT: call    ILPRT
        db      SRLEN
SRMSG:  db      CR,LF,'Received '
SRLEN   equ     $-SRMSG

;       fall into REPCNT

;*****Exit*********************************************
; Report 16-bit block count, and then return to CP/M
;******************************************************
REPCNT: lhld    CURBLK
        call    PDEC16          ;print hl in decimal

        call    MSGXIT
        db      ' blocks$'

;*****Subroutine***************************************
; Get an XMODEM block
; On Entry:
; On Exit:
;   Carry set if EOT received
;   Trashes all registers
;******************************************************
GETBLK:

;-----------------------------------------
;Wait for SOH from sender to start
;reception, checking for EOT while we wait
;-----------------------------------------
        xra     a
        sta     ERRCNT          ;Clear error count

RXRPT:  mvi     e,SOHTO*2       ;Timeout for SOH
        call    RXBYTE
        jc      RXSERR          ;Carry means timeout

        cpi     SOH             ;Did we get an SOH?
        jz      RXSOH           ;If so, get the block

;-----------------------------------------------
;Earlier versions of XMODEM sent some nulls here
;We could just ignore them. (Not in this code)
;-----------------------------------------------
      IF FALSE
        ora     a               ;Null?
        jz      RXRPT           ;Yes: ignore it
      ENDIF

;-------------------------------------
;Set carry and return if we get an EOT
;-------------------------------------
        cpi     EOT
        stc
        rz

;-------------------------------------------
;No SOH or EOT - this is an invalid header.
;Eat all received chrs until a 1-sec timeout
;-------------------------------------------
PURGE:  call    RXBYT1          ;Receive chr w/ timeout
        jnc     PURGE           ;Carry means timeout

;       fall into RXSERR

;--------------------------------------------------
;Send a NAK to indicate receive error. If we are
;waiting to start (and we are in CRC mode (NAKCHR
;=SELCRC), then send SELCRC instead of NAK
;--------------------------------------------------
RXSERR: call    CCTRLC          ;user abort?

      IF PACIFY
        mvi     c,PACRSD        ;pacifier on console
        call    TYPEC
      ENDIF

        lda     NAKCHR          ;current NAK chr
        call    TXBYTE

;----------------------------------------------
;Bump error count, and abort if too many errors
;----------------------------------------------
        lxi     h,ERRCNT        ;Clear error count
        inr     m               ;bump error count

        mov     a,m             ;Too many errors?
        cpi     ERRLIM
        jc      RXRPT           ;No: try again

;-----------------------------------
;Too many errors: abort with message
;-----------------------------------
        lxi     d,ELEMSG        ;error limit exceeded
        jmp     ABORT

;--------------------------------------------------
;Got an SOH, at beginning of block. Now get header:
;Block number, Complemented block number
;--------------------------------------------------
RXSOH:  mvi     a,NAK           ;we have received
        sta     NAKCHR          ;..at least one SOH

        call    RXBYT1          ;Get block number
        jc      RXSERR          ;Carry means timeout

        mov     d,a             ;Save block number

        call    RXBYT1          ;compl'd block number
        jc      RXSERR          ;Carry means timeout

        cma                     ;compliment to compare
        cmp     d
        jnz     PURGE           ;No match: error

        sta     RXBLK           ;Save block number

;--------------------------------------------------
;Loop to receive BLKSIZ bytes and store them in
;BLKBUF, computing the checksum & CRC along the way
;--------------------------------------------------
        lxi     h,0             ;clear CRC
        shld    CRC16

        lxi     b,BLKSIZ*256+0  ;b=bytes, c=0 cksum
        lxi     h,BLKBUF        ;Point to buffer

RXCHR:  call    RXBYT1          ;Get one byte of data
        jc      RXSERR          ;Carry means timeout

        mov     m,a             ;Store byte in buffer

        add     c               ;compute checksum
        mov     c,a
        mov     a,m             ;recover received byte

        call    CALCRC          ;calculate CRC too

        inx     h               ;next byte
        dcr     b
        jnz     RXCHR

;------------------------------------------------------
;Verify checksum in C, or CRC in CRC16, based on CRCFLG
; de = CRC
;------------------------------------------------------
        lda     CRCFLG          ;CRC mode?
        ora     a               ;0 means cksum
        jz      CKCKSM

        call    RXBYT1          ;Get 1st byte of CRC
        jc      RXSERR          ;Carry means timeout

        lhld    CRC16
        cmp     h
        jnz     PURGE           ;no: try again, but 1st
                                ;purge rest of CRC

        mov     c,l             ;put 2nd CRC byte in C

CKCKSM: call    RXBYT1          ;2nd CRC byte or cksum
        jc      RXSERR          ;Carry means timeout

        cmp     c               ;Does it match?
        jnz     RXSERR          ;No: error

;-----------------------------------------------
;Got a good block. See if we've already received
;this block. (It might be a retransmission.) If
;it's the most recently received block, then try
;again - otherwise it's an error.
;-----------------------------------------------
        lda     CURBLK          ;8-bit block number
        mov     b,a             ;b=recent Rx block

        lda     RXBLK           ;a=this block's number
        sub     b               ;calc the difference
        cz      TXACK           ;same as last block:
        jz      GETBLK          ;..send ACK & try again

        dcr     a               ;should be next block
        ora     a               ;must clear carry too!
        rz                      ;return: correct block

;--------------------------
;Error: Blocks out of order
;--------------------------
        lxi     d,SEMSG         ;sync error
        jmp     ABORT

;*****Subroutine***************************************
; Get an ACK from the receiver. If we get a NAK, print
; the NAK pacifier on the console.
; On Exit:
;   Z set and Carry clear if ACK received
;   Z clear and Carry clear if NAK received
;   Z clear, Carry set and ERRCNT bumped if timeout
;      or too many bogus chrs received
;   If too mant errors, abort
;   Trashes a,b,c, hl
;******************************************************
GETACK:

;-------------------------------
;Get a received byte, or timeout
;-------------------------------
        mvi     e,ACKTO*2       ;ACK-wait timeout value
        call    RXBYTE          ;go get a character
        jc      ACKERR          ;Carry means timeout

;------------------------------------------------
;Return form subroutine with Z set if it's an ACK
;------------------------------------------------
        cpi     ACK     ;Did we get an ACK?
        rz              ;Yes: return w/ carry cleared

;---------------------------------------
;If NAK, print pacifier, and return with
;C & Z cleared unless the user aborts us
;---------------------------------------
        mov     e,a             ;save received chr
        call    CCTRLC          ;user abort?
        mov     a,e             ;recover received chr

        cpi     NAK             ;NAK?
        jnz     ACKERR          ;NZ: bad byte received

     IF PACIFY
        mvi     c,PACNAK        ;NAK pacifier
        call    TYPEC
      ENDIF

        ora     a               ;NAK: Clear Z & C
        ret

;------------------------------------------------
;Timeout or bogus chr while waiting for ACK/NAK
;Bump error count & check limit. Set C for return
;------------------------------------------------
ACKERR: call    CCTRLC          ;user abort?

        lxi     h,ERRCNT        ;bump error count
        inr     m

        mov     a,m             ;too many errors?
        cpi     ERRLIM
        rc              ;No: Return w/ Carry set
                        ;and Z cleared for timeout

;--------------------------------------
;Abort waiting for ACK: Too many errors
;--------------------------------------
        lxi     d,TAEMSG        ;too many ack errors
        jmp     ABORT

;*****Subroutine***************************************
; Close CP/M disk file
; This is required after writing to a file!
; On Exit:
;   de = FCB
;   Trashes A
;******************************************************
FCLOSE: lxi     d,FCB           ;FCB describes the file
        mvi     c,BCLOSE        ;CP/M CLOSE FILE funct.
        call    GOBDOS
        inr     a               ;-1 means close error
        rnz

;--------------------------------------
;Error closing file: abort with message
;--------------------------------------
        call    CMSGXT
        db      'ERROR CLOSING FILE!'
        db      CR,LF,'File is probably corrupt.$'

;*****Subroutine***************************************
; Get sector from SECBUF into BLKBUF
;
;---> ENTRY IS AT RDSECT <----
;
;  If SECBUF is empty, then read up to BLKSIZ more
;  sectors from the disk.
;
; For speed, this routine buffers up to SBUFSZ blocks
; (sectors) into SECBUF each time it reads from disk.
; On Entry:
;   SECCNT = number of remaining sectors in SECBUF
;   SECPTR = address of next sector to send
; On Exit:
;   Carry and EOFLG set if EOF
;   Trashes all registers
;******************************************************

;---------------------------------------
;SECBUF is empty: read up to SBUFSZ more
;sectors from the disk into SECBUF
;---------------------------------------
RDBLOC: lda     EOFLG           ;Have we seen the EOF?
        ora     a
        stc                     ;Return w/ Carry if so
        rnz

        mvi     b,SBUFSZ        ;B=free buffs in SECBUF
        lxi     d,SECBUF        ;de=address in SECBUF

RSECLP: mvi     c,BSTDMA        ;Set CP/M DMA address
        call    GOBDOS          ;trashes no registers

        xchg                    ;pointer to hl, free de

        lxi     d,FCB           ;Disk sect. into SECBUF
        mvi     c,BREAD
        call    GOBDOS          ;trashes no registers

        ora     a               ;Read ok?
        jnz     RSEOF           ;No: no more data

        lxi     d,BLKSIZ        ;next block
        dad     d
        xchg                    ;Result goes in de

        dcr     b
        jnz     RSECLP          ;go until all space used

        jmp     RBFULL          ;No: done reading

;----------------------------------------------
;Encountered the EOF. Set EOFLG so we will stop
;----------------------------------------------
RSEOF:  sta     EOFLG           ;SET EOF FLAG

;       fall into RBFULL

;---------------------------------------
;Receive buffers are all full, or we got
;an EOF from CP/M. compute & save block
;count, point SECPTR to the 1st block
; On Entry:
;   b = remaining space in SECBUF
;---------------------------------------
RBFULL: mvi     a,SBUFSZ        ;compute # of secs read
        sub     b               ;B=remaining space

        sta     SECCNT          ;Store sector count

        lxi     h,SECBUF        ;Point SECPTR to start
        shld    SECPTR          ;..of SECBUF

; Fall into RDSECT

;******************************
;Subroutine RDSECT: Entry point
;******************************
RDSECT: lxi     h,SECCNT        ;decrement SECCNT
        dcr     m
        jm      RDBLOC          ;Empty? go read disk

        lhld    SECPTR          ;(hl) = data in SECBUF
        lxi     d,BLKBUF        ;(de) = data in BLKBUF

        lxi     b,BLKSIZ        ;bytes per block

RSLP:   mov     a,m
        stax    d
        inx     h
        inx     d
        dcx     b
        mov     a,b
        ora     c
        jnz     RSLP

        shld    SECPTR          ;Update data pointer
        ret

;*****Subroutine***************************************
; Write a received BLKSIZ-byte block from BLKBUF into
; SECBUF. If SECBUF is full, flush it to disk.
; On Entry:
;   SECPTR = address of next available block in SECBUF
;   SECCNT = count of blocks currently in SECBUF
; On Exit:
;   Trashes all registers
;******************************************************
WBLOCK: lhld    SECPTR
        xchg                    ;de=SECBUF block data
        lxi     h,BLKBUF        ;(hl)=BLKBUF

        lxi     b,BLKSIZ        ;bytes per block

WBLP:   mov     a,m
        stax    d
        inx     d
        inx     h
        dcx     b
        mov     a,b
        ora     c
        jnz     WBLP

        xchg                    ;Update SECPTR
        shld    SECPTR

        lxi     h,SECCNT        ;increment SECCNT
        inr     m

        mov     a,m
        cpi     SBUFSZ          ;Is SECBUF full?
        rnz                     ;No: return for more

;       fall into WFLUSH

;*****Subroutine***************************************
; Write all data in SECBUF to disk
; On Entry:
;   SECCNT has count of blocks currently in SECBUF
; On Exit:
;   Trashes all registers
;******************************************************
WFLUSH: lda     SECCNT          ;# of sectors in SECBUF
        ora     a               ;End of file already?
        rz                      ;Return w/ Z set if so

        mov     b,a             ;Sector count in b
        lxi     d,SECBUF        ;de=start of sect data

WFLOOP: mvi     c,BSTDMA        ;CP/M SET DMA function
        call    GOBDOS          ;de = DMA address

        xchg                    ;pointer to hl, free de

        lxi     d,FCB           ;Write from buf to disk
        mvi     c,BWRITE
        call    GOBDOS

        lxi     d,EWFMSG
        ora     a               ;return 0 if okay
        jnz     ABORT           ;OOPS, error

                                ;hl = address in SECBUF
        lxi     d,BLKSIZ        ;de=block size
        dad     d               ;(hl)=next sector data
        xchg                    ;addr to de for BSTDMA

        dcr     b
        jnz     WFLOOP          ;until all sectors sent

;-------------------------------
;Reset pointers for empty SECBUF
;-------------------------------
        xra     a
        sta     SECCNT          ;SECCNT = 0
        lxi     h,SECBUF        ;reset SECPTR
        shld    SECPTR

        ret

;*****Subroutine***************************************
; Update the 16-bit CRC with one more byte
; speed matters here.
; On Entry:
;   a has the new byte
;   CRC16 is current except this byte
; On Exit:
;   CRC16 has been updated
;   Trashes a,de
;******************************************************
CALCRC: push    b
        push    h
        lhld    CRC16           ;get CRC so far

        xra     h               ;XOR into CRC top byte
        mov     h,a

        lxi     d,1021h
        mvi     b,8             ;prepare to rot 8 bits

CROTLP: dad     h               ;16-bit shift
        jnc     CCLR            ;skip if bit 15 was 0

        mov     a,h             ;CRC=CRC xor 1021H
        xra     d
        mov     h,a
        mov     a,l
        xra     e
        mov     l,a
CCLR:
        dcr     b
        jnz     CROTLP          ;rotate 8 times

        shld    CRC16           ;save CRC so far
        pop     h
        pop     b
        ret

;*****Subroutine***************************************
; Receive a byte, with 1-sec timeout
; On Entry:
; On Exit:
;   Carry set for timeout error
;   Character in a
;   trashes a,e
;******************************************************
RXBYT1: mvi     e,2

;       fall into RXBYTE

;*****Subroutine***************************************
; Receive a byte from the reader device
; Note: CTSRDR option selects a custom reader port:
; rather than hanging and waiting for a byte, the
; driver will return with Z set if no byte is
; available. Otherwise, a=received byte
;
; On Entry:
;   e = timeout value in half-seconds
; On Exit:
;   Carry set for timeout error
;   a = received byte if no timeout
;   trashes e
;******************************************************
;* CUSTOMIZATION *
;*****************
; You can replace this call to GOBIOS with a call to
; your subroutine that reads your hardware directly,
; like this:
;               call    MYRDR
;
;               ...
;
; MYRDR:        in      <my status port>
;               ani     <my rx buffer-full bit mask>
;               rz
;
;               in      <my data port>
;               ret
;
; ...and then adjust the timer value loaded into hl so
; that the loop is 1/2 second long. (Note that the code
; detects the difference between an 8080 and a Z80,
; and assumes an 8080 at 2 MHz, or a Z80 at 4 MHz.)
;******************************************************
RXBYTE: push    h

; set HL for 1/2 second timeout for either a 2 MHz
; 8080 or a 4MHz Z80
MS500:  lxi     h,4274          ;1/2-sec count down
        sub     a               ;test for 8080 or Z80
        jpe     IS8080
        dad     h               ;Z80 is twice as fast
IS8080:

RXWAIT: mvi     a,READER        ;(7)BIOS call
        call    GOBIOS          ;(172+17=189)

        stc                     ;(4)

 if CSTRDR
        jnz     RXDONE          ;(10)

        dcx     h               ;(5)timeout timer
        mov     a,h             ;(5)Test for 16-bit 0
        ora     l               ;(4)
        jnz     RXWAIT          ;(10)
                ;inner loop:234 cycles=117 uS for 8080
                ;0.5 sec / 117 uS = 4273.5 cycles

        dcr     e
        jnz     MS500           ;spin for time

;timeout waiting for chr. Does the user want to abort?

        call    CCTRLC          ;user abort?
        ora     a               ;clear carry for exit

 endif

;-------------------------------------------
;Set carry for error, clear for ok & return
;-------------------------------------------
RXDONE: pop     h
        cmc                     ;Carry if timeout
        ret

;*****Subroutine***************************************
; Send ACK
; On Exit:
;   a trashed
;   All flags and all other registers preserved
;******************************************************
TXACK:  mvi     a,ACK

;       fall into TXBYTE

;*****Subroutine***************************************
; Send a to the punch device
;
; On Entry:
;   a = byte to send
; On Exit:
;   Checksum in c has been updated
;   All registers preserved
;******************************************************
;* CUSTOMIZATION *
;*****************
; You can replace this call to GOBIOS with a direct
; write to your hardware, like this:
;
; TXWAIT:       in      <my status port>
;               ani     <my tx ready mask>
;               jz      TXWAIT
;
;               mov     a,c
;               out     <my data port>
;******************************************************
TXBYTE: push    psw
        push    b

        mov     c,a             ;data to c for BIOS

        mvi     a,PUNCH         ;BIOS send c to punch
        call    GOBIOS

        mov     a,c             ;original byte
        pop     b
        add     c               ;update checksum
        mov     c,a

        pop     psw

        ret

;*****Subroutine***************************************
; Print hl in decimal on the console with leading
; zeros suppressed
; Trashes all registers
;******************************************************
PDEC16: mvi     d,0     ;Suppress leading 0's

        lxi     b,-10000
        call    DECDIG
        lxi     b,-1000
        call    DECDIG
        lxi     b,-100
        call    DECDIG
        lxi     b,-10
        call    DECDIG

        mov     a,l     ;last digit is simple
        jmp     DECDG0  ;with leading 0's

;-----Local Subroutine----------------------------
; Divide HL by power of 10 in bc and print result,
; unless it's a leading 0.
; On Entry:
;   hl=Dividend
;   bc=divisor (a negative power of 10)
;   d=0 if all prior digits were 0
; On Exit:
;   Quotent is printed, unless it's a leading 0
;   hl=remainder
;   d=0 iff this and all prior digits are 0
;-------------------------------------------------
DECDIG: mvi     a,0FFh  ;will go 1 too many times
        push    d       ;leading zero state

DIGLP:  mov     d,h     ;de gets prev value
        mov     e,l
        inr     a
        dad     b       ;subtract power of 10
        jc      DIGLP

        xchg            ;hl has remainder
        pop     d       ;leading 0 state

        mov     e,a     ;e has digit to print
        ora     d       ;leading 0 to suppress?
        rz              ;yes: digit is done

        mov     d,a     ;don't suppress next digit

        mov     a,e

DECDG0: adi     '0'     ;make digit ASCII
        mov     c,a     ;result to c for TYPEC

; fall into TYPEC

;*****Subroutine***************************************
; Print character in c on console
; trashes a
;******************************************************
TYPEC:  mvi     a,CONOUT        ;BIOS WR Console func

; fall into GOBIOS

;*****Subroutine***************************************
; Go call a BIOS driver directly
; On Entry:
;   c=value for BIOS routine, if any
;   a = BIOS call address offset
; On Return:
;   all other regs and flags as the BIOS code left them
;   READER will take 172 8080 cycles if no chr ready
;******************************************************
GOBIOS: push    h               ;(11)
        lhld    WBOOTA          ;(16)get BIOS base address
        mov     l,a             ;(5)a has jump vector
        xthl                    ;(18)
        ret                     ;(10)go to BIOS routine

;Assume BIOS takes 112 cycles, when no READER chr is ready:
;       jmp     <routine>       ;(10) BIOS jump vector
;       call    <status>        ;(17) reader status routine

;       lda     IOBYTE          ;(13) which reader port?
;       ani     MASK            ;(7)
;       jz      <not taken>     ;(10) not RDR=TTY
;       cpi     <val>           ;(7)
;       jc      <not taken>     ;(10) not RDR=HSR
;       jz      <taken>         ;(10) RDR=UR1

;       in      <port>          ;(10) get reader stat
;       ani     <mask>          ;(7) test, set Z
;       rz                      ;(11) return from BIOS

;*****Subroutine***************************************
;Print $-terminated string at de
;trashes a,c
;******************************************************
PRINTF: mvi     c,BPRINT
; fall into GOBDOS

;*****Subroutine***************************************
;Call BDOS while preserving all regs except a
;******************************************************
GOBDOS: push    h
        push    d
        push    b
        call    BDOS
        pop     b
        pop     d
        pop     h
        ret

;*****Subroutine***************************************
; Print In-line Message
;  The call to ILPRT is followed by a message string.
;  The first chr is the byte count of the message.
; Trashes bc
;******************************************************
ILPRT:  xthl                    ;Save hl, get msg addr
        mov     b,m             ;Byte count

IPLOOP: inx     h               ;Next byte
        mov     c,m
        call    TYPEC           ;print byte
        dcr     b
        jnz     IPLOOP          ;Do all bytes of msg

        inx     h               ;point past message

        xthl                    ;Restore hl,
                                ;..get return address
        ret

;*****Subroutine***************************************
;Check for Control-C on the console, and quit if so
; trashes a
;******************************************************
CCTRLC: mvi     a,CONST         ;anything on console?
        call    GOBIOS          ;(about 200 cycles)
        ora     a               ;0 means no chr waiting
        rz

; chr waiting: Take a look
        mvi     a,CONIN         ;read the typed chr
        call    GOBIOS
        cpi     CTRLC
        rnz                     ;ignore everything else

        lxi     d,CCMSG         ;control C

;       fall into ABORT to close file and report

;*****Exit*********************************************
;Abort Rx - close file, delete it if no blocks received
; ON Entry:
;  DE = abort message to print
;  XMODE = 0 for receiving, <>0 for sending
;******************************************************
ABORT:  call    ILPRT
        db      ABLEN
ABMSG:  db      CR,LF,'ABORT: '
ABLEN   equ     $-ABMSG

        call    PRINTF          ;print string at de

        lda     XMODE           ;need to close the file?
        ora     a               ;0 means receiving
        jnz     EXIT

        call    FCLOSE          ;Close file neatly

        lhld    CURBLK          ;any disk blks written?
        mov     a,h
        ora     l               ;check 16-bit blk count
        jnz     RRXCNT          ;y: report blks written

        mvi     c,BDELET        ;n: delete 0-byte file
        lxi     d,FCB
        call    GOBDOS

        inr     a               ;successful delete?
        jz      EXIT            ;no: done

        call    CMSGXT          ;Exit w/ this message
        db      '0-byte file deleted$'

;***************************
;$-terminated abort messages
;***************************
CCMSG:  db      '^C$'
ELEMSG: db      'too many errors$'
SEMSG:  db      'lost blocks$'
TAEMSG: db      'too many ACK errors$'
EWFMSG: db      'disk write error$'

;*****Exit*********************************************
; Print CRLF, then $-terminated string following the
; call. Fix everything for CP/M, and return to CP/M
;******************************************************
CMSGXT: call    ILPRT
        db      CRLEN
CRMSG:  db      CR,LF
CRLEN   equ     $-CRMSG

; fall into MSGXIT

;*****Exit*********************************************
; Print $-terminated string following the call, fix
; everything for CP/M, and return to CP/M
;******************************************************
MSGXIT: pop     d               ;Get message address
        call    PRINTF

;       fall into EXIT

;*****Exit*********************************************
; Restore CP/M's default disk, disk DMA buffer, and
; stack, and then return to CP/M
;******************************************************
EXIT:   lda     CURDSK          ;original default disk
        mov     e,a
        mvi     c,BSDISK
        call    GOBDOS

        lhld    STACK           ;restore CP/M stack
        sphl

        mvi     d,COMBUF        ;Reset CP/M DMA Address
        mvi     c,BSTDMA

        jmp     BDOS            ;returns to CP/M

;******************************************************
;RAM Variables and Storage, all initialized during load
;******************************************************
;------------------------------
;XMODEM file transfer variables
;------------------------------
RXBLK:  db      0       ;Received block number
CURBLK: dw      0       ;16-bit Current block number
ERRCNT: db      0       ;Error count
CRC16:  dw      0       ;calculated CRC so far
NAKCHR: db      NAK     ;current NAK chr
CURDSK  db      0       ;current disk at entry

;------------------------
;Disk buffering variables
;------------------------
SECPTR: DW      SECBUF  ;Points to next sect in SECBUF
SECCNT: db      0       ;Count of sectors in SECBUF
EOFLG:  db      0       ;EOF flag (<>0 means true)

;----------------------
;Command line variables
;----------------------
XMODE:  db      0FFH    ;1 for send, 0 for receive
CRCFLG: db      SELCRC  ;0 for checksum, SELCRC for CRC

;-------------------------------------------
;Local stack, initialized for easy debugging
;-------------------------------------------
        dw      0,0,0,0,0,0,0,0
        dw      0,0,0,0,0,0,0,0
STACK:  dw      0               ;top of stack

;******************************************************
;Buffer for SBUFSZ disk sectors (same as XMODEM blocks)
; This buffer over-writes the following initialization
; code.
;******************************************************
SECBUF: equ     $               ;Sector buffer

;******************************************************
; The following subroutines are used only during the  *
; initial command line processing, and get wiped out  *
; by the SECBUF, once we start transfering data.      *
;******************************************************

;*****Subroutine***************************************
;Open CP/M disk file (for reading),
; and reports succss or failure to console.
; On Entry:
;   FCB has file name
; On successful Exit:
;   File is open
;   File-open message has been rinted on the console
; On failure:
;   Relevent error msg has been printed on the console
;   jump to CP/M
;******************************************************
FOPEN:  lxi     d,FCB   ;FCB describes the file to open
        mvi     c,BOPEN ;CP/M FILE OPEN function
        call    GOBDOS
        inr     a       ;-1 means open failure
        jz      FOFAIL

        call    ILPRT
        db      FELEN
FEMSG:  db      CR,LF,'File open'
        db      CR,LF,'Sending'
FELEN   equ     $-FEMSG

        ret

;--------------------------------------
;Error opening file: Abort with message
;--------------------------------------
FOFAIL: call    CMSGXT  ;Exit w/ this message

        db      'ERROR: File not found$'

;*****Subroutine***************************************
;Get the error-checking mode
; Wait for initial NAK or a SELCRC from receiver to get
; going. (NAK means we use checksums, SELCRC means use
; CRC-16.) Ignore all other characters, w/ long timeout
; Abort if user types Control-C
; On Entry:
;   CRCFLG = 0, defaulting to checksum mode
; On Succesful Exit:
;   CRCFLG = 0 if NAK received
;   CRCFLG = SELCRC if SELCRC received
;   Message printed if CRC mode
; Trashes a,bc,de,hl
;******************************************************
GTMODE: mvi     b,NAKTO         ;Long timeout
        lxi     h,CRCFLG        ;assume cksum for now
        mvi     m,0

WAITNK: lxi     d,NAMSG
        dcr     b               ;Timeout?
        jz      ABORT           ;yes: abort

        call    RXBYT1          ;trashes e

        cpi     NAK             ;NAK for checksum?
        rz                      ;yes:done

        cpi     SELCRC          ;'C' for CRC?
        jnz     WAITNK          ;No: Keep looking

        mov     m,a             ;remember CRC mode

; fall into PCRC

;*****Subroutine***************************************
; Print ' with CRC'
;******************************************************
PCRC:   call    ILPRT
        db      SCLEN           ;Message length
SCMSG:  db      ' with CRC'
SCLEN   equ     $-SCMSG

        ret

;abort message

NAMSG:  db      'no init from receiver$'

;*****Subroutine***************************************
;Create file on disk and report
; On Entry:
;   FCB has file name
; On successful Exit:
;   File is created and open
;   File-created message has been rinted on the console
;   Initial NAK or C (cksum or CRC mode) has been sent
; On failure:
;   Relevent error msg has been printed on the console
;   jump to CP/M
;******************************************************
CREATE:
;-------------------------------------------
;See if file already exists, and abort if so
;-------------------------------------------
        lxi     d,FCB
        mvi     c,BSERCH                 ;Search directory for file
        call    GOBDOS
        inr     a               ;-1 means not there
        jnz     FILEX           ;error if so

;-------------------------
;Create file on CP/M disk
;   DE still points to FCB
;-------------------------
        mvi     c,BMAKE ;CP/M CREATE FILE func
        call    GOBDOS
        inr     a               ;-1 means create error

        jz      FCERR

;---------------------------
;Tell user that we are ready
;---------------------------
        call    ILPRT           ;Print this message

        db      RTRLEN          ;Message length
RTRMSG: db      CR,LF,'File created'
        db      CR,LF,'Receiving'
RTRLEN  equ     $-RTRMSG

;----------------------------------------
;Send initial NAK or SELCRC to get things
;going, & report if CRC mode is selected
;----------------------------------------
        lxi     h,NAKCHR        ;init'ed to NAK

        lda     CRCFLG          ;CRC or checksum?
        ora     a               ;0 means checksum
                                ;SELCRC means CRC
        jz      RXCSM
        mov     m,a             ;set CRC initial ACK

        call    PCRC            ;print ' with CRC'


RXCSM:  mov     a,m
        jmp     TXBYTE          ;send the initial ACK
                                ;return via TXBYTE
;----------------------------------------
;Error: Attempt to write to existing file
;----------------------------------------
FILEX:  call    CMSGXT

        db      'ERROR: File already exists$'

;-------------------------
;Error: File create failed
;-------------------------
FCERR:  call    CMSGXT

        db      'File create error',CR,LF
        db      'Write prot? Dir full?$'

;*****Subroutine***************************************
;Initialization: parse command line, set up FCB
; return with a=1 for receive, 2 for send
;******************************************************
INIT:   call    ILPRT           ;print this message

        db      SOLEN           ;message length
SOMSG:
 db CR,LF
 db '======================================'
 db CR,LF
 db '=  CP/M XMODEM 1.01  By M. Eberhard  ='
 db CR,LF
 db '======================================'
 db CR,LF
SOLEN   equ     $-SOMSG

;------------------------------------------------
;Initialize File Control Block for disk transfers
;------------------------------------------------
        xra     a
        lxi     h,FCBEXT
        mvi     b,FCBCLR
FCBLUP: mov     m,a
        inx     h
        dcr     b
        jnz     FCBLUP

;-----------------------------------------------------
;Some versions of CP/M misbehave when the specified
;drive is not the default drive. So make the specified
;drive the default, and put the default back when done
;-----------------------------------------------------
        mvi     c,BCDISK        ;remember default drive
        call    GOBDOS
        sta     CURDSK

;make the requested disk the default disk
        lda     FCBDR           ;default=requested drive
        ora     a               ;use default?
        jz      DEFDRV          ;yes:its ok

        dcr     a               ;so 0 is drive a
        mov     e,a
        mvi     c,BSDISK
        call    GOBDOS
DEFDRV:

;-----------------------------
;Point to command line options
;-----------------------------
        lxi     h,COMBUF        ;CP/M put cmd line here

        mov     b,m             ;1st byte is byte count
        inx     h               ;point to the string

        call    SSKIP           ;skip initial spaces
        jz      HLPEXT          ;no parameters?

;-------------------------------------------
;Skip past the file name, which CP/M already
;put in the FCB for us
; b = bytes remaining to see in COMBUF
; hl points to next chr in COMBUF
;-------------------------------------------
SKPFIL: call    CMDCHR
        jz      NODIR           ;no /R or /S

        cpi     ' '             ;hunt for a space
        jnz     SKPFIL

;------------------------------------------------
;Parse all command line options and set variables
;accordingly. Each option must be preceeded by a
;'/' Options may be preceeded by any reasonable
;number of spaces.
;------------------------------------------------
OPTLUP: call    SSKIP           ;skip spaces
        jz      OPTDON          ;end of input line?

        cpi     '/'             ;all start with /
        jnz     BADINP          ;error:no slash

        call    CMDCHR          ;Get an option chr
        jz      BADINP          ;Error: nothing after /

        sta     PAR1            ;put it in error msg

;------------------------------------------------
;Got a command line option in a. Loop through
;table of options, looking for a match. Update
;the appropriate option variable with the table
;value. Error exit if not in table.
; TRASH a,c,de
;------------------------------------------------
        push    h               ;Save COMBUF pointer

        lxi     h,OPTTAB

CHKLUP: cmp     m               ;Match? (alpha order)
        inx     h               ;get var value
        mov     c,m
        inx     h               ;get var address
        mov     e,m
        inx     h
        mov     d,m
        inx     h

        jz      OPMTCH          ;matched an option
        jnc     CHKLUP          ;No match: keep looking

;------------------------------------------------
;Illegal option. Print message and return to CP/M
;------------------------------------------------
        call    CMSGXT          ;Exit with this message
        db      'ERROR: /'
PAR1:   db      '&'             ;parameter goes here
        db      '$'

;-------------------------------------------
;Option match. Save value, and look for more
;-------------------------------------------
OPMTCH: mov     a,c             ;value from table
        stax    d               ;save value

        pop     h

        jmp     OPTLUP          ;look for more

;--------------------------
;Done parsing command line.
;--------------------------
OPTDON:
;------------------------------------------------
;* CUSTOMIZATION *
;-----------------
; If you replace the calls to RDR: and PUN: with
; direct access to your I/O ports, here is a good
; place to initialize your I/O port hardware.
;------------------------------------------------

;------------------------------------
; Did we get a direction? return with
; a=(XMODE) + 1 if so, error if not
;------------------------------------
        lda     XMODE           ;did /R or /S get set?
        inr     a               ;-1 means uninit'ed
        rnz                     ;ret w/ XMODE+1

;       fall into NODIR - no options with this command

;-----------------------------
;ABORT: No direction specified
;-----------------------------
NODIR:  call    CMSGXT          ;Exit with this message
        db      'ERROR: Must specify /S or /R$'

;---------------------------------------------------
;Input error exits. Print message and return to CP/M
;---------------------------------------------------
BADINP: call    ILPRT           ;print this message

        db      IPELEN          ;message length
IPEMSG: db      CR,LF,'Huh?',CR,LF
IPELEN  equ     $-IPEMSG

;       Fall into HLPEXT

;*****Exit*********************************************
; Print help screen and exit
;******************************************************
HLPEXT: call    CMSGXT          ;Exit w/ this message

 db 'Usage:',CR,LF
 db ' XMODEM <filename.ext> {/R or /S} [/C]'
 db CR,LF
 db '   /R to receive, /S to send, one must be specified'
 db CR,LF
 db '   /C to receive with checksums, otherwise CRC'
 db ' error checking',CR,LF
 db '   (Transmit error-check mode is set by receiver)'
 db CR,LF
 db '   Input from RDR:, output to PUN:'
 db CR,LF
 if CSTRDR
 db '   Special BIOS RDR: returns with Z set if not'
 db ' ready'
 endif
 db CR,LF
 db '   Each + means good block, each - means block'
 db ' retry'
 db '$'

;*****Subroutine***************************************
;Skip over spaces in command line buffer until a non-
;space character is found
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer (and a is not valid)
;******************************************************
SSKIP:  call    CMDCHR
        rz                      ;Z set for nothing left
        cpi     ' '             ;white space?
        jz      SSKIP
        ret                     ;chr in a, Z clear

;*****Subroutine***************************************
;Get next chr from command line buffer
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF, parity stripped
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer, and a=0
;    Carry = 0
;******************************************************
CMDCHR: mov     a,b             ;End of buffer already?
        ora     a               ;also clears carry
        rz                      ;and clears a

        mov     a,m             ;get buffer chr
        inx     h               ;bump buffer pointers
        dcr     b
        ani     7FH             ;Strip parity, clear Z
        ret                     ;with Z cleared

;******************************************************
;Command Line Options Table
; Table entries must be in alphabetical order, and
; terminated with 0FFh
;
; Each entry is 4 bytes long:
;  byte1 = uppercase legal option letter
;  byte2 = value for variable
;  bytes3-4 = variable address
;******************************************************
OPTTAB:
;Error check mode: 0 means checksum, 1 means CRC
        db      'C',0
        dw      CRCFLG

;Select receive mode: puts 0 in XMODE
        db      'R',0
        dw      XMODE

;Select sendmode: puts 1 in XMODE
        db      'S',1
        dw      XMODE

;end of table marker
        db      0FFh

        END
