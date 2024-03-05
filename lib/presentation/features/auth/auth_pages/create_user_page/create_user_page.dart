import 'package:cafe_of_happiness_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_account_header.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/have_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/widgets/create_password_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
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
          if (state.saved) {
            Navigator.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Pomyślnie utworzono konto!',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
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
            appBar: AppBar(
              title: const Text(
                'Welcome to Café of Happiness',
                style: TextStyle(fontSize: 18),
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: Column(
                children: [
                  const CreateAccountHeader(),
                  const SizedBox(height: 20),
                  CreateEmailInput(
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
                  CreateAccountButton(
                    signUpPressed: () {
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
