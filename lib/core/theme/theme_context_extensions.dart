import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/app_colors_extension.dart';
import 'package:mego_food/core/theme/app_text_style_extension.dart';

extension BuildContextX on BuildContext {
  AppColorsExtension get exColors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  AppTextStylesExtension get exTextStyles =>
      Theme.of(this).extension<AppTextStylesExtension>()!;
}
