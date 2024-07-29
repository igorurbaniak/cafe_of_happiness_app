import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_details.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_liked.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DishMenuItem extends StatelessWidget {
  const DishMenuItem({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => BlocProvider.value(
                value: context.read<DishesCubit>(),
                child: DishDetails(dish: dish),
              ),
            ),
          );
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: ClipOval(
                child: Hero(
                  tag: 'dish-${dish.dishId}-list',
                  child: Image.asset(
                    dish.dishImage,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dish.dishName,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  '${dish.dishPrice} PLN',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 5),
                Container(
                  constraints: const BoxConstraints(maxWidth: 220),
                  color: Theme.of(context).colorScheme.onPrimary,
                  child: Text(
                    dish.dishIngredients,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (dish.isDishNew)
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 16,
                            color: Colors.red.shade600,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Nowość',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (dish.isDishNew && dish.isDishVegetarian)
                      const SizedBox(width: 20),
                    if (dish.isDishVegetarian)
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.leaf,
                            size: 16,
                            color: Colors.green.shade600,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Vege',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                  ],
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
                      '${dish.dishCookTime}min',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(width: 30),
                    Icon(
                      dish.isDishRecommended
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Polecany',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Spacer(),
                    DishLiked(
                      dish: dish,
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
