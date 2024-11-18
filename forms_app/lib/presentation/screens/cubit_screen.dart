import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  static const name = "cubit_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    final counteMethodState = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterCubit value) {
            return Text("Cubit counter: ${value.state.transactionCount} ");
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                counteMethodState.reset();
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: (previous, current) => current.counter != previous.counter ,
          builder: (context, state) {
            return Text("Counter value:${state.counter}");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counteMethodState.increaseBy(3);
            },
            heroTag: "1",
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              counteMethodState.increaseBy(2);
            },
            heroTag: "2",
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              counteMethodState.increaseBy(1);
            },
            heroTag: "3",
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
