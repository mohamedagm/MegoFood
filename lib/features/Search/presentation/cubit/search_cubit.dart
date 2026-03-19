import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mego_food/features/Search/data/repo/search_repo.dart';
import 'package:mego_food/features/Search/data/models/result_item_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  searchByKeyword(String keyword) async {
    emit(SearchLoading());
    final results = await searchRepo.searchByKeyword(keyword);
    results.fold(
      (failure) => emit(SearchFailure(failure.message)),
      (results) => emit(SearchSuccess(results)),
    );
  }
}
