part of 'search_dish_cubit.dart';

@immutable
class SearchDishState {
  const SearchDishState({
    this.query = '',
    this.errorMessage = '',
    this.suggestions,
    this.status = Status.initial,
    this.hasText = false
  });

  final String query;
  final String? errorMessage;
  final List<String>? suggestions;
  final Status status;
  final bool hasText;
}
