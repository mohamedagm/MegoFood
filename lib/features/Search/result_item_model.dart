class ResultItemModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  ResultItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
  factory ResultItemModel.fromJson(Map<String, dynamic> json) {
    return ResultItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }
}
