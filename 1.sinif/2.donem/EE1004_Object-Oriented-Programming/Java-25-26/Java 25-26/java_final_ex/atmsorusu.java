import java.util.Scanner;

public class ATM{
    private Account[] accounts; // Account adında bir dizi tanımlıyoruz.

    public ATM(){ //constructorumuz olcak bu
        accounts = new Account[5];  //5 tane account oluşturmamızı istedi bizde oluşturduk
        //default atm object demiş yani atm oluşturulunca hesapların otomatik hazır olması lazım o yüzden burda initial balance larıda yaparız
        //accounts[i] bir Account nesnesi tutar çünkü öyle tipi Account olrak tanımlanmış.
        
        for(int i=0; i<5; i++){
        accounts[i] = new Account(500); //accounts dizisine Account olarak koyduk
        }
    }
    public void deposit(){

    }
    public void withdraw(){

    }
    public int getAChoice(){
        
        return ;
    }
}
public class Test(){
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int ID = input.nextInt();

        ATM atm = new ATM();

        while(true){
            System.out.print("Enter ID: ");
            int id = input.nextInt();

            if(id == 0){
                System.out.println("Good bye");
                break;
            }
            else if(id < 1 || id > 5){
                System.out.println("Invalid ID");
            }
            else{
                System.out.println("1. View the balance\n2. Withdraw\n3. Deposit\n4. Log off");
                int choice = input.nextInt();

                if(choice == 1){
                    
                }
                else if(choice == 2){
                    atm.withdraw();
                }
                else if(choice == 3){
                    atm.deposit();
                }
                else if(choice == 4){
                    break;
                }
                
            }
        }

    }
}