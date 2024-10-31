import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';

class SearchDishesRepository {
  SearchDishesRepository({required this.dishesRemoteDataSource});

  final DishesRemoteRetrofitDataSource dishesRemoteDataSource;

  Future<List<DishModel>> getFilteredDishes(String query) async {
    final allDishes = await dishesRemoteDataSource.getDishes();

    return allDishes
        .where(
            (dish) => dish.dishName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
