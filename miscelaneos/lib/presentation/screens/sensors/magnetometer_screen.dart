import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class MagnetometerScreen extends ConsumerWidget {
  const MagnetometerScreen({super.key});

  static const name = "magnetometer_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final magnetometer = ref.watch(magnetometerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Magnetrometro'),
      ),
      body: Center(
          child: magnetometer.when(
              data: (value) => Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
              error: (error, stacktrace) => Text("$error"),
              loading: () => const CircularProgressIndicator())),
    );
  }
}
