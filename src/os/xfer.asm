; TITLE: 'XFER'
;
; Mar 27, 2024
;
; Copyright (c) 2013 Martin Eberhard
; Copyright (c) 2015 Mike Douglas
; Copyright (c) 2020 The Glitch Works
; Copyright (c) 2024 Solid State Machines
;
; Simple file transfer program. Some code
; taken from M Eberhard XMODEM 1.01 and 
; Glitch Works PCGET and PCPUT.
;
; GPL3 LICENSE included in the project root
; for licensing information.
;-------------------------------------------

        .PROJECT        xfer.com

SOH     EQU     01H
CTRLC	EQU	03H
EOT     EQU     04H
ACK     EQU     06H
LF	EQU	0AH
CR	EQU	0DH
NAK     EQU     15H
ETB     EQU     17H
CAN     EQU     18H
EOF	EQU	1AH

TO1     EQU     15      ;1 SECOND
TOFAST  EQU     30      ;2 SECONDS
TO10    EQU     150     ;10 SECONDS
TOSLOW  EQU     255     ;17 SECONDS

CMDSND  EQU     05DDH   ;SLAVE: SEND COMMAND
CRC16   EQU     1BDDH   ;CRC16: A=DATA, BC=CHECKSUM

;-------------------------------------------
;CP/M 2 BDOS Equates
;-------------------------------------------
BIOS    EQU     0FA00H
WBOOT	EQU	BIOS+3  ;Warm Boot
CONIN   EQU     BIOS+9  ;Console In
PUNCH   EQU     BIOS+18 ;Serial Send
READER  EQU     BIOS+21 ;Serial Recv
IOBYTE  EQU     7
PRINT	EQU	9
OPEN	EQU	15	;0FFH=NOT FOUND
CLOSE	EQU	16	;   "	"
SRCHF	EQU	17	;   "	"
SRCHN	EQU	18	;   "	"
ERASE	EQU	19	;NO RET CODE
READ	EQU	20	;0=OK, 1=EOF
WRITE	EQU	21	;0=OK, 1=ERR, 2=?, 0FFH=NO DIR SPC
MAKE	EQU	22	;0FFH=BAD
REN	EQU	23	;0FFH=BAD
STDMA	EQU	26
BDOS	EQU	5
FCB	EQU	5CH	;DEFAULT FCB
PARAM   EQU	FCB+1	;COMMAND LINE PARAMETER 1 IN FCB
CMDLN   EQU     80H

	ORG	100H

;
; Get ready and begin the transfer
;
; This routine checks for the presence of a filename. If no
; filename is supplied, a help message is printed and we
; exit.
;
START:	LDA	PARAM		;A=1st character of parameter 1
	CPI	' '		;make sure file name present
	JZ	HELP		;no filename?
        lxi     h,CMDLN         ;CP/M put cmd line here
        mov     b,m             ;1st byte is byte count
        inx     h               ;point to the string
        call    SSKIP           ;skip initial spaces
        jz      HELP            ;no parameters?
;
; Skip past the file name, which CP/M already
; put in the FCB for us
; b = bytes remaining to see in COMBUF
; hl points to next chr in COMBUF
;
SKPFIL: call    CMDCHR
        jz      HELP            ;no /R or /S
        cpi     ' '             ;hunt for a space
        jnz     SKPFIL
;
; Parse all command line options and set variables
; accordingly. Each option must be preceeded by a
; '/' Options may be preceeded by any reasonable
; number of spaces.
;
OPTLUP: call    SSKIP           ;skip spaces
        jz      OPTDONE         ;end of input line?
        cpi     '/'             ;all start with /
        jnz     HELP            ;error:no slash
        call    CMDCHR          ;Get an option chr
        jz      HELP            ;Error: nothing after /
        sta     PARERR          ;put it in error msg
;
; Got a command line option in a. Loop through
; table of options, looking for a match. Update
; the appropriate option variable with the table
; value. Error exit if not in table.
; TRASH a,c,de
;
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
;
; Illegal option. Print message and return to CP/M
;
        call    EXIT            ;Exit with this message
        db      'Error Invalid Param /'
PARERR: db      '&'             ;parameter goes here
        db      '$'

OPMTCH: mov     a,c             ;value from table
        stax    d               ;save value
        pop     h
        jmp     OPTLUP          ;look for more
; Done parsing command line.

;
; Did we get a direction? return with
; a=(XMODE) + 1 if so, error if not
;
OPTDONE:lda     XMODE           ;did /R or /S get set?
        ora     a               ;0 means uninit'ed
        jz      HELP
        dcr     a               ;0 means rx
        jz      RECV_FILE
;       fall into SEND_FILE

;
; Send FIle
;
        LXI	D,SENDMSG
	MVI	C,PRINT		;PRINT SEND MSG 2
	CALL    BDOS
	
        CALL    PURGE           ;CLEAR RX BUFF
        CALL    GET_ACK         ;WAIT FOR ACK
        CPI     'C'             ;USE CRC?
        JNZ     READ_FILE       ;NO?
        LXI     H,CFLAG
        INR     M               ;SET C-FLAG
READ_FILE:
        XRA     A
        STA     COUNT           ;RESET COUNT
        LXI	D,FCB
	MVI	C,OPEN          ;OPEN FILE
	CALL	BDOS
	INR	A		;OPEN OK?
	JNZ     READ_SECTOR	;GOOD OPEN
	CALL	EXIT
	DB	'Error Opening File.$'
READ_SECTOR:
	LXI	D,FCB
	MVI	C,READ          ;READ SECTOR
	CALL	BDOS
	ORA	A
        JZ      SEND_LOOP
	DCR	A		;EOF?
	JZ	SEND_DONE       ;DONE
	CALL	EXIT
	DB	'Error Reading File.$'
SEND_DONE:
	MVI     A,EOT
	CALL    SEND
        CALL    FLUSH
	CALL    GET_ACK         ;GET ACK
        JZ      XFER_DONE
        JMP     SEND_DONE
SEND_LOOP:
        LXI     H,COUNT
        INR     M               ;INC BLOCK COUNT
SEND_BLOCK:
        MVI     A,SOH
        CALL    SEND            ;SEND SOH
        LDA     COUNT
        CALL    SEND            ;SEND COUNT
        LDA     COUNT
        CMA
        CALL    SEND            ;SEND 255-COUNT
        LXI     B,0             ;RESET CHECKSUM
	LXI	H,0080H
SEND_CHAR1:
        LDA     CFLAG
        ORA     A               ;C-FLAG SET?
        MOV     A,M             ;READ BYTE
        JZ      CHKSUM1         ;NO
        DW      CRC16           ;CALC CRC16
        JMP     SEND_CHAR2
CHKSUM1:ADD     C               ;UPDATE CHECKSUM
        MOV     C,A
SEND_CHAR2:
        MOV	A,M             ;READ BYTE
        CALL    SEND            ;SEND CHAR
	INR	L               ;DONE?
	JNZ	SEND_CHAR1      ;NEXT CHAR
	LDA     CFLAG
        ORA     A               ;C-FLAG SET?
        JZ      CHKSUM2         ;NO
        MOV     A,B
        CALL    SEND            ;SEND CRC
CHKSUM2:MOV     A,C
	CALL    SEND            ;SEND CHECKSUM
        CALL    FLUSH
        CALL    GET_ACK
	JZ      READ_SECTOR     ;NEXT RECORD
	JMP     SEND_BLOCK      ;RESEND
;
; Wait for ACK
;
GET_ACK:MVI     C,60
RETRY:  DCR     C
        JZ      FAIL            ;FAIL
	MVI     B,TO1
	CALL    RECV            ;GET ACK
	JC	RETRY           ;TIMEOUT
	CPI     ACK
	RET
FAIL:   CALL    EXIT
        DB	'Ack failed.$'
;
; Send byte via PUNCH
;
SEND:   PUSH    H
        PUSH    B
        MOV     C,A             ;C=CHAR
        MVI     A,67            ;WATER MARK
	CALL    PUNCH           ;TX CHAR
	POP     B
	POP     H
	RET
;
; Flush
;
FLUSH:	XRA     A
	CALL    PUNCH
	JNZ     FLUSH
	RET
;
; Purge
;
PURGE:  MVI     B,TO1
	CALL    RECV
	JNC     PURGE
	RET
;
; Receive File
;
RECV_FILE:
        LXI	D,RECVMSG
	MVI	C,PRINT		;PRINT RECV MSG
	CALL	BDOS

        LXI	D,FCB
	MVI	C,SRCHF		;FILE EXISTS?
	CALL	BDOS
	INR	A		;FOUND?
	JZ	NEW_FILE	;NO, SKIP ERASE
        LXI	D,FCB
	MVI	C,ERASE         ;ERASE FILE
	CALL	BDOS
NEW_FILE:
	LXI	D,FCB
	MVI	C,MAKE          ;MAKE NEW FILE
	CALL	BDOS
	INR	A		;FF=BAD
	JNZ     RECV_START      ;OPEN OK
	CALL	EXIT
	DB	'Error Directory Full.$'
RECV_START:
        MVI     B,TOSLOW
RECV_LOOP:
        LXI	H,80H		;POINT TO BUFFER
RECV_CHAR:
        CALL	RECV		;GET CHAR
	JC	RECV_DONE       ;RECEIVE DONE
	MOV	M,A		;STORE CHAR
	INR	L		;DONE?
	MVI     B,TOFAST
	JNZ     RECV_CHAR
	CALL    WR_SEC          ;GOT NEW SECTOR - WRITE IT
	MVI     B,TOFAST
	JMP	RECV_LOOP
WR_SEC:
	LXI	D,FCB
	MVI	C,WRITE
	CALL	BDOS
	ORA	A
	RZ
	CALL	EXIT
	DB	'Error Writing File.$'
;
; Handle end-of-transfer
;
RECV_DONE:
	MVI     A,7FH
	ANA     L
	JZ      FCLOSE
	MVI	M,EOF		;EOF CHAR
	INR	L		;DONE?
	JNZ     RECV_DONE       ;PAD FILE
        CALL    WR_SEC
FCLOSE: LXI	D,FCB
	MVI	C,CLOSE
	CALL	BDOS
	INR	A
	JNZ	XFER_DONE
	CALL	EXIT
	DB	'Error Closing File.$'
;
; Exit and print a message
;
EXIT:   POP	D		;GET MESSAGE
	MVI	C,PRINT
	CALL	BDOS		;PRINT MESSAGE
	LXI     D,NEWLINE
        MVI	C,PRINT
	CALL	BDOS            ;PRINT NEWLINE
        JMP	WBOOT		;Warm boot CP/M
;
; Receive byte via READER
;
RECV:	PUSH    H
        PUSH    B
	CALL    READER          ;RX CHAR
	POP     B
	POP     H
	JZ	TICKR           ;GOT CHAR?
	ORA	A		;TURN OFF CARRY TO SHOW NO TIMEOUT
	RET                     ;RET CHAR IN A
TICKR:  DCR	B		;DEC # OF TICKS
	JNZ	RECV
	STC			;Set carry flag to show timeout
	RET
;
; Sleep for long timeout
;
SLEEP:  MVI     E,TOSLOW        ;SLOW TIMEOUT
        LXI     B,010CH         ;SEQ 1, SLEEP COMMAND
        DW      CMDSND          ;CALL KERNEL
        RET
;
; Skip spaces in command line buffer
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer (and a is not valid)
;*
SSKIP:  call    CMDCHR
        rz                      ;Z set for nothing left
        cpi     ' '             ;white space?
        jz      SSKIP
        ret
;
; Get next chr from command line buffer
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF, parity stripped
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer, and a=0
;    Carry = 0
;
CMDCHR: mov     a,b             ;End of buffer already?
        ora     a               ;also clears carry
        rz                      ;and clears a
        mov     a,m             ;get buffer chr
        inx     h               ;bump buffer pointers
        dcr     b
        ani     7FH             ;Strip parity, clear Z
        ret
;
; Command Line Options Table
; Table entries must be in alphabetical order, and
; terminated with 0FFh
;
; Each entry is 4 bytes long:
;  byte1 = uppercase legal option letter
;  byte2 = value for variable
;  bytes3-4 = variable address
;
OPTTAB:
;Select receive mode: puts 1 in XMODE
        db      'R',1
        dw      XMODE
;Select send mode: puts 2 in XMODE
        db      'S',2
        dw      XMODE
;end of table marker
        db      0FFh
;
; Transfer done, clean up
;
XFER_DONE:
	CALL	EXIT
	DB	'Transfer Complete.$'
;
; Exit with usage message
;
HELP:	call	EXIT
        db 'XFER <drive:filename.ext> {/R or /S}',CR,LF
        db '  /R    Receive file over serial.',CR,LF
        db '  /S    Send file over serial.$'
;
; Variables and Storage Defines
;
XMODE   DB      0
CFLAG   DB      0
COUNT   DB      0
;
; Message Strings
;
SENDMSG:db      'Waiting 15 seconds at start '
        db      'and end of transfer...',CR,LF,'$'
RECVMSG:db	'Waiting 30 seconds to start '
        db      'receiving file...',CR,LF,'$'
ANYKEY: db      'Press any key to start transfer...'
NEWLINE:db      CR,LF,'$'

	END
