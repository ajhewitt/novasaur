; TITLE '8080 system monitor, ver 0.1'
;
; April 20, 2021
;
        .project monitor.com
;
STACK   EQU     2000H
CDATA   EQU     9       ;CONSOLE DATA
PORTN   EQU     STACK   ;3BYTES I/O
IBUFP   EQU     STACK+3 ;BUFFER POINTER
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
;
; CONTINUATION OF COLD START
;
COLD:   LXI     SP,STACK
        LXI     D,SIGNON ;MESSAGE
        CALL    SENDM   ;SEND IT
;
; WARM-START ENTRY
;
WARM:   LXI     H,WARM  ;RETURN HERE
        PUSH    H
;
; TEST
;
TEST:   CALL    INPUTT
;        CALL    OUTT
;        JMP     TEST
;
; MAIN COMMAND PROCESSOR
;
        SUI     'A'     ;CONVERT OFFSET
        JC      ERROR   ; < A
        CPI     'Z'-'A'+1
        JC      UPPER   ; <= Z
        SUI     'a'-'A'
        JC      ERROR   ; < a
        CPI     'z'-'a'+1
        JNC     ERROR   ; > z
UPPER:  ADD     A       ;DOUBLE
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
; PRINT ? ON IMPROPER INPUT
;
ERROR:  MVI     A,'?'
        OUT     CDATA
        RET             ;TRY AGAIN
;
; COMMAND TABLE
;
TABLE:  DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
        DW      STUFF
;
; TEST
;
STUFF:  RAR
        ADI     41H
        OUT     CDATA
        JMP     TEST
;
; CONSOLE INPUT ROUTINE
;
INPUTT: MVI     A,10H
        OUT     CDATA   ;FLAST CURSOR
        IN      CDATA   ;GET BYTE
        CPI     00H
        JZ      INPUTT  ;BLOCK ON IO
        RET
;
; CONSOLE OUTPUT ROUTINE
;
OUTT:   MOV     B,A     ;SAVE BYTE
        MVI     A,00H
        OUT     CDATA   ;BLANK CURSOR
        MOV     A,B     ;RESTORE BYTE
        OUT     CDATA   ;WRITE BYTE
        RET
;
; SEND ASCII MESSAGE UNTIL BINARY ZERO
; IS FOUND. POINTER IS D,E
;
SENDM:  LDAX    D       ;GET BYTE
        ORA     A       ;ZERO?
        RZ              ;YES, DONE
        OUT     CDATA   ;SEND IT
        INX     D       ;POINTER
        JMP     SENDM   ;NEXT
;
; SIGNON MESSAGE
;
SIGNON: DB      CR,LF
        DB      TAB,"     _",CR,LF
        DB      TAB,"    /",0A7H,")",CR,LF
        DB      "   .^/\/\^.//",CR,LF
        DB      " _/NOVASAUR/",TAB
        DB      "8080 SYSMON v0.1",CR,LF
        DB      "<__^|_|-|_|",CR,LF
        DB      LF,0
