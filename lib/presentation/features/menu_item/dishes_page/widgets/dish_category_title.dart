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
      color: Theme.of(context).colorScheme.surface,
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            categoryTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Text(
            categoryTimer,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
