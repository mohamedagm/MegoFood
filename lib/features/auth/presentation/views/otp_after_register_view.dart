import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class OtpAfterRegisterView extends StatelessWidget {
  const OtpAfterRegisterView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpVerificationBody(
        title: 'Verify your\naccount',
        onContinue: () => GoRouter.of(context).push(AppRoutes.createProfile),
        email: email,
      ),
    );
  }
}
