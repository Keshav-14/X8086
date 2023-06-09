; find the mean of the array

; 1 : find the sum of the array
; 2 : divide by the size
; 1, 2 => mean

DATA SEGMENT 
ARR DB 01H, 02H, 03H, 04H, 05H, 06H
SIZE DB 06H
MEAN DB 00H
DATA ENDS

CODE SEGMENT
	ASSUME DS:DATA, CS:CODE
START:
	MOV AX,DATA
	MOV DS,AX
	MOV SI,OFFSET ARR
	MOV CL,SIZE
	MOV AL,00H
	CLC	; CLEAR THE CARRY FLAG
L1:
	ADC AL,[SI]
	INC SI
	DEC CL
	JNZ L1	; SUM OF ARRAY LOOP
	MOV AH,00H
	MOV BL,SIZE
	DIV BL	; SUM(ARRAY) / N => MEAN
	MOV MEAN,AL	; QUOTIENT IS THE MEAN
CODE ENDS
	END
	