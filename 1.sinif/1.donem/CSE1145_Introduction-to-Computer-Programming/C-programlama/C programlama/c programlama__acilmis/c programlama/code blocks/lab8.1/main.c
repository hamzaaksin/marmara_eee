#include <stdio.h>
#include <stdlib.h>




int main()
{
    int number;
    int result;


    printf("Please give a number");
    scanf("%d", &number);

    result = number %2;

    if(result==1)
    { printf("odd");

    }
    else
    {
        printf("even");
    }
    return 0;
}
