import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30,
      children: [
        Text(r'$55', style: context.exTextStyles.heading1),
        Expanded(
          child: AppElevatedButton(
            buttonType: AppButtonType.primary,
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.cartPlaceOrder);
            },
            child: Text('Proceed to pay'),
          ),
        ),
      ],
    );
  }
}
