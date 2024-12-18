import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';

const storeKey = 'showAds';

class ShowAdsProvider extends StateNotifier<bool> {
  ShowAdsProvider() : super(false) {
    checkAdState();
  }

  void checkAdState() async {
    state = await SharedPreferencesPlugin.getBool(storeKey) ?? true;
  }

  void removeAds() {
    SharedPreferencesPlugin.setBool(storeKey, false);
    state = false;
  }

  void showAds() {
    SharedPreferencesPlugin.setBool(storeKey, true);
    state = true;
  }

  void toggleAds() {
    state ? removeAds() : showAds();
  }
}

final showAdsProvider = StateNotifierProvider<ShowAdsProvider, bool>((ref) {
  return ShowAdsProvider();
});
