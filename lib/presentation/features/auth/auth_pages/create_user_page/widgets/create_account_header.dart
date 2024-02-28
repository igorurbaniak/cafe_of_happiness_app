import 'package:flutter/material.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/coffee_logo.png',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 60),
        const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
