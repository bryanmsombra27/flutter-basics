void main(){
  // listado porque ve en corchetes
  final numbers = [1,2,3,4,5,5,5,6,7,8,9,9,10];



  print('list original $numbers');


  //iterable
  final reversedNumbers = numbers.reversed;

  print('List: ${reversedNumbers.toList()}');
  print('Set: ${reversedNumbers.toSet()}');

  


}