
.global main
main:
	vadd.f32 s1, s2, s3 	// s1 <- s2+s3 (scalar operation)
	vadd.f32 s1, s8, s15 	// ^
	// {s8,s10,s12,s14} <- {s16,s18,s20,s22} + {s24,s26,s28,s30}
	vadd.f32 s8, s16, s24 // vectorial since rd & rs2 are not in bank 0
	// {s10,s12,s14,s8} <- {s16,s18,s20,s22} + {s24,s26,s28,s30}
	vadd.f32 s10, s16, s24 // vectorial, wraparound inside the bank
	// {s8,s10,s12,s14} <- {s16,s18,s20,s22} + {s3,s3,s3,s3}
	vadd.f32 s8, s16, s3 // scalar expanded since rs2 in bank 0
