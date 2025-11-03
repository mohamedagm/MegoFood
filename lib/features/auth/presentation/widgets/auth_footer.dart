import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key, required this.isLogin});
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? "Don't have an account? " : "have an account? ",
          style: context.exTextStyles.medium400,
        ),
        GestureDetector(
          onTap: () {
            isLogin
                ? GoRouter.of(context).push(AppRoutes.register)
                : GoRouter.of(context).pop();
          },
          child: Text(
            isLogin ? 'Sign Up' : 'Sign In',
            style: context.exTextStyles.medium600.copyWith(
              color: context.exColors.primary600,
            ),
          ),
        ),
      ],
    );
  }
}
