import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';

class SuggestionItem extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const SuggestionItem({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: SvgPicture.asset('assets/icons/Trending.svg'),
      title: Text(text, style: context.exTextStyles.medium400),
      onTap: onTap,
    );
  }
}
