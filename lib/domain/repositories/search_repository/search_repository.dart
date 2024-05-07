import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';

class SearchDishesRepository {
  SearchDishesRepository({required this.dishesRemoteDioDataSource});

  final DishesRemoteDioDataSource dishesRemoteDioDataSource;

  Future<List<DishModel>> getFilteredDishes(String query) async {
    final json = await dishesRemoteDioDataSource.getDishes();
    if (json == null) {
      return [];
    }

    final allDishes = json.map((item) => DishModel.fromJson(item)).toList();
    return allDishes
        .where(
            (dish) => dish.dishName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

