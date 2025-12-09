import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CancelButton extends StatelessWidget {
  const CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () => GoRouter.of(context).pop(),
      child: Row(
        children: [
          Text(
            'cancel',
            style: context.exTextStyles.medium700.copyWith(
              color: context.exColors.typography500,
            ),
          ),
        ],
      ),
    );
  }
}
