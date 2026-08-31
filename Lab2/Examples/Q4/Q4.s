 ;Write a program to divide a 32 bit number by 16 bit number 
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
		
		LDR		R0, =NUM1 ;32 bit number
		LDR		R1, =NUM2 ;16 bit number
		LDR		R5, =RESULT
		LDR		R2, [R0]
		LDRH	R3, [R1]
		MOV		R4, #0
		
DIV_LOOP
		
		CMP		R2, R3
		BLO		DONE
		
		SUB		R2, R2, R3
		
		ADD		R4, R4, #1
		
		B		DIV_LOOP
		
DONE
		STR		R4, [R5]
		STRH		R2, [R5, #4]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	6  ;6 bytes space, 4 for quotient and 2 for remainder
		
		AREA	constdata, DATA, READONLY
NUM1
		DCD		0x0000000A
NUM2
		DCW	 	0x00000003
		
		END
			