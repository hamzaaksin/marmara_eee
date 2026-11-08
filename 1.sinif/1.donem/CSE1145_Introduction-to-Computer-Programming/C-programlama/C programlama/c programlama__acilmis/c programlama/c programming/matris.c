#include <stdio.h>
int main(){
    int matris[3][5];
    int a,b;
    int sum = 0;
    for(a=0; a<3; a++){
        
        for(b=0; b<5; b++){
            scanf("%d", &matris[a][b]);
        }

    }
    
    for(a=0; a<3; a++){
        
        for(b=0; b<5; b++){
            printf("%d ", matris[a][b]);
        }
        printf("\n");
    }
    
   
    for(b=0; b<5; b++){
        for(a=0; a<3; a++){
       
       sum += matris[a][b];
        }
     
            printf("%d ", sum);
            sum=0;
    }
    
    
    return 0;
}