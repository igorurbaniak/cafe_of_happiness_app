import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/search_repository/search_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'search_dish_state.dart';

@injectable  
class SearchDishCubit extends Cubit<SearchDishState> {
  SearchDishCubit({required this.searchDishesRepository})
      : super(const SearchDishState());

  final TextEditingController searchController = TextEditingController();
  final SearchDishesRepository searchDishesRepository;

  Future<void> search(String query) async {
    final hasText = query.isNotEmpty;

    emit(
      SearchDishState(
        status: Status.loading,
        hasText: hasText,
      ),
    );

    try {
      final List<DishModel> filteredDishes =
          await searchDishesRepository.getFilteredDishes(query);
      emit(
        SearchDishState(
          status: Status.success,
          suggestions: filteredDishes.map((dish) => dish.dishName).toList(),
          dishes: filteredDishes,
          hasText: hasText,
        ),
      );
    } on Exception catch (error) {
      emit(
        SearchDishState(
          status: Status.error,
          errorMessage: 'An error occurred: ${error.toString()}',
          hasText: hasText,
        ),
      );
    }
  }

  void clearSearch() {
    searchController.clear();
    emit(
      const SearchDishState(
        hasText: false,
      ),
    );
  }
}
