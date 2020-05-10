
// Code Section
//   - bleh
.text
.global main
main:
	mov r0, #1	// r0 <- 1
	b end // branch to end
	mov r0, #2  // r0 <- 2 (not executed, but in pipeline)
end:
	bx lr
