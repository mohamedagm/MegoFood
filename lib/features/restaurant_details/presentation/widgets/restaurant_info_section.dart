import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class RestaurantInfoSection extends StatelessWidget {
  const RestaurantInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'El-Prince',
                  style: context.exTextStyles.heading2.copyWith(
                    color: context.exColors.primary600,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Colors.green.shade600,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '4.8',
                      style: context.exTextStyles.small700.copyWith(
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Oriental • Grill • Fast Food',
            style: context.exTextStyles.medium400.copyWith(
              color: context.exColors.grey400,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _infoItem(
                context,
                Icons.access_time_filled,
                '20-30 min',
                context.exColors.orange,
              ),
              const SizedBox(width: 20),
              _infoItem(
                context,
                Icons.location_on,
                '2.5 km',
                context.exColors.blue,
              ),
              const SizedBox(width: 20),
              _infoItem(
                context,
                Icons.delivery_dining,
                'Free Delivery',
                context.exColors.green,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: context.exColors.grey100, thickness: 1),
        ],
      ),
    );
  }

  Widget _infoItem(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
  ) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: context.exTextStyles.small600.copyWith(
            color: context.exColors.typography300,
          ),
        ),
      ],
    );
  }
}
