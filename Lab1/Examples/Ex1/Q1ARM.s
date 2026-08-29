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
        LDR     R0, =SRC            ; R0 = address of SRC
        LDR     R1, =DST            ; R1 = address of DST

        LDRH    R3, [R0]            ; Load 16-bit value from SRC
        STRH    R3, [R1]            ; Store 16-bit value into DST

STOP
        B       STOP                ; Infinite loop

        AREA DATASEG, DATA, READWRITE

DST     DCW     0                   ; 16-bit destination

        AREA mycode2, CODE, READONLY

SRC     DCW     0x1234              ; 16-bit source

        END