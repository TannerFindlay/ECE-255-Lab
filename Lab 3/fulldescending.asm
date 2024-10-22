.data
	.align 4
	stack_Sim_FD: .space 80


.text


	.global main
main:
//---------  full descending stack setup -----------
		ldr r0, =stack_Sim_FD   // r0 is the pointer for stack simulation
		add r0, #84				// Since it is full descending stack

//---------- Test --------------------------------
		mov r2, #5
		bl stackSim_FD_PUSH
		mov r2, #10
	 	bl stackSim_FD_PUSH
		mov r2,#114
		bl stackSim_FD_PUSH
		mov r2,#232
		bl stackSim_FD_PUSH
		mov r2,#86
		bl stackSim_FD_PUSH
		mov r2,#30
		bl stackSim_FD_PUSH
		bl stackSim_FD_POP
		bl stackSim_FD_POP
		bl stackSim_FD_POP
		bl stackSim_FD_POP
		b	stop

//---------  full Descending stack ----------

stackSim_FD_PUSH:
	sub r0, #4		// Increment the pointer to the address  (to point to an empty address in the stack)
	str r2, [r0]		// Store r2 in the address contained in r0
	bx  lr			// Return to where the subroutine was called

stackSim_FD_POP:
	ldr r2, [r0]		// Load r2 with what is contained in the address in r0
	add r0, #4		// Increment the pointer to the address (to point to the last filled address in the stack)
	bx  lr			// Return to where the subroutine was called



stop:	nop
		b 		stop
		.end
