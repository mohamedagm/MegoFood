import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/presentation/widgets/suggestion_item.dart';

class ExploreSearchSuggestions extends StatelessWidget {
  final void Function(String) onSelect;

  const ExploreSearchSuggestions({super.key, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.exColors.grey0,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.exColors.grey200),
      ),
      child: Column(
        children: [
          SuggestionItem(text: 'Indian', onTap: () => onSelect('Indian')),
          SuggestionItem(text: 'Dessert', onTap: () => onSelect('Dessert')),
          SuggestionItem(text: 'Fast food', onTap: () => onSelect('Fast food')),
          SuggestionItem(text: 'Sea food', onTap: () => onSelect('Sea food')),
        ],
      ),
    );
  }
}
