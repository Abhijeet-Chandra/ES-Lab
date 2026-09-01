; a) Write a function to convert a 2 digit hexadecimal no. to ascii value
; b) Using the above function, convert an array of 10 2-digit hexadecimal numbers into ascii characters
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

		LDR		R0, =ARRAY
		LDR		R1, =RESULT
		MOV		R2, #10
LOOP
		LDRH	R3, [R0], #2
		
		BL		HEX_TO_ASCII
		
		SUBS	R2, R2, #1
		BNE		LOOP
		B		STOP
		
HEX_TO_ASCII
		
		;extract lower nibble:
		MOV		R4, #0x0F
		AND		R4, R4, R3
		
		CMP		R4, #9
		BGT		ADD_37_lower
		BLE		ADD_30_lower
		
ADD_37_lower
		ADD		R4, R4, #0x37
		B		SECOND
ADD_30_lower
		ADD		R4, R4, #0x30

SECOND
		;extract upper nibble:
		MOV		R5, #0xF0
		AND		R5, R5, R3
		LSR		R5, R5, #4
		
		CMP		R5, #9
		
		BGT		ADD_37_upper
		BLE		ADD_30_upper
		
ADD_37_upper
		ADD		R5, R5, #0x37
		B		DONE
ADD_30_upper
		ADD		R5, R5, #0x30
DONE
		
		STRB	R4, [R1]
		STRB	R5, [R1,#1]
		
		ADD		R1, R1, #2
		BX 		LR
		
STOP
		B		STOP
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	40
		AREA	constdata, DATA, READONLY
ARRAY
		DCW		0x12, 0x23, 0x34, 0x45, 0x56, 0x67, 0x78, 0x89, 0x9A, 0xAB
		
		END
