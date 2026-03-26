import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/home/data/model/base_category_model.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';

class HomeRepo {
  final DioConsumer dioConsumer;

  HomeRepo(this.dioConsumer);

  Future<Either<Failures, List<BaseCategoryModel>>> getBaseCategories() async {
    try {
      final response = await dioConsumer.get(ApiEndPoints.getAllBaseCategories);
      final List<BaseCategoryModel> baseCategories = [];
      for (var category in response.data['items']) {
        baseCategories.add(BaseCategoryModel.fromJson(category));
      }
      return right(baseCategories);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(Failures("Unauthorized."));
      } else {
        return left(Failures('Something went wrong.'));
      }
    }
  }

  Future<Either<Failures, List<ProductModel>>> getTopPicks() async {
    try {
      final response = await dioConsumer.get(
        ApiEndPoints.getProductsByCategory,
        queryParameters: {'TopRaing': true},
      );
      final List<ProductModel> topRatedProducts = [];
      for (var product in response.data['items']) {
        topRatedProducts.add(ProductModel.fromJson(product));
      }
      return right(topRatedProducts);
    } on DioException catch (_) {
      return left(Failures('Something went wrong.'));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }

  Future<Either<Failures, List<RestaurantModel>>> getTopStores() async {
    try {
      final response = await dioConsumer.get(
        ApiEndPoints.getRestaurantesByBaseCategoryId,
        queryParameters: {'TopRaing': true},
      );
      final List<RestaurantModel> topRatedRestaurants = [];
      for (var product in response.data['items']) {
        topRatedRestaurants.add(RestaurantModel.fromJson(product));
      }
      return right(topRatedRestaurants);
    } on DioException catch (_) {
      return left(Failures('Something went wrong.'));
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }
}
