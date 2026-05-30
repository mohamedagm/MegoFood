import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/home/presentation/widgets/product_item.dart';

class TopRatedProductsView extends StatelessWidget {
  const TopRatedProductsView({super.key, required this.products});

  final List<ProductModel> products;

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
          'Top Rated',
          style: context.exTextStyles.medium700.copyWith(
            color: context.exColors.typography500,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: MasonryGridView.count(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          itemCount: products.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(top: index.isOdd ? 18 : 0),
            child: GestureDetector(
              onTap: () => context.push(
                AppRoutes.productDetails,
                extra: products[index],
              ),
              child: ProductItem(productModel: products[index]),
            ),
          ),
        ),
      ),
    );
  }
}
