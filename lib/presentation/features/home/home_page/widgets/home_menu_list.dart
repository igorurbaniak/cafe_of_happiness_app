import 'package:cafe_of_happiness_app/data/data_sources/dishes_data_source/dishes_data_source.dart';
import 'package:cafe_of_happiness_app/data/data_sources/menu_item_data/menu_item_data.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_item_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/menu_category_item.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/menu_item_page.dart';
import 'package:flutter/material.dart';

class HomeMenuList extends StatelessWidget {
  const HomeMenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    void selectMenuCategory(BuildContext context, MenuItem menuCategory) {
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
            itemCount: menuCategory.length,
            itemBuilder: (ctx, index) {
              final category = menuCategory[index];
              return MenuCategoryItem(
                category: menuCategory[index],
                onSelectCategory: () {
                  selectMenuCategory(context, category);
                },
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}