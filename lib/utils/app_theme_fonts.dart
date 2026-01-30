import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeFonts {
  static final body = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight(400),
  );

  static TextTheme textTheme() {
    return TextTheme(bodyMedium: body);
  }
}
