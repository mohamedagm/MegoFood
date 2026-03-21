import 'package:equatable/equatable.dart';
import 'package:mego_food/features/home/data/model/base_category_model.dart';

enum RequestStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  // Categories states
  final RequestStatus categoriesStatus;
  //Obj was in Success state
  final List<BaseCategoryModel> categories;
  //error was in Failure state
  final String? categoriesError;

  const HomeState({
    this.categoriesStatus = RequestStatus.initial,
    this.categories = const [],
    this.categoriesError,
  });
  // Base of Game
  HomeState copyWith({
    RequestStatus? categoriesStatus,
    List<BaseCategoryModel>? categories,
    String? categoriesError,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesError: categoriesError ?? this.categoriesError,
    );
  }

  @override
  List<Object?> get props => [categoriesStatus, categories, categoriesError];
}
