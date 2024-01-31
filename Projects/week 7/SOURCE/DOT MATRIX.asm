#make_bin#

; BIN is plain binary format similar to .com format, but not limited to 1 segment;
; All values between # are directives, these values are saved into a separate .binf file.
; Before loading .bin file emulator reads .binf file with the same file name.

; All directives are optional, if you don't need them, delete them.

; set loading address, .bin file will be loaded to this address:
#LOAD_SEGMENT=0500h#
#LOAD_OFFSET=0000h#

; set entry point:
#CS=0500h#	; same as loading segment
#IP=0000h#	; same as loading offset

; set segment registers
#DS=0500h#	; same as loading segment
#ES=0500h#	; same as loading segment

; set stack
#SS=0500h#	; same as loading segment
#SP=FFFEh#	; set to top of loading segment

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

 MOV DX,PORT_CON
 MOV AL,10000000B
 OUT DX,AL

 
 XX:
 CALL X2    
 JMP XX             

 DELAY1:
    MOV CX,0FFFFH
    LOOPX:
    LOOP LOOPX
    RET 
    
 DELAY2:   
    MOV CX,009H
    LOOPY:
    LOOP LOOPY
    RET

 X1:
 MOV AL,01111110B;KONTEN
 MOV DX,PORTA
 OUT DX,AL
 MOV AL,01111111B
 MOV DX,PORTB         
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10000001B;KONTEN
 MOV DX,PORTA    
 OUT DX,AL
 MOV AL,10111111B
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10011001B;KONTEN
 MOV DX,PORTA    
 OUT DX,AL
 MOV AL,11011111B
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10100101B;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11101111B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10101101B;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11110111B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10100001B;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111011B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10011110B;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111101B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,10000000B;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111110B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 RET 
 
 X2:
 MOV AL,6CH;KONTEN
 MOV DX,PORTA    
 OUT DX,AL
 MOV AL,10111111B
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,0FEH;KONTEN
 MOV DX,PORTA    
 OUT DX,AL
 MOV AL,11011111B
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,0FEH;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11101111B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,0FEH;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11110111B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,07CH;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111011B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,038H;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111101B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 MOV AL,010H;KONTEN
 MOV DX,PORTA             
 OUT DX,AL
 MOV AL,11111110B         
 MOV DX,PORTB             
 OUT DX,AL  
 ;CALL DELAY2
 RET
 
CODE ENDS
END
HLT           ; halt!


