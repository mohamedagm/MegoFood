import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class PlaceOrderPriceSec extends StatelessWidget {
  const PlaceOrderPriceSec({
    super.key,
    required this.subtotal,
    this.coupon,
    this.deliveryCharges = 3.99,
    this.couponDiscount = 10,
  });

  final double subtotal;
  final Map<String, dynamic>? coupon;
  final double deliveryCharges;
  final double couponDiscount;

  double get discount => coupon == null ? 0 : couponDiscount;
  double get total => subtotal + deliveryCharges - discount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: context.exTextStyles.medium400),
            Text(
              '\$${subtotal.toStringAsFixed(2)}',
              style: context.exTextStyles.medium,
            ),
          ],
        ),
        if (coupon != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Coupon', style: context.exTextStyles.medium400),
              Text(
                '-\$${discount.toStringAsFixed(2)}',
                style: context.exTextStyles.medium,
              ),
            ],
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Delivery Charges', style: context.exTextStyles.medium400),
            Text(
              '+\$${deliveryCharges.toStringAsFixed(2)}',
              style: context.exTextStyles.medium,
            ),
          ],
        ),
        Divider(color: context.exColors.grey200),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text('Total', style: context.exTextStyles.large400),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: context.exTextStyles.robotoLarge,
            ),
          ],
        ),
      ],
    );
  }
}
