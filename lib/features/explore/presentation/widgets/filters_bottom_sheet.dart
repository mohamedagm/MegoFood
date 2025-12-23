import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/filter_sheet_footer.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/filter_sheet_header.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/food_type_chips.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/sort_by_chips.dart';
import 'package:mego_food/features/explore/presentation/widgets/filter_bottom_sheet_components/toggle_row.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({super.key});

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  String selectedSort = 'Rating';
  final Set<String> foodTypes = {};
  bool boboFood = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.91,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: context.exColors.grey0,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FilterSheetHeader(),
          const SizedBox(height: 20),
          Text(
            'Sort by',
            style: context.exTextStyles.small600.copyWith(
              color: context.exColors.typography300,
            ),
          ),
          const SizedBox(height: 12),
          SortByChips(
            selected: selectedSort,
            onSelect: (value) {
              setState(() {
                selectedSort = value;
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Food type',
            style: context.exTextStyles.small600.copyWith(
              color: context.exColors.typography300,
            ),
          ),
          const SizedBox(height: 12),
          FoodTypeChips(
            selected: foodTypes,
            onToggle: (value) {
              setState(() {
                foodTypes.contains(value)
                    ? foodTypes.remove(value)
                    : foodTypes.add(value);
              });
            },
          ),
          const SizedBox(height: 20),
          Text(
            'Others',
            style: context.exTextStyles.small600.copyWith(
              color: context.exColors.typography300,
            ),
          ),
          const SizedBox(height: 8),
          ToggleRow(
            value: boboFood,
            onChanged: (value) => setState(() => boboFood = value),
          ),
          const Spacer(),
          FilterSheetFooter(
            hasSelection:
                foodTypes.isNotEmpty || boboFood || selectedSort != 'Rating',
            onClear: () {
              setState(() {
                selectedSort = 'Rating';
                foodTypes.clear();
                boboFood = false;
              });
            },
            onApply: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
