#include <stdio.h>
int main(){

    int input, j, result = 1;

    scanf("%d", &input);

    for(j=1; j<=input; j++){

        result*=j;

    }

    printf("%d", result);



    return 0;
}
