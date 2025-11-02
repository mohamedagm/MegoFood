import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.arrowLeft),
        Text(
          'Back',
          style: context.exTextStyles.medium700.copyWith(
            color: context.exColors.typography500,
          ),
        ),
      ],
    );
  }
}
