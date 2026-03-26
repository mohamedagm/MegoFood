class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final double rating;
  final String baseCatgoryId;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.baseCatgoryId,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      rating: json['rating'] as double,
      baseCatgoryId: json['baseCatgoryId'] as String,
    );
  }
}
