import 'package:cafe_of_happiness_app/data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:injectable/injectable.dart';

@injectable  
class MenuCategoryRepository {
  MenuCategoryRepository({required this.menuCategoryRemoteDataSource});

  final MenuCategoryRemoteRetrofitDataSource menuCategoryRemoteDataSource;

  Future<List<MenuCategoryModel>> getMenuCategoryModels() async {
    return menuCategoryRemoteDataSource.getMenuCategory();
  }
}