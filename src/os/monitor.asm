; TITLE '8080 SYSTEM MONITOR, VER 0.5'
;
; NOV 17, 2021
;
        .PROJECT monitor.com
;
STACK   EQU     0E880H
BREAK   EQU     STACK
;
SDATA   EQU     8       ;SERIAL DATA
CDATA   EQU     9       ;CONSOLE DATA
RXEN    EQU     11      ;RX ENABLE
;
COMS    EQU     STACK+2 ;1BYTE COM SERIAL
COMB    EQU     STACK+3 ;1BYTE COM BLOCK
PORTN   EQU     STACK+4 ;3BYTES I/O
IBUFP   EQU     PORTN+3 ;BUFFER POINTER
IBUFC   EQU     IBUFP+2 ;BUFFER COUNT
IBUFF   EQU     IBUFP+3 ;INPUT BUFFER
;
CTRH    EQU     8       ;^H BACKSPACE
TAB     EQU     9       ;^I
CTRQ    EQU     17      ;^Q
CTRS    EQU     19      ;^S
CTRX    EQU     24      ;^X, ABORT
BACKUP  EQU     CTRH    ;BACKUP CHAR
DEL     EQU     127     ;RUBOUT
ESC     EQU     27      ;ESCAPE
APOS    EQU     (39-'0') & 0FFH
CR      EQU     13      ;CARRIAGE RET
LF      EQU     10      ;LINE FEED
INC     EQU     0DBH    ;IN OP CODE
OUTC    EQU     0D3H    ;OUT OP CODE
RETC    EQU     0C9H    ;RET OP CODE

        .ORG    0F800H

;
; SEND ASCII MESSAGE UNTIL BINARY ZERO
; IS FOUND. POINTER IS D,E
;
COLD:   MVI     A,1
        STA     COMS    ;TURN COMS ON
        OUT     RXEN    ;ENABLE RX
        LXI     D,SIGNON ;MESSAGE
SENDM:  LDAX    D       ;GET BYTE
        ORA     A       ;ZERO?
        JZ      START   ;YES, START
        CALL    OUTT    ;SEND IT
        INX     D       ;POINTER
        JMP     SENDM   ;NEXT
;
; CONTINUATION OF COLD START
;
START:  LXI     SP,STACK
;
; WARM-START ENTRY
;
WARM:   LXI     H,WARM  ;RETURN HERE
        PUSH    H
        CALL    CRLF
        CALL    INPLN   ;CONSOLE LINE
        CALL    GETCH   ;FIRST CHAR
;
; MAIN COMMAND PROCESSOR
;
        SUI     'A'     ;CONVERT OFFSET
        JC      ERROR   ; < A
        CPI     'Z'-'A'+1
        JNC     ERROR   ; > Z
        ADD     A       ;DOUBLE
        LXI     H,TABLE ;START
        MVI     D,0
        MOV     E,A     ;OFFSET
        DAD     D       ;ADD TO TABLE
        MOV     E,M     ;LOW BYTE
        INX     H
        MOV     D,M     ;HIGH BYTE
        XCHG            ;INTO H,L
        PCHL            ;GO THERE
;
; COMMAND TABLE
;
TABLE:  DW      ASCII   ;A, ASCII
        DW      ERROR   ;B
        DW      CALLS   ;C, CALL SUBR
        DW      DUMP    ;D, DUMP
        DW      ERROR   ;E
        DW      FILL    ;F, FILL
        DW      GO      ;G, GO
        DW      HMATH   ;H, HEX MATH
        DW      IPORT   ;I, PORT INPUT
        DW      ERROR   ;J
        DW      KERN    ;K, KERNEL
        DW      LOAD    ;L, LOAD
        DW      MOVE    ;M, MOVE
        DW      ERROR   ;N
        DW      OPORT   ;O, PORT OUTPUT
        DW      PROC    ;P, PROC SPEED TEST
        DW      ERROR    ;Q
        DW      REPL    ;R, REPLACE
        DW      SEARCH  ;S, SEARCH
        DW      TOGGLE  ;T, TOGGLE SERIAL
        DW      ERROR   ;U
        DW      VERM    ;V, VERIFY MEM
        DW      ERROR   ;W
        DW      ERROR   ;X
        DW      ERROR   ;Y
        DW      ZERO    ;Z, ZERO
;
; CONSOLE INPUT ROUTINE
;
INPUTT: MVI     A,10H
        OUT     CDATA   ;FLAST CURSOR
        IN      CDATA   ;GET BYTE
        ORA     A       ;ZERO?
        JZ      INPUT2  ;CHECK SERIAL
        MOV     B,A
        XRA     A       ;CLEAR A
        JMP     INPUT3  ;PROCESS INPUT
INPUT2: LDA     COMS    ;CHECK SERAIL
        ORA     A       ;ZERO?
        JZ      INPUTT  ;BLOCK ON IO
        IN      SDATA   ;GET BYTE
        ORA     A       ;ZERO?
        JZ      INPUTT  ;BLOCK ON IO
        MOV     B,A
        MVI     A,1
INPUT3: STA     COMB    ;SET COMS STATE
        MOV     A,B
        CPI     CTRX    ;ABORT?
        JZ      START   ;YES
        RET
;
; CONSOLE OUTPUT ROUTINE
;
OUTT:   OUT     CDATA   ;WRITE CONSOLE
        ORA     A       ;ZERO?
        RZ
        MOV     B,A
        LDA     COMS    ;CHECK COMS
        ORA     A       ;ZERO?
        RZ
OUT2:   MOV     A,B
        OUT     SDATA   ;WRITE SERIAL
        ORA     A       ;ZERO?
        RNZ
        LDA     COMB    ;LOAD COM BLOCK
        ORA     A
        JNZ     OUT2    ;BLOCK ON IO
        RET
;
; TOGGLE SERIAL
;
TOGGLE: LDA     COMS    ;LOAD COMS
        XRI     1       ;TOGGLE COMS
        STA     COMS    ;SAVE COMS
        OUT     RXEN    ;ENABLE/DISBLE RX
        RET
;
; SIGNON MESSAGE
;
SIGNON: DB      CR,LF,
        DB      "             _",CR,LF
        DB      "            /o)",CR,LF
        DB      "   .^/\/\^.//",CR,LF
        DB      " _/NOVASAUR/    ",
        DB      "8080 SYSMON v0.5",CR,LF
        DB      "<__^|_|-|_|",LF,0
;
; INPUT A LINE FROM CONSOLE AND PUT IT
; INTO THE BUFFER. CARRIAGE RETURN ENDS
; THE LINE. RUBOUT OR ^H CORRECTS LAST
; ENTRY. CONTROL-X RESTARTS LINE.
; OTHER CONTROL CHARACTERS ARE IGNORED.
;
INPLN:  MVI     A,'>'   ;PROMPT
        CALL    OUTT
INPL2:  LXI     H,IBUFF ;BUFFER ADDR
        SHLD    IBUFP   ;SAVE POINTER
        MVI     C,0     ;COUNT
INPLI:  CALL    INPUTT  ;CONSOLE CHAR
        CPI     ' '     ;CONTROL?
        JC      INPLC   ;YES
        CPI     DEL     ;DELETE
        JZ      INPLB   ;YES
        CPI     'Z'+1   ;UPPER CHAR?
        JC      INPL3   ;YES
        ANI     5FH     ;MAKE UPPER
INPL3:  MOV     M,A     ;INTO BUFFER
        MVI     A,32    ;BUFFER SIZE
        CMP     C       ;FULL?
        JZ      INPLI   ;YES, LOOP
        MOV     A,M     ;GET CHAR
        INX     H       ;INCR POINTER
        INR     C       ;AND COUNT
INPLE:  CALL    OUTT    ;SHOW CHAR
        JMP     INPLI   ;NEXT CHAR
;
; PROCESS CONTROL CHARACTER
;
INPLC:  CPI     CTRH    ;^H?
        JZ      INPLB   ;YES
        CPI     CR      ;RETURN?
        JNZ     INPLI   ;NO, IGNORE
;
; END OF INPUT LINE
;
        MOV     A,C     ;COUNT
        STA     IBUFC   ;SAVE
;
; CARRIAGE-RETURN, LINE-FEED ROUTINE
;
CRLF:   MVI     A,CR
        CALL    OUTT    ;SEND CR
        MVI     A,LF
        CALL    OUTT    ;SEND LF
        RET
;
; DELETE PRIOR CHARACTER IF ANY
;
INPLB:  MOV     A,C     ;CHAR COUNT
        ORA     A       ;ZERO?
        JZ      INPLI   ;YES
        DCX     H       ;BACK POINTER
        DCR     C       ;AND COUNT
        MVI     A,0
        CALL    OUTT    ;CLEAR CURSOR
        MVI     A,BACKUP ;CHARACTER
        JMP     INPLE   ;SEND
;
; GET A CHARACTER FROM CONSOLE BUFFER
; SET CARRY IF EMPTY
;
GETCH:  PUSH    H       ;SAVE REGS
        LHLD    IBUFP   ;GET POINTER
        LDA     IBUFC   ;AND COUNT
        SUI     1       ;DECR WITH CARRY
        JC      GETC4   ;NO MORE CHAR
        STA     IBUFC   ;SAVE NEW COUNT
        MOV     A,M     ;GET CHARACTER
        INX     H       ;INCR POINTER
        SHLD    IBUFP   ;AND SAVE
GETC4:  POP     H       ;RESTORE REGS
        RET
;
; DUMP MEMORY IN HEXADECIMAL AND ASCII
;
DUMP:   CALL    RDHLDE  ;RANGE
DUMP2:  CALL    CRHL    ;NEW LINE
DUMP3:  MOV     C,M     ;GET BYTE
        CALL    OUTHX   ;PRINT
        INX     H       ;POINTER
        MOV     A,L
        ANI     0FH     ;LINE END?
        JZ      DUMP4   ;YES, ASCII
        ANI     3       ;SPACE
        CZ      OUTSP   ; 4 BYTES
        JMP     DUMP3   ;NEXT HEX
DUMP4:  CALL    OUTSP
        PUSH    D
        LXI     D,-10H  ;RESET LINE
        DAD     D
        POP     D
DUMP5:  CALL    PASCI   ;ASCII DUMP
        CALL    TSTOP   ;DONE?
        MOV     A,L     ;NO
        ANI     0FH     ;LINE END?
        JNZ     DUMP5   ;NO
        JMP     DUMP2
;
; DISPLAY MEMORY BYTE IN ASCII IF
; POSSIBLE, OTHERWISE GIVE DECIMAL PNT
;
PASCI:  MOV     A,M     ;GET BYTE
        CPI     DEL     ;HIGH BIT ON?
        JNC     PASC2   ;YES
        CPI     ' '     ;CONTROL CHAR?
        JNC     PASC3   ;NO
PASC2:  MVI     A,'.'   ;CHANGE TO DOT
PASC3:  JMP     OUTT    ;SEND
;
; GET H,L AND D,E FROM CONSOLE
; CHECK THAT D,E IS LARGER
;
RDHLDE: CALL    HHLDE
RDHLD2: MOV     A,E
        SUB     L       ;E - L
        MOV     A,D
        SBB     H       ;D - H
        JC      ERROR   ;H,L BIGGER
        RET
;
; INPUT H,L AND D,E. SEE THAT
; 2 ADDRESSES ARE ENTERED
;
HHLDE:  CALL    READHL  ;H,L
        JC      ERROR   ;ONLY 1 ADDR
        XCHG            ;SAVE IN D,E
        CALL    READHL  ;D,E
        XCHG            ;PUT BACK
        RET
;
; INPUT H,L FROM CONSOLE
;
READHL: PUSH    D
        PUSH    B       ;SAVE REGS
        LXI     H,0     ;CLEAR
RDHL2:  CALL    GETCH   ;GET CHAR
        JC      RDHL5   ;LINE END
        CALL    NIB     ;TO BINARY
        JC      RDHL4   ;NOT HEX
        DAD     H       ;TIMES 2
        DAD     H       ;TIMES 4
        DAD     H       ;TIMES 8
        DAD     H       ;TIMES 16
        ORA     L       ;ADD NEW CHAR
        MOV     L,A
        JMP     RDHL2   ;NEXT
;
; CHECK FOR BLANK AT END
;
RDHL4:  CPI     APOS    ;APOSTROPHE
        JZ      RDHL5   ;ASCII INPUT
        CPI     (' '-'0') & 0FFH
        JNZ     ERROR   ;NO
RDHL5:  POP     B
        POP     D       ;RESTORE
        RET
;
; CONVERT ASCII CHARACTERS TO BINARY
;
NIB:    SUI     '0'     ;ASCII BIAS
        RC      ; < 0
        CPI     'F'-'0'+1
        CMC             ;INVERT
        RC              ;ERROR, > F
        CPI     10
        CMC             ;INVERT
        RNC             ;NUMBER 0-9
        SUI     'A'-'9'-1
        CPI     10      ;SKIP : TO
        RET             ;LETTER A-F
;
; PRINT ? ON IMPROPER INPUT
;
ERROR:  MVI     A,'?'
        CALL    OUTT
        JMP     START   ;TRY AGAIN
;
; START NEW LINE, GIVE ADDRESS
;
CRHL:   CALL    CRLF    ;NEW LINE
;
; PRINT H,L IN HEX
;
OUTHL:  MOV     C,H
        CALL    OUTHX   ;H
OUTLL:  MOV     C,L
;
; OUTPUT HEX BYTE FROM C AND A SPACE
;
OUTHEX: CALL    OUTHX
;
; OUTPUT A SPACE
;
OUTSP:  MVI     A,' '
        JMP     OUTT
;
; OUTPUT A HEX BYTE FROM C
; BINARY TO ASCII HEX CONVERSION
;
OUTHX:  MOV     A,C
        RAR             ;ROTATE
        RAR             ; FOUR
        RAR             ; BITS TO
        RAR             ; RIGHT
        CALL    HEX1    ;UPPER CHAR
        MOV     A,C     ;LOWER CHAR
HEX1:   ANI     0FH     ;TAKE 4 BITS
        ADI     90H
        DAA             ;DAA TRICK
        ACI     40H
        DAA
        JMP     OUTT
;
; CHECK FOR END, H,L MINUS D,E
; INCREMENT H,L
;
TSTOP:  INX     H
        MOV     A,E
        SUB     L       ; E - L
        MOV     A,D
        SBB     H       ; D - H
        RNC             ;NOT DONE
        POP     H       ;RAISE STACK
        RET
;
; ROUTINE TO GO ANYWHERE IN MEMORY
; ADDRESS OF WARM IS ON STACK, SO A
; SIMPLE RET WILL RETURN TO THIS MONITOR
;
GO:     POP     H       ;RAISE STACK
CALLS:  CALL    READHL  ;GET ADDRESS
        PCHL            ;GO THERE
;
; LOAD HEX OR ASCII CHAR INTO MEMORY
; FROM CONSOLE. CHECK TO SEE IF
; THE DATA ACTUALLY GOT THERE
; APOSTROPHE PRECEEDS ASCII CHAR
; CARRIAGE RETURN PASSES OVER LOCATION
;
LOAD:   CALL    READHL  ;ADDRESS
LOAD2:  CALL    OUTHL   ;PRINT IT
        CALL    PASCI   ;ASCII
        CALL    OUTSP
        MOV     C,M     ;ORIG BYTE
        CALL    OUTHEX  ;HEX
        PUSH    H       ;SAVE PNTR
        CALL    INPL2   ;INPUT
        CALL    READHL  ; BYTE
        MOV     B,L     ; TO B
        POP     H
        CPI     APOS
        JZ      LOAD6   ;ASCII INPUT
        MOV     A,C     ;HOW MANY?
        ORA     A       ;NONE?
        JZ      LOAD3   ;YES
LOAD4:  CALL    CHEKM   ;INTO MEMORY
LOAD3:  INX     H       ;POINTER
        JMP     LOAD2
;
; LOAD ASCII CHARACTER
;
LOAD6:  CALL    GETCH
        MOV     B,A
        JMP     LOAD4
;
; COPY BYTE FROM B TO MEMORY
; AND SEE THAT IT GOT THERE
;
CHEKM:  MOV     M,B     ;PUT IN MEM
        MOV     A,M     ;GET BACK
        CMP     B       ;SAME?
        RZ              ;YES
ERRP:   POP     PSW     ;RAISE STACK
ERRB:   MVI     A,'B'   ;BAD
ERR2:   CALL    OUTT
        CALL    OUTSP
        JMP     OUTHL   ;POINTER
;
; ZERO A PORTION OF MEMORY
; THE MONITOR AND STACK ARE
; PROTECTED
;
ZERO:   CALL    RDHLDE  ;RANGE
        MVI     B,0
        JMP     FILL2
;
; FILL A PORTION OF MEMORY
;
FILL:   CALL    HLDEBC  ;RANGE, BYTE
        CPI     APOS    ;APOSTROPHE?
        JZ      FILL4   ;YES, ASCII
        MOV     B,C
FILL2:  MOV     A,H     ;FILL BYTE
        CPI     STACK >> 8 ;TOO FAR?
        JNC     ERROR   ;YES
FILL3:  CALL    CHEKM   ;PUT, CHECK
        CALL    TSTOP   ;DONE?
        JMP     FILL3   ;NEXT
;
FILL4:  CALL    GETCH   ;ASCII CHAR
        MOV     B,A
        JMP     FILL3
;
; GET H,L D,E AND B,C
;
HLDEBC: CALL    HLDECK  ;RANGE
        JC      ERROR   ;NO BYTE
        PUSH    H
        CALL    READHL  ;3RD INPUT
        MOV     B,H     ;MOVE TO
        MOV     C,L     ; B,C
        POP     H
        RET
;
; GET 2 ADDRESSES, CHECK THAT
; ADDITIONAL DATA IS INCLUDED
;
HLDECK: CALL    HHLDE   ;2 ADDR
        JC      ERROR   ;THAT'S ALL
        JMP     RDHLD2  ;CHECK
;
; MOVE A BLOCK OF MEMORY H,L-D,E TO B,C
;
MOVE:   CALL    HLDEBC  ;3 ADDR
MOVEDN: CALL    MOVIN   ;MOVE/CHECK
        CALL    TSTOP   ;DONE?
        INX     B       ;NO
        JMP     MOVEDN
;
MOVIN:  MOV     A,M     ;BYTE
        STAX    B       ;NEW LOCATION
        LDAX    B       ;CHECK
        CMP     M       ;IS IT THERE?
        RZ              ;YES
        MOV     H,B     ;ERROR
        MOV     L,C     ;INTO H,L
        JMP     ERRP    ;SHOW BAD
;
; SEARCH FOR 1 OR 2 BYTES OVER THE
; RANGE H,L D,E. BYTES ARE IN B,C
; B HAS CARRIAGE RETURN IF ONLY ONE BYTE
; PUT SPACE BETWEEN BYTES IF TWO
; FORMAT: START STOP BYTE1 BYTE2
;
SEARCH: CALL    HLDEBC  ;RANGE, 1ST BYTE
SEAR2:  MVI     B,CR    ;SET FOR 1 BYTE
        JC      SEAR3   ;ONLY ONE
        PUSH    H
        CALL    READHL  ;2ND BYTE
        MOV     B,L     ;INTO C
        POP     H
SEAR3:  MOV     A,M     ;GET BYTE
        CMP     C       ;MATCH?
        JNZ     SEAR4   ;NO
        INX     H       ;YES
        MOV     A,B     ;ONLY 1?
        CPI     CR
        JZ      SEAR5   ;YES
;
; FOUND FIRST MATCH, CHECK FOR SECOND
;
        MOV     A,M     ;NEXT BYTE
        CMP     B       ;MATCH?
        JNZ     SEAR4   ;NO
;
SEAR5:  DCX     H       ;A MATCH
        PUSH    B
        CALL    CRHL    ;SHOW ADDR
        POP     B
SEAR4:  CALL    TSTOP   ;DONE?
        JMP     SEAR3   ;NO
;
; ASCII SUB-COMMAND PROCESSOR
;
ASCII:  CALL    GETCH   ;NEXT CHAR
        CPI     'D'     ;DISPLAY
        JZ      ADUMP
        CPI     'S'     ;SEARCH
        JZ      ASCS
        CPI     'L'     ;LOAD
        JNZ     ERROR
;
; LOAD ASCII CHARACTERS INTO MEMORY
; QUIT ON CONTROL-X
;
        CALL    READHL  ;ADDRESS
        CALL    OUTHL   ;PRINT IT
ALOD2:  CALL    INPUTT  ;NEXT CHAR
        CALL    OUTT    ;PRINT IT
        MOV     B,A     ;SAVE
        CALL    CHEKM   ;INTO MEMORY
        INX     H       ;POINTER
        MOV     A,L
        ANI     7FH     ;LINE END?
        JNZ     ALOD2   ;NO
        CALL    CRHL    ;NEW LINE
        JMP     ALOD2
;
; DISPLAY MEMORY IN STRAIGHT ASCII.
; KEEP CARRIAGE RETURN, LINE FEED, CHANGE
; TAB TO SPACE, REMOVE OTHER CONTROL CHAR.
;
ADUMP:  CALL    RDHLDE  ;RANGE
ADMP2:  MOV     A,M     ;GET BYTE
        CPI     DEL     ;HIGH BIT ON?
        JNC     ADMP4   ;YES
        CPI     ' '     ;CONTROL?
        JNC     ADMP3   ;NO
        CPI     CR      ;CARR RET?
        JZ      ADMP3   ;YES, OK
        CPI     LF      ;LINE FEED?
        JZ      ADMP3   ;YES, OK
        CPI     TAB
        JNZ     ADMP4   ;SKIP OTHER
        MVI     A,' '   ;SPACE FOR TAB
ADMP3:  CALL    OUTT    ;SEND
ADMP4:  CALL    TSTOP   ;DONE?
        JMP     ADMP2   ;END
;
; SEARCH FOR 1 OR 2 ASCII CHARACTERS
; NO SPACE BETWEEN ASCII CHARS
; FORMAT: START STOP 1 OR 2 ASCII CHAR
;
ASCS:   CALL    RDHLDE  ;RANGE
        CALL    GETCH   ;FIRST CHAR
        MOV     C,A
        CALL    GETCH   ;2ND OR CARR RET
        JC      SEAR2   ;ONLY ONE CHAR
        MOV     B,A     ;2ND
        JMP     SEAR3
;
; INPUT FOR ANY PORT (8080 VERSION)
;
IPORT:  CALL    READHL  ;PORT
        MOV     C,L     ;PORT TO C
        MVI     A,INC   ;IN CODE
        CALL    PUTIO   ;SETUP INPUT
        MOV     L,A
        CALL    OUTLL   ;HEX VALUE
;
; PRINT L REGISTER IN BINARY (8080 VER)
;
BITS:   MVI     C,8     ;8 BITS
BIT2:   MOV     A,L
        ADD     A       ;SHIFT LEFT
        MOV     L,A
        MVI     A,'0'/2 ;HALF OF 0
        ADC     A       ;DOUBLE AND CARRY
        CALL    OUTT    ;PRINT BIT
        DCR     C
        JNZ     BIT2    ;8 TIMES
        RET
;
; OUTPUT BYTE FROM PORT (8080 VERSION)
; FORMAT IS: O,PORT,BYTE
;
OPORT:  CALL    READHL  ;PORT
        MOV     C,L
        CALL    READHL  ;DATA
        MVI     A,OUTC  ;OUT OPCODE
;
; EMULATE Z80 INP AND OUTP FOR 8080
;
PUTIO:  STA     PORTN   ;IN OR OUT CODE
        MOV     A,C     ;PORT NUMBER
        STA     PORTN+1
        MVI     A,RETC  ;RET OPCODE
        STA     PORTN+2
        MOV     A,L     ;OUTPUT BYTE
        JMP     PORTN   ;EXECUTE
;
; HEXADECIMAL MATH, SUM AND DIFFERENCE
;
HMATH:  CALL    HHLDE   ;TWO NUMBERS
        PUSH    H       ;SAVE H,L
        DAD     D       ;SUM
        CALL    OUTHL   ;PRINT IT
        POP     H
        MOV     A,L
        SUB     E       ;LOW BYTES
        MOV     L,A
        MOV     A,H
        SBB     D
        MOV     H,A     ;HIGH BYTES
        JMP     OUTHL   ;DIFFERENCE
;
; REPLACE HEX BYTE WITH ANOTHER
; OVER GIVEN RANGE
; FORMAT IS: START, STOP, ORIG, NEW
;
REPL:   CALL    HLDEBC  ;RANGE, 1ST BYTE
        JC      ERROR   ;NO, 2ND
        MOV     B,C     ;1ST TO B
        PUSH    H
        CALL    READHL  ;2ND BYTE
        MOV     C,L     ;INTO C
        POP     H
REPL2:  MOV     A,M     ;FETCH BYTE
        CMP     B       ;A MATCH?
        JNZ     REPL3   ;NO
        MOV     M,C     ;SUBSTITUTE
        MOV     A,C
        CMP     M       ;SAME?
        JNZ     ERRB    ;NO, BAD
REPL3:  CALL    TSTOP   ;DONE?
        JMP     REPL2
;
; GIVE RANGE OF 1ST BLOCK
; AND START OF SECOND
;
VERM:   CALL    HLDEBC  ;3 ADDRESSES
VERM2:  LDAX    B       ;FETCH BYTE
        CMP     M       ;SAME AS OTHER?
        JZ      VERM3   ;YES
        PUSH    H       ;DIFFERENT
        PUSH    B
        CALL    CRHL    ;PRINT 1ST POINTER
        MOV     C,M     ;FIRST BYTE
        CALL    OUTHEX  ;PRINT IT
        MVI     A,':'
        CALL    OUTT
        POP     H       ;B,C TO H,L
        CALL    OUTHL   ;SECOND POINTER
        MOV     C,M     ;2ND BYTE
        CALL    OUTHX   ;PRINT IT
        MOV     C,L     ;RESTORE C
        MOV     B,H     ;AND B
        POP     H       ;AND H,L
VERM3:  CALL    TSTOP   ;DONE?
        INX     B       ;2ND POINTER
        JMP     VERM2
;
; SPEED TEST
;
PROC:   IN      3CH
        MOV     B,A     ;SAVE TIME
PROC1:  IN      3CH
        CMP     B       ;TIME CHANGED?
        JZ      PROC1   ;WAIT FOR TICK
        MOV     B,A     ;SAVE TIME
        MVI     C,99H   ;C=-1 BCD
PROC2:  MOV     A,C
        INR     A
        DAA             ;BCD INC
        MVI     D,12    ;LOOP 12*5 @ 2.4 CPI
PROC3:  MOV     E,M     ;1+1 (2) PACK
        INR     E       ;1+2-1 (2.3) PACK
        MOV     C,A     ;1+1 (2) SAVE A IN C
        DCR     D       ;1+2-1 (2.3) COUNT-1
        JNZ     PROC3   ;1+2 (3.3)
        IN      3CH
        CMP     B       ;TIME CHANGED?
        JZ      PROC2   ;WAIT FOR TICK
        CALL    OUTHX
        RET
;
; THESE MUST MATCH KERNEL!
;
SRCCPU  EQU     STACK+1
K_WAIT  EQU     0F005H
K_CMD   EQU     0F017H
;
; EXTENDED INSTRUCTIONS
;
YIELD	EQU	06EDH   ;MASTER: YIELD UNTIL CTX SW
SIGNAL  EQU     07DDH   ;MASTER: SIGNAL SLAVE
IPCSND	EQU	08DDH   ;MASTER: SET SLAVE REGS
IPCRCV	EQU	09DDH   ;MASTER: GET SLAVE REGS
RECSEND	EQU	0AEDH   ;SLAVE: SET RECORD
RECXFER	EQU	0BEDH   ;MASTER: MOVE RECORD
RECRECV	EQU	0CEDH   ;SLAVE: GET RECORD
;
; KERNEL SUB-COMMAND PROCESSOR
;
KERN:   MVI     A,1
        STA     BREAK   ;SET BREAK POINT
        STA     SRCCPU  ;SET SOURCE AS KERNEL
        CALL    GETCH   ;NEXT CHAR
        CPI     'G'     ;READ DISK
        JZ      KGET
        CPI     'P'     ;WRITE DISK
        JZ      KPUT
        ;MOAR COMMANDS
        JP      ERROR
;
; GET DISK RECORD
; COPY TRACK/SEC TO MEM ADDR
;
KGET:   CALL    HHLDE   ;GET HL, COPY TO DE
        PUSH    D       ;SAVE MEM ADDR
        XCHG            ;DE=TRACK/SEC
        LXI     B,0102H ;SEQ 1, GET COMMAND
        CALL    K_CMD   ;HANDLE COMMAND
        CALL    K_WAIT  ;HANDLE RETURN
        POP     D       ;RECOVER MEM ADDR
        DW      RECRECV ;SHM->DE
        RET
;
; PUT DISK RECORD
; COPY MEM ADDR TO TRACK/SEC
;
KPUT:   CALL    HHLDE   ;GET HL, COPY TO DE
        PUSH    H       ;SAVE TRACK/SEC
        DW      RECSEND ;DE->SHM
        LXI     B,0203H ;SEQ 2, PUT COMMAND
        POP     D       ;RECOVER TRACK/SEC
        CALL    K_CMD   ;HANDLE COMMAND
        RET

        END
