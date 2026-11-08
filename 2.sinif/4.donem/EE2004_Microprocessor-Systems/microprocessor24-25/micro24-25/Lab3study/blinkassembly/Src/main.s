.syntax unified
.thumb

.equ RCC_BASE,		(0x40023800)
.equ RCC_AHB1ENR,	(RCC_BASE + 0x30)
.equ RCC_AHB1ENR_GPIOAEN,	(1 << 0)

.equ GPIOA_BASE,	(0x40020000)
.equ GPIOA_MODER,	(GPIOA_BASE + 0x00)
.equ GPIO_MODER_5_MASK,		(0b11 << 10)
.equ GPIO_MODER_5_OUTPUT,	(0b01 << 10)
.equ GPIOA_BSRR,	(GPIOA_BASE + 0x18)

.text
.align 2
.global main

main:
	@ Enable clock to GPIOA
	ldr		r0, =RCC_AHB1ENR
	ldr		r1, [r0]
	orr		r1, RCC_AHB1ENR_GPIOAEN
	str		r1, [r0]
	@ Set GPIOA5 as output
	ldr		r0, =GPIOA_MODER
	ldr		r1, [r0]
	and		r1, ~GPIO_MODER_5_MASK
	orr		r1, GPIO_MODER_5_OUTPUT
	str		r1, [r0]

loop:
	ldr		r0, =GPIOA_BSRR
	ldr		r1, [r0]
	orr		r1, 1 << 5
	str		r1, [r0]

	ldr		r0, =5000000
	bl		delay

	ldr		r0, =GPIOA_BSRR
	ldr		r1, [r0]
	orr		r1, 1 << (5 + 16)
	str		r1, [r0]

	ldr		r0, =5000000
	bl		delay

	b	loop

delay:
delay_loop:
	subs	r0, #1
	bne		delay_loop
	bx		lr




