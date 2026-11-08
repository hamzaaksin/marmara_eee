import java.util.Scanner;
public class ATM{
    private Scanner input = new Scanner(System.in);
    private Account[] account;

     public ATM(){
        account = new Account[5];

        for(int i = 0 ; i < 5; i++){
            account[i] = new Account();
            account[i].setId(i+1);
            account[i].setBalance(500);
        }
    }

    public void deposit(){

    }

    public void withdraw(){

    }

    public int getAChoice(){
        System.out.println("Main menu");
        System.out.println("1: check balance");
        System.out.println("2: withdraw");
        System.out.println("3: deposit");
        System.out.println("4: log off");
        System.out.print("Enter a choice: ");

        int choice = input.nextInt();
        return choice;
    }

}  
class Account{

    private int id;
    private double balance;

    public Account(){

    }

    public int getId(){
        return id;
    }

    public double getBalance(){
        return balance;
    }

    public void setId(int newId){
        id = newId;
    }

    public void setBalance(double newBalance){
        balance = newBalance;
    }

    public void withdraw(double amount){
        balance = balance - amount;
    }

    public void deposit(double amount){
        balance = balance + amount;
    }

   

}
