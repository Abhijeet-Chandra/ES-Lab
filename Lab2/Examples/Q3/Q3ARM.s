;Write an assembly program to multiply two 32 bit numbers 
        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x10001000             ; stack pointer value when stack is empty
        DCD Reset_Handler          ; reset vector

        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler

		LDR		R0, =NUM1
		LDR		R1, =NUM2
		LDR		R6, =RESULT
		
		LDR		R2, [R0]
		LDR		R3, [R1]
		
		UMULL	R4, R5, R2, R3
		
		STR		R4, [R6]
		STR		R5, [R6, #4]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	8
		
		AREA	constdata, DATA, READONLY
NUM1
		DCD		0x12345678
			
NUM2
		DCD		0x12345678
			
		END
		