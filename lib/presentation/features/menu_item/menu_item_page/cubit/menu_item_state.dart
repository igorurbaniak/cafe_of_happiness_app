part of 'menu_item_cubit.dart';

@immutable
class MenuItemState {
  const MenuItemState({
    this.dishes = const [],
    this.favoriteDishIds = const [],
    this.favoriteCounter = 0,
    this.errorMessage,
  });

  final List<DishModel> dishes;
  final List<int> favoriteDishIds;
  final int favoriteCounter;
  final String? errorMessage;
}
