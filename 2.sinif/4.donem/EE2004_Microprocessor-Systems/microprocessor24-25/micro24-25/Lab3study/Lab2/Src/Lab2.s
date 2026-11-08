.text
.align
.global main


veri: .word 10,2,13,24,5,88,44,1,0,9,36,75,62,91,66,101,53,109,59,71

main:

boyut = (. - veri)/4
mov r5, #boyut
mov r2, #0
ldr r0, =veri

dongu:
	ldr r1, [r0]
		cmp r1,r2
		bgt guncel
	add r0, r0, #4
	sub r5, r5, #1
	cmp r5, #0
bne dongu
beq END

guncel:
mov r2, r1
cmp r5, #0
bne dongu

END: B END
.end
