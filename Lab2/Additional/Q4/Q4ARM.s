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

		LDR		R0, =NUM1
		LDR		R1, =NUM2
		LDR		R6, =RESULT
		MOV		R2, #0 ;carry
		MOV		R3, #0 ;sum
		
		LDR		R4,[R0] ;A
		LDR		R5,[R1] ;B
		
LOOP
		ADDS	R3, R3, R4
		
		BCS		CARRY
		BCC		NO_CARRY
CARRY
		ADD		R2, R2, #1
NO_CARRY
		SUBS	R5, R5, #1
		
		BNE 	LOOP
		
		STR		R3,[R6]
		STR		R2,[R6,#4]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	8
			
		AREA 	constdata, DATA, READONLY
NUM1
		DCD		10
NUM2
		DCD		5
			
		END
		