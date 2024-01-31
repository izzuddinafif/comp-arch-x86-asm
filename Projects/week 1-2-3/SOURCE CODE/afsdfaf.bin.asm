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

MOV DX, PORT_CON; moves control port address to dx register
MOV AL, 10001001B; sets control word
OUT DX, AL; copies bytes of control word in AL to control port addressed by dx

JMP X1; unconditional jump to x1

X1:; Checking input from certain port address.
IN AL, PORTC; copies port size value/addresses of certain port to AL
AND AL, 01H; performs bitewise AND on immediate value with AL's value,
; stores bool val. result in A, checking if such address does exist in
; certain port and whether there is any input from the address.
CMP AL, 01H; compares immediate bool value with AL's bool value (temp=source1-signextend(source2)).
; sets ZF status flag to ZF=0 or ZF=1 (bool val.) based on condition tested for,
; either Zero or Not Zero. if there's input from certain address (temp==0), then ZF=1 vice versa.
JNZ XON; conditional jump to XON if ZF==1
JZ XOFF; conditional jump to XOFF if ZF==0

XON:; SWITCH ON STATE
CALL delay_20ms ;debounce
MOV AL, 0000H; 0H addresses nothing in port A, so when switch is on,
MOV DX, PORTA; output is off.
OUT DX, AL
JMP X1; loop to keep the LED on.

XOFF:; SWITCH OFF STATE
CALL delay_20ms ;debounce
MOV AL, 0001H; When switch is off, output at 01H is on.
MOV DX, PORTA
OUT DX, AL
JMP X1; loop to keep the LED off

;Delay of 20ms
delay_20ms PROC near
MOV     CX, 2220H
x9: LOOP    x9
RET
delay_20ms  ENDP

CODE ENDS
END

HLT           ; halt!






; [SOURCE]: C:\Users\Lenovo\Documents\Percobaan2.asm




; [SOURCE]: C:\emu8086\MySource\test1.bin.asm




; [SOURCE]: D:\Cool Yeah\Internet Engineering Technology\1st Semester\Computer Architecture\Projects\week 4\Fix banget.asm
