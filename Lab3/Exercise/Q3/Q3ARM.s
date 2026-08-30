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
		
		LDR		R0,=NUM1
		LDR		R1,[R0] ;R1 = number
		LDR 	R8, =RESULT
		;extract lower nibble
		
		MOV		R2, #0x0F
		AND		R2, R2, R1 ;R2 = lower nibble
		
		;extract upper nibble
		
		MOV		R3, #0xF0
		AND		R3, R3, R1
		LSR		R3, R3, #4 ;R3 = upper nibble
		
		MOV 	R4, #16
		MUL		R3, R3, R4 ;R3 = 16 * upper nibble
		ADD		R5, R3, R2 ;R5 = 16*upper nibble + lower nibble
		
		MOV 	R2, #10
		UDIV 	R6, R5, R2
		MUL		R2, R2, R6
		SUB		R5, R5, R2
		
		;R6 = quotient, upper nibble
		;R5 = remainder, lower nibble
		
		LSL		R6, R6, #4
		
		ORR		R7, R6, R5
		
		STR		R7, [R8]
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT	
		SPACE	4
		
		AREA	constdata, DATA, READONLY
			
NUM1	DCD		0x25
	
		END