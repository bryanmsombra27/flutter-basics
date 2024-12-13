import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  bool _darkmode = false;
  bool _customTheme = false;

  bool get darkMode {
    return _darkmode;
  }

  bool get customTheme {
    return _customTheme;
  }

  set darkMode(bool isDark) {
    _darkmode = isDark;
    _customTheme = false;
    notifyListeners();
  }

  set customTheme(bool isCustom) {
    _darkmode = false;
    _customTheme = isCustom;
    notifyListeners();
  }

  ThemeData getTheme(bool isDarkMode) {
    return ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
        brightness: isDarkMode ? Brightness.dark : Brightness.light);
  }
}
