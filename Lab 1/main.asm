		.data
		.align 4
x_array:	.word	0x24,0x12,0x05,0x66,0x12,0x01,0x08,0x14		//initializes an array of words named x_array and assigns them the values listed in hex
y_array:	.word	0x12,0x33,0x21,0x0A,0x15,0x11,0x25,0x99		//initializes an array of words named y_array and assigns them the values listed in hex
sum_array:	.space	32		//Allocate 32 bytes of space for the variable sum_array

		.text
		.global main

main:		nop
		ldr		r0, =x_array      	//loads r0 with the address of the x_array
		ldr		r1, =y_array 		//loads r1 with the address of the y_array
		ldr		r2, =sum_array		//loads r2 with the address of the sum_array
		mov		r3, #0				//Assigns r3 with the value 0 
loop:
		cmp		r3, #8				//Compares the value in r3 (0) with 8 
		bge		stop				//If r3>= 8, break/stop the loop
		ldr		r4, [r0]			//load content of the memory location stored in r0 (the x_array) into r4
		ldr		r5, [r1]			//load content of the memory location stored in r1 (the y_array) into r5
		add		r4, r4,	r5			//Add the contents that are contained in r4 and r5 and store them in r4
		str		r4, [r2]			//store r4 into the memory address contained in r2 (the sum_array)

		add		r0, r0, #4			//add 4 to r0 and store the result in r0 (this increments r0 to contain the memory location of the next word in x_array)
		add		r1, r1, #4			//add 4 to r1 and store the result in r1 (this increments r1 to contain the memory location of the next word in y_array)
		add		r2, r2, #4			//add 4 to r2 and store the result in r2 (this increments r2 to contain the memory location of the next word in sum_array)
		add		r3, r3, #1			//add 1 to r3 and store the result in r3 (this will eventually stop the loop when r3 >= 8)
		b		loop
stop:
		nop							//this is the end of the program
		b		stop
