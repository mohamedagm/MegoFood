import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    super.key,
    required this.pinController,
    required this.isError,
    this.onChanged,
  });
  final TextEditingController pinController;
  final bool isError;
  final void Function(String)? onChanged;
  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.all(4),
      width: 75,
      height: 50,
      textStyle: TextStyle(
        fontSize: 22,
        color: theme.textTheme.bodyLarge?.color ?? Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.exColors.grey200, width: 2),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              onChanged: widget.onChanged,
              forceErrorState: widget.isError,
              length: 4,
              controller: widget.pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    width: 2,
                    height: 25,
                    color: context.exColors.primary600,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: context.exColors.primary600,
                    width: 2,
                  ),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: context.exColors.primary600,
                    width: 2,
                  ),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: context.exColors.red, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.pinController.dispose();
    super.dispose();
  }
}
