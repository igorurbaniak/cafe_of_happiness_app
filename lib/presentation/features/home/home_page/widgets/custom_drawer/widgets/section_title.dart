import 'package:flutter/material.dart';

class SectionTitleDrawer extends StatelessWidget {
  const SectionTitleDrawer({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }
}