; TITLE 'Boot Loader'
;
; May 20, 2021
;
        .PROJECT        BOOT.COM
;
ORIGIN  EQU     8000H
CPROM   EQU     001EDH

        .ORG    ORIGIN
        ANI     7
        ADI     TABLE   -ORIGIN
        MVI     H,0
        MOV     L,A
        MOV     L,M
        PCHL            ;JUMP VECTOR

KERNEL: LXI     DE,0001H ;DEST/ROM PAGE
        MVI     C,5     ;NUMBER OF PAGES
        DW      CPROM   ;COPY ROM
        JMP     0       ;BOOT
        
CPM:    NOP

DISK:   NOP

TABLE:  DB      KERNEL  -ORIGIN
        DB      KERNEL  -ORIGIN
        DB      CPM     -ORIGIN
        DB      CPM     -ORIGIN
        DB      DISK    -ORIGIN
        DB      DISK    -ORIGIN
        DB      DISK    -ORIGIN
        DB      DISK    -ORIGIN
