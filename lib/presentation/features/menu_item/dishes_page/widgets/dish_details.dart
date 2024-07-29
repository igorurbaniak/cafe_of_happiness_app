import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_liked.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DishDetails extends StatelessWidget {
  const DishDetails({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: ''),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          children: [
            ClipOval(
              child: Hero(
                tag: 'dish-${dish.dishId}-detail',
                child: Image.asset(
                  dish.dishImage,
                  fit: BoxFit.fill,
                  height: 220,
                  width: 220,
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              dish.dishName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            Text(
              '${dish.dishPrice} PLN',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 120,
              child: Text(
                dish.dishIngredients,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 5,
                overflow: TextOverflow.fade,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.access_time, size: 22),
                    const SizedBox(height: 5),
                    Text(
                      '${dish.dishCookTime}min',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Icon(
                      dish.isDishRecommended
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined,
                      size: 22,
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Polecany',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    if (dish.isDishNew)
                      Row(
                        children: [
                          Icon(
                            Icons.local_fire_department,
                            size: 20,
                            color: Colors.red.shade600,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Nowość',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    if (dish.isDishVegetarian)
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.leaf,
                            size: 20,
                            color: Colors.green.shade800,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Vege',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    (dish.isDishNew && dish.isDishVegetarian)
                        ? const SizedBox(height: 30)
                        : const SizedBox(height: 50),
                    SizedBox(
                      height: 50,
                      width: 90,
                      child: DishLiked(
                        dish: dish,
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
