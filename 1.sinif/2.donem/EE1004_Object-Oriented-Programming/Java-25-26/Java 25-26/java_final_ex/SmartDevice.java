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

    public SmartDevice(String deviceName){ // nesne oluşturmak için yazdık ! CONSTRUCTOR !
        this.deviceName = deviceName;
    }
    public void turnOn(){
        isOn = true;
    }
    public void turnOff(){
        isOn = false;
    }
    public abstract String toString(); // sadece abstract olursa süslüparantez olmaz.

}

public class Light extends SmartDevice{
    private int brightness;

    public Light(String deviceName, int brightness){
         // this.deviceName = deviceName; böyle yazamayız çünkü deviceName SmartDevice da private olarak tanımlı.
         super(deviceName); //SmartDevice ın constructor ını çağırmak için super kullanırız.
         this.brightness = brightness; // bu zaten bu class ın içerisindeydi direkt erişebiliriz private olsa da.
    }

    public String toString(){
        return "Light " + getDeviceName() + " is " + (isOn() ? "ON" : "OFF") + ", Brightness: " + brightness + "%";
    }

}

public class Thermostat extends SmartDevice{
    private double temperature;
    
    public Thermostat(String deviceName, double temperature){
        super(deviceName); 
        this.temperature = temperature;
    }
    public String toString(){
        return "Thermostat " + getDeviceName() + " is " + (isOn() ? "ON" : "OFF") + ", Temperature: " + temperature + "C";
    }
}


public class Test{
    public static void main(String[] args){
    Scanner input = new Scanner(System.in); 

    System.out.print("Enter light device name: ");
    String deviceName = input.nextLine();
    System.out.println(deviceName);
    
    System.out.print("Enter brightness (0-100): ");
    int brightness = input.nextInt();
    System.out.println(brightness);

    System.out.print("Turn ON the light? (Y/N): ");
    String isOn = input.nextLine();
    System.out.println(isOn);
    

    System.out.print("Enter thermostat device name: ");
    String deviceName2 = input.nextLine();
    System.out.println(deviceName2);

    System.out.print("Enter temperature (C): ");
    double temperature = input.nextDouble();
    System.out.println(temperature);

    System.out.print("Turn ON the thermostat? (Y/N): ");
    String isOn2 = input.nextLine();
    System.out.println(isOn2);



    Light light = new Light(deviceName, brightness);
    
    if(isOn.equals("Y")){
            light.turnOn();
        }
        else{
            light.turnOff();
        }


    Thermostat thermostat = new Thermostat(deviceName2, temperature);
     if(isOn2.equals("Y")){
            thermostat.turnOn();
        }
        else{
            thermostat.turnOff();
        }
  
    System.out.print("SUMMARY:\n" + light.toString() + "\n" + thermostat.toString());
    }
}