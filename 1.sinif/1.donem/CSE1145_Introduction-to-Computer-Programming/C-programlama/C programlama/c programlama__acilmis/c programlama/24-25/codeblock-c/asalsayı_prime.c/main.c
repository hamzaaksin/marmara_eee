#include <stdio.h>
int main()
{
   int N, flag_var, primeCand, divisor;

   //Store the range in variables using scanf
   scanf("%d", &N);
   if(N > 0){
        for(primeCand=2; primeCand<=N; ++primeCand)
        {
            flag_var=1;
            for(divisor=2; divisor<=primeCand/2; ++divisor)
            {
                if(primeCand%divisor==0)
                {
                 flag_var=0;
                    break;
                }
            }
            if(flag_var==1)
                printf("%d is prime\n",primeCand);
        }
   }
   else
        printf("Invalid input.");

  return 0;
}
