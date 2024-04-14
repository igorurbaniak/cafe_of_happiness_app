import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishFavoriteItem extends StatelessWidget {
  const DishFavoriteItem({
    super.key,
    required this.dish,
    required this.onToggleFavorite,
  });

  final DishModel dish;
  final Function(int) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    final isFavorite =
        context.read<MenuItemCubit>().state.favoriteDishIds.contains(dish.id);
    final favoriteCounter =
        context.read<MenuItemCubit>().state.favoriteCounts[dish.id] ?? 0;

    return Container(
      padding: const EdgeInsets.all(15),
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => DishDetails(dish: dish),
            ),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: dish,
                  child: Image.asset(
                    dish.dishImage,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 140,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.dishName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '${dish.dishPrice} PLN',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 220,
                  height: 100,
                  child: Text(
                    dish.dishIngredients,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '${dish.cookTime}min',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'Polecany',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 108),
                    InkWell(
                      onTap: () {
                        context.read<MenuItemCubit>().toggleFavorite(dish.id);
                      },
                      child: Container(
                        height: 40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Container(
                                width: 70,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  ),
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    favoriteCounter.toString(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
