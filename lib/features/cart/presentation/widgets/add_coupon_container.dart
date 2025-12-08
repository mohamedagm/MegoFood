import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AddCouponContainer extends StatelessWidget {
  const AddCouponContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: context.exColors.grey100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              SvgPicture.asset('assets/icons/Offer.svg'),
              Text('Add a coupon', style: context.exTextStyles.medium400),
            ],
          ),
          SvgPicture.asset('assets/icons/Arrow right.svg'),
        ],
      ),
    );
  }
}
