import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/screens/favorite_dishes/favourite_dishes_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_title.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_discription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cafe_of_happiness_app/app/core/extensions/extensions.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({
    super.key,
    required this.title,
    required this.dishes,
  });

  final String title;
  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final List<GlobalKey> categoryKeys = List.generate(
      DishCategory.values.length,
      (_) => GlobalKey(),
    );

    List<DishModel> sortDishesByCategory(List<DishModel> dishes) {
      final Map<String, List<DishModel>> categories = {};
      for (var dish in dishes) {
        final categoryTitle = dish.dishCategory.name; // Use category.name
        categories[categoryTitle] = (categories[categoryTitle] ?? []) + [dish];
      }

      final sortedCategoryTitles = categories.keys.toList()..sort();
      final List<DishModel> sortedDishes = [];
      for (var title in sortedCategoryTitles) {
        sortedDishes.addAll(categories[title]!);
      }
      return sortedDishes;
    }

    final sortedDishes = sortDishesByCategory(dishes);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    icon: const Icon(Icons.star),
                    label: const Text('Popular'),
                  ),
                ),
                Container(
                  height: 55,
                  width: MediaQuery.sizeOf(context).width / 2,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => const FavoriteDishesPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    icon: const Icon(Icons.favorite),
                    label: BlocBuilder<MenuItemCubit, MenuItemState>(
                      builder: (context, state) {
                        final overallFavorites = state.favoriteDishIds.length;
                        return Text(
                          'Ulubione: $overallFavorites',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  ...DishCategory.values.map(
                    (category) {
                      final categoryIndex = category.index;
                      final categoryDishes = sortedDishes
                          .where((dish) => dish.dishCategory == category)
                          .toList();

                      return categoryDishes.isNotEmpty
                          ? Row(
                              children: [
                                DishCategoryButton(
                                  categoryTitle: category.title,
                                  onTap: () {
                                    Scrollable.ensureVisible(
                                      categoryKeys[categoryIndex]
                                          .currentContext!,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                ),
                                const SizedBox(width: 5),
                              ],
                            )
                          : Container();
                    },
                  ),
                ],
              ),
            ),
            ...List.generate(
              DishCategory.values.length,
              (index) {
                final category = DishCategory.values[index];
                final categoryDishes = sortedDishes
                    .where((dish) => dish.dishCategory == category)
                    .toList();

                if (categoryDishes.isNotEmpty) {
                  return Column(
                    children: [
                      DishCategoryTitle(
                        dishCategoryKey: categoryKeys[index],
                        categoryTitle: category.title,
                        categoryTimer: category.timer,
                      ),
                      DishDiscription(
                        dishes: categoryDishes,
                        title: title,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
