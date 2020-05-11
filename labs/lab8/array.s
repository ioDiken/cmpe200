/* -- array.s */
.data
 
.balign 4
a: .skip 400


.text
 
.global main
main:
    ldr r1, addr_of_a       /* load the address of a into r1 */
    mov r2, #0              /* mov value of 0 into r2 */
loop:
    cmp r2, #100            /* compare i with 100 */
    beq end                 /* if equal, go to end */
    str r2, [r1, +r2, LSL #2] 	/* r2 shift left, times r2 by 2 basically, and add r2. Store address of r2 into that address */
    add r2, r2, #1          /* r2 is added with 1 and saved into r2*/
    b loop                  /* branch to the loop */
end:
    bx lr
addr_of_a: .word a
