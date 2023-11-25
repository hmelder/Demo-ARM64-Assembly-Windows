	.text
	.def	"@feat.00";
	.scl	3;
	.type	0;
	.endef
	.globl	"@feat.00"
.set "@feat.00", 0
	.file	"main.c"
	.def	func;
	.scl	2;
	.type	32;
	.endef


.globl	func
.p2align	2
func:
	.seh_proc func

	sub	sp, sp, #16
	.seh_stackalloc	16

	.seh_endprologue

	mov	x8, x0
	str	x8, [sp, #8] // Save pointer to struct on stack
	mov	x8, #5
	str	x8, [x0] 	 // Store changed value in parameter area

	.seh_startepilogue

	add	sp, sp, #16
	.seh_stackalloc	16

	.seh_endepilogue

	ret
	.seh_endfunclet
	.seh_endproc

.def	main;
.scl	2;
.type	32;
.endef
.globl	main
.p2align	2
main:
	.seh_proc main
	sub	sp, sp, #96
	.seh_stackalloc	96
	str	x30, [sp, #80] // Store link register on stack
	.seh_save_reg	x30, 80
	.seh_endprologue

	mov	w8, wzr
	str	w8, [sp, #12]
	str	wzr, [sp, #76]

	str	xzr, [sp, #48] // a
	str	xzr, [sp, #56] // b
	str	xzr, [sp, #64] // c

	// Create a copy of the structure for argument passing
	ldr	q0, [sp, #48] // Load a and b from stack
	add	x0, sp, #16 // x0 now points to copy of struct on stack (First argument)
	str	q0, [sp, #16] // Store copy of a and b at sp + 16
	ldr	x8, [sp, #64] // Load c
	str	x8, [sp, #32] // Store copy of c at sp + 32

	bl	func

	ldr	w0, [sp, #12]

	.seh_startepilogue

	ldr	x30, [sp, #80]
	.seh_save_reg	x30, 80

	add	sp, sp, #96
	.seh_stackalloc	96

	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc

.addrsig
.addrsig_sym func
