import 'package:dio/dio.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/Search/result_item_model.dart';

class SearchRepo {
  Future<List<ResultItemModel>> searchByKeyword(String keyword) async {
    try {
      var response = await Dio().get(
        'http://megofood.runasp.net/api/Products/search_product',
        queryParameters: {'keyword': keyword},
      );
      List<ResultItemModel> results = [];
      for (var item in response.data) {
        results.add(ResultItemModel.fromJson(item));
      }
      return results;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Failures("No products found.");
      } else {
        throw Failures('Something went wrong.');
      }
    }
  }
}
