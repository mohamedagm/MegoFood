import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/icons/Cart tilted.svg', width: 28, height: 28),
        Text('Cart', style: context.exTextStyles.large),
      ],
    );
  }
}
