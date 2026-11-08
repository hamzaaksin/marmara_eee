       mov     R0, #-110

       cmp     R0, #100


       ;       R0 < 100 ise 1 0 0
       ;       R0 = 100 ise 0 1 1
       ;       R0 > 100 ise 0 0 1


       movgt   R5, #3
       movlt   R6, #4
       moveq   R7, #5
       movle   R8, #6
       movge   R9, #7

       addge   R10, R10, #8

       rsble   R11, R0, #0

