import 'package:cafe_of_happiness_app/app/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../domain/models/dish_model/dish_model.dart';

part 'dishes_state.freezed.dart';

@freezed
class DishesState with _$DishesState {
  const factory DishesState({
    @Default([]) List<DishModel> dishes,
    @Default([]) List<DishModel> newDishes,
    @Default([]) List<DishModel> favoriteDishes,
    @Default({}) Map<int, int> favoriteCounts,
    @Default([]) List<int> favoriteDishIds,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _DishesState;
}
