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
            side: BorderSide(color: Colors.grey.shade200, width: 1),
            borderRadius: BorderRadius.circular(8)),
        shadowColor: Colors.grey.shade100,
        elevation: 0.3,
        color: Colors.white,
        child: ListTile(
          title: Text(
            menuCategoryModel.title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
          ),
        ),
      ),
    );
  }
}