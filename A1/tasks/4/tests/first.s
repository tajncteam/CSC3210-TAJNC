.section .data
.section .text
.global _start
_start:
	mov r1, #5
	sub r1, r1, #1
	add r1, r1, #4
	mov r7, #1
	svc #0

.end
