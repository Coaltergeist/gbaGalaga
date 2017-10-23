	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r0, #0
	sub	sp, sp, #12
	ldr	r3, .L2
	mov	lr, pc
	bx	r3
	ldr	r3, .L2+4
	mov	r0, #130
	str	r3, [sp, #0]
	mov	r1, #111
	mov	r2, #16
	mov	r3, #18
	ldr	ip, .L2+8
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	ldr	r2, .L2+12
	mov	r0, #76
	mov	r1, #86
	add	r3, r3, #255
	ldr	ip, .L2+16
	mov	lr, pc
	bx	ip
	ldr	r3, .L2+20
	mov	lr, pc
	bx	r3
	ldr	r2, .L2+24
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L2+28
	str	r3, [r2, #0]
	ldr	r3, .L2+32
	mov	r2, #1
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	fillScreen3
	.word	shipBitmap
	.word	drawImage3
	.word	.LC0
	.word	drawString3
	.word	waitForVBlank
	.word	state
	.word	seed
	.word	frameCount
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1040
	add	r3, r3, #3
	mov	r2, #67108864
	strh	r3, [r2, #0]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r5, .L12
	ldr	r4, .L12+4
	sub	sp, sp, #12
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #0]
	add	r2, r2, #1
	cmp	r3, #0
	str	r2, [r5, #0]
	ble	.L6
	add	r3, r3, #1
	cmp	r3, #120
	str	r3, [r4, #0]
	bgt	.L10
.L7:
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+12
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L5
	ldr	r3, .L12+16
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L11
.L5:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L11:
	ldr	r0, [r5, #0]
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+24
	mov	r2, #1
	str	r2, [r3, #0]
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	b	.L5
.L6:
	sub	r3, r3, #1
	cmn	r3, #120
	str	r3, [r4, #0]
	bge	.L7
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #76
	mov	r1, #86
	ldr	r2, .L12+32
	ldr	ip, .L12+36
	mov	lr, pc
	bx	ip
	mov	r3, #1
	str	r3, [r4, #0]
	b	.L7
.L10:
	mov	ip, #0
	mov	r3, #100
	str	ip, [sp, #0]
	mov	r0, #76
	mov	r1, #86
	mov	r2, #8
	ldr	ip, .L12+40
	mov	lr, pc
	bx	ip
	mvn	r3, #0
	str	r3, [r4, #0]
	b	.L7
.L13:
	.align	2
.L12:
	.word	seed
	.word	frameCount
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	state
	.word	initGame
	.word	.LC0
	.word	drawString3
	.word	drawRect3
	.size	start, .-start
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	mov	r2, #1
	str	r2, [r3, #0]
	bx	lr
.L16:
	.align	2
.L15:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #0
	sub	sp, sp, #12
	mov	r0, #77
	mov	r1, #105
	mov	r2, #8
	mov	r3, #30
	str	ip, [sp, #0]
	ldr	ip, .L18
	mov	lr, pc
	bx	ip
	mov	r3, #32512
	ldr	r2, .L18+4
	mov	r0, #77
	mov	r1, #105
	add	r3, r3, #255
	ldr	ip, .L18+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L18+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+16
	mov	r2, #2
	str	r2, [r3, #0]
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	drawRect3
	.word	.LC1
	.word	drawString3
	.word	waitForVBlank
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L25
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L21
	ldr	r2, .L25+8
	ldrh	r2, [r2, #0]
	tst	r2, #8
	beq	.L23
.L21:
	tst	r3, #4
	beq	.L20
	ldr	r3, .L25+8
	ldrh	r3, [r3, #0]
	tst	r3, #4
	beq	.L24
.L20:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L23:
	ldr	r3, .L25+12
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L20
.L24:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #992
	ldr	r3, .L28
	mov	lr, pc
	bx	r3
	ldr	r2, .L28+4
	mov	r0, #77
	mov	r1, #111
	mov	r3, #0
	ldr	ip, .L28+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L28+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L28+16
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	fillScreen3
	.word	.LC2
	.word	drawString3
	.word	waitForVBlank
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L33+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L30
	ldr	r3, .L33+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L32
.L30:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L34:
	.align	2
.L33:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	mov	r0, #31
	ldr	r3, .L36
	mov	lr, pc
	bx	r3
	ldr	r2, .L36+4
	mov	r0, #77
	mov	r1, #108
	mov	r3, #0
	ldr	ip, .L36+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L36+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+16
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	fillScreen3
	.word	.LC3
	.word	drawString3
	.word	waitForVBlank
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	stmfd	sp!, {r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+4
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L38
	ldr	r3, .L41+8
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L40
.L38:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	ldmfd	sp!, {r4, lr}
	b	goToStart
.L42:
	.align	2
.L41:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.align	2
	.global	goToHit
	.type	goToHit, %function
goToHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r3, .L44
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	lr, .L44+4
	ldr	r6, .L44+8
	ldr	r5, [lr, #0]
	mov	r7, #5
	ldr	r4, .L44+12
	str	r7, [r6, #0]
	ldr	r6, .L44+16
	mov	ip, #0
	sub	r5, r5, #1
	str	ip, [r6, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	str	r5, [lr, #0]
	mov	r2, #16
	str	ip, [sp, #0]
	mov	r3, #18
	ldr	ip, .L44+20
	mov	lr, pc
	bx	ip
	ldr	ip, .L44+24
	ldr	r0, [r4, #0]
	str	ip, [sp, #0]
	ldr	r1, [r4, #4]
	mov	r2, #16
	mov	r3, #18
	ldr	ip, .L44+28
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	waitForVBlank
	.word	livesRemaining
	.word	state
	.word	player
	.word	frameCount
	.word	drawRect3
	.word	explosion1Bitmap
	.word	drawImage3
	.size	goToHit, .-goToHit
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r3, .L55
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+8
	ldr	r1, .L55+12
	ldr	r2, [r3, #0]
	ldr	r5, .L55+16
	ldr	r0, .L55+20
	mov	lr, pc
	bx	r5
	ldr	r6, .L55+24
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #5
	ldr	r2, .L55+20
	ldr	r4, .L55+28
	mov	lr, pc
	bx	r4
	ldr	r2, [r6, #0]
	ldr	r1, .L55+32
	sub	r2, r2, #1
	ldr	r0, .L55+36
	mov	lr, pc
	bx	r5
	mov	r3, #32512
	add	r3, r3, #255
	mov	r0, #145
	mov	r1, #184
	ldr	r2, .L55+36
	mov	lr, pc
	bx	r4
	ldr	r3, .L55+40
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L47
	ldr	r3, .L55+44
	ldrh	r3, [r3, #0]
	tst	r3, #8
	beq	.L51
.L47:
	ldr	r3, [r6, #0]
	cmp	r3, #0
	beq	.L52
	ldr	r3, .L55+48
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L53
	ldr	r3, .L55+52
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bne	.L54
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L54:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToHit
.L51:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToPause
.L52:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToLose
.L53:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToWin
.L56:
	.align	2
.L55:
	.word	updateGame
	.word	drawGame
	.word	scoreNumber
	.word	.LC4
	.word	sprintf
	.word	buffer
	.word	livesRemaining
	.word	drawString3
	.word	.LC5
	.word	buffer2
	.word	oldButtons
	.word	buttons
	.word	enemiesRemaining
	.word	isHit
	.size	game, .-game
	.align	2
	.global	hit
	.type	hit, %function
hit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r4, .L65
	sub	sp, sp, #12
	ldr	r3, [r4, #0]
	add	r3, r3, #1
	str	r3, [r4, #0]
	ldr	r3, .L65+4
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	ldr	r1, .L65+8
	smull	r2, r1, r3, r1
	mov	r2, r3, asr #31
	add	r1, r1, r3
	rsb	ip, r2, r1, asr #5
	rsb	ip, ip, ip, asl #4
	subs	ip, r3, ip, asl #2
	beq	.L62
	rsb	ip, r2, r1, asr #6
	rsb	ip, ip, ip, asl #4
	subs	ip, r3, ip, asl #3
	beq	.L63
.L59:
	cmp	r3, #180
	ble	.L57
	ldr	r3, .L65+12
	ldr	r3, [r3, #0]
	cmp	r3, #0
	beq	.L64
	ldr	r3, .L65+16
	mov	r2, #0
	str	r2, [r3, #0]
	ldr	r3, .L65+20
	mov	r2, #1
	str	r2, [r3, #0]
.L57:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L62:
	ldr	r5, .L65+24
	mov	r2, #16
	ldmia	r5, {r0, r1}	@ phole ldm
	mov	r3, #18
	str	ip, [sp, #0]
	ldr	ip, .L65+28
	mov	lr, pc
	bx	ip
	ldr	ip, .L65+32
	mov	r3, #18
	str	ip, [sp, #0]
	ldmia	r5, {r0, r1}	@ phole ldm
	mov	r2, #16
	ldr	ip, .L65+36
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #0]
	b	.L59
.L63:
	ldr	r5, .L65+24
	mov	r2, #16
	ldmia	r5, {r0, r1}	@ phole ldm
	mov	r3, #18
	str	ip, [sp, #0]
	ldr	ip, .L65+28
	mov	lr, pc
	bx	ip
	ldr	ip, .L65+40
	mov	r3, #18
	str	ip, [sp, #0]
	ldmia	r5, {r0, r1}	@ phole ldm
	mov	r2, #16
	ldr	ip, .L65+36
	mov	lr, pc
	bx	ip
	ldr	r3, [r4, #0]
	b	.L59
.L64:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, lr}
	b	goToLose
.L66:
	.align	2
.L65:
	.word	frameCount
	.word	waitForVBlank
	.word	-2004318071
	.word	livesRemaining
	.word	isHit
	.word	state
	.word	player
	.word	drawRect3
	.word	explosion2Bitmap
	.word	drawImage3
	.word	explosion1Bitmap
	.size	hit, .-hit
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bl	initialize
	mov	r5, #67108864
	ldr	r4, .L80
	ldr	r7, .L80+4
	ldr	r6, .L80+8
	add	r5, r5, #256
.L79:
	ldrh	r3, [r4, #0]
	ldr	r2, [r7, #0]
.L69:
	strh	r3, [r6, #0]	@ movhi
	ldrh	r3, [r5, #48]
	strh	r3, [r4, #0]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L69
.L76:
	.word	.L70
	.word	.L71
	.word	.L72
	.word	.L73
	.word	.L74
	.word	.L75
.L75:
	bl	hit
	b	.L79
.L74:
	bl	lose
	b	.L79
.L73:
	bl	win
	b	.L79
.L72:
	bl	pause
	b	.L79
.L71:
	bl	game
	b	.L79
.L70:
	bl	start
	b	.L79
.L81:
	.align	2
.L80:
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	seed,4,4
	.comm	frameCount,4,4
	.comm	buffer,41,4
	.comm	buffer2,41,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"Press Start\000"
.LC1:
	.ascii	"Pause\000"
	.space	2
.LC2:
	.ascii	"Win\000"
.LC3:
	.ascii	"Lose\000"
	.space	3
.LC4:
	.ascii	"Score: %d\000"
	.space	2
.LC5:
	.ascii	"Lives: %d\000"
	.ident	"GCC: (devkitARM release 31) 4.5.0"
