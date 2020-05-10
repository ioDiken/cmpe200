.data
 
.balign 4
a: .skip 400
.balign 4
b: .skip 400
.balign 4
c: .skip 400

.text 
.global main
main:
    ldr r1, addr_of_a       /*load address of a into r1 */
    ldr r3, addr_of_b
    ldr r4, addr_of_c
    mov r2, #0              /* mov 0 into r2 */
    b pre_indexing
naive_way:
    cmp r2, #100            /* compare with max number(100) and r2 */
    beq end                 /* If previous true, go to end */
    add r3, r1, r2, LSL #2  /* r2*4(because 4 bytes) + r1 and save to r3 */
    str r2, [r3]            /* store r2 into memory r3. equivalent to a[i] where i is r2 */
    add r2, r2, #1          /* increment r2 by 1*/
    b naive_way                  /* return to top */

post_indexing:
    cmp r2, #100            /* compare with max number(100) and r2  */
    beq end                 /* If previous true, go to end  */
    str r2, [r3], #4        /* r2 into r3*. Once completed, r3+4 and put back into r3 */
    add r2, r2, #1          /* r2 ← r2 + 1 */
    b post_indexing         /*return to top */

pre_indexing:
    cmp r2, $100
    beq end
    ldr r2, [r4, #+12]!  /* add r4 with 12, then place back into r4. Store *r4 into r2*/
    add r2, r2, r2       /* times r2*2 and save to r2. Adding itself is equivalent to multiple */
    str r2, [r4]         /* store value of r2 into *r4 */
    b pre_indexing

structure:
    ldr r2, [r1, #+4]!  /* put r1+4 into r1, then save address of r1 to 42 */
    add r2, r2, #7     /* increment address of r2 by 7 */
    str r2, [r1]       /* store address of r2 to address of r1 */

end:
    mov r0, r4
    bx lr

addr_of_a: .word a
addr_of_b: .word b
addr_of_c: .word c
