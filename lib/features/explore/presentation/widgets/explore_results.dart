import 'package:flutter/material.dart';
import 'package:mego_food/features/explore/presentation/widgets/explore_results_item.dart';

class ExploreResults extends StatelessWidget {
  const ExploreResults({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, index) {
        return ExploreResultsItem();
      },
    );
  }
}
