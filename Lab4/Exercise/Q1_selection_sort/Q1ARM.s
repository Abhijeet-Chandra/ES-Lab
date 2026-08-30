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

		LDR		R0, =ARRAY ;base address
		MOV		R1, #10 ;R1 = n
		MOV		R2, #0 ;i = 0
		LDR		R8, =RESULT
		
		MOV     R7, #0          ; offset
        MOV     R9, #10         ; count

COPY
        LDR     R6, [R0, R7]    ; R6 = ARRAY[offset]
        STR     R6, [R8, R7]    ; RESULT[offset] = ARRAY[offset]

        ADD     R7, R7, #4
        SUB     R9, R9, #1
        CMP     R9, #0
        BHI     COPY

        LDR     R0, =RESULT     ; NOW sort RESULT
		
OUTER
		CMP		R2, R1 ;i >= n ?
		BGE		DONE	;if yes then its done
		
		MOV		R4, R2
		
		ADD		R3, R2, #1 ;j = i + 1

INNER
		CMP		R3, R1 ;j >= n?
		BGE		SWAP ;if yes then swap
		
		LDR		R5, [R0, R3, LSL #2] ;R5 is a[j]
		LDR		R6, [R0, R4, LSL #2] ;R6 is a[min_index]
		
		CMP		R5, R6 ;a[j] >= a[min_index]
		BGE		NEXT ;if yes then skip and go to next iteration of j
		
		MOV		R4, R3 ;if not, then, min_index = j
NEXT
		ADD		R3, R3, #1 ;j = j + 1
		B		INNER
		
SWAP
		LDR 	R7, [R0, R2, LSL#2] ;R7 is a[i]
		LDR		R6, [R0, R4, LSL#2] ;R6 is a[min_index]
		STR		R6,	[R0, R2, LSL#2] ; a[i] = a[min_index]
		STR		R7,	[R0, R4, LSL#2] ; a[min_index] = old a[i]
		
		ADD 	R2, R2, #1
		B		OUTER
DONE

		B		DONE
		
		AREA	mydata, DATA, READWRITE
RESULT
		SPACE	40
		
		AREA	constdata, DATA, READONLY
ARRAY
		DCD		7,3,5,9,1,2,6,8,4,10
			
		END