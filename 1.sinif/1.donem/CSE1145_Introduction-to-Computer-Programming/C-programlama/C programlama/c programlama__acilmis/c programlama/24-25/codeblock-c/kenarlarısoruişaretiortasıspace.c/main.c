#include <stdio.h>

int main()
{

    int row, column,i,x;

    scanf("%d%d",&row, &column);

for(x=1; x<=row ; x++){


    for(i=1; i<=column; i++){
        if(i==1 || i == column || x==1 || x == row){
            printf("?");
        }
        else{
            printf(" ");
        } }
    printf("\n");

}
    return 0;
}

/*
            ???
 3 3        ? ?
            ???
