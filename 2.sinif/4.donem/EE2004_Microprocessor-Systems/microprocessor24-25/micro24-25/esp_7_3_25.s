sum    DCD     0


       mov     R0, #1 ; index
       mov     R1, #sum


LOOP   ldr     R2, [R1]
       add     R3, R0, R2
       str     R3, [R1]
       add     R0, R0, #1
       cmp     R0, #10
       BLE     LOOP

       ;       ldr R2, [R1];

       ;LOOP   add R3, R0, R3
       ;       add R0, R0, #1
       ;       cmp R0, #10
       ;       BLE LOOP

       ;       str R3, [R1]

