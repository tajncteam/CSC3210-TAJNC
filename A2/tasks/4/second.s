@ second program: c = a + b
.section .data

    a: .WORD 2    @ 32-bit variable a in memory
    b: .WORD 5    @ 32-bit variable b in memory
    c: .WORD 0    @ 32-bit variable b in memory

.section .text

.globl _start

_start:
    ldr r1, =a      @ load the memory address of a into r1
    ldr r1, [r1]    @ load the value a into r1

    ldr r2, =b      @ load the memory address of b into r2
    ldr r2, [r2]    @ load the value b into r2

    add r1, r1, r2  @ add r1 to r2 and store into r1

    ldr r2, =c      @ load the memory address of c into r2
    str r1, [r2]    @ store r1 into memory c

    mov r7, #1      @ Program Termination: exit syscall
    svc #0          @ Program Termination: wake kernel
.end