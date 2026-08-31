;Write a program to subtract two 32 bit numbers
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

		LDR		R0,=NUM1
		LDR		R1,=NUM2
		LDR		R6,=RESULT
		LDR		R2, [R0]
		LDR		R3, [R1]
		
		SUBS	R4, R2, R3
		
		BCC		BORROW ;if c = 0, then there is a borrow
		BCS		NO_BORROW ;if c = 1, then there is no borrow
		
BORROW
		MOV		R5, #1
		B 		DONE
NO_BORROW
		MOV		R5, #0

DONE
		STR		R4, [R6]
		STR		R5, [R6, #4]
		B		STOP

STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	8

		AREA	constdata, DATA, READONLY
NUM1	
		DCD		0x00000003
NUM2
		DCD		0x0000000A
			
		END
			
		