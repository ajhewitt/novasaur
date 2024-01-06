; TITLE: 'LINES DEMO'
;
; JAN 6, 2024
;
MOVMA   EQU     077DDH          ; MOV vidM,A

        org     100H

        LXI     H, 020FH        ; 2 PAGES, VMODE 15
        CALL    003CH           ; RELOC
        MVI     A, 0FFH         ; VSTART=0
        OUT     30H             ; SET VIDEO START
        LXI     D, TABLE

L0:     XCHG
        MVI     B, 0
        MOV     A, M
        RLC
        MOV     C, A
        JNC     L1
        MVI     B, 0FFH
L1:     XCHG
        LHLD    COL
        DAD     B
        MOV     A, H
        CPI     0FFH            ; COL<0?
        JNZ     L2              ; NO: CONTINUE
        LXI     H, 0
        JMP     L3
L2:     CPI     0A9H            ; COL>160?
        JC      L4              ; NO: CONTINUE
        LXI     H, 0A8FFH
L3:     INR     E
        LDA     LIN
        INR     A
        STA     LIN
        IN      3AH
        RRC
        JC      L4
        INR     E
L4:     SHLD    COL

        INR     E

        XCHG
        MVI     B, 0
        MOV     A, M
        RLC
        MOV     C, A
        JNC     L5
        MVI     B, 0FFH
L5:     XCHG
        LHLD    ROW
        DAD     B
        MOV     A, H
        CPI     0FFH            ; ROW<0?
        JNZ     L6              ; NO: CONTINUE
        LXI     H, 0
        JMP     L7
L6:     CPI     078H            ; ROW>120?
        JC      L8              ; NO: CONTINUE
        LXI     H, 077FFH
L7:     INR     E
        LDA     LIN
        INR     A
        STA     LIN
        IN      3AH
        RRC
        JC      L8
        INR     E
L8:     SHLD    ROW

        DCR     E

        LDA     ROW+1
        MOV     H, A
        LDA     COL+1
        ADI     12
        MOV     L, A
        LDA     LIN
        DW      MOVMA
        JMP     L0

LIN     DB      0
ROW     DW      5000H
COL     DW      3D00H

        org     200H

TABLE:  DB      131, 227, 134, 195, 136, 126, 127, 115
        DB      76, 102, 187, 128, 54, 15, 96, 111
        DB      179, 71, 198, 141, 124, 81, 224, 9
        DB      133, 120, 140, 243, 155, 125, 170, 12
        DB      138, 15, 190, 94, 147, 163, 60, 21
        DB      57, 123, 100, 3, 128, 151, 43, 129
        DB      85, 174, 184, 90, 83, 129, 60, 92
        DB      172, 163, 207, 123, 201, 118, 127, 78
        DB      94, 28, 129, 141, 177, 126, 12, 227
        DB      195, 128, 106, 165, 157, 92, 143, 68
        DB      174, 130, 98, 151, 100, 146, 51, 249
        DB      98, 57, 215, 124, 243, 157, 231, 51
        DB      46, 21, 104, 140, 215, 234, 63, 126
        DB      63, 132, 46, 126, 137, 128, 119, 149
        DB      102, 135, 143, 127, 109, 73, 132, 137
        DB      172, 104, 112, 190, 201, 131, 131, 31
        DB      128, 134, 122, 147, 212, 18, 224, 252
        DB      128, 78, 192, 127, 136, 135, 212, 192
        DB      207, 187, 24, 128, 159, 54, 68, 73
        DB      218, 112, 65, 237, 37, 128, 218, 120
        DB      144, 240, 9, 161, 129, 124, 128, 128
        DB      40, 88, 177, 0, 127, 119, 149, 48
        DB      249, 138, 43, 179, 121, 117, 6, 131
        DB      114, 121, 246, 231, 40, 167, 161, 127
        DB      118, 184, 108, 234, 83, 18, 153, 34
        DB      165, 106, 130, 108, 133, 144, 65, 31
        DB      128, 128, 246, 0, 159, 127, 127, 153
        DB      124, 146, 117, 109, 221, 127, 122, 237
        DB      167, 6, 37, 96, 170, 71, 198, 111
        DB      252, 127, 204, 221, 48, 209, 88, 209
        DB      90, 204, 34, 76, 81, 28, 125, 3
        DB      240, 182, 115, 114, 182, 85, 155, 24

        END
