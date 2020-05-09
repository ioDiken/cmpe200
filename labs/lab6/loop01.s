.text
.global main
main:
    mov r1, #0       /*move #0 into r1 */
    mov r2, #1       /* move #1 into r2 */
loop: 
    cmp r2, #22      /* compare r2 and 22 */
    bgt end          /* branch if r2 > 22 to end */
    add r1, r1, r2   /* add r1 with r2 and save to r1 */
    add r2, r2, #1   /* add r2 with 1 and save to r2 */
    b loop           /*returb back to loop and continue */
end:
    mov r0, r1       /* move r1 value to r0 */
    bx lr            /* return main */


/* 
Final notes:
   C equivalent:
   i = 0;
   j = 0;
   while (i < 22)
{
   j += i;
   i++;
}
*/
