# Read an array of 5 16 bit hexadecimal numbers.
# Function to sum the digits of a 16 bit hexadecimal number
# And read that sum and write it as bcd(another func)

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
		
		LDR		R0,=ARRAY
		MOV		R2, #5
		LDR		R11,=RESULT
LOOP
		LDRH	R1,[R0],#2
		BL		SUM_DIG
		BL		BCD
		STRB	R9,[R11]
		STRB	R10,[R11,#1]
		ADD		R11, R11, #2
		SUBS	R2, R2, #1
		BNE		LOOP
		
		B		STOP
SUM_DIG
		MOV		R4,#0
LOOP_2
		
		MOV		R3, #0x0F
		AND		R3, R3, R1
		ADD		R4, R4, R3
		LSR		R1, R1, #4
		CMP		R1, #0
		BNE		LOOP_2
		
		BX		LR
		
BCD
		MOV		R5, #10
		
		UDIV	R10, R4, R5
		
		MUL		R7, R10, R5
		SUB		R9, R4, R7
		;R9 : ones
		;R10 :tens
		
		BX		LR
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE 40
		
		AREA	constdata, DATA, READONLY
ARRAY
		DCW		0x1234, 0x2345, 0x3456, 0x4567, 0x5678
			
		END
