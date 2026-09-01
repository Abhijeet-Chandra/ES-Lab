        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x10001000             ; stack pointer value when stack is empty
        DCD Reset_Handler           ; reset vector

        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler
Reset_Handler

		LDR		R0,=NUM1
		LDRH	R1,[R0]
		LDR		R10,=RESULT
		;extracting lower nibble:
		
		MOV		R2, #0x0F
		AND		R2, R2, R1
		
		;extracting upper nibble:
		
		MOV		R3, #0xF0
		AND		R3, R3, R1
		LSR		R3, R3, #4
		
		MOV		R4, #16
		MUL		R3, R3, R4
		ADD		R5, R3, R2
		
		MOV		R1, #10
		MOV		R2, #100
		;R5 = decimal number basically..
		
		UDIV	R6, R5, R2
		MUL		R3, R2, R6
		SUB		R7, R5, R3
		
		STRB	R6,[R10]
		
		MOV		R5, R7
		
		UDIV	R6, R5, R1
		MUL		R3, R1, R6
		SUB		R7, R5, R3
		
		STRB		R6,[R10, #1]
		
		STRB		R7,[R10, #2]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	3
		
		AREA	constdata, DATA, READONLY
NUM1
		DCD		0x21
			
		END
		
