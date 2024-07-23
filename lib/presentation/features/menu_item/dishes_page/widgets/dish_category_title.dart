import 'package:flutter/material.dart';

class DishCategoryTitle extends StatelessWidget {
  const DishCategoryTitle({
    super.key,
    required this.dishCategoryKey,
    required this.categoryTitle,
    required this.categoryTimer,
  });

  final GlobalKey dishCategoryKey;
  final String categoryTitle;
  final String categoryTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: dishCategoryKey,
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      padding: const EdgeInsets.only(left: 15),
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            categoryTimer,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
