import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/repositories/dishes_repository/dishes_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable  
class DishesCubit extends Cubit<DishesState> {
  final DishesRepository dishesRepository;

  DishesCubit({required this.dishesRepository}) : super(const DishesState());

  Future<void> loadDishes({required String categories}) async {
    emit(
      state.copyWith(
        status: Status.loading,
      ),
    );

    try {
      final dishes = await dishesRepository.getAllDishes(categories);
      final newDishes = dishes.where((dish) => dish.isDishNew).toList();
      final favoriteDishIds = await dishesRepository.getFavoriteDishIds();

      final updatedDishes = dishes.map((dish) {
        final isFavorite = favoriteDishIds.contains(dish.dishId);
        return dish.copyWith(isDishFavorite: isFavorite);
      }).toList();

      final favoriteCounts = _calculateFavoriteCounts(favoriteDishIds);

      emit(
        state.copyWith(
          dishes: updatedDishes,
          newDishes: newDishes,
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
      await dishesRepository.toggleFavorite(dishId);

      final currentState = state;
      final updatedFavoriteDishIds =
          List<int>.from(currentState.favoriteDishIds);

      if (updatedFavoriteDishIds.contains(dishId)) {
        updatedFavoriteDishIds.remove(dishId);
      } else {
        updatedFavoriteDishIds.add(dishId);
      }

      final updatedDishes = currentState.dishes.map((dish) {
        if (dish.dishId == dishId) {
          return dish.copyWith(isDishFavorite: !dish.isDishFavorite);
        }
        return dish;
      }).toList();

      final updatedFavoriteCounts =
          _calculateFavoriteCounts(updatedFavoriteDishIds);

      emit(
        state.copyWith(
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

  Map<int, int> _calculateFavoriteCounts(List<int> favoriteDishIds) {
    final favoriteCounts = <int, int>{};
    for (var dishId in favoriteDishIds) {
      favoriteCounts[dishId] = (favoriteCounts[dishId] ?? 0) + 1;
    }
    return favoriteCounts;
  }
}
