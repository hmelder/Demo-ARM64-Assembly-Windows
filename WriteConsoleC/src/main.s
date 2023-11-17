// See NoStdC/src/main.s for a detailed explaination of the first 14 lines
	.text
	.def	"@feat.00";
	.scl	3;
	.type	0;
	.endef
	.globl	"@feat.00"
.set "@feat.00", 0
	.file	"main.c"
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main
	.p2align	2

// Begin main function
main:
.seh_proc main
	sub	sp, sp, #64 // Reserve 64 bytes on stack
	.seh_stackalloc	64 // Inform seh about stack alloc

	/* 
	 * x30 is the link register (LR) which holds the return address
	 * for the function call.
	 *
	 * We save this register on the stack, as we need to preserve
	 * the return address.
	 */
	str	x30, [sp, #48]
	.seh_save_reg	x30, 48 // Inform seh about the register spill
	.seh_endprologue // Mark end of function prologue

	// Save arguments to stack
	mov	w8, wzr
	str	w8, [sp, #44]
	str	x1, [sp, #32]
	str	w0, [sp, #28]
	
	/* `__imp_` prefix is specific to the Windows platform and
	 * denotes an imported symbol (typically from a DLL).
	 * `__imp_<SYM_NAME>` points to the imported symbol for <SYM_NAME>.
	 *
	 * The pointer to the imported symbol is stored in a section of the
	 * PE object file, called the Import Address Table, where imported
	 * addresses are grouped into a linear array.
	 *
	 * There is a good inofficial blog post about the `__imp_` prefix:
	 * https://dennisbabkin.com/blog/?t=intricacies-of-microsoft-compilers-the-case-of-the-curious-__imp_
	 *
	 * Note that Microsoft does not fully document this behaviour.
	 */
	
	// Get the start of a 4KB page containing the address of symbol: __imp_GetStdHandle
	adrp	x8, __imp_GetStdHandle

	/* x8 now contains 63:12 of the absolute address
	 * Continue by adding the lower 12 bits to x8 and
	 * loading the contents at x8 into x8
	 */
	ldr	x8, [x8, :lo12:__imp_GetStdHandle]

	// void * GetStdHandle (unsigned long nStdHandle)
	// First argument: STD_OUTPUT_HANDLE = 0xfffffff5
	mov	w0, #-11                        // =0xfffffff5
	
	// branch to address by setting PC = x8 and x30 = PC + 4 (return address)
	blr	x8

	// Save return value (x0) to sp+16
	str	x0, [sp, #16]
	// Load saved return value into x8
	ldr	x8, [sp, #16]

	/* Note that we now compare the return value with INVALID_HANDLE_VALUE,
	 * which is resolves to -1
	 *
	 * We add 1 with x8 = x8 + 1 with adds which performs an addition
	 * and sets the condition flags for later branching.
	 */
	adds	x8, x8, #1
	// if non-zero
	b.ne	.LBB0_2
	// else (meaning == INVALID_HANDLE_VALUE)
	b	.LBB0_1
.LBB0_1:
	mov	w8, #1                          // =0x1
	str	w8, [sp, #44]
	b	.END
.LBB0_2:
	// Load 63:12 of the pointer to the char array
	// Symbol is the mangled string
	adrp	x8, "??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@"
	// Add lower 12-bits to address in x8 and save into x8
	add	x8, x8, :lo12:"??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@"

	// Store x8 into sp + 8
	str	x8, [sp, #8]
	// Load address into x0 (First arg for strlen)
	ldr	x0, [sp, #8]

	// Branch to strlen
	bl	strlen

	mov	w2, w0
	// Load pointer to char array into x1
	ldr	x1, [sp, #8]
	// Load handle into x0
	ldr	x0, [sp, #16]

	// Resolve WriteConsole
	adrp	x8, __imp_WriteConsoleA
	ldr	x8, [x8, :lo12:__imp_WriteConsoleA]

	add	x3, sp, #4
	mov	x4, xzr

	// Branch to WriteConsole
	blr	x8

	// Save result onto stack
	str	w0, [sp]
	// Load result into w8
	ldr	w8, [sp]

	// Conditional Branch not-zero
	cbnz	w8, .LBB0_4
	b	.LBB0_3
.LBB0_3:
	// Move immediate into w8
	mov	w8, #1                          // =0x1
	// Store w8 into sp + 44
	str	w8, [sp, #44]
	b	.END
.LBB0_4:
	// Zero w8 register
	mov	w8, wzr
	// Store w8 into sp + 44
	str	w8, [sp, #44]
	b	.END
.END:
	// Load return value
	ldr	w0, [sp, #44]

	// Mark SEH epilogue
	.seh_startepilogue
	// Load stored return address
	ldr	x30, [sp, #48]
	.seh_save_reg	x30, 48

	// Dealloc reserved stack
	add	sp, sp, #64
	.seh_stackalloc	64
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc


/* Read-only Section
 *
 * "dr": These are flag options for the section. d indicates that this section
 * contains data, and r signifies that the data is read-only.
 *
 * Mark section as discard_ed, if it is not referenced.
 */
.section	.rdata,"dr",discard,"??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@"
	// Mark global
	.globl	"??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@" // @"??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@"
	// Aligns the next data on a boundary. 3 means aligning on 2^3 = 8 bytes boundary.
	.p2align	3, 0x0
	// The label to the string
"??_C@_0N@GCDOMLDM@Hello?5World?$CB?$AA@":
	// Zero-terminated ASCII string
	.asciz	"Hello World!"

// .drectve section used to store linker directive on MSVC
// "yni" are additional flags
.section	.drectve,"yni"
	.ascii	" /DEFAULTLIB:uuid.lib"
	.ascii	" /DEFAULTLIB:uuid.lib"
	.addrsig
	.addrsig_sym strlen
