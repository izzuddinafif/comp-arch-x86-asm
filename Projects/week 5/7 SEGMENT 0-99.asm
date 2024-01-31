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
PORT_CON EQU 06H
DATA ENDS

CODE SEGMENT
MOV AX,DATA
MOV DS,AX

org 0000h

;add your code here
START:
MOV DX, PORT_CON
MOV AL, 10000000B; PORT A as Output
OUT DX, AL

XA:

MOV AL, 00111111B ; displaying 0
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 00000110B ; displaying 1
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01011011B ; displaying 2
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01001111B ; displaying 3
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01100110B ; displaying 4
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01101101B ; displaying 5
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01111101B ; displaying 6
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 00000111B ; displaying 7
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01111111B ; displaying 8
MOV DX, PORTB
OUT DX,AL
CALL XS

MOV AL, 01101111B ; displaying 9
MOV DX, PORTB
OUT DX,AL
CALL XS

JMP XA

XS PROC


MOV AL,007CH; DISPLAYING B ; displaying 0
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay0:loop Delay0

MOV AL, 00000110B ; displaying 1
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay1:loop Delay1

MOV AL, 01011011B ; displaying 2
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay2:loop Delay2

MOV AL, 01001111B ; displaying 3
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay3:loop Delay3

MOV AL, 01100110B ; displaying 4
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay4:loop Delay4

MOV AL, 01101101B ; displaying 5
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay5:loop Delay5

MOV AL, 01111101B ; displaying 6
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay6:loop Delay6

MOV AL, 00000111B ; displaying 7
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay7:loop Delay7

MOV AL, 01111111B ; displaying 8
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay8:loop Delay8

MOV AL, 01101111B ; displaying 9
MOV DX, PORTA
OUT DX,AL
MOV CX,0DF36H; Delay
Delay9:loop Delay9

RET
XS ENDP

CODE ENDS
END

HLT           ; halt!



; [SOURCE]: D:\Cool Yeah\Internet Engineering Technology\1st Semester\Computer Architecture\Projects\week 5\source code\Alhamdullah jadi.asm
