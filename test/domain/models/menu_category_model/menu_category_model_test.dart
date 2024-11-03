import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'MenuCategoryModel',
    () {
      test(
        'supports value equality',
        () {
          final category1 = MenuCategoryModel(id: '1', title: 'FOOD');
          final category2 = MenuCategoryModel(id: '1', title: 'FOOD');

          expect(category1, category2);

          expect(category1, equals(category2));
          expect(category1.hashCode, equals(category2.hashCode));
        },
      );

      test(
        'can be serialized and deserialized from JSON',
        () {
          final json = {
            'id': '1',
            'title': 'FOOD',
          };

          final modelFromJson = MenuCategoryModel.fromJson(json);

          expect(modelFromJson.id, '1');
          expect(modelFromJson.title, 'FOOD');

          final modelToJson = modelFromJson.toJson();

          expect(modelToJson, equals(json));
        },
      );

      test(
        'throws an error when required fields are missing',
        () {
          expect(() => MenuCategoryModel.fromJson({'id': '1'}),
              throwsA(isA<TypeError>()));
        },
      );
    },
  );
}