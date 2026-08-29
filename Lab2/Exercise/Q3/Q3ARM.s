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
		;A = A3 + A2 + A1 + A0
		;B = B3 + B2 + B1 + B0
		;each of 32 bits
		
		;S0 = A0 - B0
		;S1 = A1 - B1 - (1 - C0)
		;S2 = A2 - B2 - (1 - C1)
		;S2 = A3 - B3 - (1 - C2)
		;S4 = (1 - C3)
		
		
		LDR		R0, =NUM1
		LDR		R1, =NUM2
		LDR		R9, =RESULT
		
		
		;S0 = A0 - B0
		LDR		R2, [R0, #0]
		LDR		R3, [R1, #0]
		SUBS	R4, R2, R3
		
		;S1 = A1 - B1 - (1 - C0)
		LDR		R2, [R0, #4]
		LDR		R3, [R1, #4]
		SBCS	R5, R2, R3
		
		;S2 = A2 - B2 - (1 - C1)
		LDR		R2, [R0, #8]
		LDR		R3, [R1, #8]
		SBCS	R6, R2, R3
		
		;S3 = A3 - B3 - (1 - C2)
		LDR		R2, [R0, #12]
		LDR		R3, [R1, #12]
		SBCS	R7, R2, R3
		
		MOV		R8, #0
		MOVCC	R8, #1
			
		STR		R4, [R9, #0]
		STR		R5, [R9, #4]
		STR		R6, [R9, #8]
		STR		R7, [R9, #12]
		STR		R8, [R9, #16]
		
		
STOP
        B       STOP


; =========================================================
; DATA
; =========================================================

        AREA    mydata, DATA, READWRITE

RESULT
        SPACE   20              ; 5 × 4 bytes


        AREA    constdata, DATA, READONLY


; A = A3 A2 A1 A0
NUM1
        DCD     0xFFFFFFFF      ; A0
        DCD     0xFFFFFFFF      ; A1
        DCD     0xFFFFFFFF      ; A2
        DCD     0xFFFFFFFF      ; A3


; B = B3 B2 B1 B0
NUM2
        DCD     1               ; B0
        DCD     1               ; B1
        DCD     1               ; B2
        DCD     1               ; B3


        END