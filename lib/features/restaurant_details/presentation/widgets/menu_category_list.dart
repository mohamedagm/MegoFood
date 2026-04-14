import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class MenuCategoryList extends StatefulWidget {
  const MenuCategoryList({super.key});

  @override
  State<MenuCategoryList> createState() => _MenuCategoryListState();
}

class _MenuCategoryListState extends State<MenuCategoryList> {
  int selectedIndex = 0;
  final List<String> categories = ['Popular', 'Main Dishes', 'Sides', 'Drinks', 'Desserts'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? context.exColors.primary600 : context.exColors.grey50,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: isSelected ? context.exColors.primary600 : context.exColors.grey200,
                ),
              ),
              child: Text(
                categories[index],
                style: context.exTextStyles.medium600.copyWith(
                  color: isSelected ? Colors.white : context.exColors.grey400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
