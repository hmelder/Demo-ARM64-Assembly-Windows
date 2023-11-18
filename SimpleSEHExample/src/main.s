	.text
	.def	"@feat.00";
	.scl	3;
	.type	0;
	.endef
	.globl	"@feat.00"
.set "@feat.00", 0
	.file	"main.c"
	.def	sprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,sprintf
	.globl	sprintf                         // -- Begin function sprintf
	.p2align	2
sprintf:                                // @sprintf
.seh_proc sprintf
// %bb.0:
	sub	sp, sp, #96
	.seh_stackalloc	96
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 32
	.seh_endprologue
	str	x7, [sp, #88]
	str	x6, [sp, #80]
	str	x5, [sp, #72]
	str	x4, [sp, #64]
	str	x3, [sp, #56]
	str	x2, [sp, #48]
	str	x1, [sp, #24]
	str	x0, [sp, #16]
	add	x8, sp, #48
	str	x8, [sp]
	ldr	x3, [sp]
	ldr	x1, [sp, #24]
	ldr	x0, [sp, #16]
	mov	x2, xzr
	bl	_vsprintf_l
	str	w0, [sp, #12]
	ldr	w0, [sp, #12]
	.seh_startepilogue
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 32
	add	sp, sp, #96
	.seh_stackalloc	96
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	vsprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,vsprintf
	.globl	vsprintf                        // -- Begin function vsprintf
	.p2align	2
vsprintf:                               // @vsprintf
.seh_proc vsprintf
// %bb.0:
	sub	sp, sp, #48
	.seh_stackalloc	48
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 32
	.seh_endprologue
	str	x2, [sp, #24]
	str	x1, [sp, #16]
	str	x0, [sp, #8]
	ldr	x4, [sp, #24]
	ldr	x2, [sp, #16]
	ldr	x0, [sp, #8]
	mov	x1, #-1                         // =0xffffffffffffffff
	mov	x3, xzr
	bl	_vsnprintf_l
	.seh_startepilogue
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 32
	add	sp, sp, #48
	.seh_stackalloc	48
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	_snprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_snprintf
	.globl	_snprintf                       // -- Begin function _snprintf
	.p2align	2
_snprintf:                              // @_snprintf
.seh_proc _snprintf
// %bb.0:
	sub	sp, sp, #112
	.seh_stackalloc	112
	str	x30, [sp, #48]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 48
	.seh_endprologue
	str	x7, [sp, #104]
	str	x6, [sp, #96]
	str	x5, [sp, #88]
	str	x4, [sp, #80]
	str	x3, [sp, #72]
	str	x2, [sp, #40]
	str	x1, [sp, #32]
	str	x0, [sp, #24]
	add	x8, sp, #72
	str	x8, [sp, #8]
	ldr	x3, [sp, #8]
	ldr	x2, [sp, #40]
	ldr	x1, [sp, #32]
	ldr	x0, [sp, #24]
	bl	_vsnprintf
	str	w0, [sp, #20]
	ldr	w0, [sp, #20]
	.seh_startepilogue
	ldr	x30, [sp, #48]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 48
	add	sp, sp, #112
	.seh_stackalloc	112
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	_vsnprintf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsnprintf
	.globl	_vsnprintf                      // -- Begin function _vsnprintf
	.p2align	2
_vsnprintf:                             // @_vsnprintf
.seh_proc _vsnprintf
// %bb.0:
	sub	sp, sp, #48
	.seh_stackalloc	48
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 32
	.seh_endprologue
	str	x3, [sp, #24]
	str	x2, [sp, #16]
	str	x1, [sp, #8]
	str	x0, [sp]
	ldr	x4, [sp, #24]
	ldr	x2, [sp, #16]
	ldr	x1, [sp, #8]
	ldr	x0, [sp]
	mov	x3, xzr
	bl	_vsnprintf_l
	.seh_startepilogue
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 32
	add	sp, sp, #48
	.seh_stackalloc	48
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	main                            // -- Begin function main
	.p2align	2

// int main(int argc, char *argv[])
main:
.Lfunc_begin0:
.seh_proc main
	.seh_handler __C_specific_handler, @unwind, @except

	// Reserve 48 bytes stack space (sp - 48)
	sub	sp, sp, #48
	.seh_stackalloc	48

	// x29 = Frame Pointer
	// x30 = Link Register
	stp	x29, x30, [sp, #16]
	.seh_save_fplr	16

	// fp = sp + 16
	add	x29, sp, #16
	.seh_add_fp	16
	.seh_endprologue

	mov	x0, #-2                         // =0xfffffffffffffffe
	stur	x0, [x29, #16]
	mov	w2, wzr // Zero-out w2
	stur	w2, [x29, #-4]
.Ltmp0:
	// Load 63:12 of pointer to RaiseException (IAT Lookup)
	adrp	x8, __imp_RaiseException
	// Load lower 12 bits and store address of RaiseException into x8
	ldr	x8, [x8, :lo12:__imp_RaiseException]

	// void RaiseException(unsigned long dwExceptionCode, unsigned long dwExceptionFlags,
    //              unsigned long nNumberOfArguments, const unsigned long long *lpArguments)

	// Construct EXCEPTION_INT_DIVIDE_BY_ZERO = 0xc0000094
	mov	w0, #148 // 0x94
	// 49152 = 0xC000 left-shifted by 16-bits (lsl #16)
	movk	w0, #49152, lsl #16

	// Zero-out fourth-argument (lpArguments)
	mov	x3, xzr
	// Zero-out w1 (second-argument) (w2 was zeroed prior)
	mov	w1, w2
	blr	x8 // Call RaiseException
.Ltmp1:
	b	.LBB4_4
.LBB4_1:
	stur	x0, [x29, #-16]                 // 8-byte Folded Spill
	b	.LBB4_2
.LBB4_2:
// Exception Handler `__except(EXCEPTION_EXECUTE_HANDLER) {`
$ehgcr_4_2:
	ldur	x0, [x29, #-16]                 // 8-byte Folded Reload
	mov	w8, w0
	stur	w8, [x29, #-8]

	// Load pointer to char array into x0
	adrp	x0, "??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@"
	add	x0, x0, :lo12:"??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@"

	bl	printf // Call printf

	b	.LBB4_3
.LBB4_3: // After exception handling
	// Load pointer to char array into x0
	adrp	x0, "??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@"
	add	x0, x0, :lo12:"??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@"

	bl	printf // Call printf
	mov	w0, wzr

	.seh_startepilogue
	// Load saved fp and lr from sp + 16
	ldp	x29, x30, [sp, #16]
	// Notify seh about reloading of fp, lr
	.seh_save_fplr	16

	add	sp, sp, #48 // Release reserved stack space
	.seh_stackalloc	48 // Notify seh about releasing stack space
	.seh_endepilogue
	ret
.LBB4_4:
	b	.LBB4_3
.Lfunc_end0:
	.seh_endfunclet

	// Marks the beginning of handler data section
	.seh_handlerdata

	// Number of call sites
	// Call sites are places in the function where exceptions could be thrown
	// Calculated by (end - begin)/16 (16-bytes is the size of one call site entry)
	.word	(.Llsda_end0-.Llsda_begin0)/16

.Llsda_begin0: // Begin call site entry
	// Range of try block
	// symbols are relative to the module base, indicated by @IMGREL.
	.word	.Ltmp0@IMGREL                   // LabelStart
	.word	.Ltmp1@IMGREL+1                 // LabelEnd

	// Action
	// TODO: Analyse behaviour of this word when changing handler
	.word	1                               // CatchAll

	// Exception Handler
	.word	.LBB4_1@IMGREL
.Llsda_end0: // End call site entry

// Text Segment
.text
.seh_endproc

    // -- End function
	.def	printf;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,printf
	.globl	printf                          // -- Begin function printf
	.p2align	2
printf:                                 // @printf
.seh_proc printf
// %bb.0:
	sub	sp, sp, #128
	.seh_stackalloc	128
	str	x30, [sp, #48]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 48
	.seh_endprologue
	str	x7, [sp, #120]
	str	x6, [sp, #112]
	str	x5, [sp, #104]
	str	x4, [sp, #96]
	str	x3, [sp, #88]
	str	x2, [sp, #80]
	str	x1, [sp, #72]
	str	x0, [sp, #40]
	add	x8, sp, #72
	str	x8, [sp, #24]
	ldr	x8, [sp, #24]
	str	x8, [sp, #16]                   // 8-byte Folded Spill
	ldr	x8, [sp, #40]
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	mov	w0, #1                          // =0x1
	bl	__acrt_iob_func
	ldr	x1, [sp, #8]                    // 8-byte Folded Reload
	ldr	x3, [sp, #16]                   // 8-byte Folded Reload
	mov	x2, xzr
	bl	_vfprintf_l
	str	w0, [sp, #36]
	ldr	w0, [sp, #36]
	.seh_startepilogue
	ldr	x30, [sp, #48]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 48
	add	sp, sp, #128
	.seh_stackalloc	128
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	_vsprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsprintf_l
	.globl	_vsprintf_l                     // -- Begin function _vsprintf_l
	.p2align	2
_vsprintf_l:                            // @_vsprintf_l
.seh_proc _vsprintf_l
// %bb.0:
	sub	sp, sp, #48
	.seh_stackalloc	48
	str	x30, [sp, #32]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 32
	.seh_endprologue
	str	x3, [sp, #24]
	str	x2, [sp, #16]
	str	x1, [sp, #8]
	str	x0, [sp]
	ldr	x4, [sp, #24]
	ldr	x3, [sp, #16]
	ldr	x2, [sp, #8]
	ldr	x0, [sp]
	mov	x1, #-1                         // =0xffffffffffffffff
	bl	_vsnprintf_l
	.seh_startepilogue
	ldr	x30, [sp, #32]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 32
	add	sp, sp, #48
	.seh_stackalloc	48
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	_vsnprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vsnprintf_l
	.globl	_vsnprintf_l                    // -- Begin function _vsnprintf_l
	.p2align	2
_vsnprintf_l:                           // @_vsnprintf_l
.seh_proc _vsnprintf_l
// %bb.0:
	sub	sp, sp, #112
	.seh_stackalloc	112
	str	x30, [sp, #96]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 96
	.seh_endprologue
	str	x4, [sp, #88]
	str	x3, [sp, #80]
	str	x2, [sp, #72]
	str	x1, [sp, #64]
	str	x0, [sp, #56]
	ldr	x8, [sp, #88]
	str	x8, [sp, #40]                   // 8-byte Folded Spill
	ldr	x8, [sp, #80]
	str	x8, [sp, #32]                   // 8-byte Folded Spill
	ldr	x8, [sp, #72]
	str	x8, [sp, #24]                   // 8-byte Folded Spill
	ldr	x8, [sp, #64]
	str	x8, [sp, #16]                   // 8-byte Folded Spill
	ldr	x8, [sp, #56]
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	bl	__local_stdio_printf_options
	ldr	x1, [sp, #8]                    // 8-byte Folded Reload
	ldr	x2, [sp, #16]                   // 8-byte Folded Reload
	ldr	x3, [sp, #24]                   // 8-byte Folded Reload
	ldr	x4, [sp, #32]                   // 8-byte Folded Reload
	ldr	x5, [sp, #40]                   // 8-byte Folded Reload
	ldr	x8, [x0]
	orr	x0, x8, #0x1
	bl	__stdio_common_vsprintf
	str	w0, [sp, #52]
	ldr	w8, [sp, #52]
	subs	w8, w8, #0
	cset	w8, ge
	tbnz	w8, #0, .LBB7_2
	b	.LBB7_1
.LBB7_1:
	mov	w8, #-1                         // =0xffffffff
	str	w8, [sp, #4]                    // 4-byte Folded Spill
	b	.LBB7_3
.LBB7_2:
	ldr	w8, [sp, #52]
	str	w8, [sp, #4]                    // 4-byte Folded Spill
	b	.LBB7_3
.LBB7_3:
	ldr	w0, [sp, #4]                    // 4-byte Folded Reload
	.seh_startepilogue
	ldr	x30, [sp, #96]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 96
	add	sp, sp, #112
	.seh_stackalloc	112
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.def	__local_stdio_printf_options;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,__local_stdio_printf_options
	.globl	__local_stdio_printf_options    // -- Begin function __local_stdio_printf_options
	.p2align	2
__local_stdio_printf_options:           // @__local_stdio_printf_options
// %bb.0:
	adrp	x0, __local_stdio_printf_options._OptionsStorage
	add	x0, x0, :lo12:__local_stdio_printf_options._OptionsStorage
	ret
                                        // -- End function
	.def	_vfprintf_l;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",discard,_vfprintf_l
	.globl	_vfprintf_l                     // -- Begin function _vfprintf_l
	.p2align	2
_vfprintf_l:                            // @_vfprintf_l
.seh_proc _vfprintf_l
// %bb.0:
	sub	sp, sp, #80
	.seh_stackalloc	80
	str	x30, [sp, #64]                  // 8-byte Folded Spill
	.seh_save_reg	x30, 64
	.seh_endprologue
	str	x3, [sp, #56]
	str	x2, [sp, #48]
	str	x1, [sp, #40]
	str	x0, [sp, #32]
	ldr	x8, [sp, #56]
	str	x8, [sp, #24]                   // 8-byte Folded Spill
	ldr	x8, [sp, #48]
	str	x8, [sp, #16]                   // 8-byte Folded Spill
	ldr	x8, [sp, #40]
	str	x8, [sp, #8]                    // 8-byte Folded Spill
	ldr	x8, [sp, #32]
	str	x8, [sp]                        // 8-byte Folded Spill
	bl	__local_stdio_printf_options
	ldr	x1, [sp]                        // 8-byte Folded Reload
	ldr	x2, [sp, #8]                    // 8-byte Folded Reload
	ldr	x3, [sp, #16]                   // 8-byte Folded Reload
	ldr	x4, [sp, #24]                   // 8-byte Folded Reload
	ldr	x0, [x0]
	bl	__stdio_common_vfprintf
	.seh_startepilogue
	ldr	x30, [sp, #64]                  // 8-byte Folded Reload
	.seh_save_reg	x30, 64
	add	sp, sp, #80
	.seh_stackalloc	80
	.seh_endepilogue
	ret
	.seh_endfunclet
	.seh_endproc
                                        // -- End function
	.section	.rdata,"dr",discard,"??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@"
	.globl	"??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@" // @"??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@"
	.p2align	3, 0x0
"??_C@_0CI@KGHEEAON@Caught?5an?5exception?5in?5__except?5@":
	.asciz	"Caught an exception in __except block.\n"

	.section	.rdata,"dr",discard,"??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@"
	.globl	"??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@" // @"??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@"
	.p2align	3, 0x0
"??_C@_0BN@OABMEGFA@After?5__try?9__except?5block?4?6?$AA@":
	.asciz	"After __try-__except block.\n"

	.lcomm	__local_stdio_printf_options._OptionsStorage,8,8 // @__local_stdio_printf_options._OptionsStorage
	.section	.drectve,"yni"
	.ascii	" /DEFAULTLIB:uuid.lib"
	.ascii	" /DEFAULTLIB:uuid.lib"
	.addrsig
	.addrsig_sym _vsnprintf
	.addrsig_sym __C_specific_handler
	.addrsig_sym printf
	.addrsig_sym _vsprintf_l
	.addrsig_sym _vsnprintf_l
	.addrsig_sym __stdio_common_vsprintf
	.addrsig_sym __local_stdio_printf_options
	.addrsig_sym _vfprintf_l
	.addrsig_sym __acrt_iob_func
	.addrsig_sym __stdio_common_vfprintf
	.addrsig_sym __local_stdio_printf_options._OptionsStorage
