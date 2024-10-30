import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dish_model.freezed.dart';
part 'dish_model.g.dart';

@freezed
class DishModel with _$DishModel {
  factory DishModel({
    required int dishId,
    required String dishName,
    required int dishPrice,
    required String dishIngredients,
    required int dishCookTime,
    required String dishImage,
    required bool isDishVegetarian,
    required bool isDishRecommended,
    required bool isDishNew,
    required DishCategory dishCategory,
    required String dishCategoriesId,
    @Default(false) bool isDishFavorite,
  }) = _DishModel;

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);
}