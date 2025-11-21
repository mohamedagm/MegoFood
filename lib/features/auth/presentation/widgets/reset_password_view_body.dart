import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/reset_password_fields.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key, required this.resetToken});
    final String resetToken;


  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final reNewPasswordController = TextEditingController();

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
                    'Create a new\npassword',
                    style: context.exTextStyles.heading1,
                  ),
                ),
                Text(
                  'Enter a new password and try not to forget it.',
                  style: context.exTextStyles.medium400,
                ),
                ResetPasswordFields(
                  onChanged: (value) => setState(() {}),
                  newPasswordController: newPasswordController,
                  reNewPasswordController: reNewPasswordController,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                if (newPasswordController.text.isEmpty)
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),

                AppElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  buttonType: newPasswordController.text.isEmpty
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
