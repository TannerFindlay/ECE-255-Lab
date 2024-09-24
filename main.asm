	.data
	.align 4

		x: .word 0x0010
		y: .word 0x0014

	.text
	.global main
main:

	mov r4,#5
	mov r5,#4
	add r0, r4, r5
	add r7, r4, r0


	ldr r1,=x
	str r0, [r1]
	ldr r2,=y
	str r7, [r2]

stop: nop
	bl stop
