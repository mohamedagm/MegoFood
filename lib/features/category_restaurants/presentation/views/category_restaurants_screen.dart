import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/services/setup_service.dart';
import 'package:mego_food/features/category_restaurants/data/repo/category_restaurants_repo.dart';
import 'package:mego_food/features/category_restaurants/presentation/cubit/category_restaurants_cubit.dart';
import 'package:mego_food/features/category_restaurants/presentation/widgets/category_restaurants_view_body.dart';

class CategoryRestaurantsScreen extends StatelessWidget {
  const CategoryRestaurantsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryRestaurantsCubit(getIt.get<CategoryRestaurantsRepo>())
            ..getRestaurantsByCategory(categoryId),
      child: Scaffold(
        backgroundColor: context.exColors.grey50,
        appBar: AppBar(
          backgroundColor: context.exColors.grey50,
          elevation: 0,
          leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: context.exColors.typography500),
          ),
          title: Text(
            '$categoryName Restaurants',
            style: context.exTextStyles.medium700.copyWith(
              color: context.exColors.typography500,
            ),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          top: false,
          child: CategoryRestaurantsViewBody(
            categoryId: categoryId,
            categoryName: categoryName,
          ),
        ),
      ),
    );
  }
}
