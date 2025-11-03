import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.exColors;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colors.grey100,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: SvgPicture.asset(
        'assets/icons/Camera filled.svg',
        color: colors.grey500,
      ),
    );
  }
}
