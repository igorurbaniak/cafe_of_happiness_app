import 'package:flutter/material.dart';

class OrSignUpWith extends StatelessWidget {
  const OrSignUpWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Or sign in with',
          style: TextStyle(
            fontSize: 10,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(
            thickness: 0.5,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
