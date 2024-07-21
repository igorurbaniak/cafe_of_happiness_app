import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_of_happiness_app/app/core/themes/dark_theme.dart';
import 'package:cafe_of_happiness_app/app/core/themes/theme_light.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: ThemeLight.lightTheme));

  void toggleTheme() {
    final newThemeData = state.themeData.brightness == Brightness.light
        ? ThemeDark.darkTheme
        : ThemeLight.lightTheme;
    emit(ThemeState(themeData: newThemeData));
  }
}