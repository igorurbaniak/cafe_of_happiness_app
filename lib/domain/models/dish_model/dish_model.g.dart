// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      dishId: (json['dishId'] as num).toInt(),
      dishName: json['dishName'] as String,
      dishPrice: (json['dishPrice'] as num).toInt(),
      dishIngredients: json['dishIngredients'] as String,
      dishCookTime: (json['dishCookTime'] as num).toInt(),
      dishImage: json['dishImage'] as String,
      isDishVegetarian: json['isDishVegetarian'] as bool,
      isDishRecommended: json['isDishRecommended'] as bool,
      isDishNew: json['isDishNew'] as bool,
      dishCategory: $enumDecode(_$DishCategoryEnumMap, json['dishCategory']),
      dishCategoriesId: json['dishCategoriesId'] as String,
      isDishFavorite: json['isDishFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'dishId': instance.dishId,
      'dishName': instance.dishName,
      'dishPrice': instance.dishPrice,
      'dishIngredients': instance.dishIngredients,
      'dishCookTime': instance.dishCookTime,
      'dishImage': instance.dishImage,
      'isDishVegetarian': instance.isDishVegetarian,
      'isDishRecommended': instance.isDishRecommended,
      'isDishNew': instance.isDishNew,
      'dishCategory': _$DishCategoryEnumMap[instance.dishCategory]!,
      'dishCategoriesId': instance.dishCategoriesId,
      'isDishFavorite': instance.isDishFavorite,
    };

const _$DishCategoryEnumMap = {
  DishCategory.breakfast: 'breakfast',
  DishCategory.lunch: 'lunch',
  DishCategory.sweet: 'sweet',
  DishCategory.coffee: 'coffee',
  DishCategory.tea: 'tea',
  DishCategory.other: 'other',
};
