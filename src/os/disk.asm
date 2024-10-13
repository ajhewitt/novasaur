; TITLE 'DISK QUADRANT'
;
; OCT 13, 2024
;
; GET & PUT DISK RECORDS IN RAM. USE
; ECC TO REPAIR SINGLE BYTE/RECORD
; ERRORS. USE CHK COMMAND TO RECALC
; OR CHECK ECC FOR THE ECC RECORDS.
;
; PAGE 0        : BOOT CODE THEN VARS/STACK
; PAGES 1-250   : 500 RECORDS OF 128 BYTES
; PAGES 251-254 : ECC0|1 FOR RECORDS AT 0xTT00|80
; PAGE 255      : DISK CODE (RELOADED ON BOOT)
;
        .PROJECT disk.com

START   EQU     100H
OFFSETX EQU     START-1
OFFSETY EQU     OFFSETX-1
STACK   EQU     OFFSETY

TRACKS  EQU     250
STATUS  EQU     0FDFFH  ;ZERO IF GOOD
CLEAN   EQU     0FEFFH  ;ZERO IF CLEAN

CMDSND  EQU	005DDH
DSKSEND EQU	014DDH
DSKRECV EQU	015DDH
DSKCHK  EQU	016DDH

	.ORG    0FF00H

START:  LXI     SP, STACK
        MVI     C, 0    ;NULL COMMAND
        JMP     SEND
;
; PUT W/O ERR
;
NOECC:	CALL    PUTR
;
; MAIN LOOP - RETURN FROM LAST REQUEST
;
RETURN:	MVI     C, 1    ;CMD RETURN
SEND:   DW      CMDSND  ;SEND CMD; YIELD
        MOV     A, C    ;CMD OUT OF RANGE?
        CPI     END-TABLE
        JNC     RETURN  ;SKIP
        ; CALCULATE RECORD MEMORY LOCATION
        MOV     A, D
        CPI     TRACKS+3;TRACK>=250?
        JNC     RETURN  ;SKIP HIGH TRACKS
        INR     D       ;AVOID ZERO PAGE
        MOV	A, E    ;A=00000SQQ - 4 QUADS OF 2 SECTORS
        ANI     4       ;A=00000S00 - CLEAR QUAD
        RRC             ;A=000000S0
        STA     OFFSETY
        RRC             ;A=0000000S
        RRC             ;A=S0000000
        STA     OFFSETX
        MOV     E, A    ;RECOVER E
        ; CALCULATE COMMAND JUMP VECTOR
        MOV	A, C	;A=CMD
        ADI     TABLE&0FFH
        MOV     L, A    ;L=TABLE+CMD OFFSET
        MVI     H, TABLE>>8
        MOV     L, M    ;HL=CMD VECTOR
        PCHL            ;JUMP TO VECTOR
;
; DISK GETS RECORD
; - COPY FROM MEM [DE] TO BUFFER
; - SEND RETURN
;
GET:    CALL    GETC    ;GET COMMAND
        MOV     H, A    ;H=OR-ED SYNDROME
        JMP     RETURN
;
; GET COMMAND
;
GETC:   CALL    GETR    ;A=S0|S1: ZER0 IF S0==S1==0
        RZ              ;ECC MATCH: RETURN
        CMP     L       ;L=S1: ZERO IF S0==0
        RZ              ;ECC BAD: RETURN
        CMP     H       ;H=S0: ZERO IF S1==0
        RZ              ;ECC BAD: RETURN
        ;ATTEMPT TO REPAIR ONE BYTE
        MVI     A, 128-255
        DW      DSKCHK	;A=BYTE INDEX
        ORA     A       ;CHECK SIGN
        RM              ;INDEX OUT OF RANGE: RETURN
        MOV     C, H    ;SAVE SYN0
        ADD     E       ;A=RECORD BYTE INDEX
        MOV     H, D    ;H=RECORD Y
        MOV     L, A    ;L=RECORD X
        MOV     A, C    ;A=SYN0
        XRA     M       ;A=SYN0^BYTE
        MOV     M, A    ;REPAIR BYTE
        ;FALL INTO A RETRY
;
; GET RECORD
;
GETR:   PUSH    D       ;SAVE DE
        XRA     A       ;START SHM@0
        MOV     H, A    ;INIT ECC0
        MOV     L, A    ;INIT ECC1
        DW	DSKSEND	;COPY FROM MEM W/ECC
        CALL    HLECC   ;HL=[ECC0],DE=SYN
        MOV     A, M	;A=ECC0
        XRA     D	;D=SYN0
        MOV     D, A	;D=SYN0^ECC0
        INR     H
        MOV     A, M	;A=ECC1
        XRA     E	;E=SYN1
        MOV     E, A	;E=SYN1^ECC1
        ORA     D	;A=SYN0|SYN1
        XCHG            ;HL=SYN,E=REC PAGE
        POP     D       ;RESTORE DE
        RET     ;RETURN HL=SYNDROME,Z-FLAG==MATCH
;
; HL=[ECC0]
; DE=ECC
;
HLECC:  LDA     OFFSETY
        ADI     TRACKS+1
        MOV     E, D    ;E=REC PAGE
        MOV     D, A    ;D=TRACK+1+OFFSET
        XCHG            ;HL=[ECC0],DE=ECC
        RET
;
; DISK PUTS RECORD
; - COPY FROM BUFFER TO MEM [DE]
; - SEND RETURN
;
PUT:    CALL    PUTC    ;PUT COMMAND
        MVI     A, 1
        STA     CLEAN   ;DIRTY
        JMP     RETURN
;
; PUT COMMAND
;
PUTC:   CALL    PUTR    ;PUT RECORD
SAVECC: CALL    HLECC   ;HL=[ECC0],DE=ECC
        MOV     M, D	;SAVE ECC0
        INR     H
        MOV     M, E    ;SAVE ECC1
        RET
;
; PUT RECORD
;
PUTR:   XRA     A       ;START SHM@0
        MOV     H, A    ;INIT ECC0
        MOV     L, A    ;INIT ECC1
        DW	DSKRECV	;COPY TO MEM W/ECC
        RET
;
; DISK CHECK
; - CALLED LIKE PUT (DE!=TRK/SEC)
; D = SKIP CHECK? (0==DON'T SKIP)
; E = ACTS AS QUADRANT (IGNORED)
;
; - 4 EEC RECORD PAGES (251-254)
;   . 250 RECORD + 4 ECCS ON ECC
;   . PAGES: [1][127][123][4][1]
; - 8 ECC RECORDS WITH ECC:
;   . 0xFA:[x|0..0][4..4|0123|x]
;   . 0xFB:[x|1..1][5..5|0123|x]
;   . 0xFC:[x|2..2][6..6|4567|S]*
;   . 0xFD:[x|3..3][7..7|4567|C]*
; - *TO PREVENT CIRCULAR REF ON 67:
;   . SKIP LAST 3 BYTES IF E>=0x80
; - STATUS BYTES:
;   . 0xFDFF: STATUS (S)
;     . 0: ECC-BLOCK GOOD OR REBOOTED
;     . ELSE: ECC-BLOCK UNRECOVERBLE
;   . 0xFEFF: CLEAN (C)
;     . 0: ECC-BLOCK ACCURATE
;     . 1: MODIFIED NEEDS RECALC
;
; SKIP STATUS IF D!=0
; SKIP CHECK IF STATUS!=0
; IF CLEAN (CLEAN==0)
; - GET CMD FOR ALL 8 ECC RECORDS
; - INC STATUS AFTER EACH RECORD
; - RETURN STATUS (0==GOOD)
; IF DIRTY (CLEAN!=0)
; - DSK SND FOR ALL 8 ECC RECORDS
; - SAVE NEW ECC VALUE
; - MARK CLEAN (CLEAN=0)
; RETURN: H=STATUS, L=CLEAN
;
CHK:    LXI     H, STATUS
        XRA     A       ;A=0
        CMP     D       ;D==0?
        JNZ     CHK0    ;SKIP STATUS
        CMP     M       ;STATUS==0?
        JNZ     CHK5    ;SKIP CHECK
CHK0:   MOV     M, A    ;CLEAR STATUS
        PUSH    A       ;SAVE COUNT=0
        STA     OFFSETX ;OFFSET X=0
        STA     OFFSETY ;OFFSET Y=0
CHK1:   ADI     TRACKS+1;OFFSET TRACKS
        MOV     D, A    ;ECC PAGE
        LDA     OFFSETX
        MOV     E, A    ;RECOVER E
        LDA     CLEAN
        ORA     A       ;CHECK CLEAN
        JZ      CHK2    ;YES: CHECK RECORDS
        XRA     A       ;START SHM@0
        MOV     H, A    ;INIT ECC0
        MOV     L, A    ;INIT ECC1
        PUSH    D
        DW	DSKSEND	;COPY FROM MEM W/ECC
        POP     D
        CALL    SAVECC  ;SAVE ECC
        JMP     CHK3    ;SKIP ECC CHECK
CHK2:   CALL    GETC    ;VERIFY ECC
        ORA     A       ;A==0?
        JZ      CHK3    ;RECORD GOOD
        LXI     H, STATUS
        INR     M       ;INC STATUS IF BAD
CHK3:   POP     A       ;GET COUNT
        INR     A       ;INCREMENT
        ANI     7       ;A==8?
        JZ      CHK4    ;YES: DONE
        PUSH    A       ;SAVE COUNT
        ANI     3       ;CLEAR HIGH BIT (A=0-3)
        JNZ     CHK1    ;NEXT RECORD
        LXI     H, OFFSETX
        MVI     M, 80H-3;SKIP LAST 3 BYTES
        DCR     L
        MVI     M, 2
        JMP     CHK1    ;NEXT RECORD
CHK4:   STA     CLEAN   ;MARK CLEAN (A==0)
CHK5:   LDA     CLEAN
        MOV     L, A    ;L=CLEAN
        LDA     STATUS
        MOV     H, A    ;H=STATUS
        JMP     RETURN	;DONE
;
; COMMAND JUMP VECTOR TABLE
;
TABLE:  DB      START&0FFH      ;RESET
        DB      RETURN&0FFH     ;RETURN N/A
        DB      GET&0FFH        ;CMD 2: GET
        DB      PUT&0FFH        ;CMD 3: PUT
        DB      NOECC&0FFH      ;CMD 4: PUT W/O ECC
        DB      CHK&0FFH        ;CMD 5: CHECK

        END
