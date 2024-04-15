import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_menu_item.dart';
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
              child: Text(
                'Nie masz nic w ulubionych 🥺',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: favoriteDishes.length,
            itemBuilder: (ctx, index) {
              final dish = favoriteDishes[index];
              return DishMenuItem(
                dish: dish,
                onToggleFavorite: (dishId) =>
                    context.read<MenuItemCubit>().toggleFavorite(dishId),
              );
            },
          );
        },
      ),
    );
  }
}
