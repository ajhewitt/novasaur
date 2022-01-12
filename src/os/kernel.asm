; TITLE: 'KERNEL'
;
; JAN 11, 2022
;
        .PROJECT        kernel.com
;
STACK   EQU     0E880H
BREAK   EQU     STACK
;
SRCCPU  EQU     STACK+1
HANDPG  EQU     0E8H    ;HANDLER TABLE E7->EF
;
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

START:  LDA     BREAK
        ORA     A       ;CHECK BREAK (A!=0)
        RNZ             ;RETURN ON BREAK
WAIT:   DW	YIELD   ;WAIT UNTIL CTX SW
        XRA     A       ;A=0
SCAN:   INR     A       ;A+1
        ANI     7       ;A==8?
        JZ      START   ;NO MSGS; LOOP
        STA     SRCCPU  ;SAVE CURRENT CPU
        DW      IPCRCV  ;RX MSG
        ORA     A       ;A==0?
        JNZ     SCAN    ;NEXT CPU
;
; MSG HANDLER
;
K_CMD:  MOV	A,C	;A=CMD
        CPI	4       ;LIMIT CMD<4
        JNC     WAIT    ;SKIP HIGH CMD
        CPI     1       ;CHECK RETURN
        JC      WAIT    ;NULL CMD
        JZ      CMD1    ;HANDLE RET
        LXI	H,CMDS
	JMP     CMD2
CMD1:   LXI     H,0041H
        LDA     SRCCPU  ;GET CURRENT CPU
        CALL    HANDHL  ;HL=HANDLER
        MOV     A,M     ;A=CMD
        ORA     A       ;NULL?
        JZ      WAIT    ;NO ACTION RETURN
        MVI     M,0     ;CLEAR COMMAND
        INX     H
        PUSH    H
        LXI	H,RETS
CMD2:   PUSH    D       ;SAVE DE
	ADD	A	;A*=2
	MOV	E,A	;OFFSET
	MVI	D,0
	DAD	D	;ADD TO TABLE
	MOV	E,M	;LOW BYTE
	INX	H
	MOV	D,M	;HIGH BYTE
	XCHG		;INTO HL
	POP     D       ;RESTORE DE
	PCHL		;GO THERE
;
; RETURN HANDLER POINTER
; IN HL FROM CPU# IN A
;
HANDHL: ADI     HANDPG  ;A=HANDPG+CPU
        MOV     H,A     ;H=CPU PAGE
        MOV     A,B     ;A=SEQ
        ADD	A	;A*=2
        ADD	A	;A*=2
        MOV     L,A     ;L=SEQ*4
        RET
;
; RETURN CPU# IN A
; FROM SECTOR IN E
;
SECCPU: MOV     A,E     ;A=000QQSSS
        RRC             ;SHIFT>>3
        RRC
        RRC
        ANI     03H     ;A=000000QQ
        ORI     04H     ;A=000001QQ
        RET
;
; CLIENT GETS RECORD
; - FORWARD GET TO DISK
; - SET XFER ON RETURN
;
GET:    CALL    SECCPU  ;A=CPU#
        DW	IPCSND	;FORWARD GET
        ORA     A       ;A==0?
        JZ      WAIT    ;TODO: HANDLE ERR
        CALL    HANDHL  ;HL=HANDLER
        MVI     M,2     ;CMD=XFER
        LDA     SRCCPU
        INX     H
        MOV     M,A     ;DEST=SRC CPU
	JMP	WAIT
;
; RETURN FROM GET
; - XFER FROM CPU
;
GETR:   POP     H
        MOV     L,M     ;L=DEST CPU
        LDA     SRCCPU
        MOV     H,A     ;H=SRC CPU
        MOV     A,L
        DW      RECXFER ;XFER RECORD
        DW      SIGNAL  ;WAKE DEST CPU
        JMP     WAIT
;
; CLIENT PUTS RECORD
; - XFER TO CPU
; - FORWARD PUT TO DISK
;
PUT:    LDA     SRCCPU
        MOV     H,A     ;SRC CPU
        CALL    SECCPU  ;A=CPU#
        MOV     L,A     ;DEST CPU
        DW      RECXFER ;XFER RECORD
        DW	IPCSND	;SEND PUT
	JMP	WAIT
;
; COMMAND JUMP VECTOR TABLE
;
CMDS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GET
        DW      PUT
;
; RETURN JUMP VECTOR TABLE
;
RETS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GETR
        DW      WAIT
