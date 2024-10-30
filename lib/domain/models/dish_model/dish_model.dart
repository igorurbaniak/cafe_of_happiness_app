import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel {
  DishModel({
    required this.dishId,
    required this.dishName,
    required this.dishPrice,
    required this.dishIngredients,
    required this.dishCookTime,
    required this.dishImage,
    required this.isDishVegetarian,
    required this.isDishRecommended,
    required this.isDishNew,
    required this.dishCategory,
    required this.dishCategoriesId,
    this.isDishFavorite = false,
  });

  final int dishId;
  final String dishName;
  final int dishPrice;
  final String dishIngredients;
  final int dishCookTime;
  final String dishImage;
  final bool isDishVegetarian;
  final bool isDishRecommended;
  final bool isDishNew;
  final DishCategory dishCategory;
  final String dishCategoriesId;
  bool isDishFavorite;

  DishModel copyWith({required bool isDishFavorite}) {
    return DishModel(
      dishId: dishId,
      dishName: dishName,
      dishPrice: dishPrice,
      dishIngredients: dishIngredients,
      dishCookTime: dishCookTime,
      dishImage: dishImage,
      isDishVegetarian: isDishVegetarian,
      isDishRecommended: isDishRecommended,
      isDishNew: isDishNew,
      dishCategory: dishCategory,
      dishCategoriesId: dishCategoriesId,
      isDishFavorite: isDishFavorite,
    );
  }

  factory DishModel.fromJson(Map<String, dynamic> json) => _$DishModelFromJson(json);
  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}