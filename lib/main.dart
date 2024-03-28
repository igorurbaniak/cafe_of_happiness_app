import 'package:cafe_of_happiness_app/app/root_page/root_page.dart';
import 'package:cafe_of_happiness_app/data/data_sources/dishes_data_source/dishes_data_source.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/pages/search_dish_page/cubit/search_dish_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MenuItemCubit(),
        ),
        BlocProvider(
          create: (context) => SearchDishCubit(dishes),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
