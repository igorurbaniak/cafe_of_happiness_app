import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';

DishCategory getDishCategoryFromValue(String dishCategoryValue) {
  switch (dishCategoryValue) {
    case 'breakfast':
      return DishCategory.breakfast;
    case 'lunch':
      return DishCategory.lunch;
    case 'sweet':
      return DishCategory.sweet;
    case 'coffee':
      return DishCategory.coffee;
    case 'tea':
      return DishCategory.tea;
    case 'other':
      return DishCategory.other;
    default:
      throw Exception('Unknown dish category: $dishCategoryValue');
  }
}

extension CustomToString on DishCategory {
  String get title {
    switch (this) {
      case DishCategory.breakfast:
        return 'Śniadania 🥐';
      case DishCategory.lunch:
        return 'Lunch 🥞';
      case DishCategory.sweet:
        return 'Na słodko 🍨';
      case DishCategory.coffee:
        return 'Coffee ☕';
      case DishCategory.tea:
        return 'Tea 🍵';
      case DishCategory.other:
        return 'Other 🤯';
    }
  }

  String get timer {
    switch (this) {
      case DishCategory.breakfast:
        return 'od 8:00 - 13:00';
      case DishCategory.lunch:
        return 'od 13:00 - 19:00';
      case DishCategory.sweet:
        return '8:00 - 19:00';
      case DishCategory.coffee:
        return '8:00 - 19:00';
      case DishCategory.tea:
        return '8:00 - 19:00';
      case DishCategory.other:
        return '8:00 - 19:00';
    }
  }
}
