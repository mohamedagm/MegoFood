class BaseCategoryModel {
  String id;
  String name;
  String description;

  BaseCategoryModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory BaseCategoryModel.fromJson(Map<String, dynamic> json) {
    return BaseCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
