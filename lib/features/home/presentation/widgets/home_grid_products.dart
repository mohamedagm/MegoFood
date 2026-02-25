import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/home/presentation/widgets/product_item.dart';

class HomeSliverProducts extends StatelessWidget {
  const HomeSliverProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) {
        return InkWell(
          onTap: () => GoRouter.of(context).push(AppRoutes.productDetails),
          child: const ProductItem(),
        );
      }, childCount: 20),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        mainAxisExtent: 210,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
      ),
    );
  }
}
