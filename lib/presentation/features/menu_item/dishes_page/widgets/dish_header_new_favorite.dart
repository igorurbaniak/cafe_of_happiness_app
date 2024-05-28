import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/screens/favorite_dishes/favourite_dishes_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/screens/new_dishes/new_dishes_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DishHeaderNewFavorite extends StatelessWidget {
  const DishHeaderNewFavorite({super.key});

  Widget _buildButton(BuildContext context,
      {required Icon icon, required String label, required Widget page}) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => BlocProvider.value(
                value: context.read<DishesCubit>(),
                child: page,
              ),
            ),
          );
        },
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        icon: icon,
        label: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DishesCubit, DishesState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: _buildButton(
                context,
                icon: const Icon(Icons.local_fire_department),
                label: 'Nowości!',
                page: const NewDishesPage(),
              ),
            ),
            Expanded(
              child: _buildButton(
                context,
                icon: const Icon(Icons.favorite),
                label: 'Ulubione: ${state.favoriteDishIds.length}',
                page: const FavoriteDishesPage(),
              ),
            ),
          ],
        );
      },
    );
  }
}