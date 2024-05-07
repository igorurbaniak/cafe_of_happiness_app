import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/menu_category_repository/menu_category_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'home_menu_category_cubit_state.dart';

class MenuCategoryCubit extends Cubit<MenuCategoryState> {
  MenuCategoryCubit({required this.menuCategoryRepository})
      : super(const MenuCategoryState());

  final MenuCategoryRepository menuCategoryRepository;

  Future<void> loadMenuCategories() async {
    emit(
      const MenuCategoryState(
        status: Status.loading,
      ),
    );

    try {
      final menuCategoryModel =
          await menuCategoryRepository.getMenuCategoryModels();
      emit(
        MenuCategoryState(
          status: Status.success,
          menuCategories: menuCategoryModel,
        ),
      );
    } catch (error) {
      emit(
        MenuCategoryState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
