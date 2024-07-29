import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeLight {
  static const Color mainColorLight = Color.fromARGB(255, 237, 233, 226);
  static const Color mainColorDark = Color.fromARGB(255, 114, 47, 55);
  static const Color lightMainDarkColor = Color.fromARGB(255, 177, 76, 88);
  static const Color containerColorLight = Color.fromARGB(255, 255, 255, 255);
  static const Color containerColorDark = Color.fromARGB(255, 48, 48, 48);
  static const Color errorColor = Color.fromARGB(255, 215, 106, 106);
  static const Color successColor = Color.fromARGB(255, 92, 196, 95);
  static const Color accentColorLight = Color.fromARGB(255, 245, 245, 245);
  static const Color accentColorDark = Color.fromARGB(255, 64, 64, 64);
  static const Color borderColorLight = Color.fromARGB(255, 224, 224, 224);

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
      displayLarge: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: GoogleFonts.lato(
        color: Colors.black54,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: GoogleFonts.lato(
        color: mainColorDark,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.lato(
        color: mainColorDark,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: GoogleFonts.lato(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      tertiary: Colors.black,
      onTertiary: containerColorLight,
      onTertiaryContainer: mainColorDark,
      seedColor: mainColorDark,
      brightness: Brightness.light,
      primary: mainColorDark,
      onPrimary: accentColorLight,
      primaryContainer: containerColorLight,
      onPrimaryContainer: Colors.grey.shade100,
      secondary: mainColorLight,
      onSecondary: Colors.transparent,
      secondaryContainer: mainColorDark,
      surface: containerColorLight,
      error: errorColor,
      outline: successColor,
      outlineVariant: borderColorLight,
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
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
      thickness: 2,
    ),
    iconTheme: const IconThemeData(
      color: accentColorDark,
      size: 20,
    ),
  );
}
