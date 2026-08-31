;Find the sum of ‘n’ natural numbers using MLA instruction.
        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD     0x10001000          ; Initial stack pointer
        DCD     Reset_Handler       ; Reset vector

        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler

		LDR		R0, =ARRAY
		LDR		R1, =N
		LDR		R2, [R1]
		MOV		R3, #0
		MOV		R4, #1
		LDR		R6, =RESULT
LOOP
		
		LDR		R5, [R0], #4
		
		MLA		R3, R5, R4, R3
		
		SUBS	R2, R2, #1
		
		BNE		LOOP
		
		STR		R3, [R6]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	4
			
		AREA	constdata, DATA, READONLY
ARRAY
		DCD		1,2,3,4,5,6,7,8,9,10
N
		DCD		10
			
		END
		