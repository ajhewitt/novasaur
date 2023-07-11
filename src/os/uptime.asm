; TITLE: 'UPTIME'
;
; JUL 10, 2023
;
        .PROJECT        uptime.com

LF      EQU	10
CR      EQU	13

;-------------------------------------------
;CP/M 2 BDOS Equates
;-------------------------------------------
BIOS    EQU     0FA00H
WBOOT   EQU	BIOS+3  ;Warm Boot
CONOUT  EQU     BIOS+12

PRINT   EQU	9
BDOS    EQU	5

CMDSND  EQU     05DDH   ;SEND COMMAND
RECRECV EQU	0CEDH   ;GET RECORD
DAYHR   EQU	13EDH
BCDA    EQU     10EDH
MINS    EQU     12EDH
SECS    EQU     11EDH

KERNP   EQU     0E800H

        .ORG    100H
;
; Display Intro
;
        LXI     D,INTR
        MVI	C,PRINT
        CALL    BDOS
;
; Show uptime
;
TIME:   DW      DAYHR   ;B=DAYS,C=HOURS
        PUSH    B
        PUSH    B
        MOV     A,B     ;A=DAYS
        DW      BCDA    ;BC=BCD A
        PUSH    B
        MOV     A,B     ;A=DAYS 100's
        ANA     A       ;A==0?
        JZ      TIME1
        ADI     '0'     ;COVERT TO ASCII
        MOV     C,A
        CALL    CONOUT
TIME1:  POP     B
        MOV     A,C
        CPI     10H
        JC      TIME2
        CALL    BCD     ;OUT DAYS 10s,1s
        JMP     TIME3
TIME2:  ADI     '0'     ;COVERT TO ASCII
        MOV     C,A
        CALL    CONOUT
TIME3:  LXI     D,DAY
        MVI	C,PRINT
        CALL	BDOS
        LXI     D,CMR
        POP     A
        CPI     1
        JNZ     TIME4
        INX     D
TIME4:  MVI	C,PRINT
        CALL    BDOS
        POP     B       ;C=HOURS
        CALL    BCD
        MVI     C,':'
        CALL    CONOUT
        DW      MINS    ;C=MINUTES
        CALL    BCD
        MVI     C,':'
        CALL    CONOUT
        DW      SECS    ;C=SECONDS
        CALL    BCD
;
; Copy Kernel stats
;
        LXI     D,KERNP
        CALL    STATS
        MOV     A,E
        ANI     78H
        STA     INDEX
        LXI     D,BUFF+80H
        XRA     A               ;START SHM@0
        DW      RECRECV         ;SHM->[DE]

        LXI     D,KERNP+80H
        CALL    STATS
        LXI     D,BUFF
        XRA     A               ;START SHM@0
        DW      RECRECV         ;SHM->[DE]
;
; Show uptime header
;
        LXI     D,HEAD
        MVI	C,PRINT
        CALL	BDOS
;
; Show stat rows
;
        LDA     INDEX
        MOV     L,A
        MVI     H,BUFF>>8
ROW1:   MOV     A,L
        ANI     7FH
        JNZ     ROW2
        MOV     A,L
        XRI     80H
        MOV     L,A
ROW2:   PUSH    H
        MOV     A,L
        XRI     80H
        MOV     L,A
        CALL    AVG
        LXI     H,IDLE
        MOV     M,D
        POP     H

        CALL    AVG
        PUSH    H
        LXI     H,LOAD
        MOV     M,D
        DW      BCDA    ;BC=BCD A
        PUSH    B
        MOV     A,B
        ADI     '0'
        MOV     C,A
        CALL    CONOUT
        MVI     C,'.'
        CALL    CONOUT
        POP     B
        CALL    BCD
        MVI     C,' '
        CALL    CONOUT
        MVI     C,'|'
        CALL    CONOUT

        MVI     B,0
ROW3:   MVI     C,'='
        LDA     LOAD
        CMP     B
        JZ      ROW4
        JNC     ROW5
        LDA     IDLE
        CMP     B
        JC      ROW7
ROW4:   MVI     C,' '
ROW5:   LDA     IDLE
        CMP     B
        JNZ     ROW6
        MVI     C,'.'
ROW6:   PUSH    B
        CALL    CONOUT
        POP     B
        INR     B
        JMP     ROW3

ROW7:   MVI     C,CR
        CALL    CONOUT
        MVI     C,LF
        CALL    CONOUT
        POP     H
        LDA     INDEX
        ADI     8
        ANI     78H
        CMP     L
        JNZ     ROW1

        LXI     D,FOOT
        MVI	C,PRINT
        CALL	BDOS

        RET
;
; Show BCD value of C
;
BCD:    PUSH    B
        MOV     A,C
        RAR             ;ROTATE
        RAR             ; FOUR
        RAR             ; BITS TO
        RAR             ; RIGHT
        CALL    BCD1    ;UPPER CHAR
        POP     B
        MOV     A,C     ;LOWER CHAR
BCD1:   ANI     0FH     ;TAKE 4 BITS
        ADI     '0'
        MOV     C,A
        JMP     CONOUT
;
; Request Kernel stats
;
STATS:  LXI     B,010BH         ;SEQ 1, GET COMMAND
        MOV     A,B             ;SAVE SEQ# IN A
        DW      CMDSND          ;CALL KERNEL
        CMP     B               ;COMPARE SEQ#
        JNZ     STATS           ;RETRY ON ERROR
        RET
;
; Calculate average
;  A=average of 8 values
;  D=average of 8 values *5 (range 0-39)
;
AVG:    MVI	B,0
        LXI	D,0     ;SUM=0
        MVI	A,8
AVG1:   DCR	L
        MOV	C,M
        XCHG            ;HL=SUM,DE=INDEX
        DAD	B       ;SUM+=BC
        XCHG            ;HL=INDEX,DE=SUM
        DCR	A
        JNZ	AVG1
        XCHG            ;HL=SUM,DE=INDEX
        MOV     B,H
        MOV     C,L     ;BC=SUM
        DAD     H
        DAD     H
        PUSH    H       ;HL=SUM*4
        DAD     H
        DAD     H
        DAD     H
        MOV     A,H     ;A=SUM<<5
        POP     H
        DAD     B       ;HL=SUM*5
        XCHG            ;HL=INDEC,DE=SUM*5
        RET
;
; Messages
;
INTR    db      'System Uptime: $'
DAY     db      ' day$'
CMR     db      's, $'

HEAD    db      CR,LF,LF,
        db      '           CPU Load Average (last 4 mins)',CR,LF,
        db      '     0      0.5     1.0     1.5     2.0     2.5',CR,LF,
        db      '     +-------+-------+-------+-------+-------+',CR,LF,'$'

FOOT    db      '     +-------+-------+-------+-------+-------+',CR,LF
        db      '     0%      5%     10%     15%     20%     25%',CR,LF
        db      '           CPU Idle Cycle % (dotted line)',CR,LF,'$'

INDEX   db      0
LOAD    db      0
IDLE    db      0

BUFF	EQU	$+100H & 0FF00H

        END
