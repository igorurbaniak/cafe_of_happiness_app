import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/models/dish_model.dart';
import 'package:flutter/material.dart';

class DishDetails extends StatelessWidget {
  const DishDetails({super.key, required this.dish});

  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Hero(
              tag: dish,
              child: Image.asset(dish.dishImage),
            ),
            const SizedBox(height: 30),
            Text(
              dish.dishName,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              '${dish.dishPrice} PLN',
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),
            ),
            const SizedBox(height: 40),
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
                    const Icon(Icons.thumb_up_alt_outlined, size: 22),
                    const SizedBox(height: 5),
                    const Text(
                      'Polecany',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 70,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.favorite_outline_outlined, size: 28),
                              Center(
                                child: Text(
                                  '20',
                                  style: TextStyle(fontSize: 22),
                                ),
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
      ),
    );
  }
}
