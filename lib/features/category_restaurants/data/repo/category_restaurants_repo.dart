import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';

class CategoryRestaurantsRepo {
  final DioConsumer dioConsumer;

  CategoryRestaurantsRepo(this.dioConsumer);

  Future<Either<Failures, List<RestaurantModel>>> getRestaurantsByCategory(
    String categoryId,
  ) async {
    try {
      final response = await dioConsumer.get(
        ApiEndPoints.getRestaurantesByBaseCategoryId,
        queryParameters: {'BaseCategoryId': categoryId},
      );
      final List<RestaurantModel> restaurants = [];
      for (var restaurant in response.data['items']) {
        restaurants.add(RestaurantModel.fromJson(restaurant));
      }
      return right(restaurants);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return left(Failures("Unauthorized."));
      } else {
        return left(Failures('Something went wrong.'));
      }
    } catch (e) {
      return left(Failures(e.toString()));
    }
  }
}


