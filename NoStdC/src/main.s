.text // Start of the text section

/* We use .def and .endef respectively, to define and
 * and end the definition and properties of a symbol.
 *
 * For more information about GAS assembler directives
 * see: https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_7.html
 *
 * Safe Structured Exception Handling
 *
 * This feature creates a read-only table of
 * all exception handlers, that are verified against
 * the entry points at runtime. (See:
 * https://www.tortall.net/projects/yasm/manual/html/objfmt-win32-safeseh.html)
 *
 * Every object file must contain a special symbol
 * named "@feat.00" in order for the table to be
 * generated.
 *
 * See the definition below:
 */
.def	"@feat.00"; // Special Symbol for SSEH

/* .scl is a COFF specific directive specifying the
 * "storage class" of the symbol.
 * (See:
 * https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#storage-class)
 *
 * In this case, the storge class is IMAGE_SYM_CLASS_STATIC (3).
 * Description from MS documentation:
 * The offset of the symbol within the section. If the Value field is zero, then
 * the symbol represents a section name.
 */
	.scl	3; // Storage Class

/* .type is COFF specific and specifies the type of the symbol entry.
 * (See:
 * https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#type-representation)
 *
 * The type is a two-byte value.
 *
 * IMAGE_SYM_TYPE_NULL (0): No type information or unknown base type.
 */
	.type	0; // Symbol Type
.endef
.globl	"@feat.00" // Make the symbol visible to the linker
.set "@feat.00", 0 // Set the Storage Class to 0: Symbol represents a section name.


.file	"main.c" // Mark the following code as originating from main.c

.def	main; // Define the main symbol
	.scl	2; // IMAGE_SYM_CLASS_EXTERNAL
	.type	32; // 32 = 0x20. Most significant byte is 2, thus IMAGE_SYM_DTYPE_FUNCTION
.endef
.globl	main // Mark main as global

/*
 * .p2align aligns the next section of code or data on a 2^N byte boundary,
 * where N is the number given. For example, .p2align 2 aligns on a 4-byte
 * boundary (since 2^2 = 4).
 */
.p2align	2

main:
/* .seh_proc
*
* Part of Windows Structured Exception Handling (SEH).
* Initiates the definition of a function/procedure, informing the SEH mechanism of the
* function's start for proper stack unwinding and exception handling.
*/
.seh_proc main

	sub	sp, sp, #32 // Reserve 32 bytes on the stack by substracting from stack pointer (sp)

	.seh_stackalloc	32 // Help SEH to keep track of stack space allocation
	.seh_endprologue // Ends the function prologue (reserving stack for local variables, stack alignment, etc.)

	mov	w8, w0 // Backup w0 into w8
	mov	w0, wzr // Set 0 as ret value (x0 is the register for integer return values (w0 the 32-bit version))

	str	wzr, [sp, #28] // Set (sp + 28) to 0
	str	x1, [sp, #16] // Store x1 (second parameter) into sp + 16
	str	w8, [sp, #12] // Copy lower 4 bytes of the first parameter into sp + 12

	/* Resulting Stack:
	 * (lldb) register read
     * General Purpose Registers:
     * x0 = 0x0000000000000000
     * x1 = 0x0000018272206610
	 * ...
	 * x8 = 0x0000000000000001
	 * sp = 0x00000059feeff810
	 *
	 * (lldb) memory read --size 4 --format x --count 32 0x00000059feeff810
	 * 0x59feeff810: 0xfeeff830 0x00000059 0x5d984990 0x00000001
	 * 0x59feeff820: 0x72206610 0x00000182 0x5d9f5000 0x00000000
	 */

	.seh_startepilogue // Start function epilogue

	add	sp, sp, #32 // "Deallocate"/Add the 32 bytes previously reserved

	/* Presumably notifies SEH of deallocation. TODO: Why is this the same directive
	* as in the prologue? */
	.seh_stackalloc	32 
	.seh_endepilogue // End function epilogue

	ret
	/* Marks the end of a funclet within the function. In this context, it seems
	 * to be marking the end of the main function body. */
	.seh_endfunclet 

	.seh_endproc // End of the SEH procedure

	/* LLVM Extension
	 * See:
	 * https://llvm.org/docs/Extensions.html#sht-llvm-addrsig-section-address-significance-table
	 */
	.addrsig
