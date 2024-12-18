import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AccelerometerScreen extends ConsumerWidget {
  const AccelerometerScreen({super.key});

  static const name = "accelerometer_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accelerometer = ref.watch(accelerometerGravityProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acelerometro'),
      ),
      body: Center(
          child: accelerometer.when(
              data: (value) => Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
              error: (error, stacktrace) => Text("$error"),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
