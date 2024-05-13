import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/screens/favorite_dishes/favourite_dishes_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/screens/new_dishes/new_dishes_page.dart';
import 'package:flutter/material.dart';

class DishHeaderNewFavorite extends StatelessWidget {
  const DishHeaderNewFavorite({
    super.key,
    required this.newDishes,
    required this.favoriteDishes,
    required this.overallFavorites,
  });

  final List<DishModel> newDishes;
  final List<DishModel> favoriteDishes;
  final int overallFavorites;

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) =>
                      NewDishesPage(dishes: newDishes),
                ),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            icon: const Icon(Icons.local_fire_department),
            label: const Text('Nowości!'),
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
                  builder: (ctx) =>
                      FavoriteDishesPage(dishes: favoriteDishes),
                ),
              );
            },
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            icon: const Icon(Icons.favorite),
            label: Text(
              'Ulubione: $overallFavorites',
            ),
          ),
        ),
      ],
    );
  }
}