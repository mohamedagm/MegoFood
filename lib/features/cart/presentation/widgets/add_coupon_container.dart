import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AddCouponContainer extends StatefulWidget {
  const AddCouponContainer({super.key, this.onTap, this.selectedCoupon});
  final void Function()? onTap;
  final Map<String, dynamic>? selectedCoupon;

  @override
  State<AddCouponContainer> createState() => _AddCouponContainerState();
}

class _AddCouponContainerState extends State<AddCouponContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.selectedCoupon != null ? 70 : 50,
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
                widget.selectedCoupon == null
                    ? Text(
                        'Add a coupon',
                        style: context.exTextStyles.medium400,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Coupon', style: context.exTextStyles.small),
                          const SizedBox(height: 2),
                          Text(
                            widget.selectedCoupon!['coupon']?.toString() ?? '',
                            style: context.exTextStyles.small600,
                          ),
                        ],
                      ),
              ],
            ),
            SvgPicture.asset('assets/icons/Arrow right.svg'),
          ],
        ),
      ),
    );
  }
}
