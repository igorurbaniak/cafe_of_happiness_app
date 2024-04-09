import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/screens/favorite_dishes/favourite_dishes_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_title.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_discription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final GlobalKey breakfastKey = GlobalKey();
    final GlobalKey lunchKey = GlobalKey();
    final GlobalKey dessertKey = GlobalKey();

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
                  DishCategoryButton(
                    categoryTitle: 'Śniadania 🥐',
                    onTap: () {
                      Scrollable.ensureVisible(
                        breakfastKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                   DishCategoryButton(
                    categoryTitle: 'Lunch 🥞',
                    onTap: () {
                      Scrollable.ensureVisible(
                        lunchKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                  const SizedBox(width: 5),
                   DishCategoryButton(
                    categoryTitle: 'Na słodko 🍨',
                    onTap: () {
                      Scrollable.ensureVisible(
                        dessertKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                  ),
                ],
              ),
            ),
            DishCategoryTitle(
              dishCategoryKey: breakfastKey,
              categoryTitle: 'Śniadania 🥐',
              categoryTimer: 'od 8:00 - 13:00',
            ),
            Column(
              children: [
                DishDiscription(dishes: dishes, title: title),
              ],
            ),
            DishCategoryTitle(
              dishCategoryKey: lunchKey,
              categoryTitle: 'Lunch 🥞',
              categoryTimer: 'od 13:00 - 19:00',
            ),
            const SizedBox(height: 200),
            DishCategoryTitle(
              dishCategoryKey: dessertKey,
              categoryTitle: 'Na słodko 🍨',
              categoryTimer: 'od od 8:00 - 19:00',
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
