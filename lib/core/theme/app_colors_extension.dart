import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  // 🌿 Primary
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;

  // ✍️ Typography
  final Color typography100;
  final Color typography200;
  final Color typography300;
  final Color typography400;
  final Color typography500;

  // ⚪ Grey
  final Color grey0;
  final Color grey50;
  final Color grey100;
  final Color grey200;
  final Color grey300;
  final Color grey400;
  final Color grey500;

  // 🎨 Other
  final Color red;
  final Color yellow;
  final Color blue;
  final Color green;
  final Color orange;

  // 💧 Transparent
  final Color grey500_6;
  final Color grey0_92;
  final Color primary600_24;
  final Color backgroundBlur;

  // 🌈 Gradient
  final Color gradientLight;
  final Color gradientDark;

  // ⚫ Base
  final Color baseWhite;
  final Color baseBlack;

  const AppColorsExtension({
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.typography100,
    required this.typography200,
    required this.typography300,
    required this.typography400,
    required this.typography500,
    required this.grey0,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.red,
    required this.yellow,
    required this.blue,
    required this.green,
    required this.orange,
    required this.grey500_6,
    required this.grey0_92,
    required this.primary600_24,
    required this.backgroundBlur,
    required this.gradientLight,
    required this.gradientDark,
    required this.baseWhite,
    required this.baseBlack,
  });

  // 🧬 copyWith
  @override
  AppColorsExtension copyWith({
    Color? primary100,
    Color? primary200,
    Color? primary300,
    Color? primary400,
    Color? primary500,
    Color? primary600,
    Color? primary700,
    Color? typography100,
    Color? typography200,
    Color? typography300,
    Color? typography400,
    Color? typography500,
    Color? grey0,
    Color? grey50,
    Color? grey100,
    Color? grey200,
    Color? grey300,
    Color? grey400,
    Color? grey500,
    Color? red,
    Color? yellow,
    Color? blue,
    Color? green,
    Color? orange,
    Color? grey500_6,
    Color? grey0_92,
    Color? primary600_24,
    Color? backgroundBlur,
    Color? gradientLight,
    Color? gradientDark,
    Color? baseWhite,
    Color? baseBlack,
  }) {
    return AppColorsExtension(
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      typography100: typography100 ?? this.typography100,
      typography200: typography200 ?? this.typography200,
      typography300: typography300 ?? this.typography300,
      typography400: typography400 ?? this.typography400,
      typography500: typography500 ?? this.typography500,
      grey0: grey0 ?? this.grey0,
      grey50: grey50 ?? this.grey50,
      grey100: grey100 ?? this.grey100,
      grey200: grey200 ?? this.grey200,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey500: grey500 ?? this.grey500,
      red: red ?? this.red,
      yellow: yellow ?? this.yellow,
      blue: blue ?? this.blue,
      green: green ?? this.green,
      orange: orange ?? this.orange,
      grey500_6: grey500_6 ?? this.grey500_6,
      grey0_92: grey0_92 ?? this.grey0_92,
      primary600_24: primary600_24 ?? this.primary600_24,
      backgroundBlur: backgroundBlur ?? this.backgroundBlur,
      gradientLight: gradientLight ?? this.gradientLight,
      gradientDark: gradientDark ?? this.gradientDark,
      baseWhite: baseWhite ?? this.baseWhite,
      baseBlack: baseBlack ?? this.baseBlack,
    );
  }

  @override
  AppColorsExtension lerp(ThemeExtension<AppColorsExtension>? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      primary100: Color.lerp(primary100, other.primary100, t)!,
      primary200: Color.lerp(primary200, other.primary200, t)!,
      primary300: Color.lerp(primary300, other.primary300, t)!,
      primary400: Color.lerp(primary400, other.primary400, t)!,
      primary500: Color.lerp(primary500, other.primary500, t)!,
      primary600: Color.lerp(primary600, other.primary600, t)!,
      primary700: Color.lerp(primary700, other.primary700, t)!,
      typography100: Color.lerp(typography100, other.typography100, t)!,
      typography200: Color.lerp(typography200, other.typography200, t)!,
      typography300: Color.lerp(typography300, other.typography300, t)!,
      typography400: Color.lerp(typography400, other.typography400, t)!,
      typography500: Color.lerp(typography500, other.typography500, t)!,
      grey0: Color.lerp(grey0, other.grey0, t)!,
      grey50: Color.lerp(grey50, other.grey50, t)!,
      grey100: Color.lerp(grey100, other.grey100, t)!,
      grey200: Color.lerp(grey200, other.grey200, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey400: Color.lerp(grey400, other.grey400, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
      red: Color.lerp(red, other.red, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      green: Color.lerp(green, other.green, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      grey500_6: Color.lerp(grey500_6, other.grey500_6, t)!,
      grey0_92: Color.lerp(grey0_92, other.grey0_92, t)!,
      primary600_24: Color.lerp(primary600_24, other.primary600_24, t)!,
      backgroundBlur: Color.lerp(backgroundBlur, other.backgroundBlur, t)!,
      gradientLight: Color.lerp(gradientLight, other.gradientLight, t)!,
      gradientDark: Color.lerp(gradientDark, other.gradientDark, t)!,
      baseWhite: Color.lerp(baseWhite, other.baseWhite, t)!,
      baseBlack: Color.lerp(baseBlack, other.baseBlack, t)!,
    );
  }

  // ☀️ Light Theme
  static const light = AppColorsExtension(
    primary100: Color(0xFFECF1E8),
    primary200: Color(0xFFDDEFCE),
    primary300: Color(0xFFB7EC8C),
    primary400: Color(0xFF8BDE47),
    primary500: Color(0xFF67BD1F),
    primary600: Color(0xFF54A312),
    primary700: Color(0xFF408308),
    typography100: Color(0xFFB6B8B5),
    typography200: Color(0xFF91958E),
    typography300: Color(0xFF70756B),
    typography400: Color(0xFF60655C),
    typography500: Color(0xFF363A33),
    grey0: Color(0xFFFFFFFF),
    grey50: Color(0xFFF9FAF8),
    grey100: Color(0xFFF4F7F2),
    grey200: Color(0xFFE8EBE6),
    grey300: Color(0xFFA9ADA5),
    grey400: Color(0xFF91958E),
    grey500: Color(0xFF60635E),
    red: Color(0xFFE25839),
    yellow: Color(0xFFF5AE42),
    blue: Color(0xFF24B5D4),
    green: Color(0xFF45B733),
    orange: Color(0xFFE8712E),
    grey500_6: Color(0x0F60635E),
    grey0_92: Color(0xEBFFFFFF),
    primary600_24: Color(0x3D54A312),
    backgroundBlur: Color(0xCC9FA19E),
    gradientLight: Color(0xFF5EAD1D),
    gradientDark: Color(0xFF54A312),
    baseWhite: Color(0xFFFFFFFF),
    baseBlack: Color(0xFF232522),
  );

  // 🌑 Dark Theme
  static const dark = AppColorsExtension(
    primary100: Color(0xFF3B3F38),
    primary200: Color(0xFF3E532D),
    primary300: Color(0xFF436923),
    primary400: Color(0xFF5D9E26),
    primary500: Color(0xFF6CB231),
    primary600: Color(0xFF70BA32),
    primary700: Color(0xFF88CD4E),
    typography100: Color(0xFF7F7F7E),
    typography200: Color(0xFF888A87),
    typography300: Color(0xFF9FA19E),
    typography400: Color(0xFFC8C9C7),
    typography500: Color(0xFFEEF0ED),
    grey0: Color(0xFF262725),
    grey50: Color(0xFF2D2E2C),
    grey100: Color(0xFF313330),
    grey200: Color(0xFF3D3D3D),
    grey300: Color(0xFF7A7A79),
    grey400: Color(0xFF989998),
    grey500: Color(0xFFD5D6D3),
    red: Color(0xFFFB6A57),
    yellow: Color(0xFFFBB650),
    blue: Color(0xFF6FBDCE),
    green: Color(0xFF8CEC7D),
    orange: Color(0xFFE48047),
    grey500_6: Color(0x0FD5D6D3),
    grey0_92: Color(0xEB262725),
    primary600_24: Color(0x3D70BA32),
    backgroundBlur: Color(0xE0262725),
    gradientLight: Color(0xFF6CB231),
    gradientDark: Color(0xFF6CB231),
    baseWhite: Color(0xFFFFFFFF),
    baseBlack: Color(0xFFF0EFED),
  );
}
