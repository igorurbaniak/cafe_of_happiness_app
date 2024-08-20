import 'package:flutter/material.dart';

class AuthBottomButton extends StatelessWidget {
  const AuthBottomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.create),
      label: Text(
        buttonText,
        style: const TextStyle(fontSize: 12),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      onPressed: onPressed,
    );
  }
}