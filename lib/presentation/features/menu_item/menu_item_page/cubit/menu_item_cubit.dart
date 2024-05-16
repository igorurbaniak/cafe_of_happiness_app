import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/dishes_repository/dishes_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'menu_item_state.dart';

class MenuItemCubit extends Cubit<MenuItemState> {
  MenuItemCubit({required this.dishesRepository})
      : super(const MenuItemState());

  final DishesRepository dishesRepository;

  Future<void> loadDishes({required String categories}) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      final dishes = await dishesRepository.getAllDishes(categories);
      List<DishModel> sortDishesByCategory(List<DishModel> dishes) {
        final Map<String, List<DishModel>> categories = {};
        for (var dish in dishes) {
          final categoryTitle = dish.dishCategory.name;
          categories[categoryTitle] =
              (categories[categoryTitle] ?? []) + [dish];
        }

        final sortedCategoryTitles = categories.keys.toList()..sort();
        final List<DishModel> sortedDishes = [];
        for (var title in sortedCategoryTitles) {
          sortedDishes.addAll(categories[title]!);
        }
        return sortedDishes;
      }

      final sortedDishes = sortDishesByCategory(dishes);

      final favoriteDishIds = <int>[];
      final favoriteCounts = <int, int>{};
      for (var dish in sortedDishes) {
        if (dish.isDishFavorite) {
          favoriteDishIds.add(dish.dishId);
          favoriteCounts[dish.dishId] = 1;
        }
      }

      emit(
        state.copyWith(
          dishes: sortedDishes,
          favoriteDishIds: favoriteDishIds,
          favoriteCounts: favoriteCounts,
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
          status: Status.error,
        ),
      );
    }
  }

  Future<void> toggleFavorite(int dishId) async {
    try {
      bool isFavorite(int dishId) => state.favoriteDishIds.contains(dishId);

      final currentState = state;
      final updatedDishes = currentState.dishes
          .map((dish) => dish.dishId == dishId
              ? dish.copyWith(isDishFavorite: !dish.isDishFavorite)
              : dish)
          .toList();
      final updatedFavoriteDishIds = isFavorite(dishId)
          ? currentState.favoriteDishIds.where((id) => id != dishId).toList()
          : [...currentState.favoriteDishIds, dishId];

      final updatedFavoriteCounts =
          Map<int, int>.from(currentState.favoriteCounts);
      if (updatedFavoriteCounts.containsKey(dishId)) {
        if (updatedFavoriteCounts[dishId] == 1) {
          updatedFavoriteCounts.remove(dishId);
        } else {
          updatedFavoriteCounts[dishId] = updatedFavoriteCounts[dishId]! - 1;
        }
      } else {
        updatedFavoriteCounts[dishId] = 1;
      }

      emit(
        currentState.copyWith(
          dishes: updatedDishes,
          favoriteDishIds: updatedFavoriteDishIds,
          favoriteCounts: updatedFavoriteCounts,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  List<DishModel> getFavoriteDishes() {
    return state.dishes.where((dish) => dish.isDishFavorite).toList();
  }

  List<DishModel> getNewDishes() {
    return state.dishes.where((dish) => dish.isDishNew).toList();
  }
}
