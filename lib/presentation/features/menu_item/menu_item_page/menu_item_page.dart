import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/core/extensions/extensions.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/dishes_repository/dishes_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/cubit/menu_item_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_category_title.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_discription.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_header_new_favorite.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/menu_item_page/widgets/dish_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class MenuItemPage extends StatelessWidget {
  const MenuItemPage({
    super.key,
    required this.menuCategoryModel,
  });

  final MenuCategoryModel menuCategoryModel;

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final List<GlobalKey> categoryKeys = List.generate(
      DishCategory.values.length,
      (_) => GlobalKey(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(menuCategoryModel.title),
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: BlocProvider(
          create: (context) => MenuItemCubit(
            dishesRepository: DishesRepository(
              dishesRemoteDioDataSource: DishesRemoteDioDataSource(),
            ),
          )..loadDishes(
              categories: menuCategoryModel.id,
            ),
          child: BlocBuilder<MenuItemCubit, MenuItemState>(
            builder: (context, state) {
              final dishes = state.dishes;
              final overallFavorites = state.favoriteDishIds.length;
              final menuItemCubit = context.read<MenuItemCubit>();
              final newDishes = menuItemCubit.getNewDishes();
              final favoriteDishes = menuItemCubit.getFavoriteDishes();
              return Column(
                children: [
                  DishHeaderNewFavorite(
                    newDishes: newDishes,
                    favoriteDishes: favoriteDishes,
                    overallFavorites: overallFavorites,
                  ),
                  if (state.status == Status.initial)
                    const Center(
                      child: Text('Please wait, loading in progess...'),
                    ),
                  if (state.status == Status.loading)
                    ...List.generate(
                      DishCategory.values.length,
                      (index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: const DishShimmerLoading(),
                      ),
                    ),
                  if (state.status == Status.success)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              ...DishCategory.values.map(
                                (category) {
                                  final categoryIndex = category.index;
                                  final categoryDishes = dishes
                                      .where((dish) =>
                                          dish.dishCategory == category)
                                      .toList();

                                  return categoryDishes.isNotEmpty
                                      ? Row(
                                          children: [
                                            DishCategoryButton(
                                              categoryTitle: category.title,
                                              onTap: () {
                                                Scrollable.ensureVisible(
                                                  categoryKeys[categoryIndex]
                                                      .currentContext!,
                                                  duration: const Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                            ),
                                            const SizedBox(width: 5),
                                          ],
                                        )
                                      : Container();
                                },
                              ),
                            ],
                          ),
                        ),
                        ...List.generate(
                          DishCategory.values.length,
                          (index) {
                            final category = DishCategory.values[index];
                            final categoryDishes = dishes
                                .where((dish) => dish.dishCategory == category)
                                .toList();

                            if (categoryDishes.isNotEmpty) {
                              return Column(
                                children: [
                                  DishCategoryTitle(
                                    dishCategoryKey: categoryKeys[index],
                                    categoryTitle: category.title,
                                    categoryTimer: category.timer,
                                  ),
                                  DishDiscription(
                                    dishes: categoryDishes,
                                  ),
                                ],
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                      ],
                    ),
                  if (state.status == Status.error)
                    Center(
                      child: Text(
                        state.errorMessage ?? 'Unknown error',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}