part of 'counter_bloc_bloc.dart';

abstract class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreased extends CounterBlocEvent {
  final int value;
  const CounterIncreased(this.value);
}

class ResetCounter extends CounterBlocEvent {}
