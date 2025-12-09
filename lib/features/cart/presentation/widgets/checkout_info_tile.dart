import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CheckoutInfoTile extends StatelessWidget {
  const CheckoutInfoTile({
    super.key,
    required this.svgImageLink,
    required this.title,
    required this.subTitle,
    this.onTap,
  });
  final String svgImageLink;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 70,
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
                SvgPicture.asset(svgImageLink),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: context.exTextStyles.small),
                    const SizedBox(height: 2),
                    Text(subTitle, style: context.exTextStyles.medium400),
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
