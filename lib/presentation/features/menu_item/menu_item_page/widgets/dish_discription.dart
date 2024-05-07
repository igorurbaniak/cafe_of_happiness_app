import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishDiscription extends StatelessWidget {
  const DishDiscription({
    Key? key,
    required this.dishes,
  }) : super(key: key);

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: dishes.length,
          itemBuilder: (ctx, index) {
            final dish = dishes[index];
            return DishMenuItem(
              dish: dish,
              onToggleFavorite: (dishId) =>
                  context.read<MenuItemCubit>().toggleFavorite(dishId),
            );
          },
        ),
      ],
    );
  }
}

