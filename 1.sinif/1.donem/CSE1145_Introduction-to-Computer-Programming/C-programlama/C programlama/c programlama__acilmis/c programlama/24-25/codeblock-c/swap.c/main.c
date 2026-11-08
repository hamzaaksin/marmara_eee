#include <stdio.h>
#include <stdlib.h>

int main()
{
    double num1, num2, space;


    scanf("%lf%lf", &num1, &num2);
    space = num1;
    num1 = num2;
    num2= space;


    printf("After swapping, first number = %.2lf\nAfter swapping, second number =%.2lf", num1, num2);


    return 0;
}


