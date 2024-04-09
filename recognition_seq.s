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
	.file	"recognition_seq.c"
	.text
	.align	2
	.global	recognition
	.type	recognition, %function
recognition:
	@ args = 8, pretend = 0, frame = 120
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	fstmfdd	sp!, {d8, d9}
	mov	r5, r2, asl #2
	sub	sp, sp, #124
	mov	r9, r0
	mul	r0, r3, r5
	mov	r4, r3
	mov	r7, r1
	str	r2, [sp, #24]
	ldr	fp, [sp, #180]
	bl	malloc(PLT)
	add	r8, r5, #4
	mov	r6, r0
	mov	r0, r8
	bl	malloc(PLT)
	str	r0, [sp, #32]
	mov	r0, r8
	bl	malloc(PLT)
	mov	r2, #3136
	ldr	ip, [sp, #24]
	mul	r2, r2, r4
	ldr	r3, [sp, #32]
	cmp	ip, #1
	str	r7, [r3]
	add	r3, r7, r2
	str	r0, [sp, #36]
	str	r3, [r0]
	ble	.L40
	mov	r3, #784
	ldr	ip, [sp, #32]
	mla	r3, r3, r4, r4
	sub	r10, r5, #4
	mul	r1, r4, r4
	add	r10, r10, ip
	mla	lr, r4, r4, r4
	mov	r0, ip
	ldr	ip, [sp, #36]
	add	r3, r7, r3, asl #2
	mov	r7, r1, asl #2
	mov	lr, lr, asl #2
.L5:
	str	r3, [r0, #4]!
	cmp	r0, r10
	add	r8, r3, r7
	add	r3, r3, lr
	str	r8, [ip, #4]!
	bne	.L5
	b	.L4
.L40:
	mul	r1, r4, r4
.L4:
	sub	r7, r4, #1
	str	r7, [sp, #20]
	ldr	r7, [sp, #24]
	fconstd	d8, #112
	ldr	r3, [sp, #32]
	add	r0, r1, r4
	sub	ip, r7, #1
	ldr	r7, [sp, #20]
	add	r5, r3, r5
	add	lr, r4, r4, asl #3
	mla	ip, ip, r4, r4
	flds	s18, .L42
	ldr	r3, [r5, #-4]
	ldr	r5, [sp, #176]
	add	lr, r4, lr
	mla	r10, r7, r4, r4
	add	r3, r3, r0, asl #2
	add	r0, r5, #199680
	ldr	r5, [sp, #32]
	str	ip, [sp, #4]
	mov	ip, r4, asl #2
	add	r1, ip, r4
	str	ip, [sp, #16]
	add	ip, fp, #199680
	ldr	fp, [sp, #24]
	rsb	r8, r4, r4, asl #30
	add	ip, ip, #320
	sub	r2, r2, #3136
	movw	r7, #34752
	str	ip, [sp, #48]
	movt	r7, 2392
	ldr	ip, [sp, #36]
	add	r1, r3, r1, asl #3
	str	r2, [sp, #60]
	add	lr, r3, lr, asl #2
	ldr	r2, [sp, #4]
	add	r7, r9, r7
	str	r3, [r5, fp, asl #2]
	mov	r8, r8, asl #2
	ldr	r3, [sp, #16]
	sub	r9, r4, #4
	str	r1, [ip, fp, asl #2]
	add	r2, r6, r2, asl #2
	add	r0, r0, #320
	add	r1, r1, #40
	mov	r10, r10, asl #2
	add	r6, r6, r3
	movw	r5, #49999
	add	ip, sp, #80
	str	r0, [sp, #52]
	str	r1, [sp, #72]
	str	lr, [sp, #68]
	str	r10, [sp, #28]
	str	r2, [sp, #64]
	str	r6, [sp, #44]
	str	r5, [sp, #40]
	str	ip, [sp, #56]
.L3:
	ldr	r2, [sp, #20]
	cmp	r2, #0
	blt	.L11
	ldr	fp, [sp, #36]
	ldr	ip, [sp, #32]
	ldr	r2, [sp, #16]
	ldr	r6, [fp]
	ldr	r4, [ip]
	ldr	r3, [sp, #60]
	add	r6, r6, r2
	ldr	r10, [sp, #44]
	ldr	r5, [sp, #20]
	add	r4, r4, r3
.L12:
	vmov.f32	q8, #0.0  @ v4sf
	mov	r3, #0
.L10:
	add	r1, r7, r3
	add	r2, r4, r3
	add	r1, r1, #3120
	add	r2, r2, #3120
	sub	r3, r3, #16
	cmn	r3, #3136
	vld1.32	{d18-d19}, [r1]
	vld1.32	{d20-d21}, [r2]
	vmla.f32	q8, q9, q10
	bne	.L10
	vmov.32	fp, d16[0]
	fldmdbs	r6!, {s14}
	vmov.32	ip, d16[1]
	sub	r5, r5, #1
	fmsr	s11, fp
	sub	r4, r4, #3136
	fmsr	s12, ip
	fadds	s11, s11, s18
	vmov.32	r0, d17[0]
	vmov.32	r1, d17[1]
	fmsr	s13, r0
	fmsr	s15, r1
	fadds	s12, s11, s12
	fadds	s13, s12, s13
	fadds	s15, s13, s15
	fadds	s15, s15, s14
	fnegs	s15, s15
	fcvtds	d16, s15
	fmrrd	r0, r1, d16
	bl	exp(PLT)
	cmn	r5, #1
	fmdrr	d17, r0, r1
	faddd	d16, d17, d8
	fdivd	d16, d8, d16
	fcvtsd	s15, d16
	fstmdbs	r10!, {s15}
	bne	.L12
.L11:
	ldr	r5, [sp, #24]
	cmp	r5, #1
	ble	.L8
	ldr	r2, [sp, #36]
	mov	r3, #1
	ldr	r6, [sp, #32]
	ldr	r5, [sp, #44]
	str	r2, [sp, #8]
	str	r3, [sp, #4]
	str	r7, [sp, #76]
.L13:
	ldr	r7, [sp, #20]
	cmp	r7, #0
	blt	.L41
	ldr	r2, [sp, #8]
	ldr	r3, [sp, #16]
	ldr	fp, [sp, #16]
	add	r3, r3, r5
	ldr	ip, [r2, #4]
	ldr	r4, [sp, #28]
	ldr	r10, [sp, #20]
	add	r7, ip, fp
	mov	fp, r3
	str	r3, [sp, #12]
.L18:
	cmp	r9, #0
	vmov.f32	q8, #0.0  @ v4sf
	blt	.L14
	ldr	ip, [r6, #4]
	mov	r2, r9
	mov	r3, #0
.L15:
	add	r1, ip, r3
	add	r0, r5, r3
	add	r1, r1, r4
	sub	r0, r0, #16
	sub	r1, r1, #16
	subs	r2, r2, #4
	vld1.32	{d18-d19}, [r0]
	sub	r3, r3, #16
	vld1.32	{d20-d21}, [r1]
	vmla.f32	q8, q9, q10
	bpl	.L15
.L14:
	vmov.32	ip, d16[0]
	fldmdbs	r7!, {s14}
	vmov.32	r0, d16[1]
	sub	r10, r10, #1
	fmsr	s11, ip
	add	r4, r4, r8
	fmsr	s12, r0
	fadds	s11, s11, s18
	vmov.32	r1, d17[0]
	vmov.32	r2, d17[1]
	fmsr	s13, r1
	fmsr	s15, r2
	fadds	s12, s11, s12
	fadds	s13, s12, s13
	fadds	s15, s13, s15
	fadds	s15, s15, s14
	fnegs	s15, s15
	fcvtds	d16, s15
	fmrrd	r0, r1, d16
	bl	exp(PLT)
	cmn	r10, #1
	fmdrr	d17, r0, r1
	faddd	d16, d17, d8
	fdivd	d16, d8, d16
	fcvtsd	s15, d16
	fstmdbs	fp!, {s15}
	bne	.L18
.L17:
	ldr	r2, [sp, #4]
	add	r6, r6, #4
	ldr	r5, [sp, #24]
	add	r2, r2, #1
	ldr	r3, [sp, #8]
	cmp	r2, r5
	str	r2, [sp, #4]
	add	r3, r3, #4
	ldr	r5, [sp, #12]
	str	r3, [sp, #8]
	bne	.L13
	ldr	r7, [sp, #76]
.L8:
	ldr	r6, [sp, #72]
	add	r5, sp, #120
	ldr	r4, [sp, #68]
	add	fp, sp, #80
	ldr	r10, [sp, #64]
.L26:
	cmp	r9, #0
	vmov.f32	q8, #0.0  @ v4sf
	blt	.L19
	mov	r2, r9
	mov	r3, #0
.L20:
	add	r0, r3, r10
	add	r1, r3, r4
	sub	r0, r0, #16
	sub	r1, r1, #16
	subs	r2, r2, #4
	sub	r3, r3, #16
	vld1.32	{d18-d19}, [r0]
	vld1.32	{d20-d21}, [r1]
	vmla.f32	q8, q9, q10
	bpl	.L20
.L19:
	vmov.32	ip, d16[0]
	fldmdbs	r6!, {s14}
	vmov.32	r0, d16[1]
	add	r4, r4, r8
	fmsr	s11, ip
	fmsr	s12, r0
	fadds	s11, s11, s18
	vmov.32	r1, d17[0]
	vmov.32	r2, d17[1]
	fmsr	s13, r1
	fmsr	s15, r2
	fadds	s12, s11, s12
	fadds	s13, s12, s13
	fadds	s15, s13, s15
	fadds	s15, s15, s14
	fnegs	s15, s15
	fcvtds	d16, s15
	fmrrd	r0, r1, d16
	bl	exp(PLT)
	fmdrr	d17, r0, r1
	faddd	d16, d17, d8
	fdivd	d16, d8, d16
	fcvtsd	s15, d16
	fstmdbs	r5!, {s15}
	cmp	r5, fp
	bne	.L26
	mov	r1, #0
	add	r2, sp, #80
	mov	r3, r1
	flds	s14, .L42
.L24:
	fldmias	r2!, {s15}
	fcmpes	s15, s14
	fmstat
	movgt	r1, r3
	add	r3, r3, #1
	fcpysgt	s14, s15
	cmp	r3, #10
	bne	.L24
	ldr	r2, [sp, #40]
	sub	r7, r7, #3136
	ldr	r3, [sp, #48]
	fstmdbs	r3!, {s14}
	sub	r2, r2, #1
	ldr	r5, [sp, #52]
	cmn	r2, #1
	str	r2, [sp, #40]
	str	r3, [sp, #48]
	str	r1, [r5, #-4]!
	str	r5, [sp, #52]
	bne	.L3
	add	sp, sp, #124
	@ sp needed
	fldmfdd	sp!, {d8-d9}
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, pc}
.L41:
	ldr	fp, [sp, #16]
	add	r5, r5, fp
	str	r5, [sp, #12]
	b	.L17
.L43:
	.align	2
.L42:
	.word	0
	.size	recognition, .-recognition
	.ident	"GCC: (GNU) 4.8"
	.section	.note.GNU-stack,"",%progbits
