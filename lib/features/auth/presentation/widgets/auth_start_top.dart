import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AuthStartTop extends StatelessWidget {
  const AuthStartTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
