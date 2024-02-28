import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: Colors.brown.shade500),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const ForgotPassword()),
          ),
        );
      },
      child: const Text(
        'Forgot your Password?',
        style: TextStyle(
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
