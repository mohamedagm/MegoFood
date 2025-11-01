import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/theme/app_colors.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class StartAuthView extends StatelessWidget {
  const StartAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Column(
              spacing: 15,
              children: [
                Image.asset(AppAssets.mego),
                Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 40,
                      child: SvgPicture.asset(AppAssets.vector),
                    ),
                    SvgPicture.asset(AppAssets.startAuth),
                  ],
                ),
                Text(
                  'Join to get the\ndelicious quizines!',
                  textAlign: TextAlign.center,
                  style: context.exTextStyles.heading1,
                ),
                AppElevatedButton(
                  child: Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.apple,
                        size: 24,
                        color: context.exColors.baseWhite,
                      ),
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
                        onPressed: () => {},
                        hasGradient: false,
                        backgroundColor: AppColors.light.backgroundBlur80,
                        child: SvgPicture.asset(
                          'assets/icons/social_$index.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
