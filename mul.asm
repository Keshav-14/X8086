DATA SEGMENT

NUM1 DW 2001H
NUM2 DW 4500H
MSB DW 0000H
LSB DW 0000H

DATA ENDS

CODE SEGMENT
	ASSUME CS:CODE,DS:DATA
	
START:
	MOV AX,DATA
	MOV DS,AX
	MOV AX,NUM1
	MOV CX,NUM2
	MUL CX
	MOV MSB,DX
	MOV LSB,AX
	HLT
CODE ENDS
	END