part of 'menu_item_cubit.dart';

@immutable
class MenuItemState {
  const MenuItemState({
    this.dishes = const [],
    this.favoriteDishIds = const [],
    this.favoriteCounts = const {},
    this.errorMessage,
  });

  final List<DishModel> dishes;
  final List<int> favoriteDishIds;
  final Map<int, int> favoriteCounts;
  final String? errorMessage;
}
