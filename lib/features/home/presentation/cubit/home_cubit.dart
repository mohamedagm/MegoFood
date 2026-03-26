import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/home/data/repo/home_repo.dart';
import 'package:mego_food/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(const HomeState());

  Future<void> getBaseCategories() async {
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

  Future<void> getTopRatedProducts() async {
    emit(state.copyWith(topRatedProductsStatus: RequestStatus.loading));

    final result = await repo.getTopPicks();

    result.fold(
      (failure) => emit(
        state.copyWith(
          topRatedProductsStatus: RequestStatus.failure,
          topRatedProductsError: failure.message,
        ),
      ),
      (products) => emit(
        state.copyWith(
          topRatedProductsStatus: RequestStatus.success,
          topRatedProducts: products,
        ),
      ),
    );
  }
}
