import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: context.exColors.grey100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        spacing: 4,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/images/product.png',
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Product Name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.exTextStyles.medium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$12.99', style: context.exTextStyles.robotoMedium),
                Container(
                  decoration: BoxDecoration(
                    color: context.exColors.primary100,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(6),
                  // child: SvgPicture.asset(
                  //   'assets/icons/add.svg',
                  //   colorFilter: ColorFilter.mode(
                  //     context.exColors.primary600,
                  //     BlendMode.srcIn,
                  //   ),
                  // ),
                  child: Icon(
                    Icons.add,
                    color: context.exColors.primary600,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
