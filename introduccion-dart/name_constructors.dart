void main(){
  final Map<String,dynamic> rawJson = {
    'name':'Tony Stark',
    'power':'Money',
    'isAlive':false
  };



// asignacion con constructor normal
  // final ironman = Hero(
  //   isAlive: false,
  //   power:"money",
  //   name:"Tony Stark"
  // );


// asignacion con constructor con nombre
  final ironman = Hero.fromJson(rawJson);




  
}


class Hero{

  String hero;
  String power;
  bool isAlive;

  // constructor normal de la clase
  Hero({
    required this.hero,
    required this.power,
    required this.isAlive
  })

// constructor con nombre DE LA CLASE
  Hero.fromJson(Map<String,dynamic> json) :
    name = json['name'] ?? 'not name',
    power = json['power'] ?? 'not nampower',
    isAlive = json['isAlive'] ?? false,


  @override
  String  toString(){

    return '$name,$power ${isAlive ? 'YES!': 'Nope' }'
  }

}