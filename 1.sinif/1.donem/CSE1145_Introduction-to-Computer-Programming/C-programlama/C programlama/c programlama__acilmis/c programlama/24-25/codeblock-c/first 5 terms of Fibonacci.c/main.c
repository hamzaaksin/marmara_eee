#include <stdio.h>
int main(){
    int number, i,j, k, x;

    scanf("%d", &number);

    i=0;
    j=1;
    k=i+j;

    printf("First %d terms of Fibonacci series are :\n%d\n%d\n%d\n",number, i, j,k);
    for(x=4; x<=number; x++){

        i=j;
        j=k;
        k=i+j;
        printf("%d\n", k);
    }





    return 0;
}
