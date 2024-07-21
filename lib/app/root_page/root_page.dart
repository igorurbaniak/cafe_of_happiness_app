import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_cubit.dart';
import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_state.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cafe of Happiness',
          theme: state.themeData,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('pl'),
          ],
          home: const _RootPage(),
        );
      },
    );
  }
}

class _RootPage extends StatelessWidget {
  const _RootPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootCubit, RootState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return HomePage(user: state.user);
      },
    );
  }
}