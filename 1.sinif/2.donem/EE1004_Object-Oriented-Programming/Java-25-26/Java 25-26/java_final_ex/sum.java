import java.util.Scanner;

public class Main {
    public static void main(String [] args){
    Scanner input = new Scanner(System.in);
    int i = input.nextInt();
    input.nextLine();
    System.out.println("         i      m(i)");
    
    
    for(int p = 1; p <=i ; p++){
      System.out.print(p);
      System.out.printf("%.4f", m(i));  
    }
    


    }
    public static double m(int i){
        double sum = 0;

        for(int k = 1; k <= i; k++){
            sum = sum + k*(1.0) / (2*k+1);
            
        }
        return sum;
    }
}
