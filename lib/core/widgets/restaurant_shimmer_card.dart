import 'package:flutter/material.dart';
import 'package:mego_food/core/widgets/app_shimmer.dart';

class RestaurantShimmerCard extends StatelessWidget {
  const RestaurantShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerCard(
      child: Column(
        children: [
          ShimmerBox(
            height: 140,
            width: double.infinity,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ShimmerBox(
                  height: 44,
                  width: 44,
                  borderRadius: BorderRadius.circular(22),
                ),
                const SizedBox(width: 10),
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
                        height: 12,
                        width: 120,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ShimmerBox(
                  height: 28,
                  width: 56,
                  borderRadius: BorderRadius.circular(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
