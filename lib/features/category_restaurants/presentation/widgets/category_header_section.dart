import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CategoryHeaderSection extends StatelessWidget {
  const CategoryHeaderSection({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.exColors.primary100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.exColors.primary200),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: context.exColors.primary600,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.restaurant, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.exTextStyles.medium700.copyWith(
                    color: context.exColors.typography500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Find the best ${categoryName.toLowerCase()} restaurants near you.',
                  style: context.exTextStyles.medium400.copyWith(
                    color: context.exColors.typography300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
