; TITLE: 'BOOT LOADER'
;
; JUN 24, 2023
;
        .PROJECT        boot.com
;
STACK   EQU     0E700H
BREAK   EQU     STACK   ;KERNEL BREAK
BOOTK   EQU     0F000H  ;BOOT KERNEL
BOOTM   EQU     0F800H  ;BOOT MONITOR
BOOTC   EQU     0FA00H  ;BOOT CP/M
BOOTD   EQU     0FF00H  ;BOOT DISK
IOBYTE  EQU     3       ;CP/M IO BYTE
;
SDATA   EQU     8       ;SERIAL DATA
CDATA   EQU     9       ;CONSOLE DATA
RXEN    EQU     11      ;RX ENABLE
CR      EQU     13      ;CARRIAGE RET
LF      EQU     10      ;LINE FEED
;
CPROM   EQU     001EDH
BOOTCPU EQU     002FDH
MVCTX   EQU     004DDH
CMDSND	EQU	005DDH

        .ORG    0

RST0:   MOV     B, A    ;SAVE A in B
        ADI     TABLE
        MOV     L, A    ;L=TABLE+CPU
        MVI     H, 0
        MOV     L, M    ;HL=BOOT VECTOR
        PCHL            ;JUMP TO VECTOR
RST1:   MVI     C, 0
        DW      CMDSND  ;SEND NULL; YIELD
        JMP     RST1    ;WAIT FOREVER
        NOP
RST2:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST3:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST4:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST5:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST6:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
RST7:   NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
;
; SIGNON MESSAGE
;
SIGNON: DB      CR,LF,
        DB      "             _",CR,LF
        DB      "            /o)",CR,LF,
        DB      "   _/\/\/\_//",CR,LF,
        DB      " _/NOVASAUR/",CR,LF,
        DB      "/_-'(_]-(_]",CR,LF,0
;
; BOOT ALL
; - BOOT OTHER CPUS
; - COPY KERNEL/MONITOR
;
BOOT:   MVI     A, 2
BOOT1:  DW      BOOTCPU ;BOOT CPU
        INR     A
        CPI     8
        JNZ     BOOT1
        
        LXI     D, 0F002H;DEST/ROM PAGE
        MVI     C, 15   ;16 PAGES
        DW      CPROM   ;COPY ROM

        XRA     A
        STA     BREAK   ;RESET BREAK POINT
        INR     A
        OUT     RXEN    ;ENABLE RX
        JMP     BOOTK   ;BOOT KERNEL
;
MONITOR:JMP     BOOTM   ;BOOT MONITOR
;
; CP/M 2.2
;
CPM:    LXI     DE, 0E458H;DEST/ROM PAGE
        MVI     C, 27   ;28 PAGES
        DW      CPROM   ;COPY ROM
        MOV     A, B    ;A=CPU#
        ANI     1       ;IO=CPU#-2
        STA	IOBYTE
        JMP     BOOTC   ;BOOT CPM
;
; DISK QUADRANT
;
DISK:   LXI     DE, 0FF01H;DEST/ROM PAGE
        MVI     C, 0    ;1 PAGE
        DW      CPROM   ;COPY ROM
        JMP     BOOTD   ;BOOT DISK
;
; JUMP VECTOR TABLE
;
TABLE:  DB      BOOT
        DB      MONITOR
        DB      CPM     ;CP/M TTY
        DB      CPM     ;CP/M CRT
        DB      DISK
        DB      DISK
        DB      DISK
        DB      DISK
