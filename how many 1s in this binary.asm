;how many "1"s
DATA SEGMENT
    NUMBER DW 0FFF4H
DATA ENDS

STACK SEGMENT STACK
STACK ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,ES:EDATA,SS:STACK
START:
    MOV AX,DATA
    MOV DS,AX   
    MOV DL,00H
    MOV CX,16
FIND:    
    SHL NUMBER,1
    ADC DL,0
    LOOP FIND
    
    CMP DL,10
    JL PRINT 
    SUB DL,10
    PUSH DX
    MOV DL,'1'
    MOV AH,02H
    INT 21H
    POP DX 
PRINT:  
    ADD DL,'0'
    MOV AH,02H
    INT 21H  
ENDING:
    MOV AH,4CH
    INT 21H
CODE ENDS
    END START
 