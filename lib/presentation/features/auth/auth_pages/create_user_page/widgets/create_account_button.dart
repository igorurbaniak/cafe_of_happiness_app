import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key, required this.signUpPressed});

  final VoidCallback signUpPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.brown.shade500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 60,
        child: TextButton(
          onPressed: signUpPressed,
          child: const Text(
            'Sign up',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}