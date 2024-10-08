		.data
		.align 4
x:			.word	0x0003			//Initializes x and y (this is where you insert values)
y:			.word	0x0096

		.text
		.global main

main:		nop
		ldr		r1, =x				//Loads r1 and r2 with the addresses of x and y, and then the values contained in those addresses
		ldr		r1, [r1]
		ldr		r2, =y
		ldr		r2, [r2]
		mov		r3, #0				//Assigns r3 and r4 with the value 0
		mov		r4, #0
loop:
		cmp		r4, r2				//Compares the value in r4 with the value in r2
		bge		stop				//If r4(the counter) >= r2(your y-value), break/stop the loop
		add		r3, r1				//Add r1 to r3 and keep in r3 (this adds the x-value to the result)
		add		r4, #1				//Add one to r4 and keep in r4 (increments the counter of the loop by 1)
		b		loop
stop:
		nop							//This is the end of the program
		b		stop
