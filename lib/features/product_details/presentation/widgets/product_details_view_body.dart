import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/home/data/model/product_model.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_count.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_desc.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_details_header.dart';
import 'package:mego_food/features/product_details/presentation/widgets/total_footer.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_info_bar.dart';
import 'package:mego_food/features/product_details/presentation/widgets/product_page_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsViewBody extends StatefulWidget {
  const ProductDetailsViewBody({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  State<ProductDetailsViewBody> createState() => _ProductDetailsViewBodyState();
}

class _ProductDetailsViewBodyState extends State<ProductDetailsViewBody> {
  PageController controller = PageController();
  int quantity = 1;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _addToCart() async {
    final cartItem = CartItemModel(
      productId: widget.productModel.id,
      name: widget.productModel.name,
      imageUrl: widget.productModel.imageUrl,
      unitPrice: widget.productModel.price,
      rating: widget.productModel.rating,
      quantity: quantity,
      restaurantId: null,
      restaurantName: null,
    );
    final result = await context.read<CartCubit>().addItem(cartItem);
    if (!mounted) return;
    switch (result) {
      case AddToCartResult.success:
        customSnackbar(context, 'Added to cart', SnackbarType.success);
        Navigator.of(context).pop();
      case AddToCartResult.restaurantConflict:
        customSnackbar(
          context,
          'Cart has items from another restaurant',
          SnackbarType.error,
        );
      case AddToCartResult.failure:
        customSnackbar(context, 'Failed to add to cart', SnackbarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 16,
            children: [
              ProductDetailsHeader(),
              ProductPageView(
                controller: controller,
                productModel: widget.productModel,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: SwapEffect(
                  spacing: 8.0,
                  dotWidth: 12.0,
                  dotHeight: 12.0,
                  strokeWidth: 1.5,
                  dotColor: context.exColors.primary200,
                  activeDotColor: context.exColors.primary600,
                ),
              ),
              ProductInfoBar(productModel: widget.productModel),
              ProductCount(
                productModel: widget.productModel,
                quantity: quantity,
                onIncrement: () => setState(() => quantity++),
                onDecrement: () {
                  if (quantity > 1) {
                    setState(() => quantity--);
                  }
                },
              ),
              ProductDesc(productModel: widget.productModel),
              TotalFooter(
                buttonText: 'Add to cart',
                total: widget.productModel.price * quantity,
                onPressed: _addToCart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
