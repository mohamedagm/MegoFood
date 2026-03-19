import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mego_food/core/api/dio_consumer.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/Search/data/models/result_item_model.dart';

class SearchRepo {
  final DioConsumer dioConsumer;

  SearchRepo(this.dioConsumer);
  Future<Either<Failures, List<ResultItemModel>>> searchByKeyword(
    String keyword,
  ) async {
    try {
      var response = await dioConsumer.get(
        'http://megofood.runasp.net/api/Products/search_product',
        queryParameters: {'keyword': keyword},
      );
      List<ResultItemModel> results = [];
      results = response.data
          .map<ResultItemModel>((item) => ResultItemModel.fromJson(item))
          .toList();

      return right(results);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return left(Failures("No products found."));
      } else {
        return left(Failures('Something went wrong.'));
      }
    }
  }
}
