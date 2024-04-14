import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    if (dishes.isNotEmpty) {
      return BlocBuilder<MenuItemCubit, MenuItemState>(
        builder: (context, state) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: dishes.length,
            itemBuilder: (ctx, index) {
              final dish = dishes[index];
              return DishFavoriteItem(
                dish: dish,
                onToggleFavorite: (dishId) =>
                    context.read<MenuItemCubit>().toggleFavorite(dishId),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
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
      ),
    );
  }
}
