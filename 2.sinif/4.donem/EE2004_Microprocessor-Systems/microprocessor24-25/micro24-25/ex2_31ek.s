       mov     r0, #35
       mov     r1, #55

       adr     r5, 0x300
       bl      gcd


gcd    cmp     r0,r1
       beq     halt
       subgt   r0,r0,r1
       sublt   r1,r1,r0
       b       gcd


halt   
       str     r0, [r5]