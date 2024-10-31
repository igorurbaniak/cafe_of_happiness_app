import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart';
import 'package:cafe_of_happiness_app/domain/repositories/menu_category_repository/menu_category_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/cubit/home_menu_category_cubit_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/widgets/home_menu_category_list.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/widgets/home_menu_header.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/widgets/home_menu_shimmer_loading.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMenuCategory extends StatelessWidget {
  const HomeMenuCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: Column(
        children: [
          const HomeMenuHeader(),
          const SizedBox(height: 10),
          BlocProvider(
            create: (context) => MenuCategoryCubit(
              menuCategoryRepository: MenuCategoryRepository(
                menuCategoryRemoteDataSource:
                    MenuCategoryRemoteRetrofitDataSource(Dio()),
              ),
            )..loadMenuCategories(),
            child: BlocBuilder<MenuCategoryCubit, MenuCategoryState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return Center(
                      child: Text(
                        'Please wait, loading in progress...',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  case Status.loading:
                    return const HomeMenuShimmerLoading();
                  case Status.success:
                    return HomeMenuCategoryList(
                        menuCategories: state.menuCategories);
                  case Status.error:
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Unknown error',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
