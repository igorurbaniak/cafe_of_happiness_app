import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/widgets/reset_password_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/widgets/reset_password_email_input.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const ResetPasswordEmailInput(),
            const ResetPasswordButton(),
          ],
        ),
      ),
    );
  }
}
