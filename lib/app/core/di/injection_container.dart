import 'package:cafe_of_happiness_app/app/core/di/injection_container.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;  
  
@InjectableInit()  
void configureDependencies() => $initGetIt(getIt);   

@module  
abstract class RegisterModule {  
  @Named("BaseUrl")  
  String get baseUrl => 'https://my-json-server.typicode.com/igorurbaniak/cafe-of-happines-json';  
  
  @lazySingleton  
  Dio dio(@Named('BaseUrl') String url) => Dio(BaseOptions(baseUrl: url));  
}