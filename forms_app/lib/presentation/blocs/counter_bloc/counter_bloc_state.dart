part of 'counter_bloc_bloc.dart';

class CounterBlocState extends Equatable {
  final int transactionCount;
  final int counter;

  const CounterBlocState({this.transactionCount = 0, this.counter = 0});

  @override
  List<Object> get props => [counter, transactionCount];

  CounterBlocState copyWith({int? counter, int? transactionCount}) {
    return CounterBlocState(
        counter: counter ?? this.counter,
        transactionCount: transactionCount ?? this.transactionCount);
  }
}
