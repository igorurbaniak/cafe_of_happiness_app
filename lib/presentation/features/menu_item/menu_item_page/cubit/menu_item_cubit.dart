import 'package:cafe_of_happiness_app/data/data_sources/dishes_data_source/dishes_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'menu_item_state.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit()
      : super(
          MenuItemState(
            dishes: dishes,
          ),
        );

  void toggleFavorite(int dishId) {
    try {
      bool isFavorite(int dishId) => state.favoriteDishIds.contains(dishId);

      final currentState = state;
      final updatedDishes = currentState.dishes
          .map((dish) => dish.id == dishId
              ? dish.copyWith(isFavorite: !dish.isFavorite)
              : dish)
          .toList();
      final updatedFavoriteDishIds = isFavorite(dishId)
          ? currentState.favoriteDishIds.where((id) => id != dishId).toList()
          : [...currentState.favoriteDishIds, dishId];
      final updateFavoriteCounter = updatedFavoriteDishIds.length;

      emit(
        MenuItemState(
          dishes: updatedDishes,
          favoriteDishIds: updatedFavoriteDishIds,
          favoriteCounter: updateFavoriteCounter,
        ),
      );
    } catch (error) {
      emit(
        MenuItemState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
