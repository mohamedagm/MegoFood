import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.exColors.grey200),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          // TODO: Navigator.push(FilterView)
        },
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/Filter.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
