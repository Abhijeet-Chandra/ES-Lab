# Embedded Systems Lab — Labs 1 to 4

This repository contains the ARM Assembly programs for **Embedded Systems Lab (ICT 3144)** based on the **2026 Embedded Systems Lab Manual**.

## Labs

| Lab | Topic | Manual Lab | Manual Pages |
|---|---|---:|
| **Lab 1** | Data Transfer Programs | Lab 2 | 10–11 |
| **Lab 2** | Arithmetic Programs | Lab 3 | 12–16 |
| **Lab 3** | Code Conversion Programs | Lab 4 | 17–18 |
| **Lab 4** | Sorting, Searching and Stack | Lab 5 | 19–20 |

---

## Lab 1 — Data Transfer Programs

### Aim
Familiarization of ARM data transfer instructions.

### Programs
1. Copy a 16-bit variable from code memory to data memory.
2. Transfer a block of ten 32-bit numbers:
   - Non-overlapping source and destination blocks.
   - Overlapping source and destination blocks.
3. Reverse an array of ten 32-bit numbers in memory.

### Concepts
- ARM addressing modes
- Register indirect addressing
- Indexed addressing
- `LDR` and `STR`
- Memory-to-memory data transfer

---

## Lab 2 — Arithmetic Programs

### Aim
Familiarization of arithmetic operations such as addition, subtraction and multiplication.

### Programs
1. Add two 32-bit numbers.
2. Multiply two numbers.
3. Divide a 32-bit number by a 16-bit number using repetitive subtraction.

### Exercise Programs
1. Add ten 32-bit numbers and store the result in data memory.
2. Add two 128-bit numbers.
3. Subtract two 128-bit numbers.
4. Find the LCM of two numbers.

### Additional Exercises
1. Subtract two 32-bit numbers.
2. Find the sum of `n` natural numbers using `MLA`.
3. Find the GCD of two numbers.
4. Multiply two 32-bit numbers using repetitive addition.
5. Perform BCD multiplication.

---

## Lab 3 — Code Conversion Programs

### Aim
Familiarization of logical instructions and code conversion programs.

### Programs
1. Convert a 2-digit hexadecimal number into unpacked ASCII.

### Exercise Programs
1. Convert a 2-digit hexadecimal number into ASCII.
2. Convert a 2-digit BCD number into its equivalent hexadecimal number.
3. Convert a 2-digit hexadecimal number into its equivalent BCD number.

### Additional Exercises
1. Convert unpacked ASCII hexadecimal into packed hexadecimal.
2. Convert a 32-bit number from unpacked form into packed form.

### Main Instructions
- `AND`
- `CMP`
- `BLO`
- `ADD`
- `MOV`
- `STRB`

---

## Lab 4 — Sorting, Searching and Stack

### Aim
To understand the logic of looping and sorting.

### Programs
1. Sort a list using **Bubble Sort**.
2. Sort an array using **Selection Sort**.
3. Find the factorial of an unsigned number using **recursion**.
4. Search an element in an array of ten 32-bit numbers using **Linear Search**.

### Additional Exercises
1. Sort ten 32-bit numbers stored in registers using selection sort and a fully ascending stack.
2. Repeat the sorting operation for a fully descending stack.

### Concepts
- Loops and conditional branching
- Bubble sort
- Selection sort
- Linear search
- Recursion
- Stack operations
- `STM` / `LDM`
- `PUSH` / `POP`
- `BL` and `BX LR`

---

## Keil uVision4

The programs are intended to be developed and debugged using **Keil uVision4** with the **NXP LPC1768** ARM controller target.

Typical workflow:

1. Create a project in Keil uVision4.
2. Select **NXP → LPC1768**.
3. Create an ARM Assembly source file.
4. Add the source file to **Source Group 1**.
5. Build the project.
6. Start the Debug session.
7. Execute instructions step by step.
8. Observe register and memory values.
9. Verify the output.

## Common ARM Program Structure

```asm
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

        ; Program instructions

STOP
        B       STOP

        END
```

## Important Instructions

| Instruction | Purpose |
|---|---|
| `LDR` | Load data/address |
| `STR` | Store data |
| `LDRB` | Load byte |
| `STRB` | Store byte |
| `LDRH` | Load halfword |
| `STRH` | Store halfword |
| `MOV` | Move data |
| `ADD` / `ADDS` | Addition |
| `SUB` / `SUBS` | Subtraction |
| `MUL` | Multiplication |
| `UMULL` | 64-bit multiplication result |
| `CMP` | Compare |
| `AND` | Bit masking |
| `B` | Branch |
| `BNE` | Branch if not equal |
| `BLO` | Branch if lower |
| `BCS` | Branch if carry set |
| `BL` | Function call |
| `BX LR` | Return from function |
| `PUSH` / `POP` | Stack operations |
| `STM` / `LDM` | Multiple-register memory transfer |

## Reference

Based on the **ICT 3144 Embedded Systems Lab Manual (2026)**, covering:

- **Lab 1:** Data Transfer Programs (Manual Lab 2)
- **Lab 2:** Arithmetic Programs (Manual Lab 3)
- **Lab 3:** Code Conversion Programs (Manual Lab 4)
- **Lab 4:** Programs on Sorting, Searching and Stack (Manual Lab 5)
