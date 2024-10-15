//
// Insert your data here
//
		.data
		.align 4
primearray:			.space 80			//Initializes prime array to have 20 4-bit spaces (to hold prime numbers)




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
		mov 	r7, #0				//moves #0 into r7, resetting the 'quotient' to prepare for the next division (in loop 4)
		mov 	r0, r1				//moves r1 into r0, setting the 'remainder' value for the next divison (in loop 4)

loop4:						//Divide i by j to calculate i%j to be used in if1
		cmp 	r0, r5 				//if r0 (the remainder) < r5 (j, the denominator), go if1
		blt 	if1
		sub 	r0, r5				//subtract r5 (j) from r0 (remainder), and increment r7 (quotient) by 1
		add 	r7, #1
		b 		loop4				//repeat loop4

if1:						//Tests if the current value in r1 (i) is divisible by the current value in r5 (j)
		cmp		r0, #0				//if r0 (the remainder of the division in loop 4) != #0, then go to else1
		bne 	else1
		mov 	r3, #0				//move #0 into r3 (setting 'prime' indicator to 0, meaning the number in r1 (i) is not prime)
		add 	r5, #1				//increment r5 (j) by 1
		b 		loop3				//repeat loop 3

else1:						//Else case for if1
		add 	r5, #1				//increment r5 (j) by 1
		b		loop3				//repeat loop 3

if2:						//Tests if the current value in r3 ('prime indicator') is set to 1 or 0
		cmp 	r3, #1				//if r3 ('prime' indicator) != 1, go to else2
		bne 	else2
		str 	r1, [r6]			//stores the value in r1 (i) into the address stored in r6 (address of the current index of prime_array)
		add 	r6, #4				//increments the address stored in r6 (by 4) to point to the next index of prime_array
		add 	r1, #2				//increment r1 (i) by #2, as no even number above 2 will be prime
		add 	r2, #1				//increment r2 (n) by #1, signifying that one prime number has been stored in prime_array
		b		loop1				//repeat loop1

else2:						//Else case for if2
		add 	r1, #2				//increment r1 (i) by #2, as no even number above 2 will be prime
		b 		loop1				//repeat loop1


//
// End of ComputePrimes function
//

done:	pop			{r4}
        mov			lr, r4
        pop			{r0,r1,r2,r3,r4,r5,r6,r7}
        bx			lr
