import java.util.Scanner;

abstract class Employee{
    private String name;
    private double salary;

    public Employee (String name, double salary){
        this.name = name;
        this.salary = salary;
    }
    public String getName(){
        return name;
    }
    public double getSalary(){
        return salary;
    }
    public void raiseSalary(){
        salary *= 1.10;
    }
    public abstract String toString();
}

class Manager extends Employee{
    private String department;

    public Manager(String name, double salary, String department){
        super(name, salary);
        this.department = department;
    }
    public String toString(){
        return  "Manager " + getName() + " Department: " + department + " Salary: " + String.format("%.2f", getSalary());
    }
}

class Intern extends Employee{
    private int duration;

    public Intern(String name, double salary, int duration){
        super(name, salary);
        this.duration = duration;
    }

    public String toString(){
        return "Intern " + getName() + " Duration: " + duration + " months Salary: " + getSalary();
    }
}

public class Prog{
    public static void main(String[] args){

        Scanner input = new Scanner(System.in);
        System.out.print("Enter manager name: ");
        String name = input.nextLine();
        System.out.print("Enter salary: ");
        double salary = input.nextDouble();
        input.nextLine(); //buffer temizle
        System.out.print("Enter department: ");
        String department = input.nextLine();
        System.out.print("Raise salary? (Y/N): ");
        String isRaise = input.nextLine();

        System.out.print("Enter intern name: ");
        String name2 = input.nextLine();
        System.out.print("Enter salary: ");
        double salary2 = input.nextDouble();
        input.nextLine(); //buffer temizle
        System.out.print("Enter duration (months): ");
        int duration = input.nextInt();
        input.nextLine();
        System.out.print("Raise salary?(Y/N): ");
        String isRaise2 = input.nextLine();


        //şimdi nesne oluşturmamız gerekiyor 
        Manager manager = new Manager(name, salary, department);
        Intern intern = new Intern(name2, salary2, duration);
        
        //şimdi raise salary kısmını yazmamız lazım
        if(isRaise.equals("Y")){
            manager.raiseSalary();
        }
        else if(isRaise.equals("N")){
            manager.getSalary();
        }


        if(isRaise2.equals("Y")){
            intern.raiseSalary();
        }
        else if(isRaise2.equals("N")){
            intern.getSalary();
        }



        System.out.println("Summary:\n" + manager.toString() + "\n" + intern.toString());
     
     

    }
}