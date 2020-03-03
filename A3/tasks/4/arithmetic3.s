@ arithmetic3 program: Register = val2 + 3 + val3 - val1
@ r1 = 11 + 3 + 16 -60
@ r1 = 30 - 60
@ r1 = -30
@
@ val1, val2, and val3 are 8-bit integer memory variables
@ Besides, Val1, val2 are unsigned integers and val3 is signed integer
@ Assign val2=11, val3=16, val1=-60.


.section .data
    val1: .byte -60             @ 8-bit signed integer
    val2: .byte 11              @ 8-bit signed integer
    val3: .byte 16              @ 8-bit signed integer

.section .text
.globl _start

_start:

    ldr r1, =val2     @ load the memory address of val2 into r1
    ldrb r1, [r1]     @ load the value val2 into r1
    adds r1, r1, #3   @ add 3 to r1 => 11 + 3 : 14

    ldr r2, =val3     @ load the memory address of val3 into r2
    ldrb r2, [r2]     @ load the value val3 into r2
    adds r1, r1, r2   @ add 16 to r1 => 14 + 16 : 30

    ldr r3, =val1     @ load the memory address of val1 into r3
    ldrsb r3, [r3]    @ load the value val1 into r3
    adds r1, r1, r3   @ add r1 and r3 and store into r1 => 30 + (-60) : -30   

    mov r7, #1        @ Program Termination: exit syscall
    svc #0            @ Program Termination: wake kernel

.end    



