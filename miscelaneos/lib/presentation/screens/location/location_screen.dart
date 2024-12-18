import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  static const name = "location_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userLocationAsync = ref.watch(userLocationProvider);
    final watchLocationAsync = ref.watch(watchLocationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Location screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Ubicación Actual:"),
            userLocationAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, track) => Text('Error $err'),
                data: (data) => Text('$data')),
            const SizedBox(
              height: 30,
            ),
            const Text("Seguimiento de Ubicación:"),
            const Text("Ubicación Actual:"),
            watchLocationAsync.when(
                loading: () => const CircularProgressIndicator(),
                error: (err, track) => Text('Error $err'),
                data: (data) => Text('$data')),
          ],
        ),
      ),
    );
  }
}
