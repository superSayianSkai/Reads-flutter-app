import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeFonts {
  static final headlineMedium = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight(400),
  );

  static final headlineSmall = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight(300),
  );

  static final headineLarge = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight(600),
  );

  static TextTheme textTheme() {
    return TextTheme(
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      headlineLarge: headineLarge,
    );
  }
}
