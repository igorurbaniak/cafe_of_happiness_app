import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/search_repository/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_dish_state.dart';

class SearchDishCubit extends Cubit<SearchDishState> {
  SearchDishCubit({required this.searchDishesRepository}) : super(const SearchDishState());

  final TextEditingController searchController = TextEditingController();
  final SearchDishesRepository searchDishesRepository;

  void search(String query) async {
    emit(
      SearchDishState(
        query: query,
        errorMessage: '',
        status: Status.loading,
        hasText: query.isNotEmpty,
      ),
    );

    try {
      final List<DishModel> filteredDishes = await searchDishesRepository.getFilteredDishes(query);
      emit(
        SearchDishState(
          query: query,
          suggestions: filteredDishes.map((dish) => dish.dishName).toList(),
          errorMessage: '',
          status: Status.success,
          dishes: filteredDishes,
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