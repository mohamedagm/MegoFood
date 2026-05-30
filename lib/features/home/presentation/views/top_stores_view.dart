import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/data/model/restaurant_model.dart';
import 'package:mego_food/features/home/presentation/widgets/store_card.dart';

class TopStoresView extends StatelessWidget {
  const TopStoresView({super.key, required this.restaurants});

  final List<RestaurantModel> restaurants;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.exColors.grey50,
      appBar: AppBar(
        backgroundColor: context.exColors.grey50,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: context.exColors.typography500),
        ),
        title: Text(
          'Top Stores',
          style: context.exTextStyles.medium700.copyWith(
            color: context.exColors.typography500,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          itemCount: restaurants.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => context.push(
              AppRoutes.restaurantDetails,
              extra: restaurants[index],
            ),
            child: StoreCard(restaurantModel: restaurants[index]),
          ),
        ),
      ),
    );
  }
}
