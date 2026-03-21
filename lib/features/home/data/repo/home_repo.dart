import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/api_end_points.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/home/data/model/base_category_model.dart';

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
}
