import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.title,
    required this.sub,
    required this.timeago,
  });
  final String title;
  final String sub;
  final String timeago;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset('assets/images/Frame 48095761.png'),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 4,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: context.exTextStyles.medium600.copyWith(
                        color: context.exColors.typography500,
                      ),
                    ),
                    Text(
                      sub,
                      style: context.exTextStyles.small.copyWith(
                        color: context.exColors.typography400,
                      ),
                    ),
                    Text(
                      timeago,
                      style: context.exTextStyles.small600.copyWith(
                        color: context.exColors.typography400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
