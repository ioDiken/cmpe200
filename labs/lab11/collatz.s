
// Data Section
.data

msg: .asciz "Type a number: "
msg2: .asciz "Length of the Hailstone sequence for %d is %d\n"
scan_fmt: .asciz "%d"

// Code Section
//   - bleh
.text

collatz:
	// r0 contains first arg
	// r0,r1,r2 used
	// since no calls are made lr doesnt need to be saved
	mov r1, r0			// r1 <- r0
	mov r0, #0			// r0 <- 0
  loop:
  	cmp r1, #1			// compare r1, 1
	beq end				// r1 == 1
	and r2, r1, #1		// r2 <- r1 & 1
	cmp r2, #0			// compare r0, 0
	bne odd				// r0 != 0
  even:
  	mov r1, r1, ASR #1 	// r1 <- r1 >> 1
	b end_loop
  odd:
  	add r1, r1, LSL #1 	// r1 += r1<<1
	add r1, #1			// r1 += 1
  end_loop:
  	add r0, #1			// r0 += 1
	b loop
  end:
  	bx lr

.global main
main:
	push {lr}			// push lr to stack
	sub sp, #4			// sp -= 4 (make room in stack)

	ldr r0, msg_addr 		// &message for printf
	bl printf			// call printf

	ldr r0, scan_fmt_addr	// &scan_format for scanf
	mov r1, sp			// 2nd param for scanf
	bl scanf			// call scanf

	ldr r0, [sp]		//  load data from scanf
	bl collatz

	mov r2, r0			// 3rd param for printf
	ldr r1, [sp]		// 2nd param for printf
	ldr r0, msg2_addr	// &msg2 for printf
	bl printf

	add sp, #4			// sp += 4
	pop {lr}
	bx lr

msg_addr: .word msg
msg2_addr: .word msg2
scan_fmt_addr: .word scan_fmt
