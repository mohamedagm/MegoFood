import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_otp_field.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    spacing: 15,
                    children: [
                      const AuthHeader(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot your\npassword',
                          style: context.exTextStyles.heading1,
                        ),
                      ),
                      Text(
                        'Enter the verification code sent to your email sample@example.com',
                        style: context.exTextStyles.medium400,
                      ),
                      OtpTextField(
                        onChanged: (value) => setState(() {}),
                        pinController: pinController,
                        isError: false, // temporary value
                      ),
                      Row(
                        children: [
                          Text(
                            "Didn’t received the code? ",
                            style: context.exTextStyles.medium400,
                          ),
                          Text('00:59'),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Resend',
                              style: context.exTextStyles.medium600.copyWith(
                                color: context.exColors.primary600,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),

                      AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            GoRouter.of(context).push(AppRoutes.newPassword);
                          }
                        },
                        buttonType: pinController.text.isEmpty
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        child: const Text('Continue'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
