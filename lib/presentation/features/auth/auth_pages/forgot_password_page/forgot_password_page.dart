import 'package:cafe_of_happiness_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/widgets/reset_password_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/widgets/reset_password_email_input.dart';
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
          if (state.saved) {
            Navigator.of(context).pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text(
                  'Pomyślnie wysłano link! Sprawdź swoją pocztę.',
                  style: TextStyle(),
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
          if (state.errorMessage.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage,
                ),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Reset your password'),
            ),
            body: Container(
              padding: const EdgeInsets.only(top: 80, left: 40, right: 40),
              child: Column(
                children: [
                  Column(
                    children: [
                      Center(
                        child: Image.asset(
                          'images/coffee_logo.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 35),
                      Text(
                        'Receive an eamil adress to\n reset your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ResetPasswordEmailInput(emailController: emailController,),
                  ResetPasswordButton(
                    emailController: emailController,
                    forgotPasswordPressed: () {
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
