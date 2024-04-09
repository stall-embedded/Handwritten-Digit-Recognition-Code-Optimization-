	.arch armv7-a
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	timespec_subtract
	.type	timespec_subtract, %function
timespec_subtract:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, [r1, #4]
	ldr	r3, [r2, #4]
	stmfd	sp!, {r4, r5, r6, r7, r8}
	cmp	ip, r3
	blt	.L2
	ldr	r5, [r2]
.L3:
	rsb	ip, r3, ip
	mov	r4, #51712
	movt	r4, 15258
	cmp	ip, r4
	ble	.L4
	movw	r6, #12193
	movt	r6, 17592
	mov	r7, ip, asr #31
	smull	r8, ip, r6, ip
	rsb	ip, r7, ip, asr #28
	rsb	r5, ip, r5
	str	r5, [r2]
	mla	r3, r4, ip, r3
	str	r3, [r2, #4]
	ldr	ip, [r1, #4]
	rsb	ip, r3, ip
.L4:
	ldr	r3, [r1]
	str	ip, [r0, #4]
	rsb	r5, r5, r3
	str	r5, [r0]
	ldr	r0, [r1]
	ldr	r3, [r2]
	ldmfd	sp!, {r4, r5, r6, r7, r8}
	cmp	r0, r3
	movge	r0, #0
	movlt	r0, #1
	bx	lr
.L2:
	rsb	ip, ip, r3
	movw	r5, #12193
	movt	r5, 17592
	mov	r4, #13824
	mov	r7, ip, asr #31
	movt	r4, 50277
	smull	r6, ip, r5, ip
	ldr	r6, [r2]
	rsb	ip, r7, ip, asr #28
	add	ip, ip, #1
	add	r5, ip, r6
	str	r5, [r2]
	mla	r3, r4, ip, r3
	str	r3, [r2, #4]
	ldr	ip, [r1, #4]
	b	.L3
	.size	timespec_subtract, .-timespec_subtract
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	fstmfdd	sp!, {d8}
	cmp	r0, #2
	sub	sp, sp, #52
	ldr	fp, .L18+4
	mov	r3, #4096
	mov	r8, r1
.LPIC16:
	add	fp, pc, fp
	str	r3, [sp, #16]
	mov	r3, #3
	str	r3, [sp, #20]
	ble	.L16
	mov	r0, #37888
	movt	r0, 2392
	bl	malloc(PLT)
	ldr	r9, .L18+8
.LPIC18:
	add	r9, pc, r9
	mov	r10, r0
	mov	r0, #3392
	movt	r0, 3
	bl	malloc(PLT)
	mov	r5, r0
	mov	r0, #3392
	movt	r0, 3
	bl	malloc(PLT)
	mov	r6, r0
	mov	r0, #3392
	movt	r0, 3
	bl	malloc(PLT)
	mov	r1, r9
	mov	r7, r0
	ldr	r0, [r8, #4]
	bl	fopen(PLT)
	subs	r4, r0, #0
	beq	.L17
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, sp, #20
	bl	fread(PLT)
	mov	r3, r4
	mov	r1, #4
	mov	r2, #1
	add	r0, sp, #16
	bl	fread(PLT)
	ldr	r0, .L18+12
	ldr	r1, [sp, #16]
	ldr	r2, [sp, #20]
.LPIC20:
	add	r0, pc, r0
	bl	printf(PLT)
	ldr	r2, [sp, #16]
	ldr	r1, [sp, #20]
	movw	r0, #785
	mla	ip, r2, r2, r2
	sub	r1, r1, #1
	add	r3, r2, r2, asl #2
	mul	r1, ip, r1
	mla	r2, r0, r2, r1
	add	r2, r2, r3, asl #1
	add	r2, r2, #10
	str	r2, [sp, #12]
	mov	r0, r2, asl #2
	bl	malloc(PLT)
	mov	r3, r4
	ldr	r2, [sp, #12]
	mov	r1, #4
	mov	fp, r0
	bl	fread(PLT)
	mov	r0, r4
	bl	fclose(PLT)
	ldr	r0, .L18+16
	mov	r1, r9
.LPIC21:
	add	r0, pc, r0
	bl	fopen(PLT)
	mov	r1, #4
	mov	r2, #9472
	movt	r2, 598
	mov	r4, r0
	mov	r0, r10
	mov	r3, r4
	bl	fread(PLT)
	mov	r0, r4
	bl	fclose(PLT)
	ldr	r0, .L18+20
	mov	r1, r9
	add	r9, sp, #32
.LPIC23:
	add	r0, pc, r0
	bl	fopen(PLT)
	movw	r2, #50000
	mov	r1, #4
	mov	r4, r0
	mov	r0, r6
	mov	r3, r4
	bl	fread(PLT)
	mov	r0, r4
	add	r4, sp, #24
	bl	fclose(PLT)
	mov	r0, #1
	mov	r1, r4
	bl	clock_gettime(PLT)
	ldr	r3, [sp, #16]
	ldr	r2, [sp, #20]
	mov	r1, fp
	mov	r0, r10
	str	r5, [sp]
	str	r7, [sp, #4]
	bl	recognition(PLT)
	mov	r1, r9
	mov	r0, #1
	bl	clock_gettime(PLT)
	mov	r1, r9
	mov	r2, r4
	add	r0, sp, #40
	bl	timespec_subtract(PLT)
	mov	r3, #0
	mov	r0, #3392
	movt	r0, 3
	mov	fp, r3
.L11:
	ldr	r1, [r6, r3]
	ldr	r2, [r5, r3]
	add	r3, r3, #4
	cmp	r1, r2
	addeq	fp, fp, #1
	cmp	r3, r0
	bne	.L11
	ldr	r3, [sp, #44]
	movw	r2, #56963
	movt	r2, 17179
	ldr	r0, .L18+24
	ldr	r1, [sp, #40]
	mov	r9, #3392
	smull	ip, r2, r2, r3
	mov	r3, r3, asr #31
.LPIC25:
	add	r0, pc, r0
	ldr	r10, .L18+28
	movt	r9, 3
	mov	r4, #0
.LPIC29:
	add	r10, pc, r10
	rsb	r2, r3, r2, asr #18
	bl	printf(PLT)
	fmsr	s15, fp	@ int
	ldr	r0, .L18+32
	fsitos	s16, s15
	flds	s15, .L18
.LPIC26:
	add	r0, pc, r0
	fdivs	s16, s16, s15
	fcvtds	d8, s16
	fmrrd	r2, r3, d8
	bl	printf(PLT)
	ldr	r1, .L18+36
	ldr	r0, [r8, #8]
.LPIC27:
	add	r1, pc, r1
	bl	fopen(PLT)
	ldr	r1, .L18+40
	fmrrd	r2, r3, d8
.LPIC28:
	add	r1, pc, r1
	mov	r8, r0
	bl	fprintf(PLT)
.L13:
	fldmias	r7!, {s15}
	fcvtds	d16, s15
	ldr	r2, [r6, r4]
	mov	r0, r8
	ldr	r3, [r5, r4]
	mov	r1, r10
	add	r4, r4, #4
	fstd	d16, [sp]
	bl	fprintf(PLT)
	cmp	r4, r9
	bne	.L13
	mov	r0, r8
	bl	fclose(PLT)
	mov	r0, #0
	add	sp, sp, #52
	@ sp needed
	fldmfdd	sp!, {d8}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L16:
	ldr	r2, [r1]
	ldr	r1, .L18+44
	ldr	r3, .L18+48
.LPIC17:
	add	r1, pc, r1
.L15:
	ldr	r0, [fp, r3]
	add	r0, r0, #168
	bl	fprintf(PLT)
	mov	r0, #1
	bl	exit(PLT)
.L17:
	ldr	r1, .L18+52
	ldr	r3, .L18+48
	ldr	r2, [r8, #4]
.LPIC19:
	add	r1, pc, r1
	b	.L15
.L19:
	.align	2
.L18:
	.word	1195593728
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC16+8)
	.word	.LC1-(.LPIC18+8)
	.word	.LC3-(.LPIC20+8)
	.word	.LC4-(.LPIC21+8)
	.word	.LC5-(.LPIC23+8)
	.word	.LC6-(.LPIC25+8)
	.word	.LC10-(.LPIC29+8)
	.word	.LC7-(.LPIC26+8)
	.word	.LC8-(.LPIC27+8)
	.word	.LC9-(.LPIC28+8)
	.word	.LC0-(.LPIC17+8)
	.word	__sF(GOT)
	.word	.LC2-(.LPIC19+8)
	.size	main, .-main
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Usage: %s <network file> <output file>\012\000"
.LC1:
	.ascii	"r\000"
	.space	2
.LC2:
	.ascii	"Invalid network file %s!\012\000"
	.space	2
.LC3:
	.ascii	"size=%d, depth=%d\012\000"
	.space	1
.LC4:
	.ascii	"MNIST_image.bin\000"
.LC5:
	.ascii	"MNIST_label.bin\000"
.LC6:
	.ascii	"Elapsed time: %ld.%03ld sec\012\000"
	.space	3
.LC7:
	.ascii	"Accuracy: %.3f\012\000"
.LC8:
	.ascii	"wb\000"
	.space	1
.LC9:
	.ascii	"%.3f\012\000"
	.space	2
.LC10:
	.ascii	"%d, %d, %.3f\012\000"
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
