import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/format_time.dart';
import 'package:mego_food/core/utils/validators/otp_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/custom_otp_field.dart';

class OtpVerificationBody extends StatefulWidget {
  const OtpVerificationBody({
    super.key,
    required this.title,
    required this.email,
    required this.listener,
    required this.isVertifyPassword,
  });

  final String email;
  final String title;
  final void Function(BuildContext, AuthState) listener;
  final bool isVertifyPassword;

  @override
  State<OtpVerificationBody> createState() => _OtpVerificationBodyState();
}

class _OtpVerificationBodyState extends State<OtpVerificationBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  int seconds = 60;
  Timer? timer;
  bool isTimerEnd = false;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    setState(() {
      isTimerEnd = false;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        setState(() {
          seconds--;
        });
      } else {
        setState(() {
          isTimerEnd = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: widget.listener,
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
                      Text(formatTime(seconds)),
                      TextButton(
                        onPressed: () {
                          if (isTimerEnd) {
                            widget.isVertifyPassword
                                ? context.read<AuthCubit>().forgetPasswordC(
                                    email: widget.email,
                                  )
                                : context.read<AuthCubit>().resendConfirmEmailC(
                                    email: widget.email,
                                  );
                            setState(() {
                              seconds = 60;
                              isTimerEnd = false;
                              startTimer();
                            });
                          }
                        },
                        child: Text(
                          'Resend',
                          style: context.exTextStyles.medium600.copyWith(
                            color: isTimerEnd
                                ? context.exColors.primary600
                                : context.exColors.primary100,
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
                            widget.isVertifyPassword
                                ? context
                                      .read<AuthCubit>()
                                      .vertifyForgetPasswordOtpC(
                                        email: widget.email,
                                        otp: pinController.text,
                                      )
                                : context.read<AuthCubit>().confirmEmailC(
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
