import 'package:flutter/material.dart';

class DishCategoryButton extends StatelessWidget {
  const DishCategoryButton({
    super.key,
    required this.categoryTitle,
    required this.onTap,
  });

  final String categoryTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
            width: 1,
          ),
        ),
        child: Text(categoryTitle,
            style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
