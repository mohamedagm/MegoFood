class RestaurantModel {
  final String id;
  final String name;
  final String description;
  final double rating;
  final String baseCatgoryId;
  final String? imageUrl;
  final int? deliveryTimeMinutes;
  final double? distanceKm;
  final double? deliveryFee;
  final bool isOpen;
  final bool hasOffer;
  final String? offerText;
  final List<String> categories;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.baseCatgoryId,
    this.imageUrl,
    this.deliveryTimeMinutes,
    this.distanceKm,
    this.deliveryFee,
    this.isOpen = true,
    this.hasOffer = false,
    this.offerText,
    this.categories = const [],
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      baseCatgoryId: json['baseCatgoryId'] as String? ?? '',
      imageUrl: json['imageUrl'] as String?,
      deliveryTimeMinutes: (json['deliveryTimeMinutes'] as num?)?.toInt(),
      distanceKm: (json['distanceKm'] as num?)?.toDouble(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      isOpen: json['isOpen'] as bool? ?? true,
      hasOffer: json['hasOffer'] as bool? ?? false,
      offerText: json['offerText'] as String?,
      categories:
          (json['categories'] as List?)?.map((item) => '$item').toList() ??
          const [],
    );
  }
}
