void  main(){
  // la palabra reservada new es opcional cuando se instancia un objeto de una clase
  // final wolverine = Hero('logan','regeneration');

  final wolverine = Hero(name:'logan',power:'regeneration');





}


class Hero {
  String name;
  String power;



// constructor, este constructor tiene el nombre de la clase
  // Hero(String pName,String pPower){
  //   // el this dentro de la clase es opcional
  //   this.name = pName;
  //   this.power = pPower;
  // }

  // asignacion corta de los valores de la clase forma corta
  // Hero(this.name,this.power);

  Hero({
    required this.name,
    required this.power
    });


  // ASIGNACION DE LOS VALORES A LA CLASE forma larga
  // Hero(String pName,String pPower): 
  // name = pName, power =pPower;

// override es un decorador que indica que se sobre escribe algun metodo o propiedad de la clase
  @override
  String toString(){
    return "koso";
  }

}