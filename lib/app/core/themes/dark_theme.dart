import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDark {
  static const Color mainColorLight = Color.fromARGB(255, 237, 233, 226);
  static const Color mainColorDark = Color.fromARGB(255, 114, 47, 55);
  static const Color containerColorDark = Color.fromARGB(255, 48, 48, 48);
  static const Color errorColor = Color.fromARGB(255, 211, 47, 47);
  static const Color successColor = Color.fromARGB(255, 76, 175, 80);
  static const Color accentColorDark = Color.fromARGB(255, 64, 64, 64);

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
      ),
      headlineMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
      ),
      headlineSmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 12,
      ),
      titleLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.lato(
        color: Colors.white54,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      tertiary: Colors.white,
      onTertiary: mainColorDark,
      onTertiaryContainer: mainColorLight,
      seedColor: mainColorDark,
      brightness: Brightness.dark,
      primary: mainColorDark,
      secondary: mainColorLight,
      surface: containerColorDark,
      error: errorColor,
      outline: successColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: mainColorDark,
      titleTextStyle: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: mainColorDark,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: mainColorLight),
    ),
  );
}
