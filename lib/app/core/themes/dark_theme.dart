import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeDark {
  static const Color mainColorLight = Color.fromARGB(255, 237, 233, 226);
  static const Color mainColorDark = Color.fromARGB(255, 114, 47, 55);
  static const Color containerColorDark = Color.fromARGB(255, 48, 48, 48);

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
     textTheme: TextTheme(
      headlineLarge: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 20,
      ),
      headlineMedium: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 16,
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
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: mainColorDark,
      brightness: Brightness.dark,
      primary: mainColorDark,
      secondary: mainColorLight,
      surface: containerColorDark,
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