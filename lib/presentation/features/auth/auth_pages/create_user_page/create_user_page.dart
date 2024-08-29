import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/app/utils/validation_utils.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/create_user_page/user_name_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_logo_with_text.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_password_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  String? email;
  String? password;
  String? displayName;
  bool isButtonEnabled = false;

  void validateCreateUserForm() {
    setState(() {
      isButtonEnabled = (email != null &&
              ValidationUtils.validateEmail(email!)) &&
          (password != null && ValidationUtils.validatePassword(password!)) &&
          (displayName != null && ValidationUtils.validateName(displayName!));
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            context.read<RootCubit>().start();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(user: state.user),
              ),
            );
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Account created! Welcome, ${state.user?.displayName ?? 'User'}!👋',
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
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: const BackAppBar(title: 'Café of Happiness'),
            body: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Column(
                      children: [
                        const AuthLogoWithText(
                          authLogoText: 'Sign up',
                          assetWidth: 120,
                          assetHeight: 120,
                        ),
                        const SizedBox(height: 20),
                        AuthEmailInput(
                          onEmailChanged: (newEmail) {
                            setState(() {
                              email = newEmail;
                              validateCreateUserForm();
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        AuthPasswordInput(
                          onPasswordChanged: (newPassword) {
                            setState(() {
                              password = newPassword;
                              validateCreateUserForm();
                            });
                          },
                        ),
                        const SizedBox(height: 40),
                        UserNameInput(
                          onNameChanged: (newName) {
                            setState(() {
                              displayName = newName;
                              validateCreateUserForm();
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        AuthButton(
                          buttonText: 'Sign up',
                          buttonColor: isButtonEnabled
                              ? Theme.of(context).colorScheme.secondaryContainer
                              : Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer
                                  .withOpacity(0.5),
                          onPressed: isButtonEnabled
                              ? () {
                                  if (email != null &&
                                      password != null &&
                                      displayName != null) {
                                    context.read<AuthCubit>().signUp(
                                        email: email!,
                                        password: password!,
                                        displayName: displayName!);
                                  }
                                }
                              : null,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Already have an account?',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
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