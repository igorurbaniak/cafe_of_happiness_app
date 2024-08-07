import 'package:flutter/material.dart';

class BackHomeButton extends StatelessWidget {
  const BackHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.home),
      label: const Text(
        'Cafeteria Menu',
        style: TextStyle(fontSize: 12),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        foregroundColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
