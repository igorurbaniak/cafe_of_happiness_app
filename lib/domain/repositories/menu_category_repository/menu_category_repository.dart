import 'package:cafe_of_happiness_app/data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';

class MenuCategoryRepository {
  MenuCategoryRepository({required this.menuCategoryRemoteDioDataSource});

  final MenuCategoryRemoteDioDataSource menuCategoryRemoteDioDataSource;

  Future<List<MenuCategoryModel>> getMenuCategoryModels() async {
    final json = await menuCategoryRemoteDioDataSource.getMenuCategory();
    if (json == null) {
      return [];
    }
    return json.map((item) => MenuCategoryModel.fromJson(item)).toList();
  }
}