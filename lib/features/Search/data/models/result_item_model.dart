import 'package:mego_food/features/home/data/model/product_model.dart';

class ResultItemModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;

  ResultItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
  factory ResultItemModel.fromJson(Map<String, dynamic> json) {
    return ResultItemModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );
  }

  ProductModel toProductModel() {
    return ProductModel(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
    );
  }
}
