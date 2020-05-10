
// Data Section
.data

.align 4
msg: .asciz "Multiplication of %lld by %lld = %lld"

.align 8
var0_l: .word 3755744309
var0_h: .word 2

.align 8
var1_l: .word 12345678
var1_h: .word 0

// Code Section
.text

add_64:
	// args passed in r0,r1,r2,r3, returned r0,r1
	adds r0, r2 // add lower part & update flags
	adc r1, r3 // add upper part + carry from lower

sub_64:
	// args passed in r0,r1,r2,r3, returned r0,r1
	subs r0, r2 // sub lower part & update flags
	sbc r1, r3 // sub upper part + NOT of carry from lower

umul_64:
	// args passed in r0,r1,r2,r3, returned r0,r1
	push {r4, r5}
	mov r4, r0 // save r0 into r4
	mov r5, r1 // save r1 into r4

	umull r0, r1, r2, r4	// r0,r1 <- r2*r4
	umlal r1, r5, r2, r5	// r1 = lower + r1, r5 = upper + r5 + c
	umlal r1, r5, r3, r4	//


	// restore regs
	pop {r4, r5}
	bx lr


.global main
main:
	push {r4, r5, r6, r7, r8, lr}

	// load nums from memory
	ldr r0, var0_l_addr		// r0 <- &var0_l
	ldr r0, [r0]			// r0 <- *r0
	ldr r1, var0_h_addr		// r1 <- &var0_h
	ldr r1, [r1]			// r1 <- *r1
	ldr r2, var1_l_addr		// r2 <- &var1_l
	ldr r2, [r2]			// r2 <- *r2
	ldr r3, var1_h_addr		// r3 <- &var1_l
	ldr r3, [r3]			// r3 <- *r3

	// save num in second regs
	mov r4, r0
	mov r5, r1
	mov r6, r2
	mov r7, r3

	// call umul_64
	bl umul_64

	push {r1}
	push {r0}
	push {r7}
	push {r6}
	mov r2, r4
	mov r3, r5
	ldr r0, msg_addr
	bl printf
	add sp, #16

	mov r0, #0 // so program doesnt print anything extra
	pop {r4, r5, r6, r7, r8, lr}
	bx lr

msg_addr: .word msg
var0_h_addr: .word var0_h
var0_l_addr: .word var0_l
var1_h_addr: .word var1_h
var1_l_addr: .word var1_l
