import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/menu_category_item.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/menu_item_page.dart';
import 'package:flutter/material.dart';

class HomeMenuCategoryList extends StatelessWidget {
  const HomeMenuCategoryList({super.key, required this.menuCategories});

  final List<MenuCategoryModel> menuCategories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: menuCategories.length,
      itemBuilder: (ctx, index) {
        final menuCategory = menuCategories[index];
        return MenuCategoryItem(
          menuCategoryModel: menuCategory,
          onSelectCategory: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => MenuItemPage(menuCategoryModel: menuCategory),
              ),
            );
          },
        );
      },
    );
  }
}