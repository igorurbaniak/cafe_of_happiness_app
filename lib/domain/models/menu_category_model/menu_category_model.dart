import 'package:json_annotation/json_annotation.dart';

part 'menu_category_model.g.dart';

@JsonSerializable()
class MenuCategoryModel {
  MenuCategoryModel({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  factory MenuCategoryModel.fromJson(Map<String, dynamic> json) => _$MenuCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$MenuCategoryModelToJson(this);
}
