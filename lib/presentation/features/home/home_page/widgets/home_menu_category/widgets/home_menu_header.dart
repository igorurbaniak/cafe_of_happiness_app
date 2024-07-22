import 'package:flutter/material.dart';

class HomeMenuHeader extends StatelessWidget {
  const HomeMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Divider(
            color: isDarkMode ? Colors.white12 : Colors.black12,
            thickness: 1.5,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'MENU:',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: isDarkMode ? Colors.white12 : Colors.black12,
            thickness: 1.5,
          ),
        ),
      ],
    );
  }
}
