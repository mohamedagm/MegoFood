import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:mego_food/features/cart/presentation/widgets/checkout_info_tile.dart';
import 'package:mego_food/features/cart/presentation/widgets/place_order_price_sec.dart';
import 'package:mego_food/features/product_details/presentation/widgets/total_footer.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const double _deliveryCharges = 3.99;
  static const double _couponDiscount = 10;

  double _discount(Map<String, dynamic>? coupon) {
    return coupon == null ? 0 : _couponDiscount;
  }

  double _total(double subtotal, Map<String, dynamic>? coupon) {
    return subtotal + _deliveryCharges - _discount(coupon);
  }

  @override
  Widget build(BuildContext context) {
    final coupon = GoRouter.of(context).state.extra as Map<String, dynamic>?;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            children: [
              CustomHeader(
                leading: AppBackButton(),
                title: Text('Checkout', style: context.exTextStyles.large),
              ),
              CheckoutInfoTile(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.changeAddress);
                },
                svgImageLink: 'assets/icons/Location.svg',
                title: 'Deliver to',
                subTitle: 'Home - 123 Main St, Apt 4B',
              ),
              CheckoutInfoTile(
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.changeCard);
                },
                svgImageLink: 'assets/icons/Credit Card.svg',
                title: 'Payment from',
                subTitle: 'Mastercard - Daniel Jones',
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final subtotal = switch (state) {
                    CartLoaded(:final total) => total,
                    CartRestaurantConflict(:final total) => total,
                    _ => 0.0,
                  };
                  return PlaceOrderPriceSec(
                    subtotal: subtotal,
                    coupon: coupon,
                    deliveryCharges: _deliveryCharges,
                    couponDiscount: _couponDiscount,
                  );
                },
              ),
              Spacer(),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final subtotal = switch (state) {
                    CartLoaded(:final total) => total,
                    CartRestaurantConflict(:final total) => total,
                    _ => 0.0,
                  };
                  return TotalFooter(
                    buttonText: 'Place order',
                    total: _total(subtotal, coupon),
                    onPressed: () {
                      GoRouter.of(context).go(
                        AppRoutes.orderPlaced,
                        extra: _total(subtotal, coupon),
                      );
                    },
                  );
                },
              ),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
