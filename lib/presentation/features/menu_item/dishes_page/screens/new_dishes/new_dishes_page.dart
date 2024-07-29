import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_menu_item.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDishesPage extends StatelessWidget {
  const NewDishesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: '🔥  Nowości'),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<DishesCubit, DishesState>(
        builder: (context, state) {
          if (state.status == Status.loading) {
            return _buildNewShimmerLoading();
          } else if (state.status == Status.error) {
            return Center(
              child: Text(state.errorMessage ??
                  'You encountered an unexpected error.... try again later'),
            );
          } else {
            return _buildNewDishesList(state);
          }
        },
      ),
    );
  }

  Widget _buildNewShimmerLoading() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) => const DishesShimmerLoading(),
    );
  }

  Widget _buildNewDishesList(DishesState state) {
    final newDishes = state.newDishes;

    if (newDishes.isEmpty) {
      return const Center(
        child: Text(
          'Nowości wkrótce u Nas  👀',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      itemCount: newDishes.length,
      itemBuilder: (ctx, index) {
        final dish = newDishes[index];
        return DishMenuItem(dish: dish);
      },
    );
  }
}