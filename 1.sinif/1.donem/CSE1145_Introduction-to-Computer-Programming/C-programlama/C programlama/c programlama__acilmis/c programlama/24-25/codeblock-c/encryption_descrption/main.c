#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define ASCII_START 32
#define ASCII_END 126
#define ASCII_RANGE (ASCII_END - ASCII_START + 1)

void encryptText(char *text, int key){
    for(int i = 0; text[i] != '\0'; i++){
        if(text[i] >= ASCII_START && text[i] <= ASCII_END){
            text[i] = ASCII_START + ((text[i] - ASCII_START + key) % ASCII_RANGE);
    }
}
}

void decryptText(char *text, int key){
    for(int i = 0; text[i] != '\0'; i++){
        if(text[i] >= ASCII_START && text[i] <= ASCII_END){
            text[i] = ASCII_START + ((text[i] - ASCII_START - key + ASCII_RANGE) % ASCII_RANGE);
        }
    }
}

int main(){
    char text[1000];
    int key;
    int choice;

    printf("Data Encryption and Decryption\n");
    printf("--------------------------------\n");

    while(1){
        printf("1. Encrypt text\n");
        printf("2. Decrypt text\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        printf("%d\n", choice);
        getchar();

        if (choice == 3){
            printf("Exiting the program. Goodbye!\n");
            break;
        }

        printf("Enter the text to decrypt: ");
        fgets(text, sizeof(text), stdin);
        text[strcspn(text, "\n")] = '\0';
        printf("%s\n", text);

        printf("Enter the key for decryption: ");
        scanf("%d", &key);
        printf("%d", key);
        getchar();

        if(choice == 1){
            encryptText(text, key);
            printf("\nEncrypted Text: %s", text);
        }else if(choice == 2){

            decryptText(text, key);
            printf("\nDecrypted Text: %s", text);
        }else {
            printf("Invalid choice. Please try again.\n");
        }
        printf("\n\nData Encryption and Decryption\n");
        printf("--------------------------------\n");
    }
    return 0;
}
