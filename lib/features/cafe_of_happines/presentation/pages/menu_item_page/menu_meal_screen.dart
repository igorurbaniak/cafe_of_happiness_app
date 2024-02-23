import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/models/dish_model.dart';
import 'package:cafe_of_happiness_app/features/cafe_of_happines/presentation/widgets/menu_item_widgets/dish_discription.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
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
                    onPressed: () {},
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    icon: const Icon(Icons.favorite),
                    label: const Text('Favorites: 0'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150, width: double.infinity),
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.only(left: 15),
              height: 100,
              width: double.infinity,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Śniadania 🥐',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'od 8:00 - 17:00',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                DishDiscription(dishes: dishes, title: title),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
