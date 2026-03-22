import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/home/presentation/widgets/product_item.dart';

class HomeTopStores extends StatelessWidget {
  const HomeTopStores({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: () => GoRouter.of(context).push(AppRoutes.productDetails),
          child: SizedBox(height: 300, child: const ProductItem()),
        ),
      ),
      itemCount: 5,
    );
  }
}
