import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc_bloc.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  static const name = "cubit_screen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBlocBloc(),
      child: const _BlocScreenView(),
    );
  }
}

class _BlocScreenView extends StatelessWidget {
  const _BlocScreenView();

  void increaseCounterBy(BuildContext context, {int value = 1}) {
    // context.read<CounterBlocBloc>().add(CounterIncreased(value));
    context.read<CounterBlocBloc>().increaseBy(value);
  }

  void reset(
    BuildContext context,
  ) {
    // context.read<CounterBlocBloc>().add(ResetCounter());
    context.read<CounterBlocBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBlocBloc counterBloc) {
          return Text("Cubit counter ${counterBloc.state.transactionCount}");
        }),
        actions: [
          IconButton(
              onPressed: () {
                reset(context);
              },
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBlocBloc counterBloc) {
            return Text("Counter value:${counterBloc.state.counter}");
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, value: 3),
            heroTag: "1",
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context, value: 2);
            },
            heroTag: "2",
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              increaseCounterBy(context);
            },
            heroTag: "3",
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
