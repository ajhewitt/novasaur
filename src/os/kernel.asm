; TITLE: 'KERNEL'
;
; APR 2, 2022
;
        .PROJECT        kernel.com
;
STACK   EQU     0E880H
BREAK   EQU     STACK
;
SRCCPU  EQU     BREAK+1
CSTAT   EQU     SRCCPU+1
LASTT0  EQU     CSTAT+1
TTOP    EQU     LASTT0+1
HANDPG  EQU     0E8H    ;HANDLER TABLE E9->EF
TIMER   EQU     0E900H
;
BEL     EQU     7
SERIAL  EQU     8
CONSOLE EQU     9
AMODE   EQU     0AH
TIME0   EQU     3CH
;
YIELD	EQU	06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND	EQU	08DDH   ;MASTER: SET SLAVE REGS
IPCRCV	EQU	09DDH   ;MASTER: GET SLAVE REGS
RECXFER	EQU	0BEDH   ;MASTER: MOVE RECORD
DMA     EQU     0DDDH   ;DMA
;
        .ORG    0F000H
;
; MAIN EVENT LOOP
; SCAN MSG BOXES - EXIT IF MSG RECEIVED
;

        LXI     H,TIMER
        SHLD    TTOP
START:  LDA     BREAK
        ORA     A       ;CHECK BREAK (A!=0)
        RNZ             ;RETURN ON BREAK

        LXI     H,LASTT0;GET LAST T0
        IN      TIME0   ;A=T0
        CMP     M       ;T0==LAST T0?
        CNZ     TICK    ;T0 CHANGED

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
        CPI	7       ;LIMIT CMD<7
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
; TTY STATUS
; E=0 IF READY, ELSE 1
;
TTYS:   MVI     E,0     ;ASSUME READY
        LDA     CSTAT   ;LOAD LAST STATUS
        ORA     A
        JNZ     SRDY    ;STATUS READY
        IN      CONSOLE ;READ CHAR
        STA     CSTAT   ;STORE CHAR
        ORA     A
        JNZ     SRDY    ;STATUS READY
        INR     E       ;NOT READY A=1
SRDY:   LDA     SRCCPU
        DW	IPCSND	;SEND TTY STATUS
        JMP     WAIT
;
; TTY INPUT
; console -> E
;
TTYI:   LDA     CSTAT   ;LOAD LAST STATUS
        ORA     A
        JNZ     IRDY    ;INPUT READY
        IN      CONSOLE ;CHAR IN
IRDY:   CPI     BEL     ;BELL CHAR?
        CZ      DING
        MOV     E,A     ;E=CHAR
        XRA     A       ;A=0
        STA     CSTAT   ;CLEAR STATUS
        LDA     SRCCPU
        DW      IPCSND
        JMP     WAIT
;
; TTY OUT
; E -> console
;
TTYO:   MOV     A,E
        OUT     CONSOLE ;CHAR OUT
        MOV     E,A     ;E=0 IF EOL
        LDA     SRCCPU
        DW      IPCSND
        JMP     WAIT
;
; TICK - SCAN TIMER HEAP
; [COUNT,CALL ADDR]
; TIMED OUT AT COUNT ZERO
;
TICK:   STA     LASTT0  ;SAVE T0
        LXI     H,TIMER
        PUSH    H
TICKR:  POP     H
TICK1:  XCHG            ;SAVE HL, DE=CURT
        LXI     H,TTOP  ;HL=TTOP
        MOV     A, M
        CMP     E
        JNZ     TICK2   ;CURT!-TTOP
        INX     H
        MOV     A, M
        CMP     D
        RZ              ;CURT==TTOP
TICK2:  XCHG            ;HL=CURT
        DCR     M       ;COUNT-1
        JZ      TFIRE   ;TIMED OUT
        LXI     B, 3
        DAD     B       ;CURT+3
        JMP     TICK1
TFIRE:  PUSH    H       ;SAVE CURT
        LXI     D,TICKR
        PUSH    D       ;PUSH RETURN
        INX     H
        MOV     E, M    ;E=LSB
        INX     H
        MOV     D, M    ;D=MSB
        PUSH    D       ;PUSH CALL
        LXI     B, -3
        DAD     B       ;HL=CURT-1
        XCHG            ;SAVE HL
        LHLD    TTOP
        DAD     B       ;HL=TTOP-3
        SHLD    TTOP
        DCX     H
        XCHG
        MVI     C, 3
        DW      DMA     ;COPY TOP TIMER TO CUR
        RET
;
; TIMER ADD
; C=COUNT, DE=CALL ADDR
;
TADD:   LHLD    TTOP
        MOV     M, C
        INX     H
        MOV     M, E
        INX     H
        MOV     M, D
        INX     H
        SHLD    TTOP
        RET
;
DING:   MVI     A, 1
        OUT     AMODE
        MVI     A, 2    ; wave:0=sine,1=saw,2=sqr,15=noise
        LXI     B, 00C02H; attack,decay
        LXI     D, 00C02H; sustain, release
        DW      021DDH  ; config voice 1
        MVI     A, 48H  ; MIDI note number
        DW      029DDH  ; set note 1
        DW      02DDDH  ; gate note on
        MVI     C, 2
        LXI     D, DONG
        CALL    TADD
        MVI     C, 8
        LXI     D, AUDOFF
        CALL    TADD
        MVI     A,BEL
        RET
; GATE OFF
DONG:   DW      025DDH  ; gate note off
        RET
; AUDIO OFF
AUDOFF: XRA     A
        OUT     AMODE
        RET
;
; COMMAND JUMP VECTOR TABLE
;
CMDS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GET     ;GET RECORD
        DW      PUT     ;PUT RECORD
        DW      TTYS
        DW      TTYI
        DW      TTYO
;
; RETURN JUMP VECTOR TABLE
;
RETS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GETR
        DW      WAIT
        DW      WAIT
        DW      WAIT
        DW      WAIT
