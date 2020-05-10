
// Data Section
//   - Meant for variables
.data

// 4-byte aligned var
.balign 4
var0:
	.word 3

.balign 4
var1:
	.word 4


// Code Section
//   - bleh
.text

.balign 4 // ensure code is 4-byte aligned
.global main

main:
	ldr r0, var0_addr // r0 <- &var0
	ldr r0, [r0] 			// r0 <- *r0
	ldr r1, var1_addr // r1 <- &var1
	ldr r1, [r1]			// r1 <- *r1
	add r0, r1 // r0 += r1
	bx lr // branch and exchange back to link reg

// needed to access data outside of text section
var0_addr : .word var0
var1_addr : .word var1
