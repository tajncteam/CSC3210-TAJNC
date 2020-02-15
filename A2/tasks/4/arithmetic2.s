@ arithmetic2 program: Register = val2 + 9 + val3 - val1
@ r1 = 11 + 9 + 16 - 6
@ r1 = 36 - 6
@ r1 = 30

.section .data

    val1: .WORD 6     @ 32-bit variable a in memory
    val2: .WORD 11    @ 32-bit variable b in memory
    val3: .WORD 16    @ 32-bit variable b in memory

.section .text

.globl _start

_start:
    ldr r1, =val2    @ load the memory address of val2 into r1
    ldr r1, [r1]     @ load the value val2 into r1
    add r1, r1, #9   @ add 9 to r1 => 11 + 9 : 20

    ldr r2, =val3    @ load the memory address of val3 into r2
    ldr r2, [r2]     @ load the value val3 into r2
    add r1, r1, r2   @ add 16 to r1 => 20 + 16 : 36

    ldr r3, =val1    @ load the memory address of val1 into r3
    ldr r3, [r3]     @ load the value val1 into r3
    sub r1, r1, r3   @ sub 6 from r1 => 36 - 6 : 30

    mov r7, #1      @ Program Termination: exit syscall
    svc #0          @ Program Termination: wake kernel
.end