import 'package:flutter/material.dart';

class AppColors {
  static final light = _LightColors();
  static final dark = _DarkColors();
}

/// ☀️ Light Theme Colors
class _LightColors {
  // 🌿 Primary
  final Color primary100 = const Color(0xFFECF1E8);
  final Color primary200 = const Color(0xFFDDEFCE);
  final Color primary300 = const Color(0xFFB7EC8C);
  final Color primary400 = const Color(0xFF8BDE47);
  final Color primary500 = const Color(0xFF67BD1F);
  final Color primary600 = const Color(0xFF54A312);
  final Color primary700 = const Color(0xFF408308);

  // ✍️ Typography
  final Color typography100 = const Color(0xFFB6B8B5);
  final Color typography200 = const Color(0xFF91958E);
  final Color typography300 = const Color(0xFF70756B);
  final Color typography400 = const Color(0xFF60655C);
  final Color typography500 = const Color(0xFF363A33);

  // ⚪ Grey
  final Color grey0 = const Color(0xFFFFFFFF);
  final Color grey50 = const Color(0xFFF9FAF8);
  final Color grey100 = const Color(0xFFF4F7F2);
  final Color grey200 = const Color(0xFFE8EBE6);
  final Color grey300 = const Color(0xFFA9ADA5);
  final Color grey400 = const Color(0xFF91958E);
  final Color grey500 = const Color(0xFF60635E);

  // 🎨 Other
  final Color red = const Color(0xFFE25839);
  final Color yellow = const Color(0xFFF5AE42);
  final Color blue = const Color(0xFF24B5D4);
  final Color green = const Color(0xFF45B733);
  final Color orange = const Color(0xFFE8712E);

  // 💧 Transparent
  final Color grey500_6 = const Color(0x0F60635E);
  final Color grey0_92 = const Color(0xEBFFFFFF);
  final Color primary600_24 = const Color(0x3D54A312);
  final Color backgroundBlur80 = const Color(0xCC9FA19E);

  // 🌈 Gradient
  final Color gradientLight = const Color(0xFF5EAD1D);
  final Color gradientDark = const Color(0xFF54A312);

  // ⚫ Base
  final Color baseWhite = const Color(0xFFFFFFFF);
  final Color baseBlack = const Color(0xFF232522);
}

/// 🌑 Dark Theme Colors
class _DarkColors {
  // 🌿 Primary
  final Color primary100 = const Color(0xFF3B3F38);
  final Color primary200 = const Color(0xFF3E532D);
  final Color primary300 = const Color(0xFF436923);
  final Color primary400 = const Color(0xFF5D9E26);
  final Color primary500 = const Color(0xFF6CB231);
  final Color primary600 = const Color(0xFF70BA32);
  final Color primary700 = const Color(0xFF88CD4E);

  // ✍️ Typography
  final Color typography100 = const Color(0xFF7F7F7E);
  final Color typography200 = const Color(0xFF888A87);
  final Color typography300 = const Color(0xFF9FA19E);
  final Color typography400 = const Color(0xFFC8C9C7);
  final Color typography500 = const Color(0xFFEEF0ED);

  // ⚪ Grey
  final Color grey0 = const Color(0xFF262725);
  final Color grey50 = const Color(0xFF2D2E2C);
  final Color grey100 = const Color(0xFF313330);
  final Color grey200 = const Color(0xFF3D3D3D);
  final Color grey300 = const Color(0xFF7A7A79);
  final Color grey400 = const Color(0xFF989998);
  final Color grey500 = const Color(0xFFD5D6D3);

  // 🎨 Other
  final Color red = const Color(0xFFFB6A57);
  final Color yellow = const Color(0xFFFBB650);
  final Color blue = const Color(0xFF6FBDCE);
  final Color green = const Color(0xFF8CEC7D);
  final Color orange = const Color(0xFFE48047);

  // 💧 Transparent
  final Color grey500_6 = const Color(0x0FD5D6D3);
  final Color grey0_92 = const Color(0xEB262725);
  final Color primary600_24 = const Color(0x3D70BA32);
  final Color backgroundBlur88 = const Color(0xE0262725);

  // 🌈 Gradient
  final Color gradientLight = const Color(0xFF6CB231);
  final Color gradientDark = const Color(0xFF6CB231);

  // ⚫ Base
  final Color baseWhite = const Color(0xFFFFFFFF);
  final Color baseBlack = const Color(0xFFF0EFED);
}
