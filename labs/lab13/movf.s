
.global main
main:
	vmov s2, s3		// s2 <- s3
	vmov s2, r3		// s2 <- r3
	vmov r4, s5		// r4 <- s5

	vmov s2, s3, r4, r10 	// s2 <- r4 , s3 <- r10

	// double precision reg
	vmov d3, r1, r2 		// lower32(d3) <- r1
							// upper32(d3) <- r2
	vmov r1, r2, d4			// r1 <- lower32(d4)
							// r2 <- upper32(d4)
