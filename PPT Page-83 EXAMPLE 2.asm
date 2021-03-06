;从0200H单元开始有100个数，编一个程序检查这些数，正数保持不变，负数都取补后送回
DATA SEGMENT
    ORG 0200H               ;从0200H开始
    STRING DB 100 DUP (?)
DATA ENDS 

STACK SEGMENT STACK
STACK ENDS 

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA,ES:DATA,SS:STACK
BEGIN:
    MOV AX,DATA
    MOV DS,AX

    MOV CX,100
    LEA SI,STRING
AGAIN:  
    MOV AL,[SI]
    CMP AL,0
    JGE OVER    ;AL－0＞0，跳至OVER
    NEG AL	    ;AL＜0，对AL求补
OVER:   
    MOV [SI],AL
    INC SI
    LOOP AGAIN

    MOV AH,4CH
    INT 21H
CODE ENDS
    END BEGIN