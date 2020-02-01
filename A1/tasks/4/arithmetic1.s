@ arithmetic1 program
@ <instruction> <destination>, <operand>, <operand>
.section .data
.section .text
.global _start

_start:
    mov r1, #10         @ load r1 with 10
    add r1, r1, #11     @ add 11 to r1

    mov r2, #7          @ load r2 with 7
    mov r3, #2          @ load r3 with 2
    mul r4, r2, r3      @ multiply r2 by r3

    sub r0, r1, r4      @ subtract r1 and r2 and store the result on r0

    mov r7,#1           @ Program Termination: exit syscall
    svc #0              @ Program Termination: wake kernel
.end
