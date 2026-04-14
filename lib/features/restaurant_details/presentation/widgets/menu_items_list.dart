import 'package:flutter/material.dart';
import 'package:mego_food/features/restaurant_details/presentation/widgets/menu_item_card.dart';

class MenuItemsList extends StatelessWidget {
  const MenuItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return const MenuItemCard();
        }, childCount: 10),
      ),
    );
  }
}
