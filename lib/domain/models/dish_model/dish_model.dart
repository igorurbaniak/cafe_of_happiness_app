import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';

class DishModel {
  DishModel({
    required this.id,
    required this.dishName,
    required this.dishPrice,
    required this.dishIngredients,
    required this.cookTime,
    required this.dishImage,
    required this.isVegetarian,
    required this.isRecommended,
    required this.isNew,
    required this.dishCategory,
    required this.categories,
    this.isFavorite = false,
  });

  final int id;
  final String dishName;
  final int dishPrice;
  final String dishIngredients;
  final int cookTime;
  final String dishImage;
  final bool isVegetarian;
  final bool isRecommended;
  final bool isNew;
  final DishCategory dishCategory;
  final List categories;
  bool isFavorite;

  DishModel copyWith({required bool isFavorite}) {
    return DishModel(
      id: id,
      dishName: dishName,
      dishPrice: dishPrice,
      dishIngredients: dishIngredients,
      cookTime: cookTime,
      dishImage: dishImage,
      isVegetarian: isVegetarian,
      isRecommended: isRecommended,
      isNew: isNew,
      dishCategory: dishCategory,
      categories: categories,
      isFavorite: isFavorite,
    );
  }

  DishModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        dishName = json['dishName'],
        dishPrice = json['dishPrice'],
        dishIngredients = json['dishIngredients'],
        cookTime = json['cookTime'],
        dishImage = json['dishImage'],
        isVegetarian = json['isVegetarian'],
        isRecommended = json['isRecommended'],
        isNew = json['isNew'],
        dishCategory = json['dishCategory'],
        categories = json['categories'],
        isFavorite = json['isFavorite'];
}
