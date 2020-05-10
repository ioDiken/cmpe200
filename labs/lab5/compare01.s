
// Code Section
//   - bleh
.text
.global main
main:
	mov r1, #1
	mov r2, #1
	cmp r1, r2 // update flags
	beq equal
different:
	mov r0, #1
	b end
equal:
	mov r0, #2
end:
	bx lr
