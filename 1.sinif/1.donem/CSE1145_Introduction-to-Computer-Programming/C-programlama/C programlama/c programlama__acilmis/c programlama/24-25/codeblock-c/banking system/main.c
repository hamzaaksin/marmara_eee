#include <stdio.h>
#include <string.h>

#define MAX_ACCOUNTS 50
#define SAVINGS "Savings"
#define CURRENT "Current"

typedef struct{

    int accountnumber;
    char name[50];
    char accounttype[10];
    float balance;
    int pin;
}Account;

Account accounts[MAX_ACCOUNTS];
int accountcount = 0;

int generateaccountnumber(){
    return 1000 + accountcount;
}

void createaccount(){
    if(accountcount >= MAX_ACCOUNTS){
        printf("Maximum account limit reached.\n");
        return;
    }
    Account newaccount;
    newaccount.accountnumber = generateaccountnumber();

    printf("Enter account holder name: ");
    fgets(newaccount.accounttype, sizeof(newaccount.accounttype),stdin);
    newaccount.accounttype[strcspn(newaccount.accounttype, "\n")] = '\0';

    printf("\nEnter account type(Savings/Current): ");
    fgets(newaccount.accounttype, sizeof(newaccount.accounttype), stdin);
    newaccount.accounttype[strcspn(newaccount.accounttype, "\n")] = '\0';

    printf("\nEnter initial deposit: ");
    scanf("%f", &newaccount.balance);

    printf("\nSet a 4-digit PIN: ");
    scanf("%d", &newaccount.pin);
    getchar();

    accounts[accountcount++]= newaccount;
    printf("Account created succesfully! Your account number is %d\n", newaccount.accountnumber);
}

void depositmoney(){
    int accnum, pin;
    float amount;
    printf("Enter account number: ");
    scanf("%d", &accnum);
    printf("%d\n", accnum);
    //printf("%d\nEnter PIN: ", accnum);
    scanf("%d", &pin);

    for(int i=0; i< accountcount; i++){
        if(accounts[i].accountnumber== accnum && accounts[i].pin == pin){
            printf("Enter deposit amount: ");
            scanf("%f", &amount);
            accounts[i].balance += amount;
            printf("Deposit succesful! New balance: %.2f\n", accounts[i].balance);
            return;
        }
    }
    printf("Account not found.\n\n");
}

void withdradmoney(){
    int accnum, pin;
    float amount;
    printf("Enter account number: ");
    scanf("%d", &accnum);
    printf("Enter PIN: ");
    scanf("%d", &pin);

    for(int i = 0; i < accountcount; i++){
        if(accounts[i].accountnumber == accnum && accounts[i].pin == pin){
            printf("Enter withdrawal amount: ");
            scanf("%f", &amount);
            if(accounts[i].balance >= amount){
               accounts[i].balance -= amount;
               printf("Withdrawal successfull! Remaining balance: %.2f\n", accounts[i].balance);
            }else {
                printf("Insufficient balance.\n");
            }
            return;
        }
    }
    printf("Account not found or inccorect PIN.\n");
}

void balanceinquiry(){
    int accnum, pin;
    printf("Entere account number: ");
    scanf("%d", &accnum);
    printf("Enter PIN: ");
    scanf("%d", &pin);

    for(int i = 0; i < accountcount; i++){
        if(accounts[i].accountnumber == accnum && accounts[i].pin == pin){
            printf("Account Holder: %s\n", accounts[i].name);
            printf("Account Type: %s\n", accounts[i].accounttype);
            printf("Current Balance: %.2f\n", accounts[i].balance);
            return;
        }
    }
    printf("Account not found or incorrect PIN.\n");
}

void applyinterest(){
    for(int i = 0; i < accountcount; i++){
        if(strcmp(accounts[i].accounttype, "Savings") == 0){
            accounts[i].balance += accounts[i].balance *0.02;
            printf("Ineters applied to account %d. New balance: %.2f\n", accounts[i].accountnumber, accounts[i].balance);

        }
    }
}

void listallaccounts(){
    if (accountcount == 0){
        printf("No accounts found.\n\n");
        return;
    }
    printf("List of All Accounts:\n");
    printf("Account Number | Account Holder | Account Type | Balance\n");
    printf("--------------------------------------------------------\n");
    for (int i = 0; i < accountcount; i++) {
        printf("%d | %s | %s | %.2f\n", accounts[i].accountnumber, accounts[i].name, accounts[i].accounttype, accounts[i].balance);
}
}

int main(){
    int choice ;
    while(1){
        printf("=== Banking System Simulation ===\n");
        printf("1. Create Account\n");
        printf("2. Deposit Money\n");
        printf("3. Withdraw Money\n");
        printf("4. Balance Inquiry\n");
        printf("5. Apply Interest (Savings Accounts Only)\n");
        printf("6. List All Accounts\n");
        printf("7. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        printf("%d\n", choice);
        getchar();


  switch (choice) {
            case 1:
                createaccount();
                break;
            case 2:
                depositmoney();
                break;
            case 3:
                withdradmoney();
                break;
            case 4:
                balanceinquiry();
                break;
            case 5:
                applyinterest();
                break;
            case 6:
                listallaccounts();
                break;
            case 7:
                printf("Exiting...\n");
                return 0;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    }
    return 0;
}

