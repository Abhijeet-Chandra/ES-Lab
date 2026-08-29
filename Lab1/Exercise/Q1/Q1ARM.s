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
		
LOOP	
		LDR		R3, [R0], #4
		STR		R3, [R1], #4
		
		SUBS	R2, R2, #1
		BNE		LOOP
		
STOP
        B       STOP


        ; ===== DATA SECTION =====

        AREA    DATASEG, DATA, READWRITE

        ; Define variables here
        ; Example:
        ; DST     DCW     0
		
DST		SPACE		40

        ; ===== CONSTANT / SOURCE DATA =====

        AREA    mycode2, CODE, READONLY

        ; Define constants here
        ; Example:
        ; SRC     DCW     0x1234
		
SRC		DCD		0x00000001, 0x00000002, 0x00000003, 0x00000004, 0x00000005, 0x00000006, 0x00000007, 0x00000008, 0x00000009, 0x0000000A	
		
        END