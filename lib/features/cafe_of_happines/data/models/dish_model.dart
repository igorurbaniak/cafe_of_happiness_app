enum DishesCategory {
  breakfast,
  lunch,
  sweet,
  drinks,
}

class DishModel {
  DishModel({
    required this.dishName,
    required this.dishPrice,
    required this.dishIngredients,
    required this.cookTime,
    required this.dishImage,
    required this.isVegetarian,
    required this.isRecommended,
    required this.dishesCategory,
    required this.categories
  });

  final String dishName;
  final int dishPrice;
  final String dishIngredients;
  final int cookTime;
  final String dishImage;
  final bool isVegetarian;
  final bool isRecommended;
  final DishesCategory dishesCategory;
  final List categories;
}
