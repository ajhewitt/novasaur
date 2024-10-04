; TITLE: 'FORMAT'
;
; SEP 15, 2024
;
        .PROJECT        format.com

LF      EQU	10
CR      EQU	13
EOF     EQU     1AH

;-------------------------------------------
;CP/M 2 BDOS Equates
;-------------------------------------------
BIOS    EQU     0FA00H
WBOOT   EQU	BIOS+3  ;Warm Boot
CONIN   EQU     BIOS+9
CONOUT  EQU     BIOS+12

PRINT   EQU	9
BDOS    EQU	5

CMDSND  EQU     05DDH   ;SEND COMMAND
RECSEND EQU     0AEDH   ;SEND RECORD
RECRECV EQU     0CEDH   ;GET RECORD

FCB     EQU     5CH     ;DEFAULT FCB
PARAM   EQU     FCB     ;DRIVE NUMBER IN FCB
CMDLN   EQU     80H
TRACKS  EQU     254     ;250 TRACKS+4 ECC

        .ORG    100H
;
; Get ready and begin the transfer
;
; This routine checks for the presence of a filename. If no
; filename is supplied, a help message is printed and we
; exit.
;
START:  LDA     PARAM           ;A=1st character of parameter 1
        CPI     0               ;check drive number present
        JZ      HELP            ;default drive?
        lxi     h,CMDLN         ;CP/M put cmd line here
        mov     b,m             ;1st byte is byte count
        inx     h               ;point to the string
        call    SSKIP           ;skip initial spaces
        jz      CONF            ;no parameters?
;
; Skip past the file name, which CP/M already
; put in the FCB for us
; b = bytes remaining to see in COMBUF
; hl points to next chr in COMBUF
;
SKPFIL: call    CMDCHR
        jz      CONF            ;no parameters
        cpi     ' '             ;hunt for a space
        jnz     SKPFIL
;
; Parse all command line options and set variables
; accordingly. Each option must be preceeded by a
; '/' Options may be preceeded by any reasonable
; number of spaces.
;
OPTLUP: call    SSKIP           ;skip spaces
        jz      CONF            ;end of input line?
        cpi     '/'             ;all start with /
        jnz     HELP            ;error:no slash
        call    CMDCHR          ;Get an option chr
        jz      HELP            ;Error: nothing after /
        sta     PARERR          ;put it in error msg
;
; Got a command line option in a. Loop through
; table of options, looking for a match. Update
; the appropriate option variable with the table
; value. Error exit if not in table.
; TRASH a,c,de
;
        push    h               ;Save COMBUF pointer
        lxi     h,OPTTAB
CHKLUP: cmp     m               ;Match? (alpha order)
        inx     h               ;get var value
        mov     c,m
        inx     h               ;get var address
        mov     e,m
        inx     h
        mov     d,m
        inx     h
        jz      OPMTCH          ;matched an option
        jnc     CHKLUP          ;No match: keep looking
;
; Illegal option. Print message and return to CP/M
;
        call    EXIT            ;Exit with this message
        db      'Error Invalid Param /'
PARERR: db      '&'             ;parameter goes here
        db      '$'

OPMTCH: mov     a,c             ;value from table
        stax    d               ;save value
        pop     h
        jmp     OPTLUP          ;look for more
; Done parsing command line.

CONF:   LDA     COMMIT
        DCR     A               ;0=YES
        JZ      FORMAT
        LXI     D,RUSURE
        MVI     C,PRINT
        CALL    BDOS            ;PRINT MESSAGE
        CALL    CONIN
        CPI     'y'
        JZ      FORMAT
        CPI     'Y'
        JNZ     ABORT

FORMAT: LDA     PARAM
        CPI     5
        JC      CHKA            ;DRIVE < E:
        ADI     'A'-1
        STA     DRVERR
        CALL    EXIT
DRVERR: DB      '?'
        DB      ': Drive Not Supported.$'
CHKA:   DCR     A
        JZ      FMTA            ;A: DRIVE
        DCR     A
        JNZ     CHKC            ;C|D: DRIVE
        CALL    EXIT
        DB      'B: Drive is Write Only.$'
CHKC:   ADI     'C'-1
        STA     DRVTBD
        CALL    EXIT
DRVTBD: DB      '?'
        DB      ': Drive Not Available.$'

FMTA:   LDA     BLEACH
        DCR     A
        JNZ     FMTA0

        LXI     D,BLCHST
        MVI	C,PRINT
        CALL    BDOS            ;PRINT MESSAGE

        LXI     H,80H
BLCH1:  MOV     M,H     ;H=0,H->[HL]
        INR     L
        JNZ     BLCH1

        LXI     D,80H   ;DE=80H
        XRA     A       ;START SHM@0
        DW      RECSEND ;COPY RECORD (0100->SHM)
        LXI     D,0     ;DE=0,0
BLCH2:  PUSH    D
        LXI     B, 0303H;SEQ 3, PUT COMMAND
        MOV     A, B    ;SAVE SEQ# IN A
        DW      CMDSND  ;CALL KERNEL
        CMP     B       ;COMPARE SEQ#
        POP     D
        JNZ     BLCH2   ;RETRY ON ERROR
        INR     E       ;SEC++
        MVI     A,8
        CMP     E
        JNZ     BLCH2
        MVI     E,0
        MVI     A,7
        ANA     D
        JNZ     BLCH3
        PUSH    D
        MVI     C,'.'
        CALL    CONOUT
        POP     D
BLCH3:  INR     D
        MVI     A,TRACKS
        CMP     D
        JNZ     BLCH2

        LXI     D,NEWLINE
        MVI     C,PRINT
        CALL    BDOS    ;PRINT MESSAGE

FMTA0:  LXI     H,100H  ;CREATE RECORD
FMTA1:  DCX     H       ;HL--
        MVI     A,1FH
        ANA     L       ;L MOD 32?
        JZ      FMTA2
        MVI     M,0     ;CLEAR  BYTE
        JMP     FMTA1   ;LOOP
FMTA2:  MVI     M,0E5H  ;SET ERA EVERY RECORD
        MVI     A,7FH
        ANA     L       ;L START OF RECORD?
        JNZ     FMTA1   ;LOOP IF NO

        XCHG            ;DE=80H
        XRA     A       ;START SHM@0
        DW      RECSEND ;COPY RECORD (0100->SHM)
        LXI     D,0     ;DE=0,0
FMTA3:  PUSH    D
        LXI     B, 0303H;SEQ 3, PUT COMMAND
        MOV     A, B    ;SAVE SEQ# IN A
        DW      CMDSND  ;CALL KERNEL
        CMP     B       ;COMPARE SEQ#
        POP     D
        JNZ     FMTA3   ;RETRY ON ERROR
        INR     E       ;SEC++
        MVI     A,8
        CMP     E
        JNZ     FMTA3
        MVI     E,0
        INR     D
        MVI     A,2
        CMP     D
        JNZ     FMTA3

        LXI     D,4     ;START DISK QUAD 0
CHKDSK: PUSH    D
        LXI     B, 0505H;SEQ 5, CHK COMMAND
        MOV     A, B    ;SAVE SEQ# IN A
        DW      CMDSND  ;CALL KERNEL
        CMP     B       ;COMPARE SEQ#
        POP     D
        JNZ     CHKDSK  ;RETRY ON ERROR
        INR     E       ;DSK++
        MVI     A,8
        CMP     E
        JNZ     CHKDSK

        CALL    EXIT
        DB      'A: Drive Format Complete.$'
;
; Skip spaces in command line buffer
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer (and a is not valid)
;*
SSKIP:  call    CMDCHR
        rz                      ;Z set for nothing left
        cpi     ' '             ;white space?
        jz      SSKIP
        ret
;
; Get next chr from command line buffer
; On Entry:
;    b has remaining COMBUF byte count
;    hl points to the next chr in COMBUF
; On Exit:
;    a = chr from COMBUF, parity stripped
;    b has been decremented
;    hl has been advanced
;    Z=1 means end of buffer, and a=0
;    Carry = 0
;
CMDCHR: mov     a,b             ;End of buffer already?
        ora     a               ;also clears carry
        rz                      ;and clears a
        mov     a,m             ;get buffer chr
        inx     h               ;bump buffer pointers
        dcr     b
        ani     7FH             ;Strip parity, clear Z
        ret
;
; Command Line Options Table
; Table entries must be in alphabetical order, and
; terminated with 0FFh
;
; Each entry is 4 bytes long:
;  byte1 = uppercase legal option letter
;  byte2 = value for variable
;  bytes3-4 = variable address
;
OPTTAB:
;Clean disk
        db      'B',1
        dw      BLEACH
;Confirm format
        db      'Y',1
        dw      COMMIT
;end of table marker
        db      0FFh
;
; Variables and Storage Defines
;
COMMIT  DB      0
BLEACH  DB      0
;
; Exit and print message
;
EXIT:   POP     D               ;GET MESSAGE
        MVI     C,PRINT
        CALL    BDOS            ;PRINT MESSAGE
        LXI     D,NEWLINE
        MVI     C,PRINT
        CALL    BDOS            ;PRINT NEWLINE
        JMP     WBOOT           ;Warm boot CP/M
;
; Exit with usage message
;
HELP:   call    EXIT
        db 'FORMAT drive: [/Y] [/B]',CR,LF
        db '  /Y    Confirm without further prompt.',CR,LF
        db '  /B    Bleach the file system (set all bytes to zero).$'
;
; Exit on abort
;
ABORT:  call    EXIT
        db      'Format Aborted.$'

RUSURE: db      'Are You Sure (y/N)?',CR,LF,'$'
BLCHST: db      'Bleaching$'
NEWLINE:db      CR,LF,'$'

        END
