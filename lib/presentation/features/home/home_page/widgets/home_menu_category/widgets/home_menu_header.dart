import 'package:flutter/material.dart';

class HomeMenuHeader extends StatelessWidget {
  const HomeMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Expanded(
          child: Divider(),
        ),
        const SizedBox(width: 10),
        Text(
          'MENU:',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10),
        const Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}