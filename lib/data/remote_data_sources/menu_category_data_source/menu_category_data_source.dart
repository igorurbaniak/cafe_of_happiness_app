import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'menu_category_data_source.g.dart';

@injectable  
@RestApi(baseUrl: 'https://my-json-server.typicode.com/igorurbaniak/cafe-of-happines-json')
abstract class MenuCategoryRemoteRetrofitDataSource {
  @factoryMethod
  factory MenuCategoryRemoteRetrofitDataSource(Dio dio) =
      _MenuCategoryRemoteRetrofitDataSource;

  @GET('/menuCategory')
  Future<List<MenuCategoryModel>> getMenuCategory();
}