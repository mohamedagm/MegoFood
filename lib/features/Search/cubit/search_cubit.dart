import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mego_food/core/errors/failures.dart';
import 'package:mego_food/features/Search/repo/search_repo.dart';
import 'package:mego_food/features/Search/result_item_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  searchByKeyword(String keyword) async {
    emit(SearchLoading());
    try {
      List<ResultItemModel> results = await searchRepo.searchByKeyword(keyword);
      emit(SearchSuccess(results));
    } on Failures catch (e) {
      emit(SearchFailure(e.message));
    }
  }
}
