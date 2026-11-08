       ;mov    R1, #0x1000

       ;       while loop
       ;while  ldr R0, [R1]
       ;       add R0, R0, #1
       ;       str R0, [R1]
       ;       cmp R0, #100
       ;       Bne while



toplam DCD     0
       ;       for loop
       mov     R1, #toplam
       mov     R2, #1 ; index

for    ldr     R0, [R1]
       add     R0, R0, R2
       add     R2, R2, #1
       str     R0, [R1]
       cmp     R2, #10
       Bne     for