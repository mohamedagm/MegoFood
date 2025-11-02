import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: context.exTextStyles.medium400),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Sign Up',
            style: context.exTextStyles.medium600.copyWith(
              color: context.exColors.primary600,
            ),
          ),
        ),
      ],
    );
  }
}
