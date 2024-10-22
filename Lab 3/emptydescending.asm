.data
	.align 4
	stack_Sim_ED: .space 80


.text


	.global main
main:
//---------  Empty descending stack setup -----------
		ldr r0, =stack_Sim_ED   // r0 is the pointer for stack simulation
		add r0, #80				// Since it is full descending stack

//---------- Test --------------------------------
		mov r2, #5
		bl stackSim_ED_PUSH
		mov r2, #10
	 	bl stackSim_ED_PUSH
		mov r2,#114
		bl stackSim_ED_PUSH
		mov r2,#232
		bl stackSim_ED_PUSH
		mov r2,#86
		bl stackSim_ED_PUSH
		mov r2,#30
		bl stackSim_ED_PUSH
		bl stackSim_ED_POP
		bl stackSim_ED_POP
		bl stackSim_ED_POP
		bl stackSim_ED_POP
		b	stop

//---------  Empty Descending stack ----------

stackSim_ED_PUSH:
	str r2, [r0]		// Store r2 in the address contained in r0
	sub r0, #4		// Increment the pointer to the address  (to point to an empty address in the stack)
	bx  lr			// Return to where the subroutine was called

stackSim_ED_POP:
	add r0, #4		// Increment the pointer to the address (to point to the last filled address in the stack)
	ldr r2, [r0]		// Load r2 with what is contained in the address in r0
	bx  lr			// Return to where the subroutine was called



stop:	nop
		b 		stop
		.end


