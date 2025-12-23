import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class ToggleRow extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ToggleRow({super.key, required this.value, required this.onChanged});

  @override
  State<ToggleRow> createState() => _ToggleRowState();
}

class _ToggleRowState extends State<ToggleRow> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: context.exColors.grey50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            'Bobo Food +',
            style: context.exTextStyles.medium400.copyWith(
              color: context.exColors.typography500,
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: context.exColors.grey50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isOn = !isOn;
                });
              },
              child: Container(
                width: 50,
                height: 30,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: isOn
                      ? context.exColors.primary600
                      : context.exColors.grey0,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: context.exColors.grey200),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  alignment: isOn
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: isOn
                          ? context.exColors.baseWhite
                          : context.exColors.grey400,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
