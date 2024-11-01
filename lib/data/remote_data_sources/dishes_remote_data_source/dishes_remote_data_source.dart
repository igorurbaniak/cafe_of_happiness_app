import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dishes_remote_data_source.g.dart';

@injectable  
@RestApi(baseUrl: 'https://my-json-server.typicode.com/igorurbaniak/cafe-of-happines-json')
abstract class DishesRemoteRetrofitDataSource {
  @factoryMethod
  factory DishesRemoteRetrofitDataSource(Dio dio) =
      _DishesRemoteRetrofitDataSource;

  @GET('/dishes')
  Future<List<DishModel>> getDishes();
}