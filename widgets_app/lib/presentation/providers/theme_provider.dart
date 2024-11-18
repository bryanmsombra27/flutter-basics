import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// ESTADOS INMUTABLES
final colorListProvider = Provider((ref) => colorList);

// PIEZAS DE ESTADOS (como el useState)
final selectedColorProvider = StateProvider<int>((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  // ThemeNotifier(super.state);

  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void selectedColor(int color) {
    state = state.copyWith(selectedColor: color);
  }
}
