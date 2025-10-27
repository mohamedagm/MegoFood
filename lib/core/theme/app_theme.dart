import 'package:flutter/material.dart';
import 'package:mego_food/core/theme/app_text_style.dart';
import 'app_colors.dart';

class AppTheme {
  // 🌞 LIGHT THEME
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.light.grey50,
    primaryColor: AppColors.light.primary500,
    colorScheme: ColorScheme.light(
      primary: AppColors.light.primary500,
      secondary: AppColors.light.primary300,
      surface: AppColors.light.grey0,
      error: AppColors.light.red,
      onPrimary: Colors.white,
      onSurface: AppColors.light.typography500,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.light.grey0,
      elevation: 0,
      foregroundColor: AppColors.light.typography500,
      titleTextStyle: AppTextStyles.medium700.copyWith(
        color: AppColors.light.typography500,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading1.copyWith(
        color: AppColors.light.typography500,
      ),
      headlineMedium: AppTextStyles.heading2.copyWith(
        color: AppColors.light.typography400,
      ),
      bodyLarge: AppTextStyles.large400.copyWith(
        color: AppColors.light.typography400,
      ),
      bodyMedium: AppTextStyles.medium400.copyWith(
        color: AppColors.light.typography400,
      ),
      bodySmall: AppTextStyles.small500.copyWith(
        color: AppColors.light.typography400,
      ),
      labelLarge: AppTextStyles.medium600.copyWith(
        color: AppColors.light.primary600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.light.primary500,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.medium600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.light.grey100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.light.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.light.primary500),
      ),
      labelStyle: AppTextStyles.small500.copyWith(
        color: AppColors.light.typography300,
      ),
      hintStyle: AppTextStyles.small500.copyWith(
        color: AppColors.light.typography200,
      ),
    ),
  );

  // 🌑 DARK THEME
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.dark.grey0,
    primaryColor: AppColors.dark.primary500,
    colorScheme: ColorScheme.dark(
      primary: AppColors.dark.primary500,
      secondary: AppColors.dark.primary300,
      surface: AppColors.dark.grey50,
      error: AppColors.dark.red,
      onPrimary: Colors.black,
      onSurface: AppColors.dark.typography500,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.dark.grey50,
      elevation: 0,
      foregroundColor: AppColors.dark.typography500,
      titleTextStyle: AppTextStyles.medium700.copyWith(
        color: AppColors.dark.typography500,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.heading1.copyWith(
        color: AppColors.dark.typography500,
      ),
      headlineMedium: AppTextStyles.heading2.copyWith(
        color: AppColors.dark.typography400,
      ),
      bodyLarge: AppTextStyles.large400.copyWith(
        color: AppColors.dark.typography400,
      ),
      bodyMedium: AppTextStyles.medium400.copyWith(
        color: AppColors.dark.typography400,
      ),
      bodySmall: AppTextStyles.small500.copyWith(
        color: AppColors.dark.typography400,
      ),
      labelLarge: AppTextStyles.medium600.copyWith(
        color: AppColors.dark.primary600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.dark.primary500,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.medium600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dark.grey50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.dark.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.dark.primary500),
      ),
      labelStyle: AppTextStyles.small500.copyWith(
        color: AppColors.dark.typography300,
      ),
      hintStyle: AppTextStyles.small500.copyWith(
        color: AppColors.dark.typography200,
      ),
    ),
  );
}
