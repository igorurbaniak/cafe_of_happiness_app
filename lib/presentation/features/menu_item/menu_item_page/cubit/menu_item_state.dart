part of 'menu_item_cubit.dart';

@immutable
class MenuItemState {
  const MenuItemState({
    this.dishes = const [],
    this.favoriteDishIds = const [],
    this.favoriteCounter = 0,
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<DishModel> dishes;
  final List<int> favoriteDishIds;
  final int favoriteCounter;
  final Status status;
  final String? errorMessage;
}
