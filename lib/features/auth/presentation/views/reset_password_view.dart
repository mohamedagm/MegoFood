import 'package:flutter/material.dart';
import 'package:mego_food/features/auth/presentation/widgets/reset_password_view_body.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.resetToken, required this.email});
  final String email;
  final String resetToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ResetPasswordViewBody(resetToken: resetToken));
  }
}
