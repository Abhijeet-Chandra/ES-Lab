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
		
		LDR		R0,=UNPACKED
		LDR		R1,=RESULT
		
		LDRB 	R2,[R0] ;R2 = first digit
		LDRB	R3,[R0, #1] ;R3 = second digit
		
		LSL		R2, R2, #4
		ORR		R2, R2, R3
		STRB	R2, [R1]
		
		LDRB	R2, [R0, #2] ;third
		LDRB	R3, [R0, #3] ;fourth
		
		LSL		R2, R2, #4
		ORR		R2, R2, R3
		STRB	R2, [R1, #1]
		
		LDRB	R2, [R0, #4] ;fifth
		LDRB	R3, [R0, #5] ;sixth
		
		LSL		R2, R2, #4
		ORR		R2, R2, R3
		STRB	R2, [R1, #2]
		
		LDRB	R2, [R0, #6]
		LDRB	R3, [R0, #7]
		
		LSL		R2, R2, #4
		ORR		R2, R2, R3
		STRB	R2, [R1, #3]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	4
			
		AREA	constdata, DATA, READONLY
UNPACKED
		DCB     0x01, 0x02, 0x03, 0x04
        DCB     0x05, 0x06, 0x07, 0x08
		
		END
		
			
		