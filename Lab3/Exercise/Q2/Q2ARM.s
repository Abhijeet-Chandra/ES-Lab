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

		LDR		R0, =NUM1 ;R0 contains address of the input
		LDR		R1, [R0]  ;R1 = input
		LDR		R7, =RESULT
		
		;extract lower nibble (ones place)
		
		MOV 	R2, #0x0F
		AND		R2, R2, R1
		
		
		;extract upper nibble (tens place)
		
		MOV		R3, #0xF0
		AND		R3, R3, R1
		
		LSR		R3, R3, #4
		
		MOV		R4, #10
		MUL		R5, R3, R4
		ADD		R6, R5, R2
		
		STR		R6, [R7]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	4
		
		AREA	constdata, DATA, READONLY
NUM1	DCD		0x25
	
		END