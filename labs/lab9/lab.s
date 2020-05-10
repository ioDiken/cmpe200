/* -- lab.s */
.data
 
/* Message requesting user to ender number */
.balign 4
message1: .asciz "Please type a number"
 
/* Output */
.balign 4
message2: .asciz "%d times 5 is %d\n"
 
/* how a number will be scanned */
.balign 4
scan_pattern : .asciz "%d"
 
/* Allocating space for each of the items scanned */
.balign 4
number_read: .word 0
 
.balign 4
return: .word 0
 
.balign 4
return2: .word 0
 
.text
 
/*
mult_by_5 function
*/
mult_by_5: 
    ldr r1, address_of_return2       /* load return address into r1. */
    str lr, [r1]                     /* store value of lr into the value of r1 */
 
    add r0, r0, r0, LSL #2           /* times r0 by 4(done by shifting left twice), then add to r0 and save into r0. Increment to next byte basically */
 
    ldr lr, address_of_return2       /* put the return address into linker register */
    ldr lr, [lr]                     /* put value of linker register into linker register */
    bx lr                            /* return from main */
address_of_return2 : .word return2
 
.global main
main:
    ldr r1, address_of_return        /* store return address into r1 */
    str lr, [r1]                     /* link register value goes into *r1 */
 
    ldr r0, address_of_message1      /* place address of message 1 into r0 */
    bl printf                        /* call to printf */
 
    ldr r0, address_of_scan_pattern  /* load address of &scan_pattern into r0*/
    ldr r1, address_of_number_read   /* load address of number read to r1 */
    bl scanf                         /* call to scanf */
 
    ldr r0, address_of_number_read   /* load address of number read into r0 */
    ldr r0, [r0]                     /* load value of r0 into r0 */
    bl mult_by_5
 
    mov r2, r0                       /* mov r0 into r2  */
    ldr r1, address_of_number_read   /* load number_read's address into r1 */
    ldr r1, [r1]                     /* load value of the address of r1 into r1 */
    ldr r0, address_of_message2      /* load address of message into r0 */
    bl printf                        /* call to printf */
 
    ldr lr, address_of_return        /* load address of return into linker register */
    ldr lr, [lr]                     /* load value of linker register into the actual value of linker register */
    bx lr                            /* return from main */
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_scan_pattern : .word scan_pattern
address_of_number_read : .word number_read
address_of_return : .word return
 
/* External */
.global printf
.global scanf
