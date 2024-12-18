import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/ads/ad_interstitial_provider.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class AdFullscreen extends ConsumerWidget {
  const AdFullscreen({super.key});

  static const name = "ad_fullscreen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interstitialAdAsync = ref.watch(adInterstitialProvider);

    ref.listen(adInterstitialProvider, (previous, next) {
      if (!next.hasValue) return;
      if (next.hasValue == null) return;
      next.value!.show();
    });

    if (interstitialAdAsync.isLoading) {
      return const Scaffold(
        body: Center(
          child: Text('cargando ad'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ad full screen'),
      ),
      body: const Center(
        child: Text('Ya puedes regresar o ver esta pantalla'),
      ),
    );
  }
}
