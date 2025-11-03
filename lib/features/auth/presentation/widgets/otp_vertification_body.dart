import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/validators/otp_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_otp_field.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({
    super.key,
    required this.title,
    required this.onContinue,
  });

  final String title;
  final VoidCallback onContinue;

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
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
                    widget.title,
                    style: context.exTextStyles.heading1,
                  ),
                ),
                Text(
                  'Enter the verification code sent to your email sample@example.com',
                  style: context.exTextStyles.medium400,
                ),
                OtpTextField(
                  validator: (value) => otpValidator(value),
                  onChanged: (value) => setState(() {}),
                  pinController: pinController,
                  isError: false, // temporary
                ),
                Row(
                  children: [
                    Text(
                      "Didn’t receive the code? ",
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                AppElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      widget.onContinue();
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
      ),
    );
  }
}
