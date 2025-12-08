import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.sideWidth = 70,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final double sideWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: sideWidth, child: leading ?? const SizedBox()),

        Expanded(child: Center(child: title ?? const SizedBox())),

        SizedBox(
          width: sideWidth,
          child: actions != null && actions!.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
