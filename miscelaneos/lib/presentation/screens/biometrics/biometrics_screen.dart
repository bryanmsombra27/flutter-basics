import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/local_auth/local_auth_providers.dart';

class BiometricsScreen extends ConsumerWidget {
  const BiometricsScreen({super.key});

  static const name = "biometrics_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canCheckBiometrics = ref.watch(canCheckBiometricsProvider);
    final localAuthState = ref.watch(localAuthProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Biometric Screen"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  ref.read(localAuthProvider.notifier).authenticatedUser();
                },
                child: const Text("Autenticar")),
            canCheckBiometrics.when(
                data: (data) => Text('Puede revisar biometricos: $data'),
                error: (err, stacktrace) => Text('Error $err'),
                loading: () => const CircularProgressIndicator()),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Estado del biometrico: ",
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              "Estado: XXX ",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
