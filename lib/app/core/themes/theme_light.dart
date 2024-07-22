import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeLight {
  static const Color mainColorLight = Color.fromARGB(255, 237, 233, 226);
  static const Color mainColorDark = Color.fromARGB(255, 114, 47, 55);
  static const Color containerColorLight = Color.fromARGB(255, 255, 255, 255);
  static const Color errorColor = Color.fromARGB(255, 211, 47, 47);
  static const Color successColor = Color.fromARGB(255, 76, 175, 80);
  static const Color accentColorLight = Color.fromARGB(255, 245, 245, 245);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 16,
      ),
      headlineMedium: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 14,
      ),
      headlineSmall: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 12,
      ),
      titleLarge: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.lato(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      tertiary: Colors.black,
      onTertiary: Colors.white,
      onTertiaryContainer: mainColorDark,
      seedColor: mainColorDark,
      brightness: Brightness.light,
      primary: mainColorDark,
      secondary: mainColorLight,
      surface: containerColorLight,
      error: errorColor,
      outline: successColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: mainColorLight,
      titleTextStyle: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: mainColorDark,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: mainColorDark),
    ),
  );
}