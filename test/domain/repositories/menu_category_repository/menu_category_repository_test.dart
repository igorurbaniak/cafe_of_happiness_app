import 'package:cafe_of_happiness_app/data/remote_data_sources/menu_category_data_source/menu_category_data_source.dart';
import 'package:cafe_of_happiness_app/domain/models/menu_category_model/menu_category_model.dart';
import 'package:cafe_of_happiness_app/domain/repositories/menu_category_repository/menu_category_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMenuCategoryRemoteRetrofitDataSource extends Mock
    implements MenuCategoryRemoteRetrofitDataSource {}

void main() {
  late MenuCategoryRepository sut;
  late MockMenuCategoryRemoteRetrofitDataSource mockMenuCategoryDataSource;

  setUp(() {
    mockMenuCategoryDataSource = MockMenuCategoryRemoteRetrofitDataSource();
    sut = MenuCategoryRepository(
        menuCategoryRemoteDataSource: mockMenuCategoryDataSource);
  });

  tearDown(() {
    reset(mockMenuCategoryDataSource);
  });

  group(
    'getMenuCategories',
    () {
      test(
        'should call menuCategoryRemoteRetrofitDataSource.getMenuCategories() method',
        () async {
          when(() => mockMenuCategoryDataSource.getMenuCategory())
              .thenAnswer((_) async => []);

          await sut.getMenuCategoryModels();

          verify(() => mockMenuCategoryDataSource.getMenuCategory()).called(1);
        },
      );

      test(
        'should return a list of MenuCategoryModel when data is successfully retreived',
        () async {
          final menuCategories = [
            MenuCategoryModel(id: '1', title: 'FOOD'),
            MenuCategoryModel(id: '2', title: 'DRINKS'),
          ];

          when(() => mockMenuCategoryDataSource.getMenuCategory())
              .thenAnswer((_) async => menuCategories);

          final result = await sut.getMenuCategoryModels();

          expect(result, equals(menuCategories));
        },
      );

      test(
        'should return an empty list when no menu categories are avaiable',
        () async {
          when(() => mockMenuCategoryDataSource.getMenuCategory())
              .thenAnswer((_) async => []);

          final result = await sut.getMenuCategoryModels();

          expect(result, isEmpty);
        },
      );

      test(
        'should throw an exception when data source retrieval fails',
        () async {
          when(() => mockMenuCategoryDataSource.getMenuCategory())
              .thenThrow(Exception('Failed to fetch menu categories'));

          expect(() => sut.getMenuCategoryModels(), throwsException);
        },
      );
    },
  );
}