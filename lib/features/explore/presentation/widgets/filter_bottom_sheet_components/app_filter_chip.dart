import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AppFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const AppFilterChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected
              ? context.exColors.primary100
              : context.exColors.grey0,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? null
              : Border.all(color: context.exColors.grey200),
        ),
        child: Text(
          label,
          style: isSelected
              ? context.exTextStyles.medium600.copyWith(
                  color: context.exColors.typography500,
                )
              : context.exTextStyles.medium400.copyWith(
                  color: context.exColors.typography300,
                ),
        ),
      ),
    );
  }
}
