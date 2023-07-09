; TITLE: 'KERNEL'
;
; JUL 4, 2023
;
        .PROJECT        kernel.com
;
STACK   EQU     0E500H
BASEPG  EQU     0E8H    ;STAT PAGE:E8, HANDLER TABLE:E9->EF
;
BREAK   EQU     STACK
SRCCPU  EQU     STACK+1
; SPACE FOR MONITOR VARS
LASTT0  EQU     STACK+30H;LAST VAL OF TIME0
TICKC   EQU     STACK+32H;TICK COUNT (52 or 62)
STATI   EQU     STACK+33H;STAT RECORD INDEX
BLKC    EQU     STACK+34H;KERNEL BLOCK COUNT
RUNC    EQU     STACK+36H;KERNEL RUN COUNT
TTOP    EQU     STACK+38H;ADDR HEAP TOP
BELC    EQU     STACK+3AH;BEL COUNT
SERC    EQU     STACK+3BH;SER COUNT
TBASE   EQU     STACK+40H;TIMER HEAP
;
BEL     EQU     7
BS      EQU     8       ;^H BACKSPACE
CR      EQU     13      ;CARRIAGE RET
LF      EQU     10      ;LINE FEED
;
SERIAL  EQU     8
CONSOLE EQU     9
AMODE   EQU     0AH     ;AUDIO MODE
VMODE   EQU     31H     ;VIDEO MODE
ICH     EQU     32H     ;IDLE COUNTER HIGH
CBLOCK  EQU     38H     ;CTX BLOCK COUNT
CTXIDX  EQU     39H     ;CTX INDEX
TIME0   EQU     3CH     ;15 TICKS PER SEC
;
DSUB    EQU     8       ;HIDDEN 8085 DSUB
MVCTX   EQU     04DDH
YIELD	EQU	06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND	EQU	08DDH   ;MASTER: SET SLAVE REGS
IPCRCV	EQU	09DDH   ;MASTER: GET SLAVE REGS
RECSEND EQU     0AEDH   ;RECORD -> SHM
RECXFER	EQU	0BEDH   ;MASTER: MOVE RECORD
SERSEND EQU     0DDDH   ;SERIAL SEND FROM BUFFER
SERRECV EQU     0EDDH   ;SERIAL RECV TO BUFFER
DMA     EQU     0FDDH   ;DMA
;
        .ORG    0F000H
;
; INIT KERNEL
;
INIT:   LXI     H,STACK
        SPHL
        LXI     B,INIT  ;CLEAR STACK TO INIT (B=F0,C=0)
CLRMEM: MOV     M,C     ;(C=0)->[HL]
        INX     H
        MOV     A,H
        CMP     B
        JNZ     CLRMEM
        LXI     H,TBASE
        SHLD    TTOP    ;TIMER TOP=TIMER START
        CALL    RSTRUN  ;RESET RUN COUNT
;
; SET CTX: 1,2,3,4,1,2,3,5,1,2,3,6,1,2,3,7
;
CTX:    MVI     H, 0
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
; MAIN EVENT LOOP
; SCAN MSG BOXES - EXIT IF MSG RECEIVED
;
START:  LDA     BREAK   ;MONITOR BREAK POINT
        ORA     A       ;CHECK BREAK (A!=0)
        RNZ             ;RETURN ON BREAK
;
        LXI     H,LASTT0;CHECK FOR TICK
        IN      TIME0   ;A=T0
        CMP     M       ;T0==LAST T0?
        CNZ     TICK    ;T0 CHANGED
;
WAIT:   LXI     H,RUNC  ;2.25   COUNT RUN
        INR     M       ;2.25   ADD RUN
        JNZ     ADDKB   ;3.25   OVERFLOW?
        INX     H       ;0      RUNC MSB
        INR     M       ;2.25   OVERFLOW [7.75-10]
ADDKB:  LXI     H,BLKC  ;2.25   COUNT KERNEL BLOCKS
        IN      CBLOCK  ;2.25   GET CTX BLOCK COUNT
        SUI     100     ;2.25   99 -> 0 => -1 -> -100
        ADD     M       ;2      ADD NEGATIVE BLOCKS
        MOV     M,A     ;2.25   UPDATE COUNT
        JC      K_WAIT  ;3.25   CARRY IF NO BORROW
        INX     H       ;0      BLKC MSB
        DCR     M       ;2.25   BORROW [14.25-16.5]
;
K_WAIT: DW	YIELD   ;WAIT UNTIL CTX SW
        LDA     SRCCPU
SCAN:   INR     A       ;A+1
        ANI     7       ;A==8?
        STA     SRCCPU  ;SAVE CURRENT CPU
        JZ      START   ;DONE; RESTART
        DW      IPCRCV  ;RX MSG
        ORA     A       ;A==0?
        JNZ     SCAN    ;NEXT CPU
;
; MSG HANDLER
; MAP COMMAND TO CODE LOCATION
; WAIT IF C=0 (NULL) OR C>10
; USE RETURN HANDLERS IF C=1
; ELSE EXECUTE COMMAND
;
K_CMD:  MOV	A,C	;A=CMD
        CPI	0CH     ;LIMIT CMD<12
        JNC     WAIT    ;SKIP HIGH CMD
        CPI     1       ;CHECK RETURN
        JC      WAIT    ;NULL CMD
        JZ      CMD1    ;HANDLE RET
        LXI	H,CMDS
	JMP     CMD3    ;HANDLE COMMAND
CMD1:   LDA     SRCCPU  ;GET CURRENT CPU
CMD2:   CALL    HANDHL  ;HL=HANDLER
        MOV     A,M     ;A=CMD
        MVI     M,0     ;CLEAR COMMAND
        INX     H
        PUSH    H       ;SAVE HL, POP IN RETURN HANDLER
        LXI	H,RETS  ;HANDLE RETURN
CMD3:   PUSH    D       ;SAVE DE
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
HANDHL: ADI     BASEPG  ;A=BASEPG+CPU#
        MOV     H,A     ;H=CPU PAGE
        MOV     A,B     ;A=SEQ
        ADD	A	;A*=2
        ADD	A	;A*=2
        MOV     L,A     ;L=SEQ*4
        RET
;
; SEND RETURNABLE COMMAND
; SET RETURN HANDLER
; (SRC_CPU,SEQ*4)=[CMD|DEST_CPU|E|D]
;
SNDRET: DW	IPCSND	;SEND MSG, EXPECT RETURN
        ORA     A       ;A==0?
        JZ      IPCERR  ;HANDLE ERR
SETRET: CALL    HANDHL  ;HL=HANDLER
        MOV     M,C     ;CMD=C
        LDA     SRCCPU
        INX     H
        MOV     M,A     ;DEST=SRC CPU
        INX     H
        MOV     M,E
        INX     H
        MOV     M,D
        JMP     WAIT

IPCERR: LDA     SRCCPU
        MVI     B,0     ;SEQ ZERO IS ERROR
        DW	IPCSND
        JP      WAIT
;
; CLIENT GETS RECORD
; - FORWARD GET TO DISK
; - SET XFER ON RETURN
;
GET:    MOV     A,E     ;A=00000SQQ
        ORI     4       ;A=000001QQ
        JMP     SNDRET  ;SEND/SET HANDLER CMD
;
; RETURN FROM GET
; - XFER FROM CPU
;
GETR:   POP     H
        MOV     L,M     ;L=DEST CPU
        LDA     SRCCPU
        MOV     H,A     ;H=SRC CPU
        XRA     A       ;START SHM@0
        DW      RECXFER ;XFER RECORD
        MOV     A,L     ;A=DEST CPU
        DW      SIGNAL  ;WAKE DEST CPU
        JMP     WAIT
;
; CLIENT PUTS RECORD
; - XFER TO CPU
; - FORWARD PUT TO DISK
;
PUT:    LDA     SRCCPU
        MOV     H,A     ;SRC CPU
        MOV     A,E     ;A=00000SQQ
        ORI     4       ;A=000001QQ
        MOV     L,A     ;DEST CPU
        XRA     A       ;START SHM@0
        DW      RECXFER ;XFER RECORD
        MOV     A,L     ;A=DEST CPU
        JMP     SNDRET  ;SEND/SET HANDLER CMD
;
; TTY INPUT
; serial -> E
;
TTYI:   LDA     SERC
        ORA     A       ;SERIAL INHIBIT?
        JNZ     TTYI0   ;YES
        IN      SERIAL  ;CHAR IN
        CPI     BEL     ;BELL CHAR?
        CZ      BELON   ;BELL ON
TTYI1:  MOV     E,A     ;E=CHAR
        LDA     SRCCPU
        DW      IPCSND
        JMP     WAIT
TTYI0:  XRA     A       ;SERIAL DISABLED
        JMP     TTYI1
;
; TTY OUT
; E -> serial
;
TTYO:   MOV     A,E
        OUT     SERIAL  ;CHAR OUT
        JMP     RETOUT
;
; CON INPUT
; console -> E
;
CONI:   IN      CONSOLE ;CHAR IN
        MOV     E,A     ;E=CHAR
        CPI     BS
        JZ      CLRCUR
        CPI     BEL     ;BELL CHAR?
        CZ      BELON   ;BELL ON
        MVI     A,10H
CONSND: OUT     CONSOLE ;FLASH CURSOR
        LDA     SRCCPU
        DW      IPCSND
        JMP     WAIT
CLRCUR: XRA     A       ;CLEAR CURSOR
        JP      CONSND
;
; CON OUT
; E -> console
;
CONO:   MOV     A,E
        ORA     A
        JZ      RETOUT  ;SKIP IF NULL
        OUT     CONSOLE ;CHAR OUT
        ORA     A
        JNZ     RETOUT  ;RETURN UNLESS EOL
        MVI     A, CR
        OUT     CONSOLE ;CR OUT
        MVI     A, LF
        OUT     CONSOLE ;LF OUT
        MOV     A,E
        OUT     CONSOLE
RETOUT: LDA     SRCCPU
        DW      IPCSND
        JMP     WAIT
;
; SERIAL SEND
; CTX A buffer->serial buffer, D=index
; D==128 all sent, D<128 is incomplete
; E==number of bytes sent
;
SEND:   LDA     SRCCPU
        MOV     E, D    ;E=128-size
        DCR     D
        DW      SERSEND
        MOV     A, D    ;A=128-remain
        SUB     E       ;A=(128-remain)-(128-size)
        MOV     E, A    ;E=size-remain
        JMP     SERRET  ;SET SERIAL RETURN
;
; SERIAL RECEIVE
; serial buffer->src cpu shared mem
; E=ticks to inhibit after return
; return D=index, no data if D==0
;
RECV:   MVI     A, 15
        STA     SERC
        LDA     SRCCPU
        MVI     D, 0
        DW      SERRECV
        ;CONT TO SET SERIAL RETURN
;
; SET SERIAL RETURN
;
SERRET: LDA     SRCCPU
        PUSH    D
        MVI     E, 2    ;WAIT FOR 2 TICKS
        CALL    TADD    ;ADD RETURN TIMER
        POP     D
        JMP     SETRET  ;SET RETURN HANDLER
;
; SLEEP E=TICKS 15=1s
; RETURN D=IDLE PER KILO
;
SLEEP:  LDA     SRCCPU
        CALL    TADD    ;ADD RETURN TIMER
        JMP     SETRET  ;SET RETURN HANDLER
;
; STATS STORED AT [DE]
; RETURNED AS RECORD, E=INDEX
;
STAT:   MVI     D,BASEPG;NORMALIZE
        XRA     A       ;START SHM@0
        DW      RECSEND ;COPY FROM MEM
        MVI     H,1     ;H=SRC KERNEL
        LDA     SRCCPU
        MOV     L,A     ;L=DEST CPU
        XRA     A       ;START SHM@0
        DW      RECXFER ;XFER RECORD
        LDA     STATI
        MOV     E,A     ;E=STAT INDEX
        MOV     A,L     ;A=DEST CPU
        DW      IPCSND
        JMP     WAIT
;
; TICK - SCAN TIMER HEAP
; [COUNT|CPU|BC]
; TIMED OUT AT COUNT ZERO
;
TICK:   MOV     M,A     ;SAVE T0
        LXI     H,SERC
        XRA     A
        CMP     M
        JZ      TICK0
        DCR     M
TICK0:  LXI     H,TICKC
        DCR     M       ;TICK COUNT-1
        JNZ     TICK1   ;SKIP UNTIL ZERO
;
        LXI     H,STATI
        INR     M       ;INC STAT INDEX
        MOV     A,M     ;A=INDEX
        ANI     07FH    ;CLEAR MSB
        MOV     L,A
        MVI     H,BASEPG
        PUSH    H       ;PUSH STAT ADDR
        IN      ICH
        MOV     M,A     ;STORE IDLE COUNT
        XRA     A
        OUT     ICH     ;CLEAR IDLE COUNT
        LXI     H,BLKC
        MOV     C,M
        INX     H
        MOV     B,M     ;BC=BLOCK COUNT
        LHLD    RUNC    ;HL=RUN COUNT
        CALL    DIVIDE  ;A=BLOCK/RUN COUNT
        POP     H
        LXI     B,80H
        DAD     B       ;STAT ADDR + 80
        MOV     M,A     ;STORE LOAD AVG
        CALL    RSTRUN  ;RESET RUN COUNT
;
TICK1:  LXI     H,TBASE ;START AT BASE
        PUSH    H
TICKR:  POP     H
TICK2:  XCHG            ;DE=CURT
        LXI     H,TTOP
        MOV     A, M    ;A=[TTOP low]
        CMP     E
        JNZ     TICK3   ;CURT!=TTOP
        INX     H
        MOV     A, M    ;A=[TTOP high]
        CMP     D
        RZ              ;CURT==TTOP DONE
TICK3:  XCHG            ;HL=CURT
        DCR     M       ;COUNT-1
        JZ      TFIRE   ;TIMED OUT
        LXI     B, 4
        DAD     B       ;CURT+4
        JMP     TICK2
TFIRE:  PUSH    H       ;SAVE CURT
        LXI     B,TICKR
        PUSH    B       ;PUSH RETURN
        INX     H
        MOV     A, M    ;A=CPU
        INX     H
        MOV     C, M    ;C=LSB
        INX     H
        MOV     B, M    ;B=MSB
        PUSH    B       ;PUSH CALL ADDR
        ORA     A       ;A==0?
        JZ      TICK4
        POP     B       ;REMOVE CALL ADDR
        PUSH    H
        CALL    CMD2    ;DISPATCH RETURN HANDLER (A=CPU)
        POP     H
TICK4:  LXI     B, -4
        DAD     B       ;HL=CURT-1
        XCHG            ;SAVE HL
        LHLD    TTOP
        DAD     B       ;HL=TTOP-3
        SHLD    TTOP
        DCX     H
        XCHG
        MVI     C, 4
        DW      DMA     ;COPY TOP TIMER TO CUR
        RET             ;CALL ADDR OR RETURN TICKR
;
RSTRUN: IN      VMODE   ;A=VIDEO MODE
        ANI     7
        JZ      VGA
        MVI     A,31
        LXI     H,31*640
        JMP     SVGA
VGA:    MVI     A,26
        LXI     H,26*700
SVGA:   STA     TICKC   ;SET TICK COUNT
        SHLD    BLKC    ;SET BLOCK COUNT
        LXI     H,0
        SHLD    RUNC    ;RESET RUN COUNT
        RET
;
; TIMER ADD
; A=CPU, BC=SEQ/CMD, E=COUNT
; IF A=0, BC=CALL ADDR
; (heap_top)=[COUNT|CPU|BC]
;
TADD:   LHLD    TTOP
        MOV     M, E
        INX     H
        MOV     M, A
        INX     H
        MOV     M, C
        INX     H
        MOV     M, B
        INX     H
        SHLD    TTOP
        RET
;
; GENERIC TIMER RETURN
; DISPATCHED FROM MSG HANDLER
;
GENT:   POP     H
        MOV     A,M     ;A=DEST CPU
        INX     H
        MOV     E,M
        INX     H
        MOV     D,M     ;LOAD DE
        DW      IPCSND  ;WAKE DEST CPU
        RET             ;RETURN TO TICK
;
; GENERIC RETURN
;
GENR:   POP     H
        MOV     A,M     ;A=DEST CPU
        DW      SIGNAL  ;WAKE DEST CPU
        JMP     WAIT
;
; UTILITIES
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
        IN      VMODE   ;A=VIDEO MODE
        ANI     7
        MVI     A, 79   ;MIDI NOTE G5
        JNZ     SETNOTE
        ORI     80H
SETNOTE:DW      NOTE1
        DW      GON1
        XRA     A       ;A=0 SO INTERNAL (BC=CALL ADDR)
        MVI     E, 2    ;GATE OFF AFTER 2 TICKS
        LXI     B, BELOFF
        CALL    TADD
        MVI     E, 12   ;AUDIO OFF AFTER 12 TICKS
        LXI     B, AUDOFF
        CALL    TADD
        MVI     E, BEL  ;RETURN BEL
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
; DIVIDE A=BC/HL
; http://techref.massmind.org/techref/method/math/muldiv.htm
;
DIVIDE: mov     a,h
        ora     l
        rz              ;division by zero; abort operation
        mov	a,b	;put 2's complement of BC +1 into DE for
	cma		;purposes of subtraction. (BC will be
	mov	d,a	;incremented to enable subtraction when minuend
	mov	a,c	;and subtrahend are having equal values).
	cma
	mov	e,a	;dividend in negative form now in DE
	inx	b	;BC +1; dividend incremented
        xra	a	;reset counter A and
	jmp	double	;start the division in earnest
;
;*********************** First phase: Doubling the divisor
;
restore:dad	b	;add back
double: inr	a	;increment counter
        push	h	;save divisor
        dad	h	;double it, but go to second phase if
        jc	change	;HL now is larger than dividend in B
	dad	d	;comparison with dividend by subtraction
	jnc	restore	;keep doubling unless HL now is larger than BC
;
;*********************** Second phase: Subtracting from the dividend
;                                      and accumulating quotient bits.
change: mov	b,a	;transfer count to new counter
        xra     a       ;clear the quotient buffer
subtrct:pop	h	;Fetch halved divisor as positive subtrahend
	dad	d	;subtract by using negative dividend as minuend
	jc	shiftc	;the carry bit becomes the quotient bit
	xchg		;equivalent of adding back if subtraction fails
shiftc:	cmc		;invert quotient bit from reverse polarity
	ral             ;shift quotient bits
	dcr	b	;count-down finished?
	jnz	subtrct	;no, continue process
	ret
;
; COMMAND JUMP VECTOR TABLE
;
CMDS:   DW      WAIT    ;NULL
        DW      WAIT    ;RETURN
        DW      GET     ;GET RECORD
        DW      PUT     ;PUT RECORD
        DW      TTYI    ;TTY CHAR IN
        DW      TTYO    ;TTY CHAR OUT
        DW      CONI    ;CON CHAR IN
        DW      CONO    ;CON CHAR OUT
        DW      SEND    ;SERIAL SEND
        DW      RECV    ;SERIAL RECEIVE
        DW      SLEEP   ;SLEEP
        DW      STAT    ;STATS
;
; RETURN JUMP VECTOR TABLE
;
RETS:   DW      WAIT    ;N/A
        DW      WAIT    ;N/A
        DW      GETR    ;GET RETURN
        DW      GENR    ;GENERIC RET
        DW      WAIT
        DW      WAIT
        DW      WAIT
        DW      WAIT
        DW      GENT    ;SERIAL TIMER RET
        DW      GENT    ;SERIAL TIMER RET
        DW      GENT    ;GENERIC TIMER RET
        DW      WAIT
        
        END
