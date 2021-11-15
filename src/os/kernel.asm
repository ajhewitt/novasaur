; TITLE: 'KERNEL'
;
; NOV 14, 2021
;
        .PROJECT        kernel.com
;
STACK   EQU     0E880H
BREAK   EQU     STACK
;
SRCCPU  EQU     STACK+1
HANDPG  EQU     0E8H    ;HANDLER TABLE E7->EF
;
MOVXB   EQU     070DDH

YIELD	EQU	06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND	EQU	08DDH   ;MASTER: SET SLAVE REGS
IPCRCV	EQU	09DDH   ;MASTER: GET SLAVE REGS
RECXFER	EQU	0BEDH   ;MASTER: MOVE RECORD
;
        .ORG    0F000H
;
; MAIN EVENT LOOP
; SCAN MSG BOXES - EXIT IF MSG RECEIVED
;
START:  DW	YIELD   ;WAIT UNTIL CTX SW
        LDA     BREAK
        ORA     A       ;CHECK BREAK (A!=0)
        RNZ             ;RETURN ON BREAK
K_SCAN: XRA     A       ;A=0
NXTCPU: INR     A       ;A+1
        ANI     7       ;A==8?
        JZ      START   ;NO MSGS; LOOP
        STA     SRCCPU  ;SAVE CURRENT CPU
        DW      IPCRCV  ;RX MSG
        ORA     A       ;A==0?
        JNZ     NXTCPU  ;NEXT CPU
;
; MSG HANDLER
;
K_CMD:  MOV	A,C	;A=CMD
	CPI	04H	;LIMIT CMD<4
	JNC     START   ;SKIP HIGH CMD
        PUSH    D       ;SAVE DE
	;PUSH	H       ;SAVE HL
	ADD	A	;A*=2
	MOV	E,A	;OFFSET
	MVI	D,0	
	LXI	H,TABLE
	DAD	D	;ADD TO TABLE
	MOV	E,M	;LOW BYTE
	INX	H
	MOV	D,M	;HIGH BYTE
	XCHG		;INTO HL
	POP     D       ;RESTORE DE
	PCHL		;GO THERE
;
; CLIENT RETURNS
;
RETURN: LDA     SRCCPU  ;GET CURRENT CPU
        ADI     HANDPG  ;A=HANDPG+CPU
        MOV     H,A     ;H=CPU PAGE
        MOV     A,B     ;A=SEQ
        ADD	A	;A*=2
        ADD	A	;A*=2
        MOV     L,A     ;L=SEQ*4
        MOV     A,M     ;A=CMD
        ORA     A       ;NULL?
        JZ      START   ;NO ACTION RETURN
        ;"jump" to only option "xfer" below
        INX     H
        MOV     E,M     ;E=DEST CPU
        LDA     SRCCPU
        MOV     D,A     ;D=SRC CPU
        DW      RECXFER ;XFER
        MOV     A,E
        DW      SIGNAL  ;WAKE DEST CPU
        JMP     START    
;
; CLIENT GETS RECORD
; - FORWARD GET TO DISK
; - SET XFER ON RETURN
;
GET:    MOV     A,E     ;A=000QQSSS
        RRC             ;SHIFT>>3
        RRC
        RRC
        ANI     03H     ;A=000000QQ
        ORI     04H     ;A=000001QQ
        DW	IPCSND	;FORWARD GET
        ORA     A       ;A==0?
        JZ      START   ;TODO: HANDLE ERR
        ADI     HANDPG  ;A=HANDPG+CPU
        MOV     H,A     ;H=CPU PAGE
        MOV     A,B     ;A=SEQ
        ADD	A	;A*=2
        ADD	A	;A*=2
        MOV     L,A     ;L=SEQ*4
        MVI     M,3     ;CMD=XFER
        LDA     SRCCPU
        INX     H
        MOV     M,A     ;DEST=SRC CPU
	JMP	START
;
; CLIENT PUTS RECORD
; - XFER TO CPU
; - FORWARD PUT TO DISK
;
PUT:	MOV     A,E     ;A=SECTOR
        RRC             ;SHIFT>>3
        RRC
        RRC
        ANI     03H     ;A=000000QQ
        ORI     04H     ;A=000001QQ
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
