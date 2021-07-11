;
; July 5, 2021
;
        .PROJECT        kernel.com
;
ORIGIN  EQU     0FE00H
STACK   EQU     0FD00H
SRCCPU  EQU     STACK+1
HANDPG  EQU     0FAH    ;HANDLER TABLE

CMDSND	EQU	05DDH
YIELD	EQU	06EDH
SIGNAL  EQU     07DDH
IPCSND	EQU	08DDH
IPCRCV	EQU	09DDH
RECRECV	EQU	0AEDH
RECXFER	EQU	0BEDH
RECSEND	EQU	0CEDH

        .ORG    ORIGIN
START:  LXI     SP,STACK
        DW	YIELD   ;WAIT UNTIL CTX SW
        XRA     A       ;A=0
RXMSG:  INR     A       ;A+1
        ANI     7       ;A==8?
        JZ      START   ;NO MSGS; LOOP
        STA     SRCCPU  ;SAVE CURRENT CPU
        DW      IPCRCV  ;RX MSG
        ORA     A       ;A==0?
        JNZ     RXMSG   ;NEXT CPU
        
        PUSH    D       ;SAVE DE
	PUSH	H       ;SAVE HL
	LXI	H,TABLE
	MVI	D,0
	MOV	A,C	;A=CMD
	CPI	03H	;LIMIT CMD<=3
	JC      START   ;SKIP HIGH CMD
	ADD	A	;A*=2
	MOV	E,A	;OFFSET
	DAD	D	;ADD TO TABLE
	MOV	E,M	;LOW BYTE
	INX	H
	MOV	D,M	;HIGH BYTE
	XCHG		;INTO HL
	POP     D
	PCHL		;GO THERE
;
;
;
RETURN: LDA     SRCCPU
        ADI     HANDPG
        MOV     H,A     ;PAGE+CPU
        MOV     A,B     ;A=SEQ
        RAL
        RAL
        MOV     L,A     ;PAGE INDEX=SEQ<<2
        MOV     A,M     ;A=CMD
        ORA     A       ;NULL?
        JZ      START
        ;jump to only option "xfer" below
        INX     H
        MOV     E,M     ;E=DEST
        LDA     SRCCPU
        MOV     D,A     ;D=SRC
        DW      RECXFER ;XFER
        MOV     A,E
        DW      SIGNAL  ;SIG DEST
        JMP     START    
;
; CLIENT GETS RECORD
; - FORWARD GET TO DISK
; - SET XFER ON RETURN
;
GET:	MOV     A,E     ;A=SECTOR
        RAR             ;SHIFT>>3
        RAR
        RAR
        ORI     04H     ;A=DEST CPU
        DW	IPCSND	;FORWARD GET
        ORA     A       ;A==0?
        JZ      START   ;TODO: HANDLE ERR
        ADI     HANDPG
        MOV     H,A     ;PAGE+CPU
        MOV     A,B     ;A=SEQ
        RAL
        RAL
        MOV     L,A     ;PAGE INDEX=SEQ<<2
        MVI     M,3     ;CMD=XFER
        LDA     SRCCPU
        INR     L
        MOV     M,A     ;DEST=SRC CPU
	JMP	START
;
; CLIENT PUTS RECORD
; - XFER TO CPU
; - FORWARD PUT TO DISK
;
PUT:	MOV     A,E     ;A=SECTOR
        RAR             ;SHIFT>>3
        RAR
        RAR
        ORI     04H     ;A=CPU NUMBER
        MOV     E,A     ;DEST CPU
        LDA     SRCCPU
        MOV     D,A     ;SRC CPU
        DW      RECXFER ;XFER RECORD
        DW	IPCSND	;SEND PUT
	JMP	START
;
; COMMAND JUMP VECTOR TABLE
;
TABLE:  DW      START   ;NULL
        DW      RETURN  ;RETURN
        DW      GET
        DW      PUT
