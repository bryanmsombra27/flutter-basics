void main(){

  final mySquare = Square(side:10);

  
  print('Area:  ${mySquare.calculateArea()}');



}


class Square {

// con _ se convierte en una propiedad privada de la clase
double _side;

Square({required double side}):
  assert(side>=0,'side must be >=0'),
 _side = side;

// GETTER
double get area {
  return _side * _side;
}

// SETTER
set side(double value){
  if(value <0) throw 'value must be >=0';

  _side = side;
}


  double calculateArea(){
    return _side * _side;
  }


}