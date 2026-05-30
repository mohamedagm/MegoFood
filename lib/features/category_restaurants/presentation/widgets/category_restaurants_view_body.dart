import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/core/widgets/restaurant_shimmer_card.dart';
import 'package:mego_food/features/category_restaurants/presentation/cubit/category_restaurants_cubit.dart';
import 'package:mego_food/features/category_restaurants/presentation/cubit/category_restaurants_state.dart';
import 'package:mego_food/features/category_restaurants/presentation/widgets/category_restaurants_state_message.dart';
import 'package:mego_food/features/category_restaurants/presentation/widgets/restaurant_filter_chip.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';
import 'package:mego_food/features/home/presentation/widgets/store_card.dart';

class CategoryRestaurantsViewBody extends StatefulWidget {
  const CategoryRestaurantsViewBody({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;

  @override
  State<CategoryRestaurantsViewBody> createState() =>
      _CategoryRestaurantsViewBodyState();
}

class _CategoryRestaurantsViewBodyState
    extends State<CategoryRestaurantsViewBody> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _filters = const [
    'All',
    'Top Rated',
    'Nearest',
    'Fast Delivery',
    'Offers',
    'Free Delivery',
  ];

  String _selectedFilter = 'All';
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<RestaurantModel> _getVisibleRestaurants(
    List<RestaurantModel> restaurants,
  ) {
    final searchedRestaurants = restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(
        _searchQuery.trim().toLowerCase(),
      );
    }).toList();

    switch (_selectedFilter) {
      case 'Top Rated':
        searchedRestaurants.sort((a, b) => b.rating.compareTo(a.rating));
        return searchedRestaurants;
      case 'Nearest':
        searchedRestaurants.sort(
          (a, b) => (a.distanceKm ?? 999).compareTo(b.distanceKm ?? 999),
        );
        return searchedRestaurants;
      case 'Fast Delivery':
        searchedRestaurants.sort(
          (a, b) => (a.deliveryTimeMinutes ?? 999).compareTo(
            b.deliveryTimeMinutes ?? 999,
          ),
        );
        return searchedRestaurants;
      case 'Offers':
        return searchedRestaurants
            .where((restaurant) => restaurant.hasOffer)
            .toList();
      case 'Free Delivery':
        return searchedRestaurants
            .where((restaurant) => restaurant.deliveryFee == 0)
            .toList();
      default:
        return searchedRestaurants;
    }
  }

  void _navigateToRestaurantDetails(RestaurantModel restaurant) {
    GoRouter.of(context).push(AppRoutes.restaurantDetails, extra: restaurant);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryRestaurantsCubit, CategoryRestaurantsState>(
      builder: (context, state) {
        if (state is CategoryRestaurantsLoading) {
          return ShimmerList(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
            itemBuilder: (context, index) => const RestaurantShimmerCard(),
          );
        }

        if (state is CategoryRestaurantsFailure) {
          return CategoryRestaurantsStateMessage(
            icon: Icons.error_outline,
            title: 'Something went wrong',
            message: state.message,
            buttonText: 'Retry',
            onPressed: () => context
                .read<CategoryRestaurantsCubit>()
                .getRestaurantsByCategory(widget.categoryId),
          );
        }

        final restaurants = state is CategoryRestaurantsSuccess
            ? _getVisibleRestaurants(state.restaurants)
            : <RestaurantModel>[];

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              sliver: SliverToBoxAdapter(
                child: AppTextField(
                  controller: _searchController,
                  hintText: 'Search restaurants...',
                  prefixIcon: Icon(
                    Icons.search,
                    color: context.exColors.grey400,
                    size: 22,
                  ),
                  onChanged: (value) => setState(() => _searchQuery = value),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 60,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                  scrollDirection: Axis.horizontal,
                  itemCount: _filters.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final filter = _filters[index];
                    return RestaurantFilterChip(
                      label: filter,
                      isSelected: filter == _selectedFilter,
                      onTap: () => setState(() => _selectedFilter = filter),
                    );
                  },
                ),
              ),
            ),
            if (restaurants.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: CategoryRestaurantsStateMessage(
                  icon: Icons.restaurant_menu,
                  title: 'No restaurants found',
                  message:
                      'There are no restaurants available in this category right now.',
                  buttonText: 'Back to Home',
                  onPressed: () {
                    final router = GoRouter.of(context);
                    if (router.canPop()) {
                      router.pop();
                    } else {
                      router.go(AppRoutes.main);
                    }
                  },
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                sliver: SliverList.separated(
                  itemCount: restaurants.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return GestureDetector(
                      onTap: () => _navigateToRestaurantDetails(restaurant),
                      child: StoreCard(restaurantModel: restaurant),
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
