import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/app/utils/constants_utils.dart';
import 'package:hive/hive.dart';

class DishesRepository {
  DishesRepository({required this.dishesRemoteDataSource});

  final DishesRemoteRetrofitDataSource dishesRemoteDataSource;

  Future<List<DishModel>> getAllDishes(String categories) async {
    final allDishes = await dishesRemoteDataSource.getDishes();
    return allDishes
        .where((dish) => dish.dishCategoriesId == categories)
        .toList();
  }

  Future<List<int>> getFavoriteDishIds() async {
    final box = await Hive.openBox<int>(favoritesBox);
    return box.values.toList();
  }

  Future<void> toggleFavorite(int dishId) async {
    final box = await Hive.openBox<int>(favoritesBox);
    if (box.containsKey(dishId)) {
      box.delete(dishId);
    } else {
      box.put(dishId, dishId);
    }
  }
}
