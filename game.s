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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	mov	r2, #130
	str	r2, [r3, #0]
	mov	r2, #111
	str	r2, [r3, #4]
	mov	r2, #2
	str	r2, [r3, #8]
	mov	r2, #16
	str	r2, [r3, #12]
	mov	r2, #18
	str	r2, [r3, #16]
	mov	r2, #20
	str	r2, [r3, #24]
	bx	lr
.L3:
	.align	2
.L2:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r3, .L5
	ldr	ip, .L5+4
	sub	sp, sp, #12
	ldmia	r3, {r0, r1}	@ phole ldm
	add	r2, r3, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	ldr	ip, .L5+8
	mov	lr, pc
	bx	ip
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	player
	.word	shipBitmap
	.word	drawImage3
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	stmfd	sp!, {r4, r5, r6}
	mov	ip, #2
	mov	r5, #4
	add	r4, r3, #160
	mvn	r0, #3
	mov	r2, #0
	mvn	r1, #1
.L8:
	mov	r6, #31	@ movhi
	str	r5, [r3, #16]
	str	ip, [r3, #20]
	stmia	r3, {r0, r2}	@ phole stm
	str	r1, [r3, #8]
	str	r2, [r3, #12]
	strh	r6, [r3, #24]	@ movhi
	str	r2, [r3, #28]
	add	r3, r3, #32
	cmp	r3, r4
	bne	.L8
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L12:
	.align	2
.L11:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6}
	ldr	r0, .L19
	mov	r3, #0
	mov	r2, r0
.L16:
	ldr	r1, [r2, #28]
	cmp	r1, #0
	beq	.L18
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #32
	bne	.L16
.L13:
	ldmfd	sp!, {r4, r5, r6}
	bx	lr
.L18:
	add	r2, r0, r3, asl #5
	ldr	r1, .L19+4
	ldr	r4, [r2, #20]
	ldr	ip, [r1, #16]
	add	r4, r4, r4, lsr #31
	add	r6, ip, ip, lsr #31
	ldr	r5, [r1, #4]
	mov	ip, r4, asr #1
	ldr	r4, [r1, #0]
	rsb	ip, ip, r6, asr #1
	ldr	r1, [r1, #28]
	add	ip, ip, r5
	str	r4, [r0, r3, asl #5]
	mov	r3, #1
	str	ip, [r2, #4]
	str	r1, [r2, #12]
	str	r3, [r2, #28]
	b	.L13
.L20:
	.align	2
.L19:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	add	r3, r3, #256
	stmfd	sp!, {r4, lr}
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldrne	r4, .L33
	bne	.L22
	ldr	r4, .L33
	ldmib	r4, {r2, r3}	@ phole ldm
	cmp	r2, r3
	blt	.L22
	rsb	r3, r3, r2
	str	r3, [r4, #4]
	mvn	r3, #0
	str	r3, [r4, #28]
	ldr	r3, .L33+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L25
.L31:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
.L26:
	str	r3, [r4, #24]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L22:
	mov	r3, #67108864
	add	r3, r3, #256
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L32
.L24:
	mov	r3, #0
	str	r3, [r4, #28]
.L23:
	ldr	r3, .L33+4
	ldrh	r3, [r3, #0]
	tst	r3, #1
	beq	.L31
.L25:
	ldr	r3, .L33+8
	ldrh	r3, [r3, #0]
	tst	r3, #1
	bne	.L31
	ldr	r3, [r4, #24]
	cmp	r3, #12
	addle	r3, r3, #1
	ble	.L26
	bl	fireBullet
	mov	r3, #1
	b	.L26
.L32:
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #8]
	ldr	r0, [r4, #16]
	rsb	r1, r2, #240
	add	r0, r3, r0
	cmp	r0, r1
	ldr	r1, .L33
	bgt	.L24
	add	r3, r2, r3
	str	r3, [r1, #4]
	mov	r3, #1
	str	r3, [r1, #28]
	b	.L23
.L34:
	.align	2
.L33:
	.word	player
	.word	oldButtons
	.word	buttons
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #0]
	ldr	r2, [r0, #16]
	add	r2, r3, r2
	cmp	r2, #0
	ble	.L37
	ldr	r1, [r0, #12]
	ldr	r2, [r0, #4]
	add	r2, r1, r2
	cmp	r2, #0
	ble	.L37
	cmp	r2, #238
	ble	.L38
.L37:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L38:
	ldr	r1, [r0, #8]
	add	r3, r1, r3
	str	r3, [r0, #0]
	str	r2, [r0, #4]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullet
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L39
	ldr	ip, [r0, #0]
	ldr	r1, [r0, #4]
	add	r2, r0, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, ip
	ldr	ip, .L41
	str	ip, [sp, #0]
	ldr	ip, .L41+4
	mov	lr, pc
	bx	ip
.L39:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L42:
	.align	2
.L41:
	.word	bulletBitmap
	.word	drawImage3
	.size	drawBullet, .-drawBullet
	.align	2
	.global	initStar
	.type	initStar, %function
initStar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L44
	add	r0, r0, r0, asl #1
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #0
	add	r4, r3, r0, asl #3
	mov	r5, #1
	str	r2, [r3, r0, asl #3]
	ldr	r6, .L44+4
	str	r5, [r4, #12]
	str	r5, [r4, #16]
	mov	lr, pc
	bx	r6
	ldr	r3, .L44+8
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r2, .L44+12
	smull	r3, r2, r0, r2
	ldr	r3, .L44+16
	sub	r2, r2, r0, asr #31
	ldr	r1, [r3, #0]
	add	r2, r2, r2, asl #1
	sub	r0, r0, r2, asl #1
	add	r0, r0, #2
	add	r1, r1, r5
	str	r0, [r4, #8]
	str	r5, [r4, #20]
	str	r1, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	stars
	.word	rand
	.word	-2004318071
	.word	715827883
	.word	activeStars
	.size	initStar, .-initStar
	.align	2
	.global	initStars
	.type	initStars, %function
initStars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r8, .L49
	ldr	r7, .L49+4
	ldr	r6, .L49+8
	mov	r4, r5
.L47:
	mov	r0, r4
	bl	initStar
	mov	lr, pc
	bx	r8
	smull	r3, r2, r6, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	add	r4, r4, #1
	sub	r0, r0, r3, asl #5
	cmp	r4, #20
	str	r0, [r7, r5]
	add	r5, r5, #24
	bne	.L47
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	rand
	.word	stars
	.word	1717986919
	.size	initStars, .-initStars
	.align	2
	.global	updateStar
	.type	updateStar, %function
updateStar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r5, .L61
	ldr	r3, [r5, #0]
	cmp	r3, #19
	mov	r4, r0
	bgt	.L52
	ldr	r3, .L61+4
	mov	r0, #0
	b	.L54
.L53:
	add	r0, r0, #1
	cmp	r0, #30
	add	r3, r3, #24
	beq	.L52
.L54:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L53
	bl	initStar
.L52:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L51
	ldr	r1, [r4, #0]
	ldr	r3, [r4, #12]
	add	r3, r1, r3
	cmp	r3, #159
	ble	.L56
	ldr	r3, [r5, #0]
	mov	r0, #0
	sub	r3, r3, #1
	str	r3, [r5, #0]
	str	r0, [r4, #20]
	ldr	r3, .L61+4
	b	.L58
.L57:
	add	r0, r0, #1
	cmp	r0, #30
	add	r3, r3, #24
	beq	.L56
.L58:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	bne	.L57
	bl	initStar
	ldr	r3, [r5, #0]
	add	r3, r3, #1
	str	r3, [r5, #0]
	ldr	r1, [r4, #0]
.L56:
	ldr	r3, [r4, #8]
	add	r1, r1, r3
	str	r1, [r4, #0]
.L51:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	activeStars
	.word	stars
	.size	updateStar, .-updateStar
	.align	2
	.global	drawStar
	.type	drawStar, %function
drawStar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L63
	ldr	lr, [r0, #0]
	mov	ip, #32512
	add	ip, ip, #255
	ldr	r1, [r0, #4]
	add	r2, r0, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	mov	r0, lr
	ldr	ip, .L65
	mov	lr, pc
	bx	ip
.L63:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L66:
	.align	2
.L65:
	.word	drawRect3
	.size	drawStar, .-drawStar
	.align	2
	.global	initAsteroids
	.type	initAsteroids, %function
initAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r4, .L70
	ldr	r7, .L70+4
	ldr	r9, .L70+8
	ldr	sl, .L70+12
	add	r8, r4, #144
	mov	r6, #12
	mov	r5, #1
.L68:
	str	r6, [r4, #0]
	str	r6, [r4, #4]
	mov	lr, pc
	bx	r7
	smull	r3, r2, r9, r0
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	sub	r0, r0, r3, asl #5
	str	r0, [r4, #-12]
	mov	lr, pc
	bx	r7
	smull	r2, r3, sl, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	stmdb	r4, {r0, r5}	@ phole stm
	str	r5, [r4, #8]
	add	r4, r4, #24
	cmp	r4, r8
	bne	.L68
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	asteroids+12
	.word	rand
	.word	1717986919
	.word	-2004318071
	.size	initAsteroids, .-initAsteroids
	.align	2
	.global	drawAsteroid
	.type	drawAsteroid, %function
drawAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L72
	ldr	ip, [r0, #0]
	ldr	r1, [r0, #4]
	add	r2, r0, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, ip
	ldr	ip, .L74
	str	ip, [sp, #0]
	ldr	ip, .L74+4
	mov	lr, pc
	bx	ip
.L72:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L75:
	.align	2
.L74:
	.word	asteroidBitmap
	.word	drawImage3
	.size	drawAsteroid, .-drawAsteroid
	.align	2
	.global	updateAsteroid
	.type	updateAsteroid, %function
updateAsteroid:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	sub	sp, sp, #16
	ldr	r3, [r0, #20]
	cmp	r3, #0
	mov	r4, r0
	beq	.L76
	ldr	r3, [r0, #0]
	cmp	r3, #158
	bgt	.L80
	ldr	r0, [r0, #8]
	add	r0, r3, r0
	str	r0, [r4, #0]
	ldr	r1, [r4, #4]
.L79:
	ldr	ip, .L81
	ldr	r6, [ip, #0]
	ldr	r5, [ip, #4]
	ldr	lr, [ip, #12]
	ldr	ip, [ip, #16]
	add	r2, r4, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #12]
	str	r6, [sp, #0]
	stmib	sp, {r5, lr}	@ phole stm
	ldr	ip, .L81+4
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L76
	mov	r3, #0
	str	r3, [r4, #0]
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+12
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	ldr	r3, .L81+16
	mov	r2, #1
	str	r0, [r4, #4]
	str	r2, [r3, #0]
.L76:
	add	sp, sp, #16
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L80:
	mov	r3, #0
	str	r3, [r0, #0]
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	ldr	r1, .L81+12
	smull	r2, r1, r0, r1
	mov	r3, r0, asr #31
	add	r1, r1, r0
	rsb	r1, r3, r1, asr #7
	rsb	r1, r1, r1, asl #4
	sub	r1, r0, r1, asl #4
	str	r1, [r4, #4]
	ldr	r0, [r4, #0]
	b	.L79
.L82:
	.align	2
.L81:
	.word	player
	.word	collision
	.word	rand
	.word	-2004318071
	.word	isHit
	.size	updateAsteroid, .-updateAsteroid
	.align	2
	.global	initEnemies
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	ldr	r4, .L86
	ldr	r7, .L86+4
	ldr	r9, .L86+8
	ldr	sl, .L86+12
	add	r8, r4, #144
	mov	r6, #12
	mov	r5, #0
.L84:
	str	r6, [r4, #0]
	str	r6, [r4, #4]
	str	r5, [r4, #-12]
	mov	lr, pc
	bx	r7
	smull	r2, r3, r9, r0
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	str	r0, [r4, #-8]
	mov	lr, pc
	bx	r7
	smull	r2, r3, sl, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, asl #1
	rsb	r0, r3, r0
	add	r0, r0, #1
	str	r0, [r4, #-4]
	str	r5, [r4, #8]
	add	r4, r4, #24
	cmp	r4, r8
	bne	.L84
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	enemies+12
	.word	rand
	.word	-2004318071
	.word	1431655766
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L94
	mov	r2, #130
	str	r2, [r3, #0]
	mov	r2, #111
	str	r2, [r3, #4]
	mov	r2, #2
	str	r2, [r3, #8]
	mov	r2, #16
	str	r2, [r3, #12]
	mov	r2, #18
	str	r2, [r3, #16]
	mov	r2, #20
	str	r2, [r3, #24]
	bl	initBullets
	bl	initStars
	bl	initAsteroids
	bl	initEnemies
	ldr	r0, .L94+4
	mov	r3, #0
	mov	r2, r0
.L91:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L93
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #24
	bne	.L91
.L90:
	ldr	r2, .L94+8
	mov	r1, #10
	str	r1, [r2, #0]
	ldr	r2, .L94+12
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L94+16
	mov	r1, #4
	str	r1, [r2, #0]
	ldr	r2, .L94+20
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, lr}
	bx	lr
.L93:
	add	r3, r3, r3, asl #1
	add	r0, r0, r3, asl #3
	mov	r3, #1
	str	r3, [r0, #20]
	b	.L90
.L95:
	.align	2
.L94:
	.word	player
	.word	enemies
	.word	enemiesRemaining
	.word	activeStars
	.word	livesRemaining
	.word	isHit
	.size	initGame, .-initGame
	.align	2
	.global	drawEnemy
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #12
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L96
	ldr	ip, [r0, #0]
	ldr	r1, [r0, #4]
	add	r2, r0, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	mov	r0, ip
	ldr	ip, .L98
	str	ip, [sp, #0]
	ldr	ip, .L98+4
	mov	lr, pc
	bx	ip
.L96:
	add	sp, sp, #12
	ldr	lr, [sp], #4
	bx	lr
.L99:
	.align	2
.L98:
	.word	enemyBitmap
	.word	drawImage3
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawGame
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L109
	mov	lr, pc
	bx	r3
	mov	r0, #0
	ldr	r3, .L109+4
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	ldr	r5, .L109+8
	mov	r4, #0
.L101:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	drawBullet
	cmp	r4, #5
	bne	.L101
	ldr	r5, .L109+12
	mov	r4, #0
.L102:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawStar
	cmp	r4, #30
	bne	.L102
	ldr	r5, .L109+16
	mov	r4, #0
.L103:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawAsteroid
	cmp	r4, #6
	bne	.L103
	ldr	r5, .L109+20
	mov	r4, #0
.L104:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	drawEnemy
	cmp	r4, #10
	bne	.L104
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L110:
	.align	2
.L109:
	.word	waitForVBlank
	.word	fillScreen3
	.word	bullets
	.word	stars
	.word	asteroids
	.word	enemies
	.size	drawGame, .-drawGame
	.align	2
	.global	updateEnemy
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	sub	sp, sp, #20
	ldr	r3, [r0, #20]
	cmp	r3, #0
	mov	r5, r0
	beq	.L111
	ldr	ip, [r0, #0]
	cmp	ip, #158
	bgt	.L126
	ldr	r7, [r5, #4]
	add	r4, r5, #12
	ldmia	r4, {r4, lr}	@ phole ldm
	ldr	r3, .L131
	ldr	r6, .L131+4
	ldmia	r3, {r0, r1}	@ phole ldm
	add	r2, r3, #12
	ldmia	r2, {r2, r3}	@ phole ldm
	str	ip, [sp, #0]
	str	r7, [sp, #4]
	str	r4, [sp, #8]
	str	lr, [sp, #12]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	ldreq	ip, [r5, #4]
	bne	.L127
.L116:
	ldr	r4, .L131+8
	ldr	r9, .L131+12
	ldr	fp, .L131+16
	add	r8, r4, #160
	mov	r7, r6
.L114:
	ldr	lr, [r5, #12]
	ldr	r6, [r5, #16]
	ldr	sl, [r5, #0]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	r2, r4, #16
	ldmia	r2, {r2, r3}	@ phole ldm
	stmia	sp, {sl, ip, lr}	@ phole stm
	str	r6, [sp, #12]
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L128
.L120:
	add	r4, r4, #32
	cmp	r4, r8
	ldrne	ip, [r5, #4]
	bne	.L114
.L129:
	ldr	r2, [r5, #0]
	ldr	r3, [r5, #8]
	add	r3, r2, r3
	str	r3, [r5, #0]
.L111:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L126:
	mov	r3, #0
	str	r3, [r0, #0]
	ldr	r3, .L131+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L131+24
	smull	r1, ip, r0, ip
	mov	r3, r0, asr #31
	add	ip, ip, r0
	rsb	ip, r3, ip, asr #7
	rsb	ip, ip, ip, asl #4
	sub	ip, r0, ip, asl #4
	str	ip, [r5, #4]
	ldr	r6, .L131+4
	b	.L116
.L128:
	mov	lr, #0
	ldr	r1, .L131+20
	str	lr, [r5, #0]
	mov	lr, pc
	bx	r1
	ldr	r2, .L131+24
	smull	sl, r3, r2, r0
	mov	ip, r0, asr #31
	add	r3, r3, r0
	ldr	r1, [r9, #0]
	ldr	r2, [fp, #0]
	rsb	r3, ip, r3, asr #7
	rsb	r3, r3, r3, asl #4
	sub	r0, r0, r3, asl #4
	add	r2, r2, #10
	sub	r1, r1, #1
	mov	r3, #0
	str	r2, [fp, #0]
	str	r0, [r5, #4]
	str	r3, [r5, #20]
	str	r1, [r9, #0]
	ldr	r2, .L131+28
	b	.L122
.L121:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #24
	beq	.L120
.L122:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	bne	.L121
	ldr	sl, .L131+28
	add	r3, r3, r3, asl #1
	add	r3, sl, r3, asl #3
	mov	r1, #1
	str	r1, [r3, #20]
	b	.L120
.L127:
	mov	r4, #0
	ldr	r3, .L131+20
	str	r4, [r5, #0]
	mov	lr, pc
	bx	r3
	ldr	ip, .L131+24
	smull	r2, ip, r0, ip
	ldr	r3, .L131+16
	ldr	r2, .L131+12
	mov	r1, r0, asr #31
	add	ip, ip, r0
	rsb	ip, r1, ip, asr #7
	ldr	lr, [r2, #0]
	ldr	r1, [r3, #0]
	rsb	ip, ip, ip, asl #4
	sub	ip, r0, ip, asl #4
	sub	lr, lr, #1
	add	r0, r1, #10
	ldr	r1, .L131+28
	str	ip, [r5, #4]
	str	r4, [r5, #20]
	str	lr, [r2, #0]
	str	r0, [r3, #0]
	mov	r3, r1
.L119:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	beq	.L130
	add	r4, r4, #1
	cmp	r4, #10
	add	r3, r3, #24
	bne	.L119
.L118:
	ldr	r3, .L131+32
	mov	r2, #1
	str	r2, [r3, #0]
	b	.L116
.L130:
	add	r4, r4, r4, asl #1
	add	r1, r1, r4, asl #3
	mov	r3, #1
	str	r3, [r1, #20]
	ldr	ip, [r5, #4]
	b	.L118
.L132:
	.align	2
.L131:
	.word	player
	.word	collision
	.word	bullets
	.word	enemiesRemaining
	.word	scoreNumber
	.word	rand
	.word	-2004318071
	.word	enemies
	.word	isHit
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	bl	updatePlayer
	ldr	r5, .L142
	mov	r4, #0
.L134:
	add	r0, r5, r4, asl #5
	add	r4, r4, #1
	bl	updateBullet
	cmp	r4, #5
	bne	.L134
	ldr	r5, .L142+4
	mov	r4, #0
.L135:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateStar
	cmp	r4, #30
	bne	.L135
	ldr	r5, .L142+8
	mov	r4, #0
.L136:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateAsteroid
	cmp	r4, #6
	bne	.L136
	ldr	r5, .L142+12
	mov	r4, #0
.L137:
	add	r0, r4, r4, asl #1
	add	r0, r5, r0, asl #3
	add	r4, r4, #1
	bl	updateEnemy
	cmp	r4, #10
	bne	.L137
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	bullets
	.word	stars
	.word	asteroids
	.word	enemies
	.size	updateGame, .-updateGame
	.comm	player,32,4
	.comm	bullets,160,4
	.comm	stars,720,4
	.comm	asteroids,144,4
	.comm	enemies,240,4
	.comm	enemiesRemaining,4,4
	.comm	scoreNumber,4,4
	.comm	activeStars,4,4
	.comm	livesRemaining,4,4
	.comm	isHit,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
