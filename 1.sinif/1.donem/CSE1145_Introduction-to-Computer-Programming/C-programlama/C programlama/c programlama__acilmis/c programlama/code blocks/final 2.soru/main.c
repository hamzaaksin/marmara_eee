#include <stdio.h>

void swap3Numbers(int* x, int* y, int* z) {
    int temp = *x;
    *x = *z;
    *z = *y;
    *y = temp;
}
