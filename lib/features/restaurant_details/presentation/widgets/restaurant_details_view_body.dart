import 'package:flutter/material.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/restaurant_details_header.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/restaurant_info_section.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/menu_category_list.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/menu_items_list.dart';

class RestaurantDetailsViewBody extends StatelessWidget {
  const RestaurantDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const RestaurantDetailsHeader(),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const RestaurantInfoSection(),
              const SizedBox(height: 24),
              const MenuCategoryList(),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const MenuItemsList(),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}
