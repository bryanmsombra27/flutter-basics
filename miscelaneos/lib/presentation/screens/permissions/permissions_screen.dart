import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PermissionsScreen extends StatelessWidget {
  const PermissionsScreen({super.key});

  static const name = "permissions_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permisos"),
      ),
      body: const _PermissionsView(),
    );
  }
}

class _PermissionsView extends ConsumerWidget {
  const _PermissionsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissions = ref.watch(permissionsProvider);
    final showAds = ref.watch(showAdsProvider);

    return ListView(
      children: [
        CheckboxListTile(
          value: permissions.cameraGranted,
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestCameraAccess();
          },
          title: const Text("Camera"),
          subtitle: Text("Estado Actual: ${permissions.camera}"),
        ),
        CheckboxListTile(
          value: permissions.photoLibraryGranted,
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestPhotosAccess();
          },
          title: const Text("Galeria de fotos"),
          subtitle: Text("Estado Actual: ${permissions.photoLibrary}"),
        ),
        CheckboxListTile(
          value: permissions.locationGranted,
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestLocationAccess();
          },
          title: const Text("Location"),
          subtitle: Text("Estado Actual: ${permissions.location}"),
        ),
        CheckboxListTile(
          value: permissions.sensorsGranted,
          onChanged: (_) {
            ref.read(permissionsProvider.notifier).requestSensorsAccess();
          },
          title: const Text("Sensors"),
          subtitle: Text("Estado Actual: ${permissions.sensors}"),
        ),
        CheckboxListTile(
          value: showAds,
          onChanged: (_) {
            ref.read(showAdsProvider.notifier).toggleAds();
          },
          title: const Text("Mostrar ads"),
          subtitle: const Text("Esta opcion muestra y oculta ads"),
        ),
      ],
    );
  }
}
