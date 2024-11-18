import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBlocBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBlocBloc() : super(const CounterBlocState()) {
    on<CounterIncreased>(_onCounterIncreased);
    on<ResetCounter>(_onResetCounter);
  }

  void _onCounterIncreased(
      CounterIncreased event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1));
  }

  void _onResetCounter(ResetCounter event, Emitter<CounterBlocState> emit) {
    emit(state.copyWith(
      counter: 0,
    ));
  }

//  FORMA 2 DE MANDAR A LLAMAR LOS EVENTOS DEL BLOCK
  void increaseBy([int value = 1]) {
    add(CounterIncreased(value));
  }

  void resetCounter() {
    add(ResetCounter());
  }
}
