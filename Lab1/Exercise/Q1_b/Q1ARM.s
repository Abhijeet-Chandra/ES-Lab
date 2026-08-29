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
		LDR		R1, =DST
		MOV		R2, #10
		
		CMP		R0, R1
		
		BGT		FORWARD
		BLT		BACKWARD
		B		STOP
		
FORWARD

LOOP_F
		LDR		R3, [R0], #4
		STR		R3, [R1], #4
		SUBS	R2, R2, #1
		
		BNE 	LOOP_F
		
		B		STOP
		
BACKWARD
		ADD		R1, R1, #36
		ADD		R0, R0, #36
		
LOOP_B
		
		LDR		R3, [R0], #-4
		STR		R3, [R1], #-4
		SUBS	R2, R2, #1
		
		BNE		LOOP_B
		
		B		STOP
STOP
        B       STOP


        AREA    DATASEG, DATA, READWRITE

DST     SPACE   40


        AREA    mycode2, CODE, READONLY

SRC     DCD     1,2,3,4,5
        DCD     6,7,8,9,10

        END