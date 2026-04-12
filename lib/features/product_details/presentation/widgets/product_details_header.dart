import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';

class ProductDetailsHeader extends StatelessWidget {
  const ProductDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBackButton(),
        Row(
          spacing: 20,
          children: [
            SvgPicture.asset('assets/icons/Share.svg'),
            SvgPicture.asset(
              'assets/icons/Like filled.svg',
              colorFilter: ColorFilter.mode(
                context.exColors.red,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
