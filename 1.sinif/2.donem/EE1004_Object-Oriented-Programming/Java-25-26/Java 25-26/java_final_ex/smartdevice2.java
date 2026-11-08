import java.util.Scanner;

public abstract class SmartDevice{
    private String deviceName; 
    private boolean isOn;

    public String getDeviceName(){
        return deviceName;
    }
    public boolean isOn(){
        return isOn;
    } 
    public SmartDevice(String deviceName){
        this.deviceName = deviceName;  // constructorda this kullanırız ve return OLMAZ!!!
    }
    public void turnOn(){
        isOn = true;
    }
    public void turnOff(){
        isOn = false;
    }
    public abstract String toString(); // bu kısmı abstract olarak burada yazıyoruz. subclasslarda doldurucaz
}

public class Light extends SmartDevice{
    private int brightness;

    public Light(String deviceName, int brightness){ // constructor yazarken class adıyla aynı olmalıydı
       super(deviceName); //alt sınıfın constructorında super kullanırız, çünkü deviceName e nasıl erişicez üst sınıftan??
        this.brightness = brightness; // constructor da this kullanırız ve return OLMAZ!!! 
    }

    public String toString(){ // return da adı üstünde bi String yazdırmamız lazım.
        return "Light '" + getDeviceName() + "' is " + (isOn() ? "ON" : "OFF") + ",  Brightness: " + brightness + "%";
    }
}

public class Thermostat extends SmartDevice{
    private double temperature;

    public Thermostat(String deviceName, double temperature){ //constructor yazdık
        super(deviceName);  //alt sınıfın constructorında super kullanırız, çünkü deviceName e nasıl erişicez
        this.temperature = temperature; // constructor da this kullanırız ve return OLMAZ!!! 
    }
    public String toString(){
        return "Thermostat '" + getDeviceName() + "' is " + (isOn() ? "ON" : "OFF") + ", Temperature: " + temperature + "C";
    }
}

public class Test{
    public static void main(String[] args){

    Scanner input = new Scanner(System.in);
    System.out.print("Enter light device name: ");
    String deviceName = input.nextLine();
    System.out.print("\nEnter brightness (0-100): ");
    int brightness = input.nextInt();
    //nextInt derken bir sonrakinde int değeri girmeyeceğimiz için boş gelmesini engellemek istiyoruz 
    // o yüzden temizleme yapcaz
    input.nextLine();
    System.out.print("\nTurn ON the light? (Y/N): ");
    String isOn = input.nextLine();
    
    System.out.print("\nEnter thermostat device name: ");
    String deviceName2 = input.nextLine();
    System.out.print("\nEnter temperature (C): ");
    double temperature = input.nextDouble();
    input.nextLine(); //temizleme yaptık yine
    System.out.println("\nTurn ON the thermostat? (Y/N): ");
    String isOn2 = input.nextLine();


    
    
    // şimdi ise nesne oluşturma kısmına geçiyoruz:
    //Önce class ı seçmeliyim. Light classından "bir isimle" nesne oluşturucam
    Light isik = new Light(deviceName, brightness);
    //şimdi diğer class ın adıyla "bir isimle" diğer object imizi oluşturuyoruz.
    Thermostat thermostat = new Thermostat(deviceName2, temperature); //thermostat için ayrı bir isim aldık ona dikkat!!
    // Light için yani isOn kullancaz
    if(isOn.equals("Y")){
        isik.turnOn();
    }
    else if(isOn.equals("N")){
        isik.turnOff();
    }

    //Thermostat için yazıyoruz yani isOn2 kullancaz
    if(isOn2.equals("Y")){
        thermostat.turnOn();
    }
    else if (isOn2.equals("N")){
        thermostat.turnOff();
    }

    System.out.println("Summary: " ); 
    System.out.print(isik.toString() + "\n" + thermostat.toString());




}

}