import 'package:flutter/material.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/app_filter_chip.dart';

class FoodTypeChips extends StatelessWidget {
  final Set<String> selected;
  final ValueChanged<String> onToggle;

  const FoodTypeChips({
    super.key,
    required this.selected,
    required this.onToggle,
  });

  static const _items = [
    'Fast food',
    'Dessert',
    'Beverages',
    'Indian',
    'Chinese',
    'French',
    'Italian',
    'Mexican',
    'Japanese',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _items
          .map(
            (item) => AppFilterChip(
              label: item,
              isSelected: selected.contains(item),
              onTap: () => onToggle(item),
            ),
          )
          .toList(),
    );
  }
}
