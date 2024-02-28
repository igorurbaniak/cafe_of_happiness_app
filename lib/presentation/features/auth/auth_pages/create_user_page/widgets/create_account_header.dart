import 'package:flutter/material.dart';

class CreateAccountHeader extends StatelessWidget {
  const CreateAccountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/coffee_logo.png',
          width: 135,
          height: 135,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 20),
        const Text(
          'Sign up',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
