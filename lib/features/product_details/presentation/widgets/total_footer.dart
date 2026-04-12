import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class TotalFooter extends StatelessWidget {
  const TotalFooter({
    super.key,
    required this.buttonText,
    required this.total,
    this.onPressed,
  });
  final String buttonText;
  final double total;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Text('\$$total', style: context.exTextStyles.robotoHeading),
        Expanded(
          child: AppElevatedButton(
            buttonType: AppButtonType.primary,
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
      ],
    );
  }
}
