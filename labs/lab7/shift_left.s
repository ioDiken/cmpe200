/*shift_left */
.text
.global main

main:
	mov r1, #255
	mov r2, #26
	mov r3, #1
	mov r4, #2147483648
	mov r5, #0
	b shift_left

shift_left:
	cmp r3, r2
	beq endgame
	add r3, r3, #1
	mov r1, r1, LSL #1
	and r5, r1, r4
	cmp r5, r4
	beq carry_loop
	b shift_left

carry_loop:
	add r1, r1, #1
	b shift_left

endgame:
	mov r0, r1
	bx lr
