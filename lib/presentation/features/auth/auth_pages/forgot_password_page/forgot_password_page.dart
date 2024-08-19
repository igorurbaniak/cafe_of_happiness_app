import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/domain/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/widgets/reset_password_email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/widgets/auth_logo_with_text.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository()),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            Navigator.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Successfully sent link! Check your email.',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                backgroundColor: Theme.of(context).colorScheme.outline,
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
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
            appBar: const BackAppBar(title: 'Reset your password'),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const AuthLogoWithText(
                    authLogoText:
                        'Receive an eamil adress to\n reset your password',
                    assetWidth: 150,
                    assetHeight: 150,
                  ),
                  const SizedBox(height: 50),
                  ResetPasswordEmailInput(emailController: emailController),
                  const SizedBox(height: 30),
                  AuthButton(
                    buttonText: 'Reset Password',
                    onPressed: () {
                      context.read<AuthCubit>().resetPassword(
                            email: emailController.text,
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}