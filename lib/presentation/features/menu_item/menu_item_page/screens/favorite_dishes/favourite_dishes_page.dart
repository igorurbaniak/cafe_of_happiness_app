import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteDishesPage extends StatelessWidget {
  const FavoriteDishesPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: '🖤  Twoje ulubione'),
      body: BlocBuilder<MenuItemCubit, MenuItemState>(
        builder: (context, state) {
                    final favoriteDishes =
              state.dishes.where((dish) => dish.isFavorite).toList();

          if (favoriteDishes.isEmpty) {
            return const Center(
              child: Column(
                children: [
                  Text('YOYOYOYOYYO'),
                ],
              ),
            );
          }
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: favoriteDishes.length,
            itemBuilder: (ctx, index) {
              final dish = favoriteDishes[index];
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
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${dish.dishPrice} PLN',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
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
                              const Icon(Icons.access_time, size: 16),
                              const SizedBox(width: 5),
                              Text(
                                '${dish.cookTime}min',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 30),
                              const Icon(Icons.thumb_up_alt_outlined,
                                  size: 16),
                              const SizedBox(width: 5),
                              const Text(
                                'Polecany',
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(width: 108),
                              InkWell(
                                onTap: () {
                                   context
                                      .read<MenuItemCubit>()
                                      .toggleFavorite(dish.id);
                                },
                                child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 50,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(dish.isFavorite
                                                ? Icons
                                                    .favorite_outline_outlined
                                                : Icons
                                                    .favorite_border_outlined),
                                            const Center(
                                              child: Text('20'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
