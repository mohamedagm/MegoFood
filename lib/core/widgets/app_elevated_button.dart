import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/app_colors.dart';
import 'package:mego_food/core/theme/app_text_style.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.child,
    this.backgroundColor,
    this.hasGradient = true,
    this.foregroundColor,
  });

  final void Function()? onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final bool hasGradient;
  final Color? foregroundColor;
  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.medium700,
        backgroundColor: hasGradient ? Colors.transparent : backgroundColor,
        foregroundColor: foregroundColor ?? Colors.white,
        shadowColor: Colors.transparent,
      ),
      onPressed: onPressed,
      child: child,
    );

    if (!hasGradient) return button;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.light.gradientLight, AppColors.light.gradientDark],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: button,
    );
  }
}
