class CartItemModel {
  final String productId;
  final String name;
  final String imageUrl;
  final double unitPrice;
  final double rating;
  final int quantity;
  final String? restaurantId;
  final String? restaurantName;

  CartItemModel({
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.unitPrice,
    required this.rating,
    required this.quantity,
    this.restaurantId,
    this.restaurantName,
  });

  double get lineTotal => unitPrice * quantity;

  CartItemModel copyWith({
    String? productId,
    String? name,
    String? imageUrl,
    double? unitPrice,
    double? rating,
    int? quantity,
    String? restaurantId,
    String? restaurantName,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      unitPrice: unitPrice ?? this.unitPrice,
      rating: rating ?? this.rating,
      quantity: quantity ?? this.quantity,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
    );
  }

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'name': name,
    'imageUrl': imageUrl,
    'unitPrice': unitPrice,
    'rating': rating,
    'quantity': quantity,
    'restaurantId': restaurantId,
    'restaurantName': restaurantName,
  };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    productId: json['productId'] as String,
    name: json['name'] as String,
    imageUrl: json['imageUrl'] as String,
    unitPrice: (json['unitPrice'] as num).toDouble(),
    rating: (json['rating'] as num).toDouble(),
    quantity: json['quantity'] as int,
    restaurantId: json['restaurantId'] as String?,
    restaurantName: json['restaurantName'] as String?,
  );
}
