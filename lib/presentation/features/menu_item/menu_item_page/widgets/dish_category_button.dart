import 'package:flutter/material.dart';

class DishCategoryButton extends StatelessWidget {
  const DishCategoryButton({
    super.key,
    required this.categoryTitle,
    required this.onTap,
  });

  final String categoryTitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(categoryTitle),
      ),
    );
  }
}
