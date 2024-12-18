import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

final adBannerProvider = FutureProvider<BannerAd>((ref) async {
  // validar si se muestran los anuncios o no
  final showAds = ref.watch(showAdsProvider);

  if (!showAds) throw "ads estan bloqueadas";

  final ad = await AdModPlugin.loadBannerAd();

  return ad;
});

final adRewardedProvider = FutureProvider<RewardedAd>((ref) async {
  // validar si se muestran los anuncios o no

  final ad = await AdModPlugin.loadRewardedAd();

  return ad;
});
