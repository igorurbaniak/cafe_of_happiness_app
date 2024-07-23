import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:flutter/material.dart';

class MenuCategoryItem extends StatelessWidget {
  const MenuCategoryItem({
    super.key,
    required this.onSelectCategory,
    required this.menuCategoryModel,
  });

  final void Function() onSelectCategory;
  final MenuCategoryModel menuCategoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.secondary, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: Theme.of(context).colorScheme.onPrimaryContainer,
        elevation: 0.3,
        color: Theme.of(context).colorScheme.surface,
        child: ListTile(
          title: Text(
            menuCategoryModel.title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
