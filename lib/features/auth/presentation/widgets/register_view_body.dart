import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_footer.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_text_fields.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<RegisterViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isAgree = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) {
        return current is AuthRegisterSuccess || current is AuthFailure;
      },
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        if (state is AuthRegisterSuccess) {
          customSnackbar(
            context,
            'Initially success, proof Yourself',
            SnackbarType.success,
          );
          GoRouter.of(
            context,
          ).push(AppRoutes.otpAfterRegister, extra: emailController.text);
        } else if (state is AuthFailure) {
          customSnackbar(context, state.failure.message, SnackbarType.error);
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
                      'Create a new\naccount',
                      style: context.exTextStyles.heading1,
                    ),
                  ),
                  AuthTextFields(
                    emailController: emailController,
                    passwordController: passwordController,
                    onChanged: (value) => setState(() {}),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isAgree,
                        onChanged: (value) => setState(() {
                          isAgree = value!;
                        }),
                      ),
                      Text(
                        'I agree to terms & conditions',
                        style: context.exTextStyles.medium400,
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  if (passwordController.text.isEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  BlocSelector<AuthCubit, AuthState, bool>(
                    selector: (state) => state is AuthLoading,
                    builder: (context, isLoading) {
                      return AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthCubit>().registerC(
                              email: emailController.text,
                              password: passwordController.text,
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
                            : Text('Create account'),
                      );
                    },
                  ),
                  AuthFooter(isLogin: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
