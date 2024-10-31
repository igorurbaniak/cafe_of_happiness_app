import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_state.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_menu_item.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteDishesPage extends StatelessWidget {
  const FavoriteDishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: BackAppBar(
          title: isDarkMode ? '🤍  Twoje ulubione' : '🖤  Twoje ulubione'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<DishesCubit, DishesState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return _buildFavoriteShimmerLoading();
          } else if (state.status == Status.error) {
            return Center(
              child: Text(state.errorMessage ??
                  'You encountered an unexpected error.... try again later'),
            );
          } else {
            return _buildFavoriteDishesList(state);
          }
        },
      ),
    );
  }

  Widget _buildFavoriteShimmerLoading() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => const DishesShimmerLoading(),
    );
  }

  Widget _buildFavoriteDishesList(DishesState state) {
    final favoriteDishes = state.dishes
        .where((dish) => state.favoriteDishIds.contains(dish.dishId))
        .toList();

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
        return DishMenuItem(dish: dish);
      },
    );
  }
}
