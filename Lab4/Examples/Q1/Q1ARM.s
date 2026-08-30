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
		LDR		R0,=ARRAY
		MOV		R1, #10 ;R1 = N
		MOV		R2, #0 ;i = 0
		LDR		R6, =RESULT
		MOV		R7, #10; temp = N
		MOV		R8, #0
		
		;for copying:
LOOP
		LDR		R9, [R0, R8]
		STR		R9, [R6, R8]
		ADD		R8, R8, #4
		SUBS	R7, R7, #1
		
		BNE		LOOP
		
		LDR		R0, =RESULT
		
OUTER
		CMP		R2, R1 ;i >= n ?
		BGE		DONE ;if yes, done
		
		MOV		R3, #0 ;j = 0
		SUB		R10, R1, R2 ;R10 = N - i
		SUB		R10, R10, #1 ;R10 = N - i - 1
		
INNER
		
		CMP 	R3, R10
		BGE		NEXT_i
		
		LDR		R4, [R0, R3, LSL#2] ;R4 = a[j]
		ADD		R11, R3, #1
		LDR		R5, [R0, R11, LSL#2] ;R5 = a[j+1]
		
		CMP 	R4, R5
		BLE		NEXT_j
		
		STR		R5, [R0, R3, LSL#2] ;a[j] = a[j + 1]
		STR		R4, [R0, R11, LSL#2] ;a[j+1] = old a[j]
		
NEXT_j
		ADD		R3, R3, #1
		
		B		INNER
NEXT_i
		ADD		R2, R2, #1
		B		OUTER
		
DONE
		B		DONE
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	40
		
		AREA	constdata, DATA, READONLY

ARRAY
		DCD 	4,9,8,3,2,1,10,7,5,6
			
		END
		
		
		