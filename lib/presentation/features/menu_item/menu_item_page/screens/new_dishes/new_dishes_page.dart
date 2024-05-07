import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDishesPage extends StatelessWidget {
  const NewDishesPage({super.key, required this.dishes});

  final List<DishModel> dishes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: '🔥  Nowości'),
      body: BlocBuilder<MenuItemCubit, MenuItemState>(
        builder: (context, state) {
          if (dishes.isEmpty) {
            return const Center(
              child: Text(
                'Nowości wkrótce u Nas  👀',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
          }
          return ListView.builder(
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
          );
        },
      ),
    );
  }
}
