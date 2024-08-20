import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_google_repository/auth_google_sign_in_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/auth_google/cubit/auth_google_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/back_home_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/create_new_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/forgot_password_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/auth_google/google_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/or_sign_up_with.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/password_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_logo_with_text.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(AuthRepository()),
        ),
        BlocProvider(
          create: (context) => AuthGoogleCubit(AuthGoogleSignInRepository()),
        ),
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(user: state.user),
              ),
            );
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login successfully. Welcome!👋',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                backgroundColor: Theme.of(context).colorScheme.outline,
              ),
            );
          } else if (state.status == Status.error) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: const BackAppBar(title: 'Welcome in Cafeteria'),
            body: Stack(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Column(
                    children: [
                      const AuthLogoWithText(
                        authLogoText: 'Sign in',
                        assetWidth: 120,
                        assetHeight: 120,
                      ),
                      const SizedBox(height: 15),
                      AuthEmailInput(
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
                      const SizedBox(height: 15),
                      AuthButton(
                        buttonText: 'Login',
                        onPressed: () {
                          if (email != null && password != null) {
                            context
                                .read<AuthCubit>()
                                .signIn(email: email!, password: password!);
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      const OrSignUpWith(),
                      const SizedBox(height: 5),
                      BlocConsumer<AuthGoogleCubit, AuthGoogleState>(
                        listener: (context, state) {
                          if (state.status == Status.loading) {
                           ScaffoldMessenger.of(context).hideCurrentSnackBar(); 
                           ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Signing in with Google...',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.outline,
                              ),
                            );
                          } else if (state.status == Status.success) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(user: state.user),
                              ),
                            );
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Login successfully. Welcome!👋',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.outline,
                              ),
                            );
                          } else if (state.status == Status.error) {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.errorMessage,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                backgroundColor:
                                    Theme.of(context).colorScheme.error,
                              ),
                            );
                          } 
                        },
                        builder: (context, state) {
                          return GoogleButton(
                            onPressed: () {
                              context
                                  .read<AuthGoogleCubit>()
                                  .signInWithGoogle();
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.zero,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CreateNewAccountButton(),
                            BackHomeButton(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                if (state.status == Status.loading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}