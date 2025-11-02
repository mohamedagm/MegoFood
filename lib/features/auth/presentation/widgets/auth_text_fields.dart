import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/utils/validators/email_validator.dart';
import 'package:mego_food/core/utils/validators/password_validator.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/presentation/widgets/live_validate_password.dart';

class AuthTextFields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const AuthTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<AuthTextFields> createState() => _AuthTextFieldsState();
}

class _AuthTextFieldsState extends State<AuthTextFields> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppTextField(
          validator: (value) => emailValidator(value),
          emailController: widget.emailController,
          hintText: 'email address',
        ),
        AppTextField(
          validator: (value) => passwordValidator(value),
          emailController: widget.passwordController,
          obscureText: !isVisible,
          hintText: 'password',
          suffixIcon: InkWell(
            onTap: () => setState(() => isVisible = !isVisible),
            child: SvgPicture.asset(
              isVisible
                  ? 'assets/icons/Not visible.svg'
                  : 'assets/icons/Visible.svg',
            ),
          ),
        ),
        if (widget.passwordController.text.isNotEmpty)
          LiveValidatePassword(passwordController: widget.passwordController),
      ],
    );
  }
}
