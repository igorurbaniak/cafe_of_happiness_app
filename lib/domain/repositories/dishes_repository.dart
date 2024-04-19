import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';

class DishesRepository {
  DishesRepository({required this.dishesRemoteDioDataSource});

  final DishesRemoteDioDataSource dishesRemoteDioDataSource;

  Future<List<DishModel>> getDishesModels() async {
    final json = await dishesRemoteDioDataSource.getDishes();
    if (json == null) {
      return [];
    }
    return json.map((item) => DishModel.fromJson(item)).toList();
  }
}
