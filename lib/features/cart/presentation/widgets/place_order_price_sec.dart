import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class PlaceOrderPriceSec extends StatelessWidget {
  const PlaceOrderPriceSec({super.key, this.coupon});
  final Map<String, dynamic>? coupon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: context.exTextStyles.medium400),
            Text('56.27', style: context.exTextStyles.medium),
          ],
        ),
        if (coupon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Coupon', style: context.exTextStyles.medium400),
              Text('-10', style: context.exTextStyles.medium),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Delivery Charges', style: context.exTextStyles.medium400),
            Text('+3.99', style: context.exTextStyles.medium),
          ],
        ),
        Divider(color: context.exColors.grey200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Total', style: context.exTextStyles.large400),
            Text('60.26', style: context.exTextStyles.robotoLarge),
          ],
        ),
      ],
    );
  }
}
