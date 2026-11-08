import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.print("Adın: ");
        String name = input.nextLine();

        System.out.println("Merhaba " + name);
    }
}