import java.util.Scanner;

public class main {
    public static void main (String[] args){
    Scanner input = new Scanner(System.in);    

    String text = input.nextLine();
    int k = input.nextInt(); 

    StringBuilder[] rows = new StringBuilder[k];
    

    for (int i = 0; i<k ; i++){
        rows[i] = new StringBuilder();
    }

    int currentRow = 0;
    int direction = 1;

    for(int i = 0; i <text.length(); i++){
        char ch = text.charAt(i);

        for(int row = 0; row<k; row++){
            if(row == currentRow){
                rows[row].append(ch);
            }
            else{
                rows[row].append(" ");
            }
        }

        if(currentRow== k -1){
            direction = -1;
        }
        else if(currentRow == 0){
            direction = 1;
        }

        currentRow += direction;
    }

    for(int i = 0; i<k; i++){
        System.out.println(rows[i]);
    }
    }
}
