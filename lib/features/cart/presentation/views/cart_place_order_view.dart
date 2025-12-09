import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/cart/presentation/widgets/add_coupon_container.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list.dart';
import 'package:mego_food/features/cart/presentation/widgets/place_order_price_sec.dart';
import 'package:mego_food/features/home/presentation/widgets/total_footer.dart';

class CartPlaceOrderView extends StatefulWidget {
  const CartPlaceOrderView({super.key});

  @override
  State<CartPlaceOrderView> createState() => _CartPlaceOrderViewState();
}

class _CartPlaceOrderViewState extends State<CartPlaceOrderView> {
  Map<String, dynamic>? res;
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
              //temporary
              CartList(),
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
              PlaceOrderPriceSec(coupon: res),
              TotalFooter(
                buttonText: 'Continue',
                total: 60.26,
                onPressed: () {
                  //  GoRouter.of(context).push(AppRoutes);
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
