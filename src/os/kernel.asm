; TITLE: 'KERNEL'
;
; APR 10, 2022
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
BELC    EQU     TTOP+2
HANDPG  EQU     0E8H    ;HANDLER TABLE E9->EF
TBASE   EQU     0E900H
;
BEL     EQU     7
SERIAL  EQU     8
CONSOLE EQU     9
AMODE   EQU     0AH
TIME0   EQU     3CH
;
MVCTX   EQU     04DDH
YIELD	EQU	06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND	EQU	08DDH   ;MASTER: SET SLAVE REGS
IPCRCV	EQU	09DDH   ;MASTER: GET SLAVE REGS
RECXFER	EQU	0BEDH   ;MASTER: MOVE RECORD
DMA     EQU     0FDDH   ;DMA
;
        .ORG    0F000H
;
; MAIN EVENT LOOP
; SCAN MSG BOXES - EXIT IF MSG RECEIVED
;

        LXI     H,TBASE
        SHLD    TTOP    ;TIMER TOP=TIMER START
        XRA     A
        STA     BELC    ;BEL COUNT=0
        LDA     SRCCPU
;
; SET CTX: 1,2,3,4,1,2,3,5,1,2,3,6,1,2,3,7
;
        MVI     H, 0
CTX1:   MOV     A, H
        INR     A
        ANI     3
        JNZ     CTX2    ;A=1,2,3
        MOV     A, H
        RRC
        RRC
        ANI     3       ;A=0,1,2,3
        ORI     4       ;A=4,5,6,7
CTX2:   ORI     0F0H
        DW      MVCTX
        INR     H
        JNZ     CTX1
;
START:  LDA     BREAK
        ORA     A       ;CHECK BREAK (A!=0)
        RNZ             ;RETURN ON BREAK
;
        LXI     H,LASTT0;GET LAST T0
        IN      TIME0   ;A=T0
        CMP     M       ;T0==LAST T0?
        CNZ     TICK    ;T0 CHANGED
;
WAIT:   DW	YIELD   ;WAIT UNTIL CTX SW
        LDA     SRCCPU
SCAN:   INR     A       ;A+1
        ANI     7       ;A==8?
        STA     SRCCPU  ;SAVE CURRENT CPU
        JZ      START   ;NO MSGS; LOOP
        DW      IPCRCV  ;RX MSG
        ORA     A       ;A==0?
        JNZ     SCAN    ;NEXT CPU
;
; MSG HANDLER
;
K_CMD:  MOV	A,C	;A=CMD
        CPI	6       ;LIMIT CMD<6
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
; IN HL FROM SEQ B & CPU# IN A
;
HANDHL: ADI     HANDPG  ;A=HANDPG+CPU
        MOV     H,A     ;H=CPU PAGE
        MOV     A,B     ;A=SEQ
        ADD	A	;A*=2
        ADD	A	;A*=2
        MOV     L,A     ;L=SEQ*4
        RET
;
; SEND RETURNABLE COMMAND
; SET RETURN HANDLER
;
SNDRET: DW	IPCSND	;SEND MSG, EXPECT RETURN
        ORA     A       ;A==0?
        JZ      WAIT    ;TODO: HANDLE ERR
        CALL    HANDHL  ;HL=HANDLER
        MOV     M,C     ;CMD=C
        LDA     SRCCPU
        INX     H
        MOV     M,A     ;DEST=SRC CPU
        JMP     WAIT
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
; GENERIC RETURN
;
GENR:   POP     H
        MOV     A,M     ;A=DEST CPU
        DW      SIGNAL  ;WAKE DEST CPU
        JMP     WAIT
;
; CLIENT GETS RECORD
; - FORWARD GET TO DISK
; - SET XFER ON RETURN
;
GET:    CALL    SECCPU  ;A=CPU#
        JMP     SNDRET  ;SET HANDLER CMD
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
        JMP     SNDRET  ;SET HANDLER CMD
;
; TTY INPUT
; console -> E
;
TTYI:   IN      CONSOLE ;CHAR IN
        CPI     BEL     ;BELL CHAR?
        CZ      BELON   ;BELL ON
        MOV     E,A     ;E=CHAR
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
        LXI     H,TBASE
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
        RET             ;CALL ADDR
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
VOICE1	EQU	21DDH
GOFF1	EQU	25DDH
NOTE1	EQU	29DDH
GON1	EQU	2DDDH
;
; BELL ON - AUDIO ON, NOTE G ON
; ADD TIMERS TO GATE OFF, AUDIO OFF
;
BELON:  LXI     H, BELC
        INR     M       ;BELL COUNT +1
        MVI     A, 1
        OUT     AMODE
        MVI     A, 2    ;SQR WAVE
        LXI     B, 00C02H;ATTACK/DECAY
        LXI     D, 00C02H;SUSTAIN/RELEASE
        DW      VOICE1
        MVI     A, 43H  ;MIDI NOTE G
        DW      NOTE1
        DW      GON1
        MVI     C, 2    ;GATE ON FOR 2 TICKS
        LXI     D, BELOFF
        CALL    TADD
        MVI     C, 8    ;AUDIO ON FOR 8 TICKS
        LXI     D, AUDOFF
        CALL    TADD
        MVI     A, BEL  ;RETURN BEL
        RET
; GATE OFF
BELOFF: DW      GOFF1
        RET
; AUDIO OFF
AUDOFF: LXI     H, BELC
        DCR     M       ;BELL COUNT -1
        RNZ             ;MORE AUDIO COMING
        XRA     A
        OUT     AMODE   ;AUDIO OFF
        RET
;
; COMMAND JUMP VECTOR TABLE
;
CMDS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GET     ;GET RECORD
        DW      PUT     ;PUT RECORD
        DW      TTYI
        DW      TTYO
;
; RETURN JUMP VECTOR TABLE
;
RETS:   DW      WAIT    ;NULL N/A
        DW      WAIT    ;RETURN N/A
        DW      GETR
        DW      GENR
        DW      WAIT
        DW      WAIT
