import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/permissions/permissions_provider.dart';

class AskLocationScreen extends ConsumerWidget {
  const AskLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permiso Requerido'),
      ),
      body: FilledButton(
          onPressed: () {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
          child: const Text('Localizacion  necesaria')),
    );
  }
}
