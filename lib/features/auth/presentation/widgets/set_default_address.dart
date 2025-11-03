import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class SetDefaultAddress extends StatelessWidget {
  const SetDefaultAddress({
    super.key,
    required this.onToggle,
    required this.status,
  });
  final void Function(bool) onToggle;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: context.exColors.grey50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Set as default',
            style: context.exTextStyles.medium400.copyWith(
              color: context.exColors.typography500,
            ),
          ),
          FlutterSwitch(
            toggleColor: context.exColors.grey400,
            inactiveColor: context.exColors.grey200,
            activeToggleColor: context.exColors.baseWhite,
            activeColor: context.exColors.primary600,
            width: 60.0,
            height: 30.0,
            toggleSize: 20.0,
            value: status,
            borderRadius: 32.0,
            padding: 4.0,
            showOnOff: false,
            onToggle: onToggle,
          ),
        ],
      ),
    );
  }
}
