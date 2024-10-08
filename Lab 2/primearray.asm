//
// Insert your data here
//
		.data
		.align 4
primearray:			.space 80			//Initializes pirme array to have 20 4-bit spaces (to hold prime numbers)




//
// Start of ComputePrimes function
//
        .text
        .global		ComputePrimes
        .func		ComputePrimes

ComputePrimes:

//
// Save registers
//

        push		{r0,r1,r2,r3,r4,r5,r6,r7}
        mov 		r4, lr
        push		{r4}

//
// Insert your code to compute the first 20 prime numbers here.
//

main:
		nop
		ldr		r6, =primearray			//Loads r1 and r2 with the addresses of x and y, and then the values contained in those addresses
		mov		r1, #3
		mov		r2, #0

loop1:
		cmp 	r2, #20
		bge 	done
		mov 	r3, #1
		mov 	r7, #0
		mov 	r0, r1
		mov 	r5, #2

loop2:
		cmp 	r0, #2
		blt 	loop3
		sub 	r0, #2
		add 	r7, #1
		b 		loop2

loop3:
		mov r4, r7
		cmp r5, r4
		bge if2
		mov r7, #0
		mov r0, r1

loop4:
		cmp r0, r5 //r0 is remainder, r5 is j
		blt if1
		sub r0, r5
		add r7, #1
		b 	loop4

if1:
		cmp r0, #0
		bne else1
		mov r3, #0
		add r5, #1
		b 	loop3

else1:
		add r5, #1
		b	loop3

if2:
		cmp r3, #1
		bne else2
		str r1, [r6]
		add r6, #4
		add r1, #2
		add r2, #1
		b	loop1

else2:
		add r1, #2
		b loop1


//
// End of ComputePrimes function
//

done:	pop			{r4}
        mov			lr, r4
        pop			{r0,r1,r2,r3,r4,r5,r6,r7}
        bx			lr
