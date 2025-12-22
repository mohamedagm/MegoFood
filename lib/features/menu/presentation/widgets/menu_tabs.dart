import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({
    super.key,
    required this.prefIconLink,
    required this.title,
    required this.navigationPath,
    this.customSuffix,
    this.onTap,
  });
  final String prefIconLink;
  final String title;
  final String navigationPath;
  final Widget? customSuffix;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => GoRouter.of(context).push(navigationPath),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: context.exColors.grey50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          spacing: 12,
          children: [
            SvgPicture.asset(prefIconLink),
            Text(title, style: context.exTextStyles.medium400),
            Spacer(),
            if (customSuffix == null)
              SvgPicture.asset(
                'assets/icons/Arrow right.svg',
                colorFilter: ColorFilter.mode(
                  context.exColors.grey400,
                  BlendMode.srcIn,
                ),
              ),
            if (customSuffix != null) customSuffix!,
          ],
        ),
      ),
    );
  }
}
