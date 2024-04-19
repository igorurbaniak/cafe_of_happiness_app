import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_liked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishDetails extends StatelessWidget {
  const DishDetails({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            Hero(
              tag: dish,
              child: Image.asset(
                dish.dishImage,
                fit: BoxFit.contain,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              dish.dishName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              '${dish.dishPrice} PLN',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Text(
                dish.dishIngredients,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.access_time, size: 22),
                    const SizedBox(height: 5),
                    Text(
                      '${dish.cookTime}min',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    Icon(
                      dish.isRecommended
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                      size: 22,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Polecany',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (dish.isNew)
                      const Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 22,
                            color: Colors.red,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Nowość',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    const SizedBox(height: 40),
                    SizedBox(
                      height: 50,
                      width: 90,
                      child: BlocBuilder<MenuItemCubit, MenuItemState>(
                        builder: (context, state) {
                          final isFavorite = context
                              .read<MenuItemCubit>()
                              .state
                              .favoriteDishIds
                              .contains(dish.id);
                          final favoriteCounter = context
                                  .read<MenuItemCubit>()
                                  .state
                                  .favoriteCounts[dish.id] ??
                              0;

                          return DishLiked(
                            dish: dish,
                            isFavorite: isFavorite,
                            favoriteCounter: favoriteCounter,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
