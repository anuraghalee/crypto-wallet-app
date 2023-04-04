import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  canvasColor: Colors.black.withOpacity(0.8),
  primaryColor: Colors.black,
  cardColor: Colors.black,
  fontFamily: GoogleFonts.roboto().fontFamily,
  brightness: Brightness.dark,
  textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
      ),
      headlineMedium: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineSmall: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyLarge: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      )),
);
