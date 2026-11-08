#include <stdio.h>
int main(){
    
    char ch;
     
    scanf("%c", &ch);
    
    if((ch>='A' && ch<='Z') || (ch>='a' && ch<='z')){
        switch(ch){
            
            case 'A':
            case 'E':
            case 'I':
            case 'O':
            case 'U':
            case 'a':
            case 'e':
            case 'i':
            case 'o':
            case 'u':
            
            printf("%c is a VOWEL.",ch );
            break;
            default:
            printf("%c is a CONSONANT.",ch);
            
        }
    }
    
    else{
        printf("%c is not a letter.", ch);
        
    }
    
    return 0;
}