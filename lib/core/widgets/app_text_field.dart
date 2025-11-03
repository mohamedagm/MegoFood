import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
  });

  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: '●',
      validator: validator,
      onChanged: onChanged,
      style: context.exTextStyles.medium400.copyWith(
        color: context.exColors.typography500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: context.exColors.grey0,
        hintStyle: context.exTextStyles.medium400.copyWith(
          color: context.exColors.typography200,
        ),
        hintText: hintText,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: suffixIcon,
        ),
        suffixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: context.exColors.grey200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: context.exColors.grey200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: context.exColors.primary600),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: context.exColors.red),
        ),
      ),
    );
  }
}
