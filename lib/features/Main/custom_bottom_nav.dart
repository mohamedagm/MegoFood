import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<String> listIcons1;
  final List<String> listIcons2;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.listIcons1,
    required this.listIcons2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(listIcons1.length, (index) {
          final isActive = index == currentIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  isActive ? listIcons2[index] : listIcons1[index],
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    isActive
                        ? context.exColors.primary600
                        : context.exColors.grey400,
                    BlendMode.srcIn,
                  ),
                ),

                const SizedBox(height: 4),

                isActive
                    ? SvgPicture.asset('assets/icons/select_arrow.svg')
                    : const SizedBox(height: 12),
              ],
            ),
          );
        }),
      ),
    );
  }
}
