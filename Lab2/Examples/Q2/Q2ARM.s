;Write an assembly program to multiply two 16 bit numbers 
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
		LDR		R5, =RESULT
		
		LDRH	R2, [R0]
		LDRH	R3, [R1]
		
		MUL		R4, R2, R3
		
		STR		R4, [R5]
		
STOP
		B		STOP

		AREA 	mydata, DATA, READWRITE
RESULT
		SPACE	4
		
		AREA	constdata, DATA, READONLY
NUM1
		DCW		0xFFFF
NUM2
		DCW		0xFFFF
			
		END