; 64 BIT ADDITION

DATA SEGMENT
NUM1 DB 12H,34H,45H,67H,89H,43H,89H,21H	; LSB ... MSB
NUM2 DB 12H,34H,45H,67H,89H,43H,89H,21H	; LSB ... MSB
RESUTL DB 00H,00H,00H,00H,00H,00H,00H,00H	; LSB ... MSB
COUNT DB 08H
CARRY DB 00H
DATA ENDS

CODE SEGMENT
	ASSUME DS:DATA, CS:CODE
START:
	MOV AX,DATA
	MOV DS,AX
	MOV SI,OFFSET NUM1
	MOV BX,OFFSET NUM2
	MOV DI,OFFSET RESULT
	MOV CL,COUNT
	MOV DL,00H	; FOR CARRY
	CLC	; CLEAR CARRY
RPT:
	MOV AL,[BX]
	ADC AL,[SI]
	MOV [DI],AL
	INC SI
	INC DI
	INC BYTE PTR [BX]
	DEC CL
	JNZ RPT
	JNC NOCARRY
	INC DL
NOCARRY:
	MOV CARRY,DL
	HLT
CODE ENDS
	END
	