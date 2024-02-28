import 'package:flutter/material.dart';

class OrSignUpWith extends StatelessWidget {
  const OrSignUpWith({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.black12,
            thickness: 1.5,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'Or sign in with',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: Colors.black12,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}
