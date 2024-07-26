import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton(
      {super.key,
      required this.forgotPasswordPressed,
      required this.emailController});

  final VoidCallback forgotPasswordPressed;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 55,
        child: TextButton(
          onPressed: forgotPasswordPressed,
          child: Text(
            'Reset Password',
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
