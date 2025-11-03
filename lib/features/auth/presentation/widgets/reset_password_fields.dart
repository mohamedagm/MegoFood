import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/utils/validators/password_validator.dart';
import 'package:mego_food/core/widgets/app_text_field.dart';
import 'package:mego_food/features/auth/presentation/widgets/live_validate_password.dart';

class ResetPasswordFields extends StatefulWidget {
  final TextEditingController newPasswordController;
  final TextEditingController reNewPasswordController;
  final void Function(String)? onChanged;

  const ResetPasswordFields({
    super.key,
    required this.newPasswordController,
    required this.reNewPasswordController,
    this.onChanged,
  });

  @override
  State<ResetPasswordFields> createState() => _ResetPasswordFieldsState();
}

class _ResetPasswordFieldsState extends State<ResetPasswordFields> {
  bool isVisible1 = false;
  bool isVisible2 = false;

  Widget visibleOrNot({required bool visible, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        visible ? 'assets/icons/Not visible.svg' : 'assets/icons/Visible.svg',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        AppTextField(
          onChanged: widget.onChanged,
          validator: (value) => passwordValidator(value),
          controller: widget.newPasswordController,
          obscureText: !isVisible1,
          hintText: 'new password',
          suffixIcon: visibleOrNot(
            visible: isVisible1,
            onTap: () => setState(() => isVisible1 = !isVisible1),
          ),
        ),
        AppTextField(
          validator: (value) {
            if (widget.newPasswordController.text !=
                widget.reNewPasswordController.text) {
              return 'must be = new password field';
            }
            return null;
          },
          controller: widget.reNewPasswordController,
          obscureText: !isVisible2,
          hintText: 're-enter the new password',
          suffixIcon: visibleOrNot(
            visible: isVisible2,
            onTap: () => setState(() => isVisible2 = !isVisible2),
          ),
        ),
        if (widget.newPasswordController.text.isNotEmpty)
          LiveValidatePassword(
            passwordController: widget.newPasswordController,
          ),
      ],
    );
  }
}
