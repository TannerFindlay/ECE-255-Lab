		.data
		.align 4
x:			.word	0x000B			//Initializes x and y (this is where you insert values)
y:			.word	0x0003

		.text
		.global main

main:		nop
		ldr		r1, =x				//Loads r1 and r2 with the addresses of x and y, and then the values contained in those addresses
		ldr		r1, [r1]
		ldr		r2, =y
		ldr		r2, [r2]
		mov		r3, #0				//Assigns r3 and with the value 0
		mov		r4, r1				//Assigns r4 with the value in r1
if:
		cmp		r2, #0				//If the denominator (in r2) is equal to 0, end the program
		beq		stop
loop:
		cmp		r4, r2				//Compares the value in r4 with the value in r2
		blt		stop				//If r4(the counter) >= r2(your y-value), break/stop the loop
		sub		r4, r2				//Subract value in r2 from the value currently in r4 and place result back in r4 (sub loop to imitate division)
		add		r3, #1				//Increment r3 by 1 (counter incrementation) NOTE:r4 holds the remainder and r3 holds the quotient
		b		loop
stop:
		nop							//This is the end of the program
		b		stop
