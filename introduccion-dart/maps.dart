void main(){
// MAPS EL PRIMER VALOR DE LA DEFINICION QUIERE DECIR QUE LAS LLAVES PARA ACCEDER AL MAPA SERAN DE TIPO STRING Y EL VALOR ES DINAMICO PUESTO QUE EL OBJETO TIENE DIVERSOS VALORES
  final Map<String,dynamic> pokemon = {
    'name':"dito",
    'hp':100,
    'isAlive':true,
    "abilities":<String>['impostor'],
    "sprites":{
      1:"ditto/front.png",
    2:"ditto/back.png"
    }
  };

  // acceder a los valores de los mapas  con las llaves cuadradas
  print('name:  ${pokemon["name"]}');
  print('Back:  ${pokemon["sprites"][2]}');
  print('Front:  ${pokemon["sprites"][1]}');



}