void main(){


}


enum PlanType {
  nuclear,wind,water

}

abstract class EnergyPlant {

  double energyLeft;
  PlanType type;

  EnergyPlant({
    required this.energyLeft,
    required this.type
  })


  void consumeEnergy(double amount);

}

class WindPlant extends EnergyPlant {

  WindPlant({
    required double initialEnergy
  }):
  super(energyLeft: initialEnergy, type:PlantType.wind );


  @override
  void consumeEnergy(double amount){
    energyLeft -= amount;
  }


}