import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mego_food/core/routing/app_routes.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
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
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      if (passwordController.text.isEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            GoRouter.of(
                              context,
                            ).push(AppRoutes.otpAfterRegister);
                          }
                        },
                        buttonType: emailController.text.isEmpty
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        child: Text('Create account'),
                      ),
                      AuthFooter(isLogin: false),
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
