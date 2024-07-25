import 'package:cafe_of_happiness_app/presentation/features/auth/auth_pages/forgot_password_page/forgot_password_page.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => const ForgotPassword()),
            ),
          );
        },
        child: Text(
          'Forgot your Password?',
          style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.secondaryContainer),
        ),
      ),
    );
  }
}
