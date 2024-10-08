		.data
		.align 4
primearray:			.space 80			//Initializes pirme array to have 20 4-bit spaces (to hold prime numbers)

		.text
		.global main

main:		nop
		ldr	r6, =primearray			//Loads r1 and r2 with the addresses of x and y, and then the values contained in those addresses
		mov	r1, #3
		mov	r3, #2
		mov r4, #0 

prime:
		cmp r4, #20
		bge stop

loop

stop:
		nop							//This is the end of the program
		b		stop
