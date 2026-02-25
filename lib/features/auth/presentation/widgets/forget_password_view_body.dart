import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/utils/validators/email_validator.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthForgetPassword || current is AuthFailure;
      },
      listener: (context, state) {
        if (state is AuthForgetPassword) {
          customSnackbar(context, state.temporary, SnackbarType.success);

          GoRouter.of(context).pushReplacement(
            AppRoutes.vertifyForgotPassword,
            extra: emailController.text,
          );
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
                  AuthHeader(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter your Email\nto reset password',
                      style: context.exTextStyles.heading1,
                    ),
                  ),
                  AppTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: (value) => emailValidator(value),
                    controller: emailController,
                    hintText: 'email address',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.55),

                  BlocSelector<AuthCubit, AuthState, bool>(
                    selector: (state) => state is AuthLoading,
                    builder: (context, isLoading) {
                      return AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().forgetPasswordC(
                              email: emailController.text,
                            );
                          }
                        },
                        buttonType: emailController.text.isEmpty
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        child: isLoading
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              )
                            : Text('send OTP'),
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
