import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const themecolor = Colors.greenAccent;

    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: themecolor,
        listTileTheme: const ListTileThemeData(iconColor: themecolor));
  }
}
