import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class FilterSheetHeader extends StatelessWidget {
  const FilterSheetHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: SvgPicture.asset(
            'assets/icons/Close.svg',
            width: 32,
            height: 32,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Text('Filters', style: context.exTextStyles.large600),
        const Spacer(),
        Text(
          '532 results',
          style: context.exTextStyles.large400.copyWith(
            color: context.exColors.typography400,
          ),
        ),
      ],
    );
  }
}
