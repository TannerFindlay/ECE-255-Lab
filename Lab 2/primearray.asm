//
// Insert your data here
//
		.data
		.align 2
primearray:			.space 40			//Initializes prime array to have 20 4-bit spaces (to hold prime numbers)




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

//r1 is i
//r2 is n
//r3 is prime
//r4 is limit
//r5 is j
//r6 is the address of primearray
//r7 is the quotients
//r0 is the remainders


main:
			nop
		ldr		r6, =primearray		//load the address of primearray into r6
		mov		r1, #3				//move #3 into r2, and #0 into r3
		mov		r2, #0

loop1:						//BIG MAIN LOOP
		cmp 	r2, #20				//if r2(n) >= #20, go to done
		bge 	done
		mov 	r3, #1				//move #1 into r3, #0 into r7, r1 into r0, and #2 into r5
		mov 	r7, #0
		mov 	r0, r1
		mov 	r5, #2

loop2:						//Divide i by 2 to calculate limit
		cmp 	r0, #2				//if r0 < 2, go to loop3
		blt 	loop3
		sub 	r0, #2				//subtract #2 from r0, keep in r0
		add 	r7, #1				//add #1 to r7, keep in r7
		b 		loop2				//repeat loop 2

loop3:						//Going through each number >2 and <limit to see if i is divisible by any of them
		mov 	r4, r7				//move r7 into r4 (the value for limit (quotient of loop2) into the 'limit' register)
		cmp 	r5, r4				//if r5 >= r4, go to if2
		bge 	if2
		mov 	r7, #0
		mov 	r0, r1

loop4:
		cmp 	r0, r5 				//r0 is remainder, r5 is j
		blt 	if1
		sub 	r0, r5
		add 	r7, #1
		b 		loop4

if1:
		cmp		r0, #0
		bne 	else1
		mov 	r3, #0
		add 	r5, #1
		b 		loop3

else1:
		add 	r5, #1
		b		loop3

if2:
		cmp 	r3, #1
		bne 	else2
		str 	r1, [r6]
		add 	r6, #4
		add 	r1, #2
		add 	r2, #1
		b		loop1

else2:
		add 	r1, #2
		b 		loop1


//
// End of ComputePrimes function
//

done:	pop			{r4}
        mov			lr, r4
        pop			{r0,r1,r2,r3,r4,r5,r6,r7}
        bx			lr
