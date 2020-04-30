.global main // entry point of program, must be global for C runtime to call, otherwise linking will fail

main:
	mov r0, #2 // put 2 inside r0
	bx lr // branch and exchange back to link reg