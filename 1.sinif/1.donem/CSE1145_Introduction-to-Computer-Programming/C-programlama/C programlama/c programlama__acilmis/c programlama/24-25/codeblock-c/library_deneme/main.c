#include <stdio.h>
#include <string.h>

#define MAX_ACCOUNTS 100
#define SAVINGS_INTEREST_RATE 0.02

typedef struct {
    int accountNumber;
    char holderName[50];
    char accountType[10];
    double balance;
    int pin;
} Account;

Account accounts[MAX_ACCOUNTS];
int accountCount = 0;
int nextAccountNumber = 1000;

void openAccount() {
    if (accountCount >= MAX_ACCOUNTS) {
        printf("Account limit reached. Cannot create more accounts.\n");
        return;
    }

    Account newAccount;

    scanf(" %[^ \n]%*c", newAccount.holderName);
    printf("Enter account holder name: %s\n",newAccount.holderName);

    scanf(" %[^ \n]%*c", newAccount.accountType);
    printf("Enter account type (Savings/Current): %s\n",newAccount.accountType);

    scanf("%lf", &newAccount.balance);
    printf("Enter initial deposit: %.2lf\n",newAccount.balance);

    scanf("%d", &newAccount.pin);
    printf("Set a 4-digit PIN: %d\n",newAccount.pin);
    newAccount.accountNumber = nextAccountNumber++;
    accounts[accountCount++] = newAccount;

    printf("Account created successfully! Your account number is %d\n", newAccount.accountNumber);
    printf("\n");
}

void addFunds() {
    int accountNumber;
    double amount;
    scanf("%d", &accountNumber);
    printf("Enter account number: %d\n",accountNumber);


    for (int i = 0; i < accountCount; i++) {
        if (accounts[i].accountNumber == accountNumber) {
            scanf("%lf", &amount);
            printf("Enter amount to deposit: %lf\n",amount);

            accounts[i].balance += amount;
            printf("Amount deposited successfully! New balance: %.2f\n", accounts[i].balance);
            return;
        }

    }

    printf("Account not found.\n");
    printf("\n");
}

void checkBalance() {
    int accountNumber, pin;
    scanf("%d", &accountNumber);
    printf("Enter account number: %d\n",accountNumber);

    scanf("%d", &pin);
    printf("Enter PIN: %d\n",pin);


    for (int i = 0; i < accountCount; i++) {
        if (accounts[i].accountNumber == accountNumber && accounts[i].pin == pin) {
            printf("Account Holder: %s\n", accounts[i].holderName);
            printf("Account Type: %s\n", accounts[i].accountType);
            printf("Current Balance: %.2f\n", accounts[i].balance);
            printf("\n");
            return;
        }
    }

    printf("Invalid account number or PIN.\n");

}

void calculateInterest() {
    for (int i = 0; i < accountCount; i++) {
        if (strcmp(accounts[i].accountType, "Savings") == 0) {
            accounts[i].balance += accounts[i].balance * SAVINGS_INTEREST_RATE;
            printf("Interest applied to account %d. New balance: %.2f\n", accounts[i].accountNumber, accounts[i].balance);
        }
    }
    printf("\n");
}

void displayAccounts() {
    if (accountCount == 0) {
        printf("No accounts found.\n");
        printf("\n");
        return;
    }

    printf("\nList of All Accounts:\n");
    printf("Account Number | Account Holder | Account Type | Balance\n");
    printf("--------------------------------------------------------\n");

    for (int i = 0; i < accountCount; i++) {
        printf("%d | %s | %s | %.2f\n", accounts[i].accountNumber, accounts[i].holderName, accounts[i].accountType, accounts[i].balance);
    }
    printf("\n");
}

int main() {
    int choice;

    do {
        printf("=== Banking System Simulation ===\n");
        printf("1. Create Account\n");
        printf("2. Deposit Money\n");
        printf("3. Withdraw Money\n");
        printf("4. Balance Inquiry\n");
        printf("5. Apply Interest (Savings Accounts Only)\n");
        printf("6. List All Accounts\n");
        printf("7. Exit\n");
        scanf("%d", &choice);
        printf("Enter your choice: %d\n",choice);


        switch (choice) {
            case 1:
                openAccount();
                break;
            case 2:
                addFunds();
                break;
            case 4:
                checkBalance();
                break;
            case 5:
                calculateInterest();
                break;
            case 6:
                displayAccounts();
                break;
            case 7:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice. Please try again.\n");
        }
    } while (choice != 7);

return 0;
}
