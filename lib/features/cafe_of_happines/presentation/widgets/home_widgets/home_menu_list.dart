


import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/data_sources/dish_discription.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/data_sources/menu_category.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/models/menu_category_model.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/pages/menu_item_page/menu_meal_screen.dart';
import 'package:flutter/material.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void _selectMenuCategory(BuildContext context, MenuCategory menuCategory) {
      final filteredDishes = dishes
          .where((dish) => dish.categories.contains(menuCategory.id))
          .toList();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => MenuScreen(
            title: menuCategory.title,
            dishes: filteredDishes,
          ),
        ),
      );
    }

    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  thickness: 1.5,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'MENU:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  thickness: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return Column(
                 children: [
                  for (final category in menuCategory)
                    NewOne(
                      category: category,
                      onSelectCategory: () {
                        _selectMenuCategory(context, category);
                      },
                    ),
                ],
                );
              }
              ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

class NewOne extends StatelessWidget {
  const NewOne({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final MenuCategory category;
  final void Function() onSelectCategory;

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
            category.title,
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
