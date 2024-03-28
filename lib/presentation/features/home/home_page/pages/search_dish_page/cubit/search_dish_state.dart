part of 'search_dish_cubit.dart';

@immutable
class SearchDishState {
  const SearchDishState({
    this.query = '',
    // this.isLoading = false,
    this.errorMessage = '',
    this.suggestions,
    this.status = Status.initial,
  });

  final String query;
  // final bool isLoading;
  final String? errorMessage;
  final List<String>? suggestions;
  final Status status;
}
