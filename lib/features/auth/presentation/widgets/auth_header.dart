import 'package:flutter/material.dart';
import 'package:mego_food/core/const/app_assets.dart';
import 'package:mego_food/core/widgets/app_back_button.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppBackButton()),
        Image.asset(AppAssets.mego),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
