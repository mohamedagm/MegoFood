import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/onBoarding/data/model/onboarding_model.dart';

class BoardingViewBody extends StatelessWidget {
  const BoardingViewBody({
    super.key,
    required this.controller,
    this.onPageChanged,
  });

  final PageController? controller;
  final void Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: onPageChanged,
      controller: controller,
      children: List.generate(
        3,
        (index) => Column(
          spacing: 15,
          children: [
            Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 40,
                  child: SvgPicture.asset(AppAssets.vector),
                ),
                SvgPicture.asset(onboardingPages[index].image),
              ],
            ),
            Text(
              onboardingPages[index].title,
              textAlign: TextAlign.center,
              style: context.exTextStyles.heading1,
            ),
            Text(
              onboardingPages[index].subTitle,
              textAlign: TextAlign.center,
              style: context.exTextStyles.medium400,
            ),
          ],
        ),
      ),
    );
  }
}
