#include <stdio.h>
#include <stdlib.h>

int main()
{
    char character;


    scanf("%c", &character);
    printf("Enter an alphabet: %c\n", character);

    if((character <= 'z' && character >= 'a') || (character <= 'Z' && character >= 'A')){


    switch(character){
        case 'a':
        printf("%c is a vowel.\n", character);
        break;
        case 'A':
        printf("%c is a vowel.\n", character);
        break;
        case 'e':
        printf("%c is a vowel.\n", character);
        break;
        case 'E':
        printf("%c is a vowel.\n", character);
        break;
        case 'I':
        printf("%c is a vowel.\n", character);
        break;
        case'i':
        printf("%c is a vowel.\n", character);
        break;
        case 'U':
        printf("%c is a vowel.\n", character);
        break;
        case'u':
        printf("%c is a vowel.\n", character);
        break;
        case 'O':
        printf("%c is a vowel.\n", character);
        break;
        case'o':
        printf("%c is a vowel.\n", character);
        break;
        default:
        printf("%c is a consonant.\n", character);
    }

    }
    else if(!((character <= 'z' && character >= 'a') || (character <= 'Z' && character >= 'A'))){
        printf("Invalid entry!");
    }
    return 0;
}
// another solution

/*
    #include <stdio.h>

int main(){
    char character;

    scanf("%c", &character);

    printf("Enter an alphabet: %c\n", character);

    if(!(('a' <= character && character <= 'z') || ('A' <= character && character <= 'Z'))){
        printf("Invalid entry!");
    }
     else if (character == 'a'|| character == 'e' || character == 'i' || character == 'u' || character == 'o' || character == 'A' || character == 'E' || character == 'I' || character == 'U' || character == 'O'){
        printf("%c is a vowel. ", character);
    }
    else{
        printf("%c is a consonant.", character);
    }



    return 0;
}
*/
