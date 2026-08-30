        AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x10001000             ; stack pointer value when stack is empty
        DCD Reset_Handler          ; reset vector

        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler

Reset_Handler

		LDR		R0, =ARRAY
		MOV		R1, #0 ;R1 = 0, i.e. low = 0
		MOV		R2, #9 ;R2 = n - 1, i.e. high = n - 1
		MOV		R10, #9 ;target
LOOP
		CMP		R1, R2
		BGT		NOT_FOUND
		
		ADD		R3, R1, R2 ;R3 = low + high
		MOV		R4, #2
		UDIV	R3, R3, R4 ; mid = R3/2 i.e. (low + high)/2
		
		LDR		R5, [R0, R3, LSL#2] ;R5 = arr[mid]
		
		CMP		R10, R5
		
		BLT		LBL1
		BGT		LBL2
		BEQ		LBL3
		
LBL1
		SUB		R3, R3, #1
		MOV		R2, R3
		B		NEXT
LBL2
		
		ADD		R3, R3, #1
		MOV		R1,R3
		B		NEXT
LBL3
		
		B		LBL3
NEXT

		B		LOOP

NOT_FOUND
		MOV		R3, #-1
		B		NOT_FOUND
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	4
			
		AREA	constdata, DATA, READONLY
ARRAY
		DCD		1,2,3,4,5,6,7,8,9,10
		
		END