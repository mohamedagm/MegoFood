import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/home/presentation/widgets/product_item.dart';

class HomeGridProducts extends StatelessWidget {
  const HomeGridProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 220,
          childAspectRatio: 0.85,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => GoRouter.of(context).push(AppRoutes.productDetails),
            child: ProductItem(),
          );
        },
      ),
    );
  }
}
