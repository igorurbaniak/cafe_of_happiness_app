import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'DishModel',
    () {
      test(
        'should support equality comparison',
        () {
          final dish1 = DishModel(
            dishId: 1,
            dishName: 'Hamburger',
            dishPrice: 10,
            dishIngredients: 'Beef, cheese, bun',
            dishCookTime: 15,
            dishImage: 'burger.jpg',
            isDishVegetarian: false,
            isDishRecommended: true,
            isDishNew: true,
            dishCategory: DishCategory.lunch,
            dishCategoriesId: '12',
          );

          final dish2 = DishModel(
            dishId: 1,
            dishName: 'Hamburger',
            dishPrice: 10,
            dishIngredients: 'Beef, cheese, bun',
            dishCookTime: 15,
            dishImage: 'burger.jpg',
            isDishVegetarian: false,
            isDishRecommended: true,
            isDishNew: true,
            dishCategory: DishCategory.lunch,
            dishCategoriesId: '12',
          );

          expect(dish1, equals(dish2));
        },
      );

      test(
        'should convert to and from JSON correctly',
        () {
          final dish = DishModel(
            dishId: 1,
            dishName: 'Hamburger',
            dishPrice: 10,
            dishIngredients: 'Beef, cheese, bun',
            dishCookTime: 15,
            dishImage: 'burger.jpg',
            isDishVegetarian: false,
            isDishRecommended: true,
            isDishNew: true,
            dishCategory: DishCategory.lunch,
            dishCategoriesId: '12',
          );

          final dishJson = dish.toJson();
          final expectedJson = {
            'dishId': 1,
            'dishName': 'Hamburger',
            'dishPrice': 10,
            'dishIngredients': 'Beef, cheese, bun',
            'dishCookTime': 15,
            'dishImage': 'burger.jpg',
            'isDishVegetarian': false,
            'isDishRecommended': true,
            'isDishNew': true,
            'dishCategory': 'lunch',
            'dishCategoriesId': '12',
            'isDishFavorite': false,
          };

          expect(dishJson, equals(expectedJson));

          final dishFromJson = DishModel.fromJson(dishJson);

          expect(dishFromJson, equals(dish));
        },
      );
      test(
        'should have correct default value for isDishFavorite',
        () {
          final dish = DishModel(
            dishId: 1,
            dishName: 'Hamburger',
            dishPrice: 10,
            dishIngredients: 'Beef, cheese, bun',
            dishCookTime: 15,
            dishImage: 'burger.jpg',
            isDishVegetarian: false,
            isDishRecommended: true,
            isDishNew: true,
            dishCategory: DishCategory.lunch,
            dishCategoriesId: '12',
          );

          expect(dish.isDishFavorite, isFalse);
        },
      );
    },
  );
}
