import 'package:flutter/material.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class FilterSheetFooter extends StatelessWidget {
  final bool hasSelection;
  final VoidCallback onClear;
  final VoidCallback onApply;

  const FilterSheetFooter({
    super.key,
    required this.hasSelection,
    required this.onClear,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: AppElevatedButton(
              buttonType: AppButtonType.skip,
              onPressed: () {
                onClear();
              },

              child: const Text('Remove all'),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 44,
            child: AppElevatedButton(
              buttonType: hasSelection
                  ? AppButtonType.primary
                  : AppButtonType.disabled,
              onPressed: () {
                onApply();
              },
              child: const Text('Apply Filters'),
            ),
          ),
        ),
      ],
    );
  }
}
