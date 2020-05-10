
// Data Section
//   - Meant for variables
.data

// 4-byte aligned var
.balign 4
var0:
	.word 0

.balign 4
var1:
	.word 0


// Code Section
//   - bleh
.text

.balign 4 // ensure code is 4-byte aligned
.global main

main:
  // store values in r0,r1
	ldr r0, var0_addr // r0 <- &var0
	mov r2, #3        // r2 <- 3
  str r2, [r0]      // *r0 <- r2
  ldr r1, var1_addr // r1 <- &var1
  mov r3, #4        // r3 <- 4
  str r3, [r1]      // *r1 <- r3

  // load values from r0,r1
  ldr r0, var0_addr // r0 <- &var0
	ldr r0, [r0] 			// r0 <- *r0
	ldr r1, var1_addr // r1 <- &var1
	ldr r1, [r1]			// r1 <- *r1
	add r0, r1 // r0 += r1
	bx lr // branch and exchange back to link reg

// needed to access data outside of text section
var0_addr : .word var0
var1_addr : .word var1
