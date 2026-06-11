import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';

class SearchResultShimmerItem extends StatelessWidget {
  const SearchResultShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.exColors.grey0,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.exColors.grey100),
        boxShadow: [
          BoxShadow(
            color: context.exColors.grey500_6,
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          ShimmerBox(
            height: 104,
            width: 104,
            borderRadius: BorderRadius.circular(14),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 104,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerBox(
                              height: 14,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            const SizedBox(height: 8),
                            ShimmerBox(
                              height: 14,
                              width: 120,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      ShimmerBox(
                        height: 32,
                        width: 32,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ShimmerBox(
                    height: 10,
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const SizedBox(height: 8),
                  ShimmerBox(
                    height: 10,
                    width: 160,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      ShimmerBox(
                        height: 28,
                        width: 70,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      const Spacer(),
                      ShimmerBox(
                        height: 12,
                        width: 64,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
