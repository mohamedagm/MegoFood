import 'package:equatable/equatable.dart';
import 'package:mego_food/features/home/data/model/base_category_model.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';

enum RequestStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final RequestStatus categoriesStatus;
  final List<BaseCategoryModel> categories;
  final String? categoriesError;
  final RequestStatus topRatedProductsStatus;
  final List<ProductModel> topRatedProducts;
  final String? topRatedProductsError;

  const HomeState({
    this.categoriesStatus = RequestStatus.initial,
    this.categories = const [],
    this.categoriesError,
    this.topRatedProductsStatus = RequestStatus.initial,
    this.topRatedProducts = const [],
    this.topRatedProductsError,
  });
  HomeState copyWith({
    RequestStatus? categoriesStatus,
    List<BaseCategoryModel>? categories,
    String? categoriesError,
    RequestStatus? topRatedProductsStatus,
    List<ProductModel>? topRatedProducts,
    String? topRatedProductsError,
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
  ];
}
