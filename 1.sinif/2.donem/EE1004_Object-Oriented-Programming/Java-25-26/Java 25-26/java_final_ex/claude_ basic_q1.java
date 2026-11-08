import java.util.Scanner;
public class Main {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);
        int a = input.nextInt();
        System.out.println("        n        s(n)");
        
        for(int k=1; k<=a; k++){     
        //System.out.print(k + "     " + sum(k));  
        System.out.printf("%d", k);  
        System.out.print("         ");
        System.out.printf("%.4f", sum(k));        
        }

    }

    public static double sum(int n){
        double sum = 0;

        for(int i=1; i<= n; i++){
        sum += (Math.pow(i,2)) / (i + (1.0));
    }
        return sum;
    }
}
