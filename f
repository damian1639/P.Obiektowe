import java.util.ArrayList;
import java.util.Objects;

public class Computer {

   public String manufacturer;
   public String model;
   public ArrayList<Double> partsPrices;

   public Computer(){

   }
   public Computer(String manufacturer,String model, ArrayList<Double>partsPrices){
       this.manufacturer=manufacturer;
       this.model=model;
       this.partsPrices=partsPrices;

   }
   public int calculatePrice(){
       int suma=0;
       for(int i=0;i<partsPrices.size();i++)
       {
           suma += partsPrices.get(i);
       }
       return suma;
   }

    @Override
    public String toString() {
        return "Computer{" +
                "manufacturer='" + manufacturer + '\'' +
                ", model='" + model + '\'' +
                ", partsPrices=" + partsPrices +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Computer computer = (Computer) o;
        return Objects.equals(manufacturer, computer.manufacturer) && Objects.equals(model, computer.model) && Objects.equals(partsPrices, computer.partsPrices);
    }

    @Override
    public int hashCode() {
        return Objects.hash(manufacturer, model, partsPrices);
    }
}
class Laptop extends Computer{

    public double displaySize;
    public Laptop(){

    }
    public Laptop(String manufacturer,String model,ArrayList<Double>partsPrices,double displaySize){
        super(manufacturer,model,partsPrices);

        if(displaySize<0)
        {

            this.displaySize=15;
        }
        else
            this.displaySize=displaySize;

    }

    @Override
    public String toString() {
        return "Laptop{" +
                "displaySize=" + displaySize +
                ", manufacturer='" + manufacturer + '\'' +
                ", model='" + model + '\'' +
                ", partsPrices=" + partsPrices +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;
        Laptop laptop = (Laptop) o;
        return Double.compare(displaySize, laptop.displaySize) == 0;
    }

    @Override
    public int hashCode() {
        return Objects.hash(super.hashCode(), displaySize);
    }
    public int calculatePrice(){
      return  super.calculatePrice()+1000;

    }
}

main

import java.util.ArrayList;

public class Main {
    public static void main(String[] args){
        ArrayList<Double>partsPrice = new ArrayList<>();
        partsPrice.add(12.0);
        partsPrice.add(17.0);
        partsPrice.add(20.0);
        Computer k1=new Computer("Dell","i3",partsPrice);
        Laptop l1 = new Laptop("Dell","i3",partsPrice,-12);


        System.out.println(k1.toString()+l1.toString()+k1.equals(l1)+l1.equals(k1));
        k1.calculatePrice();
        l1.calculatePrice();


    }
}

Car
public record Car(String brand, String model, double fuelConsumptionPer100km) {

    public double fuelCost(double fuelPrice, double distance)
    {
        return fuelPrice*(distance*(fuelConsumptionPer100km/100));
    }
}

        Car c1 = new Car("Audi", "A5", 10);
        System.out.println(c1.fuelCost(6,100));


