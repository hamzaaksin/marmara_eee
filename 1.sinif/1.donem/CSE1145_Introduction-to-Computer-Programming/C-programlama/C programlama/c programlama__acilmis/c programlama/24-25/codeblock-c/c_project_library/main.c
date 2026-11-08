#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BOOKS 50
#define MAX_CUSTOMERS 50


typedef struct{
    int ID;
    char title[50];
    char author[50];
    int isborrowed;  // 0=available, 1= borrowed
}Book;

typedef struct{
    int ID;
    char name[50];
    char contact[20];
}customer;
// global variables
Book books[MAX_BOOKS];
customer customers[MAX_CUSTOMERS];
int numberofbook =0;
int numberofcustomer = 0;

void addbook() {

    if (numberofbook >= MAX_BOOKS){
        printf("Book storage is full\n");
        return;
    }
    scanf("%d", &books[numberofbook].ID);
    printf("\nEnter book ID: %d", books[numberofbook].ID);


    printf("\nEnter book title: ");
    // birden fazla harf gireceðim için bu olmaz.  Ayný zamanda da girilen enter tuþunu fgets in okumamasý için temizlemem gerekiyor. O yüzden bunu kullanamam: scanf("%c", &books[numberofbook].title);
    getchar();
    fgets(books[numberofbook].title, 50, stdin);
    books[numberofbook].title[strcspn(books[numberofbook].title, "\n")] = '\0';
    printf("%s", books[numberofbook].title);

    printf("\nEnter book author: ");
    fgets(books[numberofbook].author, 50, stdin);
    books[numberofbook].author[strcspn(books[numberofbook].author, "\n")] = '\0';
    printf("%s", books[numberofbook].author);
    books[numberofbook].isborrowed = 0;
    numberofbook++;
    printf("\nBook added successfully!\n\n");
}
void listbook(){

    if (numberofbook== 0){
        printf("\nNo books available.\n\n");
        return;
    }
    printf("\nAvailable Books:\n");
    for(int i = 0; i < numberofbook; i++){
        printf("ID: %d, Title: %s, Author: %s, Status: %s\n\n",books[i].ID, books[i].title, books[i].author,books[i].isborrowed ? "Borrowed" : "Available");
    }
}

void deletebook(){

    int bookID;
    printf("Enter book ID to delete: ");
    scanf("%d", &bookID);

    int found = -1;
    for(int i = 0; i < numberofbook; i++){
        if( books[i].ID == bookID){
            found = i;
            break;
        }
    }

    if (found == -1){
        printf("Book not found.\n");
        return;
    }

    for(int i = found; i< numberofbook - 1; i++){
        books[i] = books[i+1];
    }
    numberofbook--;
    printf("\nBook deleted successfully!\n\n");
}

void searchbook(){
    char query[50];
    printf("Enter title or author to search: ");
    getchar();
    fgets(query, 50, stdin);
    query[strcspn(query, "\n")] = '\0';

    int found = 0;
    for(int i = 0; i < numberofbook; i++){
        if(strstr(books[i].title, query) || strstr(books[i].author, query)){
            printf("ID: %d, Title: %s, Author: %s, Status: %s\n\n",
                   books[i].ID, books[i].title, books[i].author, books[i].isborrowed ? "Borrowed": "Available");
                   found = 1;
        }

    }

    if (!found){
        printf("\nNo books found matching the querry.\n\n");
    }

}

void registercustomer(){
    if(numberofcustomer >= MAX_CUSTOMERS){
        printf("Clients storage is full!\n");
        return;
    }

    printf("\nEnter client ID: " );
    scanf("%d", &customers[numberofcustomer].ID);

    printf("%d\nEnter client name: ", customers[numberofcustomer].ID);
    getchar();
    fgets(customers[numberofcustomer].name, 50, stdin);
    customers[numberofcustomer].name[strcspn(customers[numberofcustomer].name, "\n")] = '\0';
    printf("%s", customers[numberofcustomer].name);

    printf("\nEnter client contact: ");
    fgets(customers[numberofcustomer].contact, 20, stdin);
    customers[numberofcustomer].contact[strcspn(customers[numberofcustomer].contact, "\n")] = '\0';
    printf("%s", customers[numberofcustomer].contact);
    numberofcustomer++;

    printf("\nClient registered successfully!\n\n");

}

void listcustomer(){
    if (numberofcustomer == 0){
        printf("No clients registered.\n");
        return;
    }
    for(int i = 0; i < numberofcustomer; i++){
        printf("\nRegistered Clients:\nID: %d, Name: %s, Contact: %s\n\n", customers[i].ID, customers[i].name, customers[i].contact);
    }
}
void borrowbook(){
    int customerID, bookID;
    scanf("%d", &customerID);
    printf("\nEnter client ID: ");
    scanf("%d", &bookID);
    printf("%d\nEnter book ID: ", customerID);
    int bookfound = -1;
    for (int i= 0; i< numberofbook; i++){
        if(books[i].ID == bookID){
            bookfound = i;
            break;
        }
    }
    if (bookfound == -1 || books[bookfound].isborrowed){
        printf("Book not available for borrowing.\n");
        return;
    }
    books[bookfound].isborrowed = 1;
    printf("Book borrowed successfully!\n\n");

}

void returnbook(){
    int bookID;
    printf("Enter book ID to return: ");
    scanf("%d", &bookID);

    int bookfound = -1;
    for(int i = 0; i< numberofbook; i++){
        if(books[i].ID == bookID){
            bookfound = i;
            break;
        }
    }
    if (bookfound == -1 || !books[bookfound].isborrowed){
        printf("Book not found or not borrowed.\n");
        return;
    }
    books[bookfound].isborrowed = 0;
    printf("Book returned successfully!\n\n");
}
void displaymenu(){
    printf("=== Library Management System ===\n");
    printf("1. Add Book\n");
    printf("2. Delete Book\n");
    printf("3. Search Book\n");
    printf("4. List All Books\n");
    printf("5. Register Client\n");
    printf("6. List All Clients\n");
    printf("7. Borrow Book\n");
    printf("8. Return Book\n");
    printf("9. Exit\n");
    printf("Enter your choice: ");
}
int main(){
    int choice;
    do{
        displaymenu();
        scanf("%d", &choice);
        printf("%d", choice);

        switch(choice){
            case 1: addbook();
                break;
            case 2: deletebook();
                break;
            case 3: searchbook();
                break;
            case 4: listbook();
                break;
            case 5: registercustomer();
                break;
            case 6: listcustomer();
                break;
            case 7: borrowbook();
                break;
            case 8: returnbook();
                break;
            case 9: printf("\nExiting...\n");
                break;
            default: printf("Invalid choice!\n");
        }
    } while (choice != 9);
    return 0;
}


