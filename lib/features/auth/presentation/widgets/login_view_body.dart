import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/utils/functions/custom_snack_bar.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/manager/authCubit/auth_cubit.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_text_fields.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_footer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        if (state is AuthLoginSuccess) {
          customSnackbar(
            context,
            'your id: ${state.successLoginModel.userId}',
            SnackbarType.success,
          );
          GoRouter.of(context).go(AppRoutes.home);
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
                      'Log in to your\naccount',
                      style: context.exTextStyles.heading1,
                    ),
                  ),
                  AuthTextFields(
                    emailController: emailController,
                    passwordController: passwordController,
                    onChanged: (value) => setState(() {}),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.forgotPassword);
                    },
                    child: Text(
                      'forget password',
                      style: context.exTextStyles.medium700.copyWith(
                        color: context.exColors.primary600,
                      ),
                    ),
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
                            context.read<AuthCubit>().loginC(
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
                            : Text('Log In'),
                      );
                    },
                  ),
                  AuthFooter(isLogin: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
