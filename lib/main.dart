import 'package:cafe_of_happiness_app/app/core/di/injection_container.dart';
import 'package:cafe_of_happiness_app/app/core/themes/cubit/theme_cubit.dart';
import 'package:cafe_of_happiness_app/app/root_page/cubit/root_cubit.dart';
import 'package:cafe_of_happiness_app/app/root_page/root_page.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model_hive_adapter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DishModelAdapter());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) 
          => getIt<RootCubit>()..start(),
        ),
        BlocProvider(
          create: (context) => getIt<SearchDishCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<DishesCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}