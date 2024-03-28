import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 100,
      leading: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: Colors.brown.shade700,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
        iconSize: 32,
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title),
    );
  }
}
