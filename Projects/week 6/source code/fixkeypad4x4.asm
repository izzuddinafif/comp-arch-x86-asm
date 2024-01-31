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
    PORTCON EQU 06H
DATA ENDS

CODE SEGMENT
    MOV AX,DATA
    MOV DS,AX
    
    MOV DX,PORTCON
    MOV AL,10000010B
    OUT DX,AL
    
    START:
    MOV AL,00FEH
    MOV DX,PORTA
    OUT DX,AL
    MOV CX,00FFH
    
    R1:
    IN AL,PORTB
    
    CMP AL,000FEH
    JNE C2R1
    MOV AL,0007H; DISPLAYING 7
    OUT PORTC,AL
    JMP ONR1
    
    C2R1:
    CMP AL,000FDH
    JNE C3R1
    MOV AL,0066H; DISPLAYING 4
    OUT PORTC,AL
    JMP ONR1
    
    C3R1:
    CMP AL,000FBH
    JNE C4R1 
    MOV AL,0006H; DISPLAYING 1
    OUT PORTC,AL
    JMP ONR1
    
    C4R1:
    CMP AL,000F7H
    JNE ONR1                   
    MOV AL,0071H; DISPLAYING F
    OUT PORTC,AL
       
    ONR1:
    LOOP R1
    
    MOV AL,00FDH
    MOV DX,PORTA
    OUT DX,AL 
    MOV CX,00FFH
    
    R2:
    IN AL,PORTB
    
    CMP AL,000FEH
    JNE C2R2      
    MOV AL,007FH; DISPLAYING 8
    OUT PORTC,AL
    JMP ONR2
    
    C2R2:
    CMP AL,000FDH
    JNE C3R2
    MOV AL,006DH; DISPLAYING 5
    OUT PORTC,AL
    JMP ONR2
    
    C3R2:
    CMP AL,000FBH
    JNE C4R2
    MOV AL,005BH; DISPLAYING 2
    OUT PORTC,AL
    JMP ONR2
    
    C4R2:
    CMP AL,000F7H
    JNE ONR2
    MOV AL,003FH; DISPLAYING 0
    OUT PORTC,AL
       
    ONR2:
    LOOP R2
    
    MOV AL,00FBH
    MOV DX,PORTA
    OUT DX,AL 
    MOV CX,00FFH
   
    R3:
    IN AL,PORTB
    
    CMP AL,000FEH
    JNE C2R3              
    MOV AL,006FH; DISPLAYING 9
    OUT PORTC,AL
    JMP ONR3
    
    C2R3:
    CMP AL,000FDH
    JNE C3R3
    MOV AL,007DH; DISPLAYING 6
    OUT PORTC,AL
    JMP ONR3
    
    C3R3:
    CMP AL,000FBH
    JNE C4R3
    MOV AL,004FH; DISPLAYING 3
    OUT PORTC,AL
    JMP ONR3
    
    C4R3:
    CMP AL,000F7H
    JNE ONR3  
    MOV AL,0079H; DISPLAYING E
    OUT PORTC,AL
       
    ONR3:
    LOOP R3
    
    MOV AL,00F7H
    MOV DX,PORTA
    OUT DX,AL 
    MOV CX,00FFH
    
    R4:
    IN AL,PORTB
    
    CMP AL,000FEH
    JNE C2R4
    MOV AL,0077H; DISPLAYING A              
    OUT PORTC,AL
    JMP ONR4
    
    C2R4:
    CMP AL,000FDH
    JNE C3R4
    MOV AL,007CH; DISPLAYING b    
    OUT PORTC,AL
    JMP ONR4
    
    C3R4:
    CMP AL,000FBH
    JNE C4R4                
    MOV AL,0039H; DISPLAYING C
    OUT PORTC,AL
    JMP ONR4
    
    C4R4:
    CMP AL,000F7H
    JNE ONR4   
    MOV AL,005EH; DISPLAYING d
    OUT PORTC,AL
       
    ONR4:
    LOOP R4
    
    JMP START
    
    CODE ENDS
    END  
    HLT           ; halt!


