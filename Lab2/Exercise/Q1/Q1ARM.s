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

		LDR		R0, =SRC
		MOV		R1, #0
		MOV 	R2, #0
		LDR		R3, =RESULT
		LDR		R4, =CARRY
		MOV		R5, #10
		
LOOP
		LDR		R6, [R0], #4
		ADDS	R1, R1, R6
		ADC	R2, R2, #0
		
		SUBS	R5, R5, #1
		
		BNE 	LOOP
		
		STR		R1, [R3]
		STR		R2, [R4]
STOP
		B		STOP
		
		AREA    mydata, DATA, READWRITE
			
RESULT  SPACE   4
CARRY 	SPACE	4
	
        AREA    constdata, DATA, READONLY

SRC     DCD     0xFFFFFFFF
        DCD     1,2,3,4,5,6,7,8,9

        END

