	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10001000          ; stack pointer value when stack is empty
	DCD Reset_Handler       ; reset vector
	ALIGN

	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	
	LDR		R0, = SRC
	LDR		R1, = DST
	MOV 	R2, #10
	ADD		R0, R0, #36
LOOP

	LDR		R3, [R0], #-4
	STR		R3, [R1], #4
	SUBS	R2, R2, #1
	
	BNE		LOOP
	
STOP
	B STOP

	AREA mydata, DATA, READWRITE

DST
        SPACE 40


        AREA constdata, DATA, READONLY

SRC
        DCD 457893, 111, 222, 333, 444
        DCD 555, 666, 777, 888, 999

        END