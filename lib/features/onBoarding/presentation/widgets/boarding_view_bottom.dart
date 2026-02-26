import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/cache/cache_helper.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/app_colors.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingViewBottom extends StatelessWidget {
  const BoardingViewBottom({
    super.key,
    required this.controller,
    this.onNextPressed,
  });

  final PageController? controller;
  final void Function()? onNextPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SmoothPageIndicator(
          controller: controller!,
          count: 3,
          effect: SwapEffect(
            spacing: 8.0,
            dotWidth: 12.0,
            dotHeight: 12.0,
            strokeWidth: 1.5,
            dotColor: AppColors.light.primary200,
            activeDotColor: AppColors.light.primary600,
          ),
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              flex: 2,
              child: AppElevatedButton(
                onPressed: () async {
                  await CacheHelper.saveData(
                    key: 'isOnboardingDone',
                    value: true,
                  );
                  if (context.mounted) {
                    GoRouter.of(context).go(AppRoutes.startAuth);
                  }
                },
                buttonType: AppButtonType.skip,
                child: const Text('Skip'),
              ),
            ),
            Expanded(
              flex: 5,
              child: AppElevatedButton(
                onPressed: onNextPressed,
                buttonType: AppButtonType.primary,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
