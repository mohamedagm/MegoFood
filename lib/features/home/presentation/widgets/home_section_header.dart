import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({super.key, required this.title, this.onSeeAll});

  final String title;
  final VoidCallback? onSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.exTextStyles.medium600.copyWith(
            color: context.exColors.primary500,
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Text(
            'See all',
            style: context.exTextStyles.medium600.copyWith(
              color: onSeeAll == null
                  ? context.exColors.grey300
                  : context.exColors.primary500,
            ),
          ),
        ),
      ],
    );
  }
}
