import 'package:equatable/equatable.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';

sealed class CategoryRestaurantsState extends Equatable {
  const CategoryRestaurantsState();

  @override
  List<Object?> get props => [];
}

final class CategoryRestaurantsInitial extends CategoryRestaurantsState {}

final class CategoryRestaurantsLoading extends CategoryRestaurantsState {}

final class CategoryRestaurantsSuccess extends CategoryRestaurantsState {
  final List<RestaurantModel> restaurants;

  const CategoryRestaurantsSuccess(this.restaurants);

  @override
  List<Object?> get props => [restaurants];
}

final class CategoryRestaurantsFailure extends CategoryRestaurantsState {
  final String message;

  const CategoryRestaurantsFailure(this.message);

  @override
  List<Object?> get props => [message];
}
