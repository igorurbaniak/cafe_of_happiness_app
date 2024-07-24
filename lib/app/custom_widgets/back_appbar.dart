import 'package:flutter/material.dart';

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({super.key, required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      toolbarHeight: 80,
      leadingWidth: 100,
      leading: IconButton.outlined(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondaryContainer),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
              width: 0.5,
            ),
          ),
        ),
        icon: Icon(Icons.arrow_back_rounded,
            color: Theme.of(context).colorScheme.onTertiary),
        iconSize: 32,
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(title),
    );
  }
}
