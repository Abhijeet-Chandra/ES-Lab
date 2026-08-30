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
		
		LDR 	R0, =ARRAY ;array
		MOV		R1, #14 ;target
		MOV		R2, #0 ;i
		MOV		R3, #10 ;N
		
LOOP
		CMP		R2, R3 ;i >= N?
		BGE		NOT_FOUND
		
		LDR		R4, [R0, R2, LSL#2] ;R4 = arr[i]
		
		CMP		R4, R1
		
		BEQ		FOUND
		
		ADD		R2, R2, #1
		
		B		LOOP
		
NOT_FOUND	
		MOV		R2, #-1
		B		NOT_FOUND
		
FOUND
		B		FOUND
		
		AREA	mydata, DATA, READWRITE
RESULT	
		SPACE	40
			
		AREA	constdata, DATA, READONLY
ARRAY
		DCD 1,2,3,4,5,6,7,8,9,10
			
		END
		