;Write an assembly program to convert a 2 digit hexadecimal number into unpacked ASCII. 
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
		LDR		R1,[R0]
		LDR		R5, =RESULT
		;extract lower nibble:
		MOV		R2, #0x0F
		AND		R2, R2, R1
		
		CMP		R2, #9
		
		BGT		ADD_37_lower
		BLE		ADD_30_lower
		
ADD_30_lower
		ADD		R2, R2, #0x30
		B		SECOND
ADD_37_lower
		ADD		R2, R2, #0x37
SECOND

		;extract upper nibble:
		
		MOV		R3, #0xF0
		AND		R3, R3, R1
		LSR		R3, R3, #4
		
		CMP		R3, #9
		
		BGT		ADD_37_upper
		BLE		ADD_30_upper
		
ADD_30_upper
		ADD		R3, R3, #0x30
		B		DONE
ADD_37_upper
		ADD		R3, R3, #0x37
		
DONE
		STRB	R2, [R5]
		STRB	R3, [R5,#1]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	8
		
		AREA	constdata, DATA, READONLY
NUM1
		DCD		0x21
			
		END