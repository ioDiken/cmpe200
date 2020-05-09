/*lab.s*/

.text
.global main
main: 
    mov r1, #131 /* move 131 into r1 */
    mov r1, r1, LSL #1 /* move r1*2 into r1, 131*2 = 262 */
    mov r1, r1, LSL #2 /* move r1 * 4 into r1, 262*(2^2)=1048 */
    mov r1, r1, ASR #3 /* move r1/(2^3) into r1. we are back to 131 */
    add r1, r1, r1, LSL #1 /* r1*2+r1 == 3*r1 which is 131 *3 => 393 into r1*/
    mov r1, r1, ROR #3 /*rotate r1 to the right 3 times, and save to r1. r1 is 933 */
    mov r0, r1
    bx lr 
