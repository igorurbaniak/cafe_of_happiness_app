import 'package:hive/hive.dart';

part 'generated/dish_model_hive_adapter.g.dart';

@HiveType(typeId: 0)
class HiveDishModel extends HiveObject {
  @HiveField(0)
  final int dishId;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final bool isDishFavorite;

  @HiveField(3)
  final bool isDishNew;

  HiveDishModel({
    required this.dishId,
    required this.name,
    this.isDishFavorite = false,
    this.isDishNew = false,
  });

  HiveDishModel copyWith({
    int? dishId,
    String? name,
    bool? isDishFavorite,
    bool? isDishNew,
  }) {
    return HiveDishModel(
      dishId: dishId ?? this.dishId,
      name: name ?? this.name,
      isDishFavorite: isDishFavorite ?? this.isDishFavorite,
      isDishNew: isDishNew ?? this.isDishNew,
    );
  }
}
