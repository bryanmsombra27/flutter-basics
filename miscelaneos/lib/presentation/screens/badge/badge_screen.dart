import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class BadgeScreen extends ConsumerWidget {
  const BadgeScreen({super.key});

  static const name = "badge_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(badgeCounterProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(badgeCounterProvider.notifier).update((state) => state + 1);

          // AppBadgePlugin.updateBadgeCount(counter + 1);
        },
        child: const Icon(Icons.plus_one),
      ),
      appBar: AppBar(
        title: const Text("App badge"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Badge(
              alignment: Alignment.lerp(
                  Alignment.topRight, Alignment.bottomRight, 0.2),
              label: Text("$counter"),
              child: Text(
                "$counter",
                style: const TextStyle(fontSize: 150),
              ),
            ),
            FilledButton.tonal(
                onPressed: () {
                  ref.invalidate(badgeCounterProvider);
                  // AppBadgePlugin.removeBadge();
                },
                child: const Text("Borrar badge"))
          ],
        ),
      ),
    );
  }
}
