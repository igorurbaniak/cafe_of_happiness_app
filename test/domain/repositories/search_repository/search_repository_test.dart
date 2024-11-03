import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/search_repository/search_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDishesRemoteRetrofitDataSource extends Mock
    implements DishesRemoteRetrofitDataSource {}

void main() {
  late SearchDishesRepository sut;
  late MockDishesRemoteRetrofitDataSource mockDishesDataSource;

  setUp(() {
    mockDishesDataSource = MockDishesRemoteRetrofitDataSource();
    sut = SearchDishesRepository(dishesRemoteDataSource: mockDishesDataSource);
  });

  tearDown(() {
    reset(mockDishesDataSource);
  });

  group('getFilteredDishes', () {
    const dishNameQuery = 'dishName1';

    test('should call dishesRemoteDataSource.getDishes() method', () async {
      when(() => mockDishesDataSource.getDishes()).thenAnswer((_) async => []);
      await sut.getFilteredDishes(dishNameQuery);
      verify(() => mockDishesDataSource.getDishes()).called(1);
    });

    test('should return only dishes that match the query', () async {
      when(() => mockDishesDataSource.getDishes()).thenAnswer((_) async => [
            DishModel(
              dishId: 1,
              dishName: 'dishName1',
              dishPrice: 1,
              dishIngredients: 'dishIngredients1',
              dishCookTime: 1,
              dishImage: 'dishImage1',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId1',
              isDishFavorite: true,
            ),
            DishModel(
              dishId: 2,
              dishName: 'otherDish',
              dishPrice: 2,
              dishIngredients: 'dishIngredients2',
              dishCookTime: 2,
              dishImage: 'dishImage2',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId2',
              isDishFavorite: true,
            ),
            DishModel(
              dishId: 3,
              dishName: 'dishName1 special',
              dishPrice: 3,
              dishIngredients: 'dishIngredients3',
              dishCookTime: 3,
              dishImage: 'dishImage3',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId3',
              isDishFavorite: true,
            ),
          ]);

      final result = await sut.getFilteredDishes(dishNameQuery);

      expect(result, [
        DishModel(
          dishId: 1,
          dishName: 'dishName1',
          dishPrice: 1,
          dishIngredients: 'dishIngredients1',
          dishCookTime: 1,
          dishImage: 'dishImage1',
          isDishVegetarian: true,
          isDishRecommended: true,
          isDishNew: true,
          dishCategory: DishCategory.breakfast,
          dishCategoriesId: 'dishCategoriesId1',
          isDishFavorite: true,
        ),
        DishModel(
          dishId: 3,
          dishName: 'dishName1 special',
          dishPrice: 3,
          dishIngredients: 'dishIngredients3',
          dishCookTime: 3,
          dishImage: 'dishImage3',
          isDishVegetarian: true,
          isDishRecommended: true,
          isDishNew: true,
          dishCategory: DishCategory.breakfast,
          dishCategoriesId: 'dishCategoriesId3',
          isDishFavorite: true,
        ),
      ]);

      verify(() => mockDishesDataSource.getDishes()).called(1);
    });

    test('should return an empty list when no dishes match the query',
        () async {
      when(() => mockDishesDataSource.getDishes()).thenAnswer((_) async => [
            DishModel(
              dishId: 1,
              dishName: 'anotherDish',
              dishPrice: 1,
              dishIngredients: 'dishIngredients1',
              dishCookTime: 1,
              dishImage: 'dishImage1',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId1',
              isDishFavorite: true,
            ),
          ]);

      final result = await sut.getFilteredDishes(dishNameQuery);

      expect(result, isEmpty);

      verify(() => mockDishesDataSource.getDishes()).called(1);
    });

    test('should filter dishes in a case-insensitive manner', () async {
      when(() => mockDishesDataSource.getDishes()).thenAnswer((_) async => [
            DishModel(
              dishId: 1,
              dishName: 'DishName1',
              dishPrice: 1,
              dishIngredients: 'dishIngredients1',
              dishCookTime: 1,
              dishImage: 'dishImage1',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId1',
              isDishFavorite: true,
            ),
            DishModel(
              dishId: 2,
              dishName: 'dishname1',
              dishPrice: 2,
              dishIngredients: 'dishIngredients2',
              dishCookTime: 2,
              dishImage: 'dishImage2',
              isDishVegetarian: true,
              isDishRecommended: true,
              isDishNew: true,
              dishCategory: DishCategory.breakfast,
              dishCategoriesId: 'dishCategoriesId2',
              isDishFavorite: true,
            ),
          ]);

      final result = await sut.getFilteredDishes('DISHNAME1');

      expect(result.length, 2);
    });

    test('should throw an error if dishesRemoteDataSource.getDishes() fails',
        () async {
      when(() => mockDishesDataSource.getDishes())
          .thenThrow(Exception('Failed to fetch dishes'));

      expect(() => sut.getFilteredDishes(dishNameQuery), throwsException);
    });
  });
}