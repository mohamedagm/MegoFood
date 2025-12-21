import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class RatingDialog extends StatefulWidget {
  const RatingDialog({super.key});

  @override
  State<RatingDialog> createState() => RatingDialogState();
}

class RatingDialogState extends State<RatingDialog> {
  int selectedStars = 0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Text(
              'Did you like the food!',
              style: context.exTextStyles.robotoHeading,
            ),
            Text(
              'Please rate this food so, that we can improve it!',
              style: context.exTextStyles.medium400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final starIndex = index + 1;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedStars = starIndex;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: starIndex <= selectedStars
                        ? SvgPicture.asset(
                            width: 48,
                            height: 48,
                            'assets/icons/Star filled.svg',
                            colorFilter: ColorFilter.mode(
                              context.exColors.yellow,
                              BlendMode.srcIn,
                            ),
                          )
                        : SvgPicture.asset(
                            'assets/icons/Star.svg',
                            width: 48,
                            height: 48,
                            colorFilter: ColorFilter.mode(
                              context.exColors.grey400,
                              BlendMode.srcIn,
                            ),
                          ),
                  ),
                );
              }),
            ),
            AppElevatedButton(
              buttonType: selectedStars == 0
                  ? AppButtonType.disabled
                  : AppButtonType.primary,
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text('Rate'),
            ),
          ],
        ),
      ),
    );
  }
}
