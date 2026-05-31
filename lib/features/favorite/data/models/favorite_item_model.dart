import 'package:mego_food/features/home/data/model/product_model.dart';

class FavoriteItemModel {
  final String productId;
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;

  const FavoriteItemModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  factory FavoriteItemModel.fromProduct(ProductModel product) {
    return FavoriteItemModel(
      productId: product.id,
      name: product.name,
      description: product.description,
      imageUrl: product.imageUrl,
      price: product.price,
      rating: product.rating,
    );
  }

  ProductModel toProduct() {
    return ProductModel(
      id: productId,
      name: name,
      description: description,
      imageUrl: imageUrl,
      price: price,
      rating: rating,
    );
  }

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
    'price': price,
    'rating': rating,
  };

  factory FavoriteItemModel.fromJson(Map<String, dynamic> json) {
    return FavoriteItemModel(
      productId: json['productId'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
    );
  }
}
