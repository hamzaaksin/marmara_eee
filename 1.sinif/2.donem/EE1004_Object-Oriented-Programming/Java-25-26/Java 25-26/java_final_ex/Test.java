import java.util.Scanner;

public class MATH {
    public static void main(String[] args){                                    //Math.round(m(k) * 10000.0) / 10000.0
    Scanner input = new Scanner(System.in);

    int number = input.nextInt();
    
    for(int k= 0; k <= number; k++){
        if(k == 0){
            System.out.printf("%10s%10s\n","i", "m(i)");
        }
        else{
            System.out.printf("%10d%10.4f\n", k, m(k));
        }
    } 

    }
    public static double m(int i){
    double function = 0;

    for(int p = 1 ; p <= i; p++){
        
    
    
        function += p / ((2.0*p) + 1);
    }
        
        
    return function;
    }
}
