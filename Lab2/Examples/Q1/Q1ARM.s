		AREA RESET, DATA, READONLY
		EXPORT __Vectors

__Vectors
		DCD 0x10001000          ; stack pointer value when stack is empty
		DCD Reset_Handler       ; reset vector
		ALIGN
	
		AREA mycode, CODE, READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
	
		LDR		R0, =NUM1
		LDR 	R1, =NUM2
		LDR		R2, =RESULT
		
		LDR		R3,	[R0]
		LDR		R4, [R1]
		ADDS	R3, R3, R4
		
		BCS		CARRY
		B		NO_CARRY
		
CARRY
			MOV		R5, #1
			B		STORE
			
NO_CARRY
			MOV		R5, #0
			
STORE
			STR		R3, [R2]
		
		
STOP
		B		STOP
		
		
		AREA    mydata, DATA, READWRITE

RESULT  SPACE   4

        AREA    constdata, DATA, READONLY

NUM1    DCD		0xFFFFFFFF
NUM2    DCD     1

        END