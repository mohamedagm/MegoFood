import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class ProductDetailsFooter extends StatelessWidget {
  const ProductDetailsFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Text(r'$12.99', style: context.exTextStyles.robotoHeading),
        Expanded(
          child: AppElevatedButton(
            buttonType: AppButtonType.primary,
            onPressed: () {},
            child: Text('Add to card'),
          ),
        ),
      ],
    );
  }
}
