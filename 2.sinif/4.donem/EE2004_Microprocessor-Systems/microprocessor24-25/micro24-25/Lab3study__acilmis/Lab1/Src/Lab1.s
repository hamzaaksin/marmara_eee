.text
.align 2
.global main

Loc1 = 0x20002000
Loc2 = 0x20003000


main:
        ldr r0, =Loc1
        ldr r1, =0xf0f1f2f3
        mov r2, #4 // index
        ldr r3, =0x04040404

filling: str r1, [r0]
         sub r2, r2, #1
         add r0, r0, #4
         add r1, r1, r3
         cmp r2, #0
         bgt filling

def1: mov r1, #16 // index
      mov r2, #0 // sum
      mov r3, #0 // comparison
      mov r4, #1 // mask
      ldr r0, =Loc1

collect: ldrb r5, [r0]
		 mov r6, r5
		 add r0, r0, #1
         sub r1, r1, #1
         and r5, r5, r4
         	cmp r5,r4
         	beq odd
         cmp r1, #0
         bgt collect
         beq avg

odd:	 add r2,r2,r6
         cmp r1, #0
         bgt collect

avg:     lsr r7, r2, #3
         ldr r0, =Loc2
         str r7, [r0]

END: B END
.end
