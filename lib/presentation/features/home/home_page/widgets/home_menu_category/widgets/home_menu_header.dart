import 'package:flutter/material.dart';

class HomeMenuHeader extends StatelessWidget {
  const HomeMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Divider(
            color: Colors.black12,
            thickness: 1.5,
          ),
        ),
        SizedBox(width: 10),
        Text(
          'MENU:',
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