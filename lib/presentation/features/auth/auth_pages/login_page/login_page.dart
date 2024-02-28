import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/create_new_account_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/forgot_password_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/google_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/email_input.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/login_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/or_sign_up_with.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/login_page/widgets/password_input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
        child: Column(
          children: [
            Image.asset(
              'images/coffee_logo.png',
              width: 135,
              height: 135,
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
            const EmailInput(),
            const SizedBox(height: 10),
            const PasswordInput(),
            const ForgotPasswordButton(),
            const SizedBox(height: 25),
            const LoginButton(),
            const SizedBox(height: 20),
            const OrSignUpWith(),
            const SizedBox(height: 20),
            const GoogleButton(),
            const SizedBox(height: 40),
            const CreateNewAccountButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
