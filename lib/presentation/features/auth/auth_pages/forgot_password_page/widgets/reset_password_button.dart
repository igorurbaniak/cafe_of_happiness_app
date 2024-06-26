import 'package:flutter/material.dart';

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key, required this.forgotPasswordPressed, required this.emailController});

  final VoidCallback forgotPasswordPressed;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.brown.shade500,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 60,
            child: TextButton(
              onPressed: forgotPasswordPressed,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
