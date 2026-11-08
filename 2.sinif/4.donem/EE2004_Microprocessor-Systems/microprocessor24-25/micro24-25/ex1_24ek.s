veri1  DCD     -130
veri2  DCD     82


       mov     R1, #veri1

       ldr     R2, [R1]

       cmp     R2, #0

       rsble   R3, R2, #0

       mov     R4, #veri2

       str     R3, [R4]