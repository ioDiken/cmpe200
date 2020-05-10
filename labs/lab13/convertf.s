
.global main
main:
	vcvt.f64.f32 d0, s0		// s0 float to double, store in d0
	vcvt.f32.f64 s0, d0		// d0 double to float, store in s0

	vmov s0, r0				// bitwise copy of r0 to s0
	vcvt.f32.s32 s0, s0		// signed int to float

	vmov s0, r0
	vcvt.f32.u32 s0, s0		// uint to float

	vmov s0, r0
	vcvt.f64.s32 d0, s0		// signed int to double

	vmov s0, r0
	vcvt.f64.u32 d0, s0		// uint to double
