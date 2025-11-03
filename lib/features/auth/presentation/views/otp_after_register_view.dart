import 'package:flutter/material.dart';
import 'package:mego_food/features/auth/presentation/widgets/otp_vertification_body.dart';

class OtpAfterRegisterView extends StatelessWidget {
  const OtpAfterRegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpVerificationBody(
      title: 'Verify your\naccount',
      onContinue: () {},
      //onContinue: () => GoRouter.of(context).push(AppRoutes.home),
    );
  }
}
