import 'package:dio/dio.dart';

class MenuCategoryRemoteDioDataSource {
  Future<List<Map<String, dynamic>>?> getMenuCategory() async {
    final response = await Dio().get<List<dynamic>>(
        'https://my-json-server.typicode.com/igorurbaniak/cafe-of-happines-json/menuCategory');
    final listDynamic = response.data;

    if (listDynamic == null) {
      return null;
    }
    return listDynamic.map((e) => e as Map<String, dynamic>).toList();
  }
}
