import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_category_model.freezed.dart';
part 'menu_category_model.g.dart';

@freezed
class MenuCategoryModel with _$MenuCategoryModel {
  factory MenuCategoryModel({
    required String id,
    required String title,
  }) = _MenuCategoryModel;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$MenuCategoryModelFromJson(json);
}