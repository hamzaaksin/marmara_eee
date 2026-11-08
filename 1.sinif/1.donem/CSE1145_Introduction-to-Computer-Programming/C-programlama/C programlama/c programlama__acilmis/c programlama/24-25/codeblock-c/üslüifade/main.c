#include <stdio.h>
int main(){
    int down, up, i, result=1;

    scanf("%d%d", &down, &up);

    for(i=1; i<=up; i++){

        result*=down;

    }

    printf("%d", result);


    return 0;
}
