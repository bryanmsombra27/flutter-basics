import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class GiroscopeScreen extends ConsumerWidget {
  const GiroscopeScreen({super.key});

  static const name = "giroscope_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gyroscope = ref.watch(gyroscopeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Giroscopio'),
      ),
      body: Center(
          child: gyroscope.when(
              data: (value) => Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
              error: (error, stacktrace) => Text("$error"),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
