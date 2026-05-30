import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class CategoryRestaurantsStateMessage extends StatelessWidget {
  const CategoryRestaurantsStateMessage({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 56, color: context.exColors.primary600),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.exTextStyles.medium700.copyWith(
                color: context.exColors.typography500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: context.exTextStyles.medium400.copyWith(
                color: context.exColors.typography300,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 180,
              child: AppElevatedButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
