import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ProductInfoBar extends StatelessWidget {
  const ProductInfoBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.exColors.grey200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Star filled.svg',
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  context.exColors.yellow,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text("4.8", style: context.exTextStyles.medium),
            ],
          ),

          // Divider
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),

          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Fire filled.svg',
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  context.exColors.orange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text("300kcal", style: context.exTextStyles.medium),
            ],
          ),

          // Divider
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 1,
            height: 20,
            color: Colors.grey.shade300,
          ),

          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/Clock filled.svg',
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  context.exColors.blue,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4),
              Text("20mins", style: context.exTextStyles.medium),
            ],
          ),
        ],
      ),
    );
  }
}
