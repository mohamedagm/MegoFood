import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class RestaurantFilterChip extends StatelessWidget {
  const RestaurantFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 18),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected
              ? context.exColors.primary600
              : context.exColors.grey0,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected
                ? context.exColors.primary600
                : context.exColors.grey200,
          ),
        ),
        child: Text(
          label,
          style: context.exTextStyles.medium600.copyWith(
            color: isSelected ? Colors.white : context.exColors.typography400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
