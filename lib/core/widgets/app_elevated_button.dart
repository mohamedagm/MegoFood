import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

enum AppButtonType { primary, skip, disabled, danger }

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.buttonType = AppButtonType.primary,
  });

  final void Function()? onPressed;
  final Widget? child;
  final AppButtonType buttonType;

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: context.exTextStyles.medium700,
        foregroundColor:
            buttonType == AppButtonType.primary ||
                buttonType == AppButtonType.danger
            ? context.exColors.baseWhite
            : buttonType == AppButtonType.skip
            ? context.exColors.primary600
            : context.exColors.typography100, // disabled
        backgroundColor: buttonType == AppButtonType.primary
            ? Colors.transparent
            : buttonType == AppButtonType.skip
            ? context.exColors.primary100
            : buttonType == AppButtonType.danger
            ? context.exColors.red
            : context.exColors.grey200, // disabled
        shadowColor: Colors.transparent,
      ),

      onPressed: onPressed,
      child: child,
    );

    if (!(buttonType == AppButtonType.primary)) return button;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.exColors.gradientLight,
            context.exColors.gradientDark,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: button,
    );
  }
}
