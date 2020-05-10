%macro TEST 0
%endmacro

.global main // entry point of program, must be global for C runtime to call, otherwise linking will fail

main:
	mov r0, #3 // put 2 inside r0
	%ifdef TEST
	mov r1, #4 // put 4 inside r1
	%else
	mov r1, #1 // put 4 inside r1
	%endif
	add r0, r0, r1
	bx lr // branch and exchange back to link reg

