import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishDescription extends StatelessWidget {
  const DishDescription({super.key, required this.selectedCategory});

  final DishCategory selectedCategory;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishesCubit, DishesState>(
      builder: (context, state) {
        final dishes = state.dishes;
        return Column(
          children: [
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: dishes.where((dish) => dish.dishCategory == selectedCategory).length,
              itemBuilder: (ctx, index) {
                final dish = dishes.where((dish) => dish.dishCategory == selectedCategory).toList()[index];
                return DishMenuItem(
                  dish: dish,
                );
              },
            ),
          ],
        );
      },
    );
  }
}