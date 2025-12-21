import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/features/menu/presentation/widgets/rating_dialog.dart';

class PreviousOrederItem extends StatelessWidget {
  const PreviousOrederItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Column(
              spacing: 4,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/pizaa.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  spacing: 4,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/pizaa.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 40,
                        height: 40,
                        color: context.exColors.grey100,
                        child: Center(
                          child: Text(
                            '+3',
                            style: context.exTextStyles.small600.copyWith(
                              color: context.exColors.typography400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order delivered',
                      style: context.exTextStyles.medium700,
                    ),

                    Column(
                      spacing: 4,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 16,
                          children: [
                            Text(
                              'Delivered on',
                              style: context.exTextStyles.small600,
                            ),
                            Text(
                              '26 October',
                              style: context.exTextStyles.robotoSmall,
                            ),
                          ],
                        ),
                        Row(
                          spacing: 16,

                          children: [
                            Text(
                              'Order summary',
                              style: context.exTextStyles.small600,
                            ),
                            Expanded(
                              child: Text(
                                'Pepperoni Cheese Pizza Pizza Pizza Pizza',
                                style: context.exTextStyles.robotoSmall,
                                maxLines: 1,
                                overflow: TextOverflow.fade,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 16,

                          children: [
                            Text(
                              'Total price paid',
                              style: context.exTextStyles.small600,
                            ),
                            Text(
                              r'$24.02',
                              style: context.exTextStyles.robotoSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.exColors.grey200),
                ),
                child: Center(
                  child: Text('Reorder', style: context.exTextStyles.medium700),
                ),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: context.exColors.grey200),
              ),
              child: GestureDetector(
                onTap: () => showRatingDialog(context),
                child: SvgPicture.asset('assets/icons/More.svg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void showRatingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: context.exColors.backgroundBlur,

    builder: (_) => const RatingDialog(),
  );
}
