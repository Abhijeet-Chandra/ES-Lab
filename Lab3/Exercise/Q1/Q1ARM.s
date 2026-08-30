;NOTE: THIS SOLUTION IS FOR PACKED ASCII CONVERSION
		AREA RESET, DATA, READONLY
        EXPORT __Vectors

__Vectors
        DCD 0x10001000             ; stack pointer value when stack is empty
        DCD Reset_Handler           ; reset vector

        ALIGN

        AREA mycode, CODE, READONLY
        ENTRY
        EXPORT Reset_Handler
Reset_Handler
		LDR 	R7, =NUM1
		LDR		R0, [R7]
		LDR		R8, =RESULT
		
		;extract lower byte:
		MOV		R1, #0x0F
		
		AND		R1, R1, R0
		
		
		;extract upper byte
		MOV		R2, #0xF0
		
		AND		R2, R2, R0
		
		LSR		R2, R2, #4
		
		;ADD 30 to lower byte if its between 0 to 9, otherwise add 37
		
		CMP		R1, #9
		
		BGT		ADD_37_lower
		B		ADD_30_lower
		
ADD_37_lower
		ADD		R1, R1, #0x37
		B		lower_done
ADD_30_lower
		ADD		R1, R1, #0x30
lower_done

		;ADD 30 to upper byte if its between 0 to 9, otherwise add 37
		
		CMP		R2, #9

		BGT		ADD_37_upper
		B		ADD_30_upper
		
ADD_37_upper
		ADD		R2, R2, #0x37
		B		upper_done
ADD_30_upper
		ADD		R2, R2, #0x30
upper_done		
		
		LSL		R2,R2,#8
		
		;final answer:
		
		ORR 	R3, R1, R2
		
		STR		R3, [R8]
		
STOP
		B		STOP
		
		AREA	mydata, DATA, READWRITE
RESULT
		
		SPACE 4
		
		AREA	constdata, DATA, READONLY
NUM1	DCD		0x21
	
		END