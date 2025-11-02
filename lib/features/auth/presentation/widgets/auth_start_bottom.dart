import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class AuthStartBottom extends StatelessWidget {
  const AuthStartBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppElevatedButton(
          child: Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.apple, size: 24, color: context.exColors.baseWhite),
              Text(
                'Continue with Apple',
                style: context.exTextStyles.medium700,
              ),
            ],
          ),
          onPressed: () {},
        ),
        Text('or', style: context.exTextStyles.medium600),
        Row(
          spacing: 8.0,
          children: List.generate(
            3,
            (index) => Expanded(
              child: AppElevatedButton(
                onPressed: () => {
                  index == 2
                      ? GoRouter.of(context).push(AppRoutes.login)
                      : null,
                },
                buttonType: AppButtonType.skip,
                child: SvgPicture.asset(
                  Theme.of(context).brightness == Brightness.dark && index == 2
                      ? AppAssets.emailFill
                      : authIcons[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
