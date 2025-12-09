import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/cart/presentation/widgets/checkout_info_tile.dart';
import 'package:mego_food/features/cart/presentation/widgets/place_order_price_sec.dart';
import 'package:mego_food/features/home/presentation/widgets/total_footer.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

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
                svgImageLink: 'assets/icons/Cridet Card.svg',
                title: 'Payment from',
                subTitle: 'Mastercard - Daniel Jones',
              ),
              PlaceOrderPriceSec(
                coupon:
                    GoRouter.of(context).state.extra as Map<String, dynamic>?,
              ),
              Spacer(),
              TotalFooter(
                buttonText: 'Place order',
                total: 60.26,
                onPressed: () {
                  GoRouter.of(context).push(AppRoutes.orderPlaced);
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
