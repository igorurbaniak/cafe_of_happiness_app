import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/have_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_password_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_logo_with_text.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

String? email;
String? password;

class _CreateUserPageState extends State<CreateUserPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(user: state.user),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Account successfully created!',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                backgroundColor: Theme.of(context).colorScheme.outline,
              ),
            );
          } else if (state.errorMessage.isNotEmpty) {
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
            appBar: const BackAppBar(title: 'Café of Happiness'),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                children: [
                  const AuthLogoWithText(
                    authLogoText: 'Sign up',
                    assetWidth: 150,
                    assetHeight: 150,
                  ),
                  const SizedBox(height: 20),
                  AuthEmailInput(
                    onEmailChanged: (newEmail) {
                      setState(() {
                        email = newEmail;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  CreatePasswordInput(
                    onPasswordChanged: (newPassword) {
                      setState(() {
                        password = newPassword;
                      });
                    },
                  ),
                  const SizedBox(height: 50),
                  AuthButton(
                    buttonText: 'Sign up',
                    onPressed: () {
                      context.read<AuthCubit>().signUp(
                            email: email!,
                            password: password!,
                          );
                    },
                  ),
                  const SizedBox(height: 70),
                  const HaveAccountButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}