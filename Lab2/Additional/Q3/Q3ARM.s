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

		LDR		R0, =NUM1
		LDR		R1, =NUM2
		LDR		R5, =RESULT
		LDR		R2, [R0] ;a
		LDR		R3, [R1] ;b
LOOP
		CMP		R2, R3 ; a>b?
		
		BHI		B1
		
		BLO		B2
		
		BEQ		DONE
		
B1
		SUB		R2, R2, R3
		B		LOOP
B2
		SUB		R3, R3, R2
		B		LOOP
		
DONE
		STR		R2, [R5]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	4
		
		AREA	constdata, DATA, READONLY
NUM1
		DCD		12
NUM2
		DCD		4
		
		END
		
		