import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpVerificationBody(
      title: 'Forgot your\npassword',
      onContinue: () => GoRouter.of(context).push(AppRoutes.newPassword),
    );
  }
}
