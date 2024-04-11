import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';

extension CustomToString on DishCategory {
  String get title {
    switch (this) {
      case DishCategory.breakfast:
        return 'Śniadania 🥐';
      case DishCategory.lunch:
        return 'Lunch 🥞';
      case DishCategory.sweet:
        return 'Na słodko 🍨';
      case DishCategory.drinks:
        return 'Drinks ☕';
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
      case DishCategory.drinks:
        return '8:00 - 19:00';
    }
  }
}
