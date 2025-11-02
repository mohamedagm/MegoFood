import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class LiveValidatePassword extends StatelessWidget {
  const LiveValidatePassword({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final password = passwordController.text;

    final validations = [
      {'text': 'At least 8 characters', 'isValid': password.length >= 8},
      {
        'text': 'Add an uppercase letter',
        'isValid': RegExp(r'[A-Z]').hasMatch(password),
      },
      {
        'text': 'Add a lowercase letter',
        'isValid': RegExp(r'[a-z]').hasMatch(password),
      },
      {'text': 'Add a number', 'isValid': RegExp(r'[0-9]').hasMatch(password)},
      {
        'text': 'Add a special character',
        'isValid': RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password),
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: validations.map((item) {
        final isValid = item['isValid'] as bool;
        final text = item['text'] as String;

        return AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          style: context.exTextStyles.large.copyWith(
            color: isValid
                ? context.exColors.primary600
                : context.exColors.primary200,
          ),
          child: Text(' ● $text ${isValid ? "✓" : ""}'),
        );
      }).toList(),
    );
  }
}
