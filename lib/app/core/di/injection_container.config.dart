// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart'
    as _i7;
import '../../../data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart'
    as _i9;
import '../../../domain/repositories/auth_google_repository/auth_google_sign_in_repository.dart'
    as _i3;
import '../../../domain/repositories/auth_repository/auth_repository.dart'
    as _i4;
import '../../../domain/repositories/dishes_repository/dishes_repository.dart'
    as _i8;
import '../../../domain/repositories/menu_category_repository/menu_category_repository.dart'
    as _i10;
import '../../../domain/repositories/search_repository/search_repository.dart'
    as _i11;
import '../../../presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart'
    as _i14;
import '../../../presentation/features/home/home_page/widgets/home_menu_category/cubit/home_menu_category_cubit_cubit.dart'
    as _i13;
import '../../../presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart'
    as _i12;
import '../../root_page/cubit/root_cubit.dart' as _i5;
import 'injection_container.dart'
    as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.AuthGoogleSignInRepository>(
      () => _i3.AuthGoogleSignInRepository());
  gh.factory<_i4.AuthRepository>(() => _i4.AuthRepository());
  gh.factory<_i5.RootCubit>(() => _i5.RootCubit(
        authRepository: get<_i4.AuthRepository>(),
        authGoogleSignInRepository: get<_i3.AuthGoogleSignInRepository>(),
      ));
  gh.factory<String>(
    () => registerModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i6.Dio>(
      () => registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i7.DishesRemoteRetrofitDataSource>(
      () => _i7.DishesRemoteRetrofitDataSource(get<_i6.Dio>()));
  gh.factory<_i8.DishesRepository>(() => _i8.DishesRepository(
      dishesRemoteDataSource: get<_i7.DishesRemoteRetrofitDataSource>()));
  gh.factory<_i9.MenuCategoryRemoteRetrofitDataSource>(
      () => _i9.MenuCategoryRemoteRetrofitDataSource(get<_i6.Dio>()));
  gh.factory<_i10.MenuCategoryRepository>(() => _i10.MenuCategoryRepository(
      menuCategoryRemoteDataSource:
          get<_i9.MenuCategoryRemoteRetrofitDataSource>()));
  gh.factory<_i11.SearchDishesRepository>(() => _i11.SearchDishesRepository(
      dishesRemoteDataSource: get<_i7.DishesRemoteRetrofitDataSource>()));
  gh.factory<_i12.DishesCubit>(
      () => _i12.DishesCubit(dishesRepository: get<_i8.DishesRepository>()));
  gh.factory<_i13.MenuCategoryCubit>(() => _i13.MenuCategoryCubit(
      menuCategoryRepository: get<_i10.MenuCategoryRepository>()));
  gh.factory<_i14.SearchDishCubit>(() => _i14.SearchDishCubit(
      searchDishesRepository: get<_i11.SearchDishesRepository>()));
  return get;
}

class _$RegisterModule extends _i15.RegisterModule {}
