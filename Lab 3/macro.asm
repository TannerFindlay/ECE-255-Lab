.macro	memorygenerate	destination, size
	mov		r0, #1			// Initialize counter
loop_begin\@:
	cmp 	r0, \size		// If r0 is greater than size, end the loop
	bgt 	loop_end\@
	str 	r0, [\destination]		// Store r0 in the address
	add 	\destination, #4		// Increment the address
	add 	r0, #1			// Increment r0 by 1
	b	loop_begin\@		// Repeat the loop
loop_end\@:
	.endm

	.data
	.align 4
myArray: 	.space 600


	.text
	.global main

main:
	ldr	r2, =myArray		// Load the address of myArray into r2
	mov	r3, #150		// Move #150 into r3
	memorygenerate r2,r3		// Insert the macro memory generate with the parameters r2 and r3

stop:	nop
		b 		stop
		.end
