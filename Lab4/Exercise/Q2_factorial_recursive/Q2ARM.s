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
		
		MOV		R0, #5
		BL		FACTORIAL
		
STOP

		B		STOP
		
FACTORIAL
		
		CMP		R0, #1
		BLE		BASE_CASE
		
		PUSH 	{R0, LR}
		
		SUB 	R0, R0, #1
		
		BL 		FACTORIAL
		
		POP		{R1, LR}
		
		MUL		R0, R0, R1
		
		BX 		LR
		
BASE_CASE
		MOV		R0, #1
		BX		LR
		
		END