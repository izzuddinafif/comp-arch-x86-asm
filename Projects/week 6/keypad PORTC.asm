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

 MOV DX, PORT_CON
 MOV AL, 10001000B; PORT A as Output Port C Upper as Input Port C Lower as Output
 OUT DX, AL   
 CALL F0
    
 JMP XX 

XX:  
   ; Keluarkan output scanning untuk baris A keypad
   MOV AL, 11111110B
   MOV DX, PORTC
   OUT DX,AL      
   
   ; Check tombol yang ditekan (untuk setiap kolom (1-4))
   IN AL, PORTC 
   MOV BL, AL
   AND BL, 11110000B
   CMP BL, 11100000B
   JE F7 
   CMP BL, 11010000B
   JE F8
   CMP BL, 10110000B
   JE F9
   CMP BL, 01110000B
   JE FA   
   CALL DELAY  
   
   ; Keluarkan output scanning untuk baris B keypad
   MOV AL, 11111101B
   MOV DX, PORTC
   OUT DX,AL   
   
   ; Check tombol yang ditekan (untuk setiap kolom (1-4))
   IN AL, PORTC 
   MOV BL, AL
   AND BL, 11110000B
   CMP BL, 11100000B
   JE F4
   CMP BL, 11010000B
   JE F5
   CMP BL, 10110000B
   JE F6
   CMP BL, 01110000B
   JE FB   
   CALL DELAY
    
   ; Keluarkan output scanning untuk baris C keypad
   MOV AL, 11111011B
   MOV DX, PORTC
   OUT DX,AL   
   
   ; Check tombol yang ditekan (untuk setiap kolom (1-4))
   IN AL, PORTC 
   MOV BL, AL
   AND BL, 11110000B
   CMP BL, 11100000B
   JE F1 
   CMP BL, 11010000B
   JE F2
   CMP BL, 10110000B
   JE F3
   CMP BL, 01110000B
   JE FC   
   CALL DELAY
   
   ; Keluarkan output scanning untuk baris D keypad   
   MOV AL, 11110111B
   MOV DX, PORTC
   OUT DX,AL    
   
   ; Check tombol yang ditekan (untuk setiap kolom (1-4))
   IN AL, PORTC 
   MOV BL, AL
   AND BL, 11110000B
   CMP BL, 11100000B
   JE FF
   CMP BL, 11010000B
   JE F0
   CMP BL, 10110000B
   JE FE
   CMP BL, 01110000B
   JE FD      
   CALL DELAY 
   
   JMP XX
     
    
DELAY:
MOV CX,0F6H; Delay
Delay9:loop Delay9  
RET

F0: 
 MOV AL, 00111111B ; displaying 0
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY 
 JMP XX  

F1:
 MOV AL, 00000110B  ; Displaying 1
 MOV DX, PORTA
 OUT DX,AL   
 CALL DELAY
 JMP XX

F2:
 MOV AL, 01011011B  ;Displaying 2
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX
 
F3:
 MOV AL, 01001111B  ; Displaying 3
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY 
 JMP XX
 
F4:
 MOV AL, 01100110B  ; Displaying 4
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY 
 JMP XX
 
F5:
 MOV AL, 01101101B    ;Displaying 5
 MOV DX, PORTA
 OUT DX,AL   
 CALL DELAY
 JMP XX
 
F6:
 MOV AL, 01111101B  ;Displaying 6
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX
 
F7:
 MOV AL, 00000111B  ;Displaying 7
 MOV DX, PORTA
 OUT DX,AL    
 CALL DELAY
 JMP XX
 
F8:
 MOV AL, 01111111B  ;Displaying 8
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY 
 JMP XX
 
F9:
 MOV AL, 01101111B      ; Displaying 9
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX 
 
FA:
 MOV AL, 01110111B      ; Displaying A
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY                          
 JMP XX                                  
 
FB:
 MOV AL, 01111100B      ; Displaying B
 MOV DX, PORTA
 OUT DX,AL    
 CALL DELAY
 JMP XX 
  
FC:
 MOV AL, 00111001B      ; Displaying C
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX  
 
FD:
 MOV AL, 01011110B      ; Displaying D
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX   
 
FE:
 MOV AL, 01111001B      ; Displaying E
 MOV DX, PORTA
 OUT DX,AL  
 CALL DELAY
 JMP XX    
 
FF:
 MOV AL, 01110001B      ; Displaying F
 MOV DX, PORTA
 OUT DX,AL   
 CALL DELAY
 JMP XX 
          

CODE ENDS
END

HLT           ; halt!


