.text
.global main
main:
    mov r1, #123           /* mov immediate value 123 into r1 */
    mov r2, #0             /* mov #0 into r2 */
loop:
    cmp r1, #1             /* compare r1 and #1 */
    beq end                /* if equal , branch to end */
 
    and r3, r1, #1         /* and r1 with 1 */
    cmp r3, #0             /* compare r3 with #0 */
    bne odd                /* if r3 is not equal to 0, banch to odd */
even:
    mov r1, r1, ASR #1     /* divide r1 by 2 and save to r1 */
    b end_loop
odd:
    add r1, r1, r1, LSL #1 /* multiple r1 by 2 and add it with r1. Save to r1 */
    add r1, r1, #1         /* add r1 with 1 save to r1*/
 
end_loop:
    add r2, r2, #1         /* r2 ← r2 + 1 */
    b loop                 /* branch to loop */
 
end:
    mov r0, r2           /* move value of r2 to r0 */
    bx lr		/* return main */
