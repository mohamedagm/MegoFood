import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/app_text_style_extension.dart';
import 'app_colors_extension.dart';

class AppTheme {
  // 🌞 LIGHT THEME
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorsExtension.light.grey0,
    primaryColor: AppColorsExtension.light.primary500,

    colorScheme: ColorScheme.light(
      primary: AppColorsExtension.light.primary500,
      secondary: AppColorsExtension.light.primary300,
      surface: AppColorsExtension.light.grey0,
      error: AppColorsExtension.light.red,
      onPrimary: AppColorsExtension.light.baseWhite,
      onSurface: AppColorsExtension.light.typography500,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsExtension.light.grey0,
      elevation: 0,
      foregroundColor: AppColorsExtension.light.typography500,
      titleTextStyle: AppTextStylesExtension.light.medium600.copyWith(
        color: AppColorsExtension.light.typography500,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsExtension.light.primary500,
        foregroundColor: AppColorsExtension.light.baseWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStylesExtension.light.medium600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsExtension.light.grey100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsExtension.light.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsExtension.light.primary500),
      ),
      labelStyle: AppTextStylesExtension.light.small500.copyWith(
        color: AppColorsExtension.light.typography300,
      ),
      hintStyle: AppTextStylesExtension.light.small500.copyWith(
        color: AppColorsExtension.light.typography200,
      ),
    ),

    extensions: [AppColorsExtension.light, AppTextStylesExtension.light],
  );

  // 🌑 DARK THEME
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColorsExtension.dark.grey0,
    primaryColor: AppColorsExtension.dark.primary500,

    colorScheme: ColorScheme.dark(
      primary: AppColorsExtension.dark.primary500,
      secondary: AppColorsExtension.dark.primary300,
      surface: AppColorsExtension.dark.grey50,
      error: AppColorsExtension.dark.red,
      onPrimary: AppColorsExtension.dark.baseBlack,
      onSurface: AppColorsExtension.dark.typography500,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsExtension.dark.grey50,
      elevation: 0,
      foregroundColor: AppColorsExtension.dark.typography500,
      titleTextStyle: AppTextStylesExtension.dark.medium700.copyWith(
        color: AppColorsExtension.dark.typography500,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsExtension.dark.primary500,
        foregroundColor: AppColorsExtension.dark.baseBlack,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStylesExtension.dark.medium600,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsExtension.dark.grey50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsExtension.dark.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColorsExtension.dark.primary500),
      ),
      labelStyle: AppTextStylesExtension.dark.small500.copyWith(
        color: AppColorsExtension.dark.typography300,
      ),
      hintStyle: AppTextStylesExtension.dark.small500.copyWith(
        color: AppColorsExtension.dark.typography200,
      ),
    ),

    extensions: [AppColorsExtension.dark, AppTextStylesExtension.dark],
  );
}
