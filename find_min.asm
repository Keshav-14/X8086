; FIND THE SMALLEST ELEMENT IN THE ARRAY

DATA SEGMENT
ARR DB 09H,08H,05H,03H,0CH,0FH,01H
SIZE DB 07H
MIN DB 00H
DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
START:
	MOV AX,DATA
	MOV DS,AX
	MOV AL,FFH
	MOV SI,OFFSET ARR
	MOV CL,SIZE
REPEAT:
	CMP AL,[SI]
	JC NEXT
	MOV AL,[SI]
NEXT:
	INC SI
	DEC CL
	JNZ REPEAT
	MOV MIN,AL
	HLT
CODE ENDS
	END