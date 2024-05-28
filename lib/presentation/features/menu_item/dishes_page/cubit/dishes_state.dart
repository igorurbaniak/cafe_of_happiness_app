part of 'dishes_cubit.dart';

@immutable
class DishesState {
  final List<DishModel> dishes;
  final List<DishModel> newDishes;
  final List<DishModel> favoriteDishes;
  final Map<int, int> favoriteCounts;
  final List<int> favoriteDishIds;
  final Status status;
  final String? errorMessage;

  const DishesState({
    this.dishes = const [],
    this.newDishes = const [],
    this.favoriteDishes = const [],
    this.favoriteCounts = const {},
    this.favoriteDishIds = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  DishesState copyWith({
    List<DishModel>? dishes,
    List<DishModel>? newDishes,
    List<DishModel>? favoriteDishes,
    Map<int, int>? favoriteCounts,
    List<int>? favoriteDishIds,
    Status? status,
    String? errorMessage,
  }) {
    return DishesState(
      dishes: dishes ?? this.dishes,
      newDishes: newDishes ?? this.newDishes,
      favoriteDishes: favoriteDishes ?? this.favoriteDishes,
      favoriteCounts: favoriteCounts ?? this.favoriteCounts,
      favoriteDishIds: favoriteDishIds ?? this.favoriteDishIds,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
