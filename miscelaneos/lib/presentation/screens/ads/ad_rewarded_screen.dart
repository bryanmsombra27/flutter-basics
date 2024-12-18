import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdRewardedScreen extends ConsumerWidget {
  const AdRewardedScreen({super.key});

  static const name = "ad_rewarded_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adRewardedAsync = ref.watch(adRewardedProvider);
    final adPoints = ref.watch(adPointsProvider);

    ref.listen(adRewardedProvider, (prev, next) {
      if (!next.hasValue) return;

      if (next.value == null) return;

      next.value!.show(onUserEarnedReward: (ad, reward) {
        ref.read(adPointsProvider.notifier).update((state) => state + 10);

        print('Puntos ganados: $reward');
      });
    });

    if (adRewardedAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text("cargando anuncio.."),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad rewarded screen'),
      ),
      body: Center(
        child: Text('puntos actuales: $adPoints'),
      ),
    );
  }
}
