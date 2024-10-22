.data
	.align 4
	stack_Sim_EA: .space 80


.text


	.global main
main:
//---------  Empty Ascending stack setup -----------
		ldr r0, =stack_Sim_EA   // r0 is the pointer for stack simulation

//---------- Test --------------------------------
		mov r2, #5
		bl stackSim_EA_PUSH
		mov r2, #10
	 	bl stackSim_EA_PUSH
		mov r2,#114
		bl stackSim_EA_PUSH
		mov r2,#232
		bl stackSim_EA_PUSH
		mov r2,#86
		bl stackSim_EA_PUSH
		mov r2,#30
		bl stackSim_EA_PUSH
		bl stackSim_EA_POP
		bl stackSim_EA_POP
		bl stackSim_EA_POP
		bl stackSim_EA_POP
		b	stop

//---------  Empty Ascending stack ----------

stackSim_EA_PUSH:
	str r2, [r0]		// Store r2 in the address contained in r0
	add r0, #4		// Increment the pointer to the address  (to point to an empty address in the stack)
	bx  lr			// Return to where the subroutine was called

stackSim_EA_POP:
	sub r0, #4		// Increment the pointer to the address (to point to the last filled address in the stack)
	ldr r2, [r0]		// Load r2 with what is contained in the address in r0
	bx  lr			// Return to where the subroutine was called



stop:	nop
		b 		stop
		.end


