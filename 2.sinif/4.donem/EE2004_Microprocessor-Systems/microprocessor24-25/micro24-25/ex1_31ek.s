veri   DCD     7,3,9, 22,4,0, 5, 11, 2, 5
sum    dcd     0



main   mov     r0, #veri
       mov     r1, #sum
       ldr     r2, [r1]
       mov     r3, #0 ; indeks

for    ldr     r4, [r0, r3, lsl #2]

       add     r2, r2, r4
       add     r3, r3, #1
       cmp     r3, #10
       blt     for

       str     r2, [r1]

