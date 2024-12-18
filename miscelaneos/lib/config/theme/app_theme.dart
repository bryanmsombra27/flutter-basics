import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.pink,
        textTheme: TextTheme(
            titleLarge: GoogleFonts.montserratAlternates(),
            titleMedium: GoogleFonts.montserratAlternates(fontSize: 35)));
  }
}
