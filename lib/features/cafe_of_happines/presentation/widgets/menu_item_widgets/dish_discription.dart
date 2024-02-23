import 'package:cafe_of_happiness_app/features/cafe_of_happines/data/models/dish_model.dart';
import 'package:flutter/material.dart';

class DishDiscription extends StatelessWidget {
  const DishDiscription({
    super.key,
    required this.title,
    required this.dishes,
  });

  final String title;
  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ],
      ),
    );

    if (dishes.isNotEmpty) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dishes.length,
        itemBuilder: (ctx, index) => Container(
          padding: const EdgeInsets.all(15),
          height: 260,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    dishes[index].dishImage,
                    fit: BoxFit.contain,
                    height: 100,
                    width: 140,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dishes[index].dishName,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${dishes[index].dishPrice} PLN',
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
                      dishes[index].dishIngredients,
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
                        '${dishes[index].cookTime}min',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 30),
                      const Icon(Icons.thumb_up_alt_outlined, size: 16),
                      const SizedBox(width: 5),
                      const Text(
                        'Polecany',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 108),
                      InkWell(
                        onTap: () {},
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
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.favorite_outline_outlined),
                                    Center(
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
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
