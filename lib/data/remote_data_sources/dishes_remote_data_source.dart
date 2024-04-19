import 'package:dio/dio.dart';

class DishesRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getDishes() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/igorurbaniak/cafe-of-happines-json/dishes');
    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
