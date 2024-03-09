import 'package:cafe_of_happiness_app/app/core/themes/theme.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/login_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe of Happiness',
      theme: theme,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RootCubit()..start(),
      child: BlocBuilder<RootCubit, RootState>(
        builder: (context, state) {
          // final user = state.user;
          // switch (state.isLogged) {
          //   case Authentication.loggedIn:
          //     return HomePage(user: user);
          //     case Authentication.loggedOut:
          //     return const HomePage(user: null);
          // }
          //////////////////////////////////////////////////
          final user = state.user;
          if (user == null) {
            return const LoginPage();
          } 
          return HomePage(user: user);
          ///////////////////////////////////////////////////
          
        },
      ),
    );
  }
}
