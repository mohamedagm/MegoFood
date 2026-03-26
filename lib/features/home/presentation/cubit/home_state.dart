import 'package:equatable/equatable.dart';
import 'package:mego_food/features/home/data/model/base_category_model.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';

enum RequestStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final RequestStatus categoriesStatus;
  final List<BaseCategoryModel> categories;
  final String? categoriesError;
  final RequestStatus topRatedProductsStatus;
  final List<ProductModel> topRatedProducts;
  final String? topRatedProductsError;

  final RequestStatus topRatedRestaurantsStatus;
  final List<RestaurantModel> topRatedRestaurants;
  final String? topRatedRestaurantsError;

  const HomeState({
    this.categoriesStatus = RequestStatus.initial,
    this.categories = const [],
    this.categoriesError,
    this.topRatedProductsStatus = RequestStatus.initial,
    this.topRatedProducts = const [],
    this.topRatedProductsError,
    this.topRatedRestaurantsStatus = RequestStatus.initial,
    this.topRatedRestaurants = const [],
    this.topRatedRestaurantsError,
  });
  HomeState copyWith({
    RequestStatus? categoriesStatus,
    List<BaseCategoryModel>? categories,
    String? categoriesError,
    RequestStatus? topRatedProductsStatus,
    List<ProductModel>? topRatedProducts,
    String? topRatedProductsError,
    RequestStatus? topRatedRestaurantsStatus,
    List<RestaurantModel>? topRatedRestaurants,
    String? topRatedRestaurantsError,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesError: categoriesError ?? this.categoriesError,

      topRatedProductsStatus:
          topRatedProductsStatus ?? this.topRatedProductsStatus,
      topRatedProducts: topRatedProducts ?? this.topRatedProducts,
      topRatedProductsError:
          topRatedProductsError ?? this.topRatedProductsError,

      topRatedRestaurantsStatus:
          topRatedRestaurantsStatus ?? this.topRatedRestaurantsStatus,
      topRatedRestaurants: topRatedRestaurants ?? this.topRatedRestaurants,
      topRatedRestaurantsError:
          topRatedRestaurantsError ?? this.topRatedRestaurantsError,
    );
  }

  @override
  List<Object?> get props => [
    categoriesStatus,
    categories,
    categoriesError,
    topRatedProductsStatus,
    topRatedProducts,
    topRatedProductsError,
    topRatedRestaurantsStatus,
    topRatedRestaurants,
    topRatedRestaurantsError,
  ];
}
