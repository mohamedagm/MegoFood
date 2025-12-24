import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CustomToggleTabs extends StatelessWidget {
  final bool isCurrentSelected;
  final void Function(bool) onTap;
  final String tab1;
  final String tab2;

  const CustomToggleTabs({
    super.key,
    required this.isCurrentSelected,
    required this.onTap,
    required this.tab1,
    required this.tab2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: context.exColors.grey100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(true),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: isCurrentSelected ? context.exColors.grey0 : null,
                ),
                child: Text(
                  tab1,
                  style: isCurrentSelected
                      ? context.exTextStyles.large
                      : context.exTextStyles.medium,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTap(false),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 24,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: !isCurrentSelected ? context.exColors.grey0 : null,
                ),
                child: Text(
                  tab2,
                  style: !isCurrentSelected
                      ? context.exTextStyles.large
                      : context.exTextStyles.medium,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
