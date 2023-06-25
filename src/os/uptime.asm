; TITLE: 'UPTIME'
;
; JUN 24, 2023
;
        .PROJECT        uptime.com

LF	EQU	10
CR	EQU	13

;-------------------------------------------
;CP/M 2 BDOS Equates
;-------------------------------------------
BIOS    EQU     0FA00H
WBOOT	EQU	BIOS+3  ;Warm Boot
PRINT	EQU	9
BDOS	EQU	5

        .ORG    100H

        JMP     HELP
;
; Exit and print an error message
;
ERXIT:	POP	D		;GET MESSAGE
	MVI	C,PRINT
	CALL	BDOS		;PRINT MESSAGE
EXIT:	JMP	WBOOT		;Warm boot CP/M
;
; Exit with usage message
;
HELP:	call	ERXIT
        db 'Show system load and uptime information.',CR,LF
        db 'Usage:',CR,LF
        db ' UPTIME [/M]',CR,LF
        db '   use /M to exit to kernel monitor.',CR,LF,'$'
        
        END
