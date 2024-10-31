import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/app/core/extensions/extensions.dart';
import 'package:cafe_of_happiness_app/app/custom_widgets/back_appbar.dart';
import 'package:cafe_of_happiness_app/data/remote_data_sources/dishes_remote_data_source/dishes_remote_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/dish_model/dish_model.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/dishes_repository/dishes_repository.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_cubit.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/cubit/dishes_state.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_category_button.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_category_title.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_description.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_header_new_favorite.dart';
import 'package:cafe_of_happiness_app/presentation/features/menu_item/dishes_page/widgets/dish_shimmer_loading.dart';
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
      appBar: BackAppBar(title: menuCategoryModel.title),
      body: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          controller: scrollController,
          child: BlocProvider(
            create: (context) => DishesCubit(
              dishesRepository: DishesRepository(
                dishesRemoteDioDataSource: DishesRemoteDioDataSource(),
              ),
            )..loadDishes(categories: menuCategoryModel.id),
            child: BlocBuilder<DishesCubit, DishesState>(
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return _buildLoadingState(context);
                } else if (state.status == Status.error) {
                  return Center(
                    child: Text(
                      state.errorMessage ??
                          'You encountered an unexpected error.... \ntry again later',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                  );
                }

                final dishes = state.dishes;
                return Column(
                  children: [
                    const DishHeaderNewFavorite(),
                    _buildCategoryButtons(context, categoryKeys, dishes),
                    _buildCategorySections(categoryKeys, dishes),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingState(BuildContext context) {
    return Column(
      children: [
        const DishHeaderNewFavorite(),
        ...List.generate(
          DishCategory.values.length,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Theme.of(context).colorScheme.onPrimaryContainer,
            child: const DishesShimmerLoading(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryButtons(BuildContext context,
      List<GlobalKey> categoryKeys, List<DishModel> dishes) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Row(
          children: DishCategory.values.map((category) {
            final categoryIndex = category.index;
            final categoryDishes =
                dishes.where((dish) => dish.dishCategory == category).toList();

            return categoryDishes.isNotEmpty
                ? Row(
                    children: [
                      DishCategoryButton(
                        categoryTitle: category.title,
                        onTap: () {
                          Scrollable.ensureVisible(
                            categoryKeys[categoryIndex].currentContext!,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                      ),
                      const SizedBox(width: 5),
                    ],
                  )
                : Container();
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCategorySections(
      List<GlobalKey> categoryKeys, List<DishModel> dishes) {
    return Column(
      children: List.generate(
        DishCategory.values.length,
        (index) {
          final category = DishCategory.values[index];
          final categoryDishes =
              dishes.where((dish) => dish.dishCategory == category).toList();

          return categoryDishes.isNotEmpty
              ? Column(
                  children: [
                    DishCategoryTitle(
                      dishCategoryKey: categoryKeys[index],
                      categoryTitle: category.title,
                      categoryTimer: category.timer,
                    ),
                    DishDescription(selectedCategory: category),
                  ],
                )
              : const SizedBox();
        },
      ),
    );
  }
}
