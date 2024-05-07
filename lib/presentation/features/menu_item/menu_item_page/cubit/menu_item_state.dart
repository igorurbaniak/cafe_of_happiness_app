part of 'menu_item_cubit.dart';

@immutable
class MenuItemState {
  const MenuItemState({
    this.dishes = const [],
    this.favoriteDishIds = const [],
    this.favoriteCounts = const {},
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<DishModel> dishes;
  final List<int> favoriteDishIds;
  final Map<int, int> favoriteCounts;
  final Status status;
  final String? errorMessage;

  MenuItemState copyWith({
    List<DishModel>? dishes,
    List<int>? favoriteDishIds,
    Map<int, int>? favoriteCounts,
    Status? status,
    String? errorMessage,
  }) {
    return MenuItemState(
      dishes: dishes ?? this.dishes,
      favoriteDishIds: favoriteDishIds ?? this.favoriteDishIds,
      favoriteCounts: favoriteCounts ?? this.favoriteCounts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

