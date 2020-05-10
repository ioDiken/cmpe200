
.global main
main:
	mov r0, #7				// r0 <- 0b111
	mov r0, r0, LSL #16		// r0 << 16
	vmrs r1, fpscr			// r1 <- fpscr
	orr r0, r0, r1			// r0 <- r0 | r1
	vmsr fpscr, r0			// fpscr <- r0
							// modify len to 8
