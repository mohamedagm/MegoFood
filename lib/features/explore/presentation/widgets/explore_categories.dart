import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key, this.onTap});
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    final items = ['Indian', 'Dessert', 'Fast food', 'Sea food', 'Veg'];

    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () => onTap!(items[index]),
          child: Container(
            height: 140,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/Frame 48095785.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
              color: context.exColors.grey200,
            ),
            child: Text(
              items[index],
              style: context.exTextStyles.heading2.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
