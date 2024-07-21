import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/back_home_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/create_new_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/forgot_password_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/google_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/login_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/or_sign_up_with.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/password_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

String? email;
String? password;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: const BackAppBar(title: 'Welcome in Cafeteria'),
            body: Container(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                children: [
                  Image.asset(
                    'images/coffee_logo.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  EmailInput(
                    onEmailChanged: (newEmail) {
                      setState(() {
                        email = newEmail;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  PasswordInput(
                    onPasswordChanged: (newPassword) {
                      setState(() {
                        password = newPassword;
                      });
                    },
                  ),
                  const ForgotPasswordButton(),
                  const SizedBox(height: 25),
                  LoginButton(
                    loginPressed: () {
                      context
                          .read<AuthCubit>()
                          .signIn(email: email!, password: password!);
                      context.read<RootCubit>().start();
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 20),
                  const OrSignUpWith(),
                  const SizedBox(height: 20),
                  const GoogleButton(),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CreateNewAccountButton(),
                      BackHomeButton(),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
