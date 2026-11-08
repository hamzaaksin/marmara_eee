#include <stdio.h>
#include <stdlib.h>

int main()
{
    int given,a,sum;
    given=0;
    a=1;
    sum=0;

    printf("Please give number:\n");
    scanf("%d", &given);


    while(given>0){

      printf("%d\n", given);
      sum=sum+a;
      a++;
      given--;

    }


    printf("Sum is %d", sum);




    return 0;
}
