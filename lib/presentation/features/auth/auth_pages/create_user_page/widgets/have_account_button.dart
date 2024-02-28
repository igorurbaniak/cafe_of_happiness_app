import 'package:flutter/material.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign in',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
