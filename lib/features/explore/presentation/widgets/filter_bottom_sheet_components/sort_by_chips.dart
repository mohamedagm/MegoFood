import 'package:flutter/material.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/app_filter_chip.dart';

class SortByChips extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onSelect;

  const SortByChips({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  static const _items = ['Rating', 'Price', 'Delivery time', 'Popularity'];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _items
          .map(
            (item) => AppFilterChip(
              label: item,
              isSelected: selected == item,
              onTap: () => onSelect(item),
            ),
          )
          .toList(),
    );
  }
}
