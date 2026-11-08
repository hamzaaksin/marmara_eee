#include <stdio.h>
int main(){
    int matris[2][2];
    int a,b;
    
    for(a=1 ;a<3; a++){                         //what about a=1 and a<3//
     
     for(b=1; b<3; b++){
         scanf("%d", &matris[a][b]);
         
     }
    
    }  
    
    for(a=1; a<3; a++){
        
        for(b=1; b<3; b++){
        
         printf("%d ", matris[a][b]);
        }
        printf("\n");
    }
    return 0;
}