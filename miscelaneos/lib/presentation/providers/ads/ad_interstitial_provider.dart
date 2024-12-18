import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';

final adInterstitialProvider =
    FutureProvider.autoDispose<InterstitialAd>((ref) async {
  // validar si se muestran los anuncios o no

  final ad = await AdModPlugin.loadInterstitialAd();

  return ad;
});
