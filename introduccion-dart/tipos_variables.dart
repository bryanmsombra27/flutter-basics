void main(){

  final String pokemon = "dito";
  final int hp = 100;
  final bool isAlive = true;
  final List<String> abilities = ["impostor"];
  final  sprites = <String>["ditto/front.png","ditto/back.png"];


  // dynamic = null similar al tipo any  y por defecto es nulo
  dynamic errorMessage ="hola";
  errorMessage = true;
  errorMessage = [1,2,3,4,5];
  errorMessage = {1,2,3,4,5};
  errorMessage = () => true;
  errorMessage = null;




// triple comas indica que es una impresion multi linea
  print("""
    $pokemon
    $hp
    $isAlive
  """
  );









}