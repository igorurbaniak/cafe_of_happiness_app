class MenuCategoryModel {
  MenuCategoryModel({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;

  MenuCategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'];
}
