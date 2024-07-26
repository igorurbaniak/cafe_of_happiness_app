import 'package:flutter/material.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Already have an account?',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Sign in',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 22,
            ),
          ),
        ),
      ],
    );
  }
}
