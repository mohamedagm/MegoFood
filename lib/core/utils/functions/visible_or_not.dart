import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InkWell visibleOrNot({required bool visible, required void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: SvgPicture.asset(
      visible ? 'assets/icons/Not visible.svg' : 'assets/icons/Visible.svg',
    ),
  );
}
