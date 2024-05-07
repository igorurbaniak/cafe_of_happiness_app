import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart';
import 'package:cafe_of_happiness_app/domain/repositories/menu_category_repository/menu_category_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/home_menu_category/cubit/home_menu_category_cubit_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/home/home_page/widgets/menu_category_item.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/menu_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMenuCategory extends StatelessWidget {
  const HomeMenuCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  thickness: 1.5,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'MENU:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Divider(
                  color: Colors.black12,
                  thickness: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          BlocProvider(
            create: (context) => MenuCategoryCubit(
              menuCategoryRepository: MenuCategoryRepository(
                menuCategoryRemoteDioDataSource:
                    MenuCategoryRemoteDioDataSource(),
              ),
            )..loadMenuCategories(),
            child: BlocBuilder<MenuCategoryCubit, MenuCategoryState>(
              builder: (context, state) {
                switch (state.status) {
                  case Status.initial:
                    return const Center(
                      child: Text('Initial state'),
                    );
                  case Status.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.success:
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.menuCategories.length,
                      itemBuilder: (ctx, index) {
                        final menuCategory = state.menuCategories[index];
                        return MenuCategoryItem(
                          menuCategoryModel: menuCategory,
                          onSelectCategory: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => MenuItemPage(
                                  menuCategoryModel: menuCategory,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    );
                  case Status.error:
                    return Center(
                      child: Text(
                        state.errorMessage ?? 'Unknown error',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
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
