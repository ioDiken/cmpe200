
.global main
main:
	vldr s1, [r0]			// s1 <- *r0
	vldr s2, [r0, #4]		// s2 <- *(r0+4)

	vstr s10, [r1]			// *r1 <- s10
	vstr s10, [r1, #4]		// *(r1+4) <- s10
