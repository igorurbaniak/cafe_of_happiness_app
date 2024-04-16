import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dishes_model/dishes_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_dish_state.dart';

class SearchDishCubit extends Cubit<SearchDishState> {
  SearchDishCubit(this.dishes) : super(const SearchDishState());

  final TextEditingController searchController = TextEditingController();
  final List<DishModel> dishes;

  void search(String query) {
    emit(
      SearchDishState(
        query: query,
        errorMessage: '',
        status: Status.loading,
        hasText: query.isNotEmpty,
      ),
    );

    final filteredDishes = dishes.where((dish) {
      final dishNameLower = dish.dishName.toLowerCase();
      final queryLower = query.toLowerCase();
      return dishNameLower.contains(queryLower);
    }).toList();

    try {
      emit(
        SearchDishState(
          query: query,
          suggestions: filteredDishes.map((dish) => dish.dishName).toList(),
          errorMessage: '',
          status: Status.success,
        ),
      );
    } on Exception catch (e) {
      emit(
        SearchDishState(
          query: query,
          errorMessage: 'An error occurred: $e',
          status: Status.error,
        ),
      );
    }
  }

  void clearSearch() {
    searchController.clear();
    emit(
      const SearchDishState(
        query: '',
        hasText: false,
      ),
    );
  }
}
