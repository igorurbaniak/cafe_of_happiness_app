import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_of_happiness_app/app/core/themes/theme_config.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeData: ThemeConfig.lightTheme));

  void toggleTheme() {
    final newThemeData = state.themeData.brightness == Brightness.light
        ? ThemeConfig.darkTheme
        : ThemeConfig.lightTheme;
    emit(ThemeState(themeData: newThemeData));
  }
}