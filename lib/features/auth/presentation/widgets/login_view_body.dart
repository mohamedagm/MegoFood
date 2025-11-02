import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_elevated_button.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_header.dart';
import 'package:mego_food/features/auth/presentation/widgets/auth_text_fields.dart';
import 'package:mego_food/features/auth/presentation/widgets/login_footer.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? empty;
  bool get isButtonEnabled =>
      emailController.text.trim().isNotEmpty &&
      passwordController.text.trim().isNotEmpty;

  @override
  void initState() {
    emailController.addListener(() {
      setState(() {
        empty = emailController.text.trim().isEmpty;
      });
    });
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
                          'Log in to your\naccount',
                          style: context.exTextStyles.heading1,
                        ),
                      ),
                      AuthTextFields(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'forget password',
                          style: context.exTextStyles.medium700.copyWith(
                            color: context.exColors.primary600,
                          ),
                        ),
                      ),
                      if (passwordController.text.isEmpty)
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                      ),
                      AppElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        buttonType: empty == true
                            ? AppButtonType.disabled
                            : AppButtonType.primary,
                        child: Text('Log In'),
                      ),
                      LoginFooter(),
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
