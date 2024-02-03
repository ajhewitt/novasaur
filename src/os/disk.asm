; TITLE 'DISK QUADRANT'
;
; FEB 2, 2024
;
; PAGE 0: BOOT CODE THEN DISK CHECK MAP
; PAGES  1-250:  500 RECORDS OF 128 BYTES
; PAGES 251-254: ECC0|1 FOR RECORDS AT 0xTT00|80
; PAGE 255: DISK CODE (RELOADED ON BOOT)
;
	.PROJECT disk.com

STACK   EQU     00FFH
CMDSND	EQU	05DDH
DSKCHK	EQU	13DDH
DSKSEND	EQU	14DDH
DSKRECV	EQU	15DDH

TRACKS  EQU     250

	.ORG    0FF00H

START:  LXI     SP, STACK
        LXI     H, 0    ;START FROM 0000
        MVI     A, 3    ;CHECK STATUS (BOTH)
CHKMAP: MOV     M, A    ;RESET STATUS
        INR     L       ;NEXT RECORD
        JNZ     CHKMAP  ;PAGE FILLED?
WAIT:	MVI     C, 0    ;CMD NOP
SEND:   DW      CMDSND  ;SEND CMD; YIELD
        MOV     A, C    ;CMD OUT OF RANGE?
        CPI     (END-TABLE)>>1
	JNC     WAIT    ;SKIP 
	; CALCULATE RECORD MEMORY LOCATION
	MOV     A, D
	CPI     TRACKS  ;TRACK>=250?
	JNC     WAIT    ;SKIP HIGH TRACKS
	INR     D       ;AVOID ZERO PAGE
	MOV	A, E    ;A=00000SQQ - 4 QUADS OF 2 SECTORS
	ANI     4       ;A=00000S00 - CLEAR QUAD
	RRC             ;A=000000S0
	STA     OFFSETY
	RRC             ;A=0000000S
	RRC             ;A=S0000000
	STA     OFFSETX
	MOV     E, A
	; CALCULATE COMMAND JUMP VECTOR
	MOV	A, C	;A=CMD
	ADD	A	;A*=2
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
GET:	CALL    GETC    ;GET COMMAND
        MOV     H, A    ;H=OR-ED SYNDROME
        JMP     RETURN
;
; GET COMMAND
;
GETC:   CALL    GETR    ;GET RECORD
        RZ              ;RETURN IF GOOD
	;ATTEMPT TO REPAIR ONE BYTE
	MVI     A, 128-255
        DW      DSKCHK	;A=BYTE INDEX
        ORA     A       ;CHECK SIGN
        RM              ;INDEX OUT OF RANGE
        MOV     C, H    ;SAVE SYN0
        LXI     H, OFFSETX
        MOV     E, M    ;RECOVER E
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
GETR:   XRA     A       ;START SHM@0
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
        MOV     D, E    ;RESTORE D
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
PUT:    CALL    PUTR    ;PUT RECORD
        CALL    HLECC   ;HL=[ECC0],DE=ECC
        MOV     M, D	;SAVE ECC0
        INR     H
        MOV     M, E    ;SAVE ECC1
        JMP     RETURN
;
; PUT RECORD
;
PUTR:   XRA     A       ;START SHM@0
        MOV     H, A    ;INIT ECC0
        MOV     L, A    ;INIT ECC1
        DW	DSKRECV	;COPY TO MEM W/ECC
        RET
;
; PUT W/O ERR
;
NOECC:	CALL    PUTR
;
; RETURN
;
RETURN: MVI     C, 1    ;CMD RETURN
	JMP	SEND    ;SEND RETURN
;
; DISK CHECK
;
CHK:    JMP     RETURN
;
OFFSETS:
OFFSETX DB      0
OFFSETY DB      0
;
; COMMAND JUMP VECTOR TABLE
;
TABLE:  DW      START   ;RESET
	DW      WAIT    ;RETURN N/A
	DW      GET     ;CMD 2: GET
	DW      PUT     ;CMD 3: PUT
	DW      NOECC   ;CMD 4: PUT W/O ECC
	DW      CHK     ;CMD 5: CHECK
	
	END
