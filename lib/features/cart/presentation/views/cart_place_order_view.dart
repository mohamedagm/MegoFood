import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/cart/presentation/widgets/add_coupon_container.dart';
import 'package:mego_food/features/cart/presentation/widgets/cart_list.dart';
import 'package:mego_food/features/cart/presentation/widgets/place_order_price_sec.dart';
import 'package:mego_food/features/home/presentation/widgets/total_footer.dart';

class CartPlaceOrderView extends StatelessWidget {
  const CartPlaceOrderView({super.key});

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
              AddCouponContainer(),
              PlaceOrderPriceSec(),
              TotalFooter(buttonText: 'Continue', total: 60.26),
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
