import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/home/presentation/widgets/suggestion_item.dart';

class HomeSearchSuggestions extends StatelessWidget {
  const HomeSearchSuggestions({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: const Color(0xA1FFFFFF),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 130, 20, 0),
            child: Container(
              decoration: BoxDecoration(
                color: context.exColors.grey0,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: context.exColors.grey200),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SuggestionItem(text: 'Chocolate boba'),
                  SuggestionItem(text: 'grilled beef burger'),
                  SuggestionItem(text: 'honey bee cake'),
                  SuggestionItem(text: 'classic momos'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
