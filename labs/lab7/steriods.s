.text
.global main

main:
	mov r1, #131 
	mov r2, #939
	mov r3, #1048
	mov r4, #0
	mov r5, #524
	cmp r1, r2
	bne stage1

stage1:
	add r4, r4, #1
	cmp r1, r3
	beq stage2
	mov r1, r1, LSL #1
	b stage1

stage2:
	add r4, r4, #1
 	cmp r1, r5
	beq stage3
	mov r1, r1, LSR #1
	b stage2

stage3:
	add r4, r4, #1
	mov r1, r1, ROR #1
	cmp r1, r3
	bne stage3
	b endgame

endgame:
	mov r0, r1
	bx lr
     
