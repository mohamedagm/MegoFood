import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/reset_password_fields.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({
    super.key,
    required this.resetToken,
    required this.email,
  });
  final String email;
  final String resetToken;

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        if (state is AuthresetPassword) {
          customSnackbar(
            context,
            'password reset Successfully',
            SnackbarType.success,
          );
          GoRouter.of(context).go(AppRoutes.login); // reomve previous paths
        } else if (state is AuthFailure) {
          final failure = state.failure;
          customSnackbar(context, failure.message, SnackbarType.error);
        }
      },
      child: SingleChildScrollView(
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
                    reNewPasswordController: confirmNewPasswordController,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                  if (newPasswordController.text.isEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),

                  BlocSelector<AuthCubit, AuthState, bool>(
                    selector: (state) => state is AuthLoading,
                    builder: (context, isLoading) {
                      return AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().resetPasswordC(
                              email: widget.email,
                              token: widget.resetToken,
                              newPassword: newPasswordController.text,
                              confirmNewPassword:
                                  confirmNewPasswordController.text,
                            );
                          }
                        },
                        buttonType: newPasswordController.text.isEmpty
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        child: isLoading
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              )
                            : Text('Continue'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
