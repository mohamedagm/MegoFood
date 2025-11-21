import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/utils/validators/otp_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/data/models/error_login_model.dart';
import 'package:mego_food/features/auth/data/models/validation_error_login_model.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/views/vertify_forget_password_otp_view.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_otp_field.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({
    super.key,
    required this.title,
    required this.onContinue,
    required this.email,
  });
  final String email;
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        if (state is AuthVertifyForgetPasswordOtp) {
          customSnackbar(context, 'Created Successfully', SnackbarType.success);
          GoRouter.of(context).push(
            AppRoutes.newPassword,
            extra: [widget.email, state.resetToken],
          );
        } else if (state is AuthFailure) {
          final failure = state.failure;
          if (failure is ValidationErrorAuthModel) {
            customSnackbar(
              context,
              failure.errors.values.first.first,
              SnackbarType.error,
            );
          } else if (failure is ErrorAuthModel) {
            customSnackbar(context, failure.error.message, SnackbarType.error);
          }
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
                      widget.title,
                      style: context.exTextStyles.heading1,
                    ),
                  ),
                  Text(
                    'Enter the verification code sent to your email ${widget.email}',
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
                  BlocSelector<AuthCubit, AuthState, bool>(
                    selector: (state) => state is AuthLoading,
                    builder: (context, isLoading) {
                      return AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().vertifyForgetPasswordOtpC(
                              email: widget.email,
                              otp: pinController.text,
                            );
                          }
                        },
                        buttonType: pinController.text.isEmpty
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
