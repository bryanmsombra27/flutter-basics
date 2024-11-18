import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const name = "counter_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ACTUALIZAR EL ESTADO
          // ref.read(counterProvider.notifier).update((state) => state++);
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).update((state) => !state);
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text(
          'Valor: $value',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
