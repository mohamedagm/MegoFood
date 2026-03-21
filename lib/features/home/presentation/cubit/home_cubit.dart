import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/home/data/repo/home_repo.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(const HomeState());

  Future<void> getBaseCategories() async {
    // instead of emit(loading state)
    // that cant assign to more than one endpoint in the same Screen
    // every time we can use Copywith to handle this problem
    // each endpoint has its own state and error and data (that handle by copywith)
    // So We have Only State for the whole Screen but we can handle it by copywith for assign to each endpoint
    emit(state.copyWith(categoriesStatus: RequestStatus.loading));

    final result = await repo.getBaseCategories();

    result.fold(
      (failure) => emit(
        state.copyWith(
          categoriesStatus: RequestStatus.failure,
          categoriesError: failure.message,
        ),
      ),
      (categories) => emit(
        state.copyWith(
          categoriesStatus: RequestStatus.success,
          categories: categories,
        ),
      ),
    );
  }
}
