import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mego_food/features/Search/result_item_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  searchByKeyword(String keyword) async {
    emit(SearchLoading());
    try {
      var response = await Dio().get(
        'http://megofood.runasp.net/api/Products/search_product',
        queryParameters: {'keyword': keyword},
      );
      List<ResultItemModel> results = [];
      for (var item in response.data) {
        results.add(ResultItemModel.fromJson(item));
      }

      emit(SearchSuccess(results));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        emit(SearchFailure('No products found.'));
      } else {
        emit(SearchFailure(e.toString()));
      }
    }
  }
}
