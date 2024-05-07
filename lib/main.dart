import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/app/root_page/root_page.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/repositories/dishes_repository/dishes_repository.dart';
import 'package:cafe_of_happiness_app/domain/repositories/search_repository/search_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuItemCubit(
            dishesRepository: DishesRepository(
              dishesRemoteDioDataSource: DishesRemoteDioDataSource(),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => SearchDishCubit(
            searchDishesRepository: SearchDishesRepository(
              dishesRemoteDioDataSource: DishesRemoteDioDataSource(),
            )
          ),
        ),
        BlocProvider(
          create: (context) => RootCubit()..start(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
