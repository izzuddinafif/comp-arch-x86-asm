#make_bin#

; BIN is plain binary format similar to .com format, but not limited to 1 segment;
; All values between # are directives, these values are saved into a separate .binf file.
; Before loading .bin file emulator reads .binf file with the same file name.

; All directives are optional, if you don't need them, delete them.

; set loading address, .bin file will be loaded to this address:
#LOAD_SEGMENT=0500h#
#LOAD_OFFSET=0000h#

; set entry point:
#CS=0500h#    ; same as loading segment
#IP=0000h#    ; same as loading offset

; set segment registers
#DS=0500h#    ; same as loading segment
#ES=0500h#    ; same as loading segment

; set stack
#SS=0500h#    ; same as loading segment
#SP=FFFEh#    ; set to top of loading segment

; set general registers (optional)
#AX=0000h#
#BX=0000h#
#CX=0000h#
#DX=0000h#
#SI=0000h#
#DI=0000h#
#BP=0000h#

; add your code here
DATA SEGMENT
PORTA EQU 00H
PORTB EQU 02H
PORTC EQU 04H
PORTCON EQU 06H
DATA ENDS

CODE SEGMENT
MOV AX,DATA
MOV DS,AX

ORG 0000H

START:
MOV DX, PORTCON
MOV AL, 10000000B
OUT DX,AL

XX:
MOV DX, PORTA
MOV AL, 00000001B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00000011B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00000010B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00000110B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00000100B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00001100B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00001000B
OUT DX, AL
CALL DELAY

MOV DX, PORTA
MOV AL, 00001001B
OUT DX, AL
CALL DELAY

JMP XX

DELAY:
MOV CX, 00EFFFH
LOOPX: LOOP LOOPX
RET

CODE ENDS
END


HLT           ; halt!




