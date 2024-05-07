part of 'search_dish_cubit.dart';

@immutable
class SearchDishState {
  const SearchDishState({
    this.status = Status.initial,
    this.dishes = const [],
    this.suggestions,
    this.hasText = false,
    this.errorMessage = '',
  });

  final Status status;
  final List<DishModel> dishes;
  final List<String>? suggestions;
  final bool hasText;
  final String? errorMessage;
}
