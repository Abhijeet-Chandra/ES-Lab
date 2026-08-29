        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors

__Vectors
        DCD     0x10001000
        DCD     Reset_Handler

        ALIGN

        AREA    mycode, CODE, READONLY
        ENTRY
        EXPORT  Reset_Handler

Reset_Handler
		
		LDR 	R0, =NUM1
		LDR		R1, =NUM2
		LDR 	R7, =RESULT
		LDR		R2, [R0] ;A
		LDR		R3, [R1] ;B
		
		CMP     R3, #0
        BEQ     STOP ;avoid dividing if B == 0
LOOP
		UDIV	R4, R2, R3 ; X = A/B
		MUL		R5, R4, R3 ; Y = X * B
		SUB		R6, R2, R5 ; Z = A - Y
		
		
		CMP 	R6, #0	; remainder == 0 ?
		BEQ 	DONE
		
		ADD 	R2, R2, R2 ; A = A + A
		
		B		LOOP
		
DONE
		STR		R2, [R7]
		
STOP	
		B 		STOP
		
		
		        AREA    mydata, DATA, READWRITE

RESULT  SPACE   4


        AREA    constdata, DATA, READONLY

NUM1    DCD     6
NUM2    DCD     4

        END