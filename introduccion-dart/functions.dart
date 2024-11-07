void main(){
  greetEveryone();
  hello();

  sum(12,10);
}


String greetEveryone(){
  return "hello motherfuckers";
}

// arrow function : aqui no puede elaborarse un cuerpo de la funcion, se devuelve direactamente el valor
String hello()=> "hola koso";

// PARAMETROS OBLIGATORIOS
int sum(int a, int b)=> a+b; 

// FUNCIONES CON PARAMETROS OPCIONALES van entre corchetes []
// Int sumOptional(int a, [int? b]){
int sumOptional(int a, [int b = 0]){

  // b ??= 0;


  return a+ b;
};  

// parametros de una funcion con nombre y opcionales
// con la palabra reservada required un parametro se vuelve obligatorio
String greetPerson({required String name, String message = "hola"}){

  return '$message,$name'
}


