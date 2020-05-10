/* -- lab.s */
.data
 
message1: .asciz "Type a number: "
format:   .asciz "%d"
message2: .asciz "The factorial of %d is %d\n"
 
.text
 
factorial:
    push {r4, lr}	   /* push r4 and lr onto the stack */
    mov r4, r0
    cmp r0, #0         /* compare r0 and 0 */
    bne is_nonzero     /* branch to is_nonzero previous statement is not equal */
    mov r0, #1         /* mov #1 into r0*/
    b end          	   /* branch to end*/
is_nonzero:
    sub r0, r0, #1     /* r0-1 is saved into r0. This is the n-1 step for factorials */
    bl factorial      /* branch and linkto factorials*/
    mov r1, r4       /* load address of stack pointer into r1 */
    mul r0, r0, r1     /* multiple r0 with r1 and save into r0.  */
 
end:
    pop {r4, lr}
    bx lr              /* Leave factorial */
 
.global main
main:
    str lr, [sp,#-4]!            /* push the link register(r14) onto the stack pointer */
    sub sp, sp, #4               /* add space to the stack pointer for the printf on next instruction */
    ldr r0, address_of_message1  /* load address of message to r0*/
    bl printf                    /* Call printf and print the items from previous instructions*/
 
    ldr r0, address_of_format    /* load address of format into r0. This is the format for scanf */
    mov r1, sp                   /* mov the sp to r1 so scanf can use */
    bl scanf                     /* Call scanf */
 
    ldr r0, [sp]                 /* Load the integer read by scanf into r0 */
    bl factorial                 /* call factorial uses value loaded previously*/
 
    mov r2, r0                   /* mov r0 into r2. r0 contains the value of factorial */
    ldr r1, [sp]                 /* Load the integer read by scanf into r1 */
    ldr r0, address_of_message2  /* put the address containing message2 to r0. Known as load*/
    bl printf                    /* Call printf */
 
 
    add sp, sp, #+4              /* remove integer from sp*/
    ldr lr, [sp], #+4            /* Pop the top of the stack and put it in lr */
    bx lr                        /* Leave main */
 
address_of_message1: .word message1
address_of_message2: .word message2
address_of_format: .word format
