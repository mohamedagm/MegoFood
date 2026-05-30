import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/features/category_restaurants/data/repo/category_restaurants_repo.dart';
import 'package:mego_food/features/category_restaurants/presentation/cubit/category_restaurants_state.dart';

class CategoryRestaurantsCubit extends Cubit<CategoryRestaurantsState> {
  final CategoryRestaurantsRepo repo;

  CategoryRestaurantsCubit(this.repo) : super(CategoryRestaurantsInitial());

  Future<void> getRestaurantsByCategory(String categoryId) async {
    emit(CategoryRestaurantsLoading());

    final result = await repo.getRestaurantsByCategory(categoryId);

    result.fold(
      (failure) => emit(CategoryRestaurantsFailure(failure.message)),
      (restaurants) => emit(CategoryRestaurantsSuccess(restaurants)),
    );
  }
}
