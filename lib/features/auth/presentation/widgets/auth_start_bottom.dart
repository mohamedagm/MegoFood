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
          child: Text(
            'Continue with Email',
            style: context.exTextStyles.medium700,
          ),
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.login);
          },
        ),
        Text('or', style: context.exTextStyles.medium600),
        Row(
          spacing: 8.0,
          children: List.generate(
            3,
            (index) => Expanded(
              child: AppElevatedButton(
                onPressed: () => {},
                buttonType: AppButtonType.skip,
                child: SvgPicture.asset(
                  authIcons[index],
                  width: 32,
                  height: 32,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
