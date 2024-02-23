import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/pages/home_page/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.latoTextTheme(),
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 114, 47, 55),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cafe of Happiness',
        theme: theme,
        home: const HomeScreen(),
        );
  }
}
