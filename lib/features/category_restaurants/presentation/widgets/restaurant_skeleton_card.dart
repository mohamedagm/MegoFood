import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class RestaurantSkeletonCard extends StatelessWidget {
  const RestaurantSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.exColors.grey0,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _SkeletonBox(
            height: 140,
            width: double.infinity,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                _SkeletonBox(
                  height: 44,
                  width: 44,
                  borderRadius: BorderRadius.circular(22),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SkeletonBox(
                        height: 14,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      const SizedBox(height: 8),
                      _SkeletonBox(
                        height: 12,
                        width: 120,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _SkeletonBox(
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

class _SkeletonBox extends StatelessWidget {
  const _SkeletonBox({
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: context.exColors.grey200,
        borderRadius: borderRadius,
      ),
    );
  }
}
