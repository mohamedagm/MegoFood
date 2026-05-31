import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/cart/data/models/cart_item_model.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:mego_food/features/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:mego_food/features/cart/presentation/widgets/add_coupon_container.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list.dart';
import 'package:mego_food/features/cart/presentation/widgets/place_order_price_sec.dart';
import 'package:mego_food/features/product_details/presentation/widgets/total_footer.dart';

class CartPlaceOrderView extends StatefulWidget {
  const CartPlaceOrderView({super.key});

  @override
  State<CartPlaceOrderView> createState() => _CartPlaceOrderViewState();
}

class _CartPlaceOrderViewState extends State<CartPlaceOrderView> {
  Map<String, dynamic>? res;

  static const double _deliveryCharges = 3.99;
  static const double _couponDiscount = 10;

  double _discount() => res == null ? 0 : _couponDiscount;

  double _total(double subtotal) => subtotal + _deliveryCharges - _discount();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 20,
            children: [
              CustomHeader(
                leading: AppBackButton(),
                title: Text('place order', style: context.exTextStyles.large),
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final items = switch (state) {
                    CartLoaded(:final items) => items,
                    CartRestaurantConflict(:final items) => items,
                    _ => <CartItemModel>[],
                  };
                  return CartList(items: items);
                },
              ),
              Text(
                '+ more',
                style: context.exTextStyles.medium700.copyWith(
                  color: context.exColors.primary700,
                ),
              ),
              AddCouponContainer(
                selectedCoupon: res,
                onTap: () async {
                  res = await GoRouter.of(context).push(AppRoutes.addCoupon);
                  if (res != null) {
                    setState(() {});
                  }
                },
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
                    coupon: res,
                    deliveryCharges: _deliveryCharges,
                    couponDiscount: _couponDiscount,
                  );
                },
              ),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final subtotal = switch (state) {
                    CartLoaded(:final total) => total,
                    CartRestaurantConflict(:final total) => total,
                    _ => 0.0,
                  };
                  return TotalFooter(
                    buttonText: 'Continue',
                    total: _total(subtotal),
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.checkOut, extra: res);
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
