part of 'home_menu_category_cubit_cubit.dart';

@immutable
class MenuCategoryState {
  const MenuCategoryState({
    this.menuCategories = const [],
    this.status = Status.initial,
    this.errorMessage,
  });

  final List<MenuCategoryModel> menuCategories;
  final Status status;
  final String? errorMessage;
}
