import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ExploreResults extends StatelessWidget {
  const ExploreResults({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        return Container(
          height: 90,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: context.exColors.grey200),
          ),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: context.exColors.grey200,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Result item ${index + 1}',
                style: context.exTextStyles.medium,
              ),
            ],
          ),
        );
      },
    );
  }
}
