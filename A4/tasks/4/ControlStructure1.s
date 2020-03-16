@ Fourth program
@ This program compute the following if statement construct:
    @ int x = 1;
    @ if(X <= 3) 
    @     X = X - 1
    @ else
    @     X = X - 2


.section .data
    x: .word 1          @ 32-bit signed integer, you can also use int directive instead of .word directive

.section .text
.globl _start

_start:
    ldr r1, =x          @ load the memory address of x into r1
    ldr r1, [r1]        @ load the value x into r1

    cmp r1, #3          @ 
    ble r1_lower        @ jump to r1_lower if r1 is less than or equal to 3
    b r1_greater        @ jump to r1_greater if r1 is greater than 3

    r1_lower:
         subs r1, r1, #1
         ldr r2, =x      @ load the memory address of x into r2
         str r1, [r2]    @ store r1 register value into y memory address
         b endif         @ jump to endif
    
    r1_greater:
         subs r1, r1, #2
         ldr r2, =x      @ load the memory address of x into r2
         str r1, [r2]    @ store r1 register value into y memory address
         b endif         @ jump to endif
    

    endif:    
        mov r7, #1      @ Program Termination: exit syscall
        svc #0          @ Program Termination: wake kernel
.end        





