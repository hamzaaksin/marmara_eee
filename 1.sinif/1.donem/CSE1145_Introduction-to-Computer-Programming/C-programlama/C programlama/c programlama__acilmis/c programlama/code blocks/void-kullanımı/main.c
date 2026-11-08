#include <stdio.h>
#include <stdlib.h>

void anything(void);
int main()
{
    int i;
    for(i=0; i<5; i++){
        anything();

    }
    return 0;
}
void anything(void){

        printf("Excellent\n");

}
