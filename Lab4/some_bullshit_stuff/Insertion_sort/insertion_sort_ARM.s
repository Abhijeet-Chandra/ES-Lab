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
		
		LDR		R0,=ARRAY
		MOV		R1, #10 ; N = 10
		MOV		R2, #1 ; i = 1
		MOV		R8, #10 ;temp = 10
		MOV		R9, #0 ;offset = 0
		LDR		R10, =RESULT
COPY_LOOP
		LDR		R11,[R0, R9]
		STR		R11,[R10,R9]
		ADD		R9, R9, #4
		SUBS		R8, R8, #1
		BNE 	COPY_LOOP
		
		LDR		R0,=RESULT
OUTER
		CMP		R2, R1 ; i>= N?
		BGE		DONE
		
		LDR		R3, [R0, R2, LSL#2] ; R3 = arr[i], i.e. key = arr[i]
		SUB		R4, R2, #1 ;j = i - 1
INNER
		CMP		R4, #0 ; j < 0
		
		BLT		ASSIGN ;if yes then go to assign
		
		LDR		R5, [R0, R4, LSL#2] ;R5 = arr[j]
		
		CMP		R5, R3 ;arr[j] <=  key?
		
		BLE		ASSIGN ;if yes
		
		ADD		R6, R4, #1 ;R6 = j + 1
		
		STR		R5, [R0, R6, LSL#2] ;arr[j+1] = arr[j]
		
		SUB		R4, R4, #1 ;j = j - 1
		
		B		INNER
		
ASSIGN
		ADD		R7, R4, #1
		STR		R3, [R0, R7, LSL#2] ;arr[j+1] = key
		
		ADD		R2, R2, #1
		
		B		OUTER
		
DONE
		B		DONE
		
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	40
			
		AREA	constdata, DATA, READONLY
ARRAY
		DCD 	4,5,2,3,1,9,8,6,7,10
			
		END