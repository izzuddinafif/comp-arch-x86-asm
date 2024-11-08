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
PORT_CON EQU 06H
DATA ENDS

CODE SEGMENT
MOV AX,DATA
MOV DS,AX

org 0000h


;add your code here
START:

MOV DX, PORT_CON; moving control port adress to dx
MOV AL, 10000000B; PORT A, PORT B, PORT C as output
OUT DX, AL; transfer byte from al to control port in dx
;4+4+10 clocks

JMP XX;15 clocks 

XX:
MOV AL, 0000H; OFF STATE coz 0h points to nothing
MOV DX, PORTA; move port a to register dx
OUT DX, AL   ; move 0h to register dx
MOV CX, 06F9BH; Delay by moving h value to loop counter register
;4+4+10+4 clocks sisa 999,978
loopy1:loop loopy1;17*cx-12

MOV AL, 0081H; ON STATE coz 81h points to both 1st and 1st and 8th x port
MOV DX, PORTA; move port a to register dx
OUT DX, AL   ; move 81h to register dx, so its ap0 and ap7 that are gonna be lit.
MOV CX, 06F9BH; Delay by moving h value to loop counter register
;4+4+10+4 clocks
loopy2:loop loopy2;17*cx-12

JMP XX; by jmping back, we create an infinite loop. 15 clocks.

CODE ENDS
END

HLT           ; halt!






; [SOURCE]: C:\emu8086\MySource\mycode.asm
