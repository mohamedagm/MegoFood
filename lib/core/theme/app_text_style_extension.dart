import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mego_food/core/theme/app_colors_extension.dart';

class AppTextStylesExtension extends ThemeExtension<AppTextStylesExtension> {
  // ---------- POPPINS ----------
  final TextStyle heading1;
  final TextStyle heading2;

  final TextStyle large;
  final TextStyle large400;
  final TextStyle large600;
  final TextStyle large700;

  final TextStyle medium;
  final TextStyle medium400;
  final TextStyle medium600;
  final TextStyle medium700;

  final TextStyle small;
  final TextStyle small500;
  final TextStyle small600;
  final TextStyle small700;

  // ---------- ROBOTO ----------
  final TextStyle robotoHeading;
  final TextStyle robotoLarge;
  final TextStyle robotoMedium;
  final TextStyle robotoSmall;

  // ---------- ROBOTO MONO ----------
  final TextStyle robotoMonoMedium;

  const AppTextStylesExtension({
    required this.heading1,
    required this.heading2,
    required this.large,
    required this.large400,
    required this.large600,
    required this.large700,
    required this.medium,
    required this.medium400,
    required this.medium600,
    required this.medium700,
    required this.small,
    required this.small500,
    required this.small600,
    required this.small700,
    required this.robotoHeading,
    required this.robotoLarge,
    required this.robotoMedium,
    required this.robotoSmall,
    required this.robotoMonoMedium,
  });

  @override
  AppTextStylesExtension copyWith({
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? large,
    TextStyle? large400,
    TextStyle? large600,
    TextStyle? large700,
    TextStyle? medium,
    TextStyle? medium400,
    TextStyle? medium600,
    TextStyle? medium700,
    TextStyle? small,
    TextStyle? small500,
    TextStyle? small600,
    TextStyle? small700,
    TextStyle? robotoHeading,
    TextStyle? robotoLarge,
    TextStyle? robotoMedium,
    TextStyle? robotoSmall,
    TextStyle? robotoMonoMedium,
  }) {
    return AppTextStylesExtension(
      heading1: heading1 ?? this.heading1,
      heading2: heading2 ?? this.heading2,
      large: large ?? this.large,
      large400: large400 ?? this.large400,
      large600: large600 ?? this.large600,
      large700: large700 ?? this.large700,
      medium: medium ?? this.medium,
      medium400: medium400 ?? this.medium400,
      medium600: medium600 ?? this.medium600,
      medium700: medium700 ?? this.medium700,
      small: small ?? this.small,
      small500: small500 ?? this.small500,
      small600: small600 ?? this.small600,
      small700: small700 ?? this.small700,
      robotoHeading: robotoHeading ?? this.robotoHeading,
      robotoLarge: robotoLarge ?? this.robotoLarge,
      robotoMedium: robotoMedium ?? this.robotoMedium,
      robotoSmall: robotoSmall ?? this.robotoSmall,
      robotoMonoMedium: robotoMonoMedium ?? this.robotoMonoMedium,
    );
  }

  @override
  AppTextStylesExtension lerp(
    ThemeExtension<AppTextStylesExtension>? other,
    double t,
  ) {
    if (other is! AppTextStylesExtension) return this;
    return AppTextStylesExtension(
      heading1: TextStyle.lerp(heading1, other.heading1, t)!,
      heading2: TextStyle.lerp(heading2, other.heading2, t)!,
      large: TextStyle.lerp(large, other.large, t)!,
      large400: TextStyle.lerp(large400, other.large400, t)!,
      large600: TextStyle.lerp(large600, other.large600, t)!,
      large700: TextStyle.lerp(large700, other.large700, t)!,
      medium: TextStyle.lerp(medium, other.medium, t)!,
      medium400: TextStyle.lerp(medium400, other.medium400, t)!,
      medium600: TextStyle.lerp(medium600, other.medium600, t)!,
      medium700: TextStyle.lerp(medium700, other.medium700, t)!,
      small: TextStyle.lerp(small, other.small, t)!,
      small500: TextStyle.lerp(small500, other.small500, t)!,
      small600: TextStyle.lerp(small600, other.small600, t)!,
      small700: TextStyle.lerp(small700, other.small700, t)!,
      robotoHeading: TextStyle.lerp(robotoHeading, other.robotoHeading, t)!,
      robotoLarge: TextStyle.lerp(robotoLarge, other.robotoLarge, t)!,
      robotoMedium: TextStyle.lerp(robotoMedium, other.robotoMedium, t)!,
      robotoSmall: TextStyle.lerp(robotoSmall, other.robotoSmall, t)!,
      robotoMonoMedium: TextStyle.lerp(
        robotoMonoMedium,
        other.robotoMonoMedium,
        t,
      )!,
    );
  }

  // ---------- LIGHT INSTANCE ----------
  static final light = AppTextStylesExtension(
    // Poppins
    heading1: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.02,
      height: 1.2,
      color: AppColorsExtension.light.typography500,
    ),
    heading2: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.0,
    ),

    large: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.3,
    ),
    large400: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.01,
      height: 1.5,
    ),
    large600: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.01,
      height: 1.5,
    ),
    large700: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.5,
    ),

    medium: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.3,
    ),
    medium400: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.7,
      color: AppColorsExtension.light.typography400,
    ),
    medium600: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.7,
      color: AppColorsExtension.light.typography300,
    ),
    medium700: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      height: 1.7,
    ),

    small: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.3,
    ),
    small500: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.7,
    ),
    small600: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.7,
    ),
    small700: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      height: 1.7,
    ),

    // Roboto
    robotoHeading: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.02,
      height: 1.0,
    ),
    robotoLarge: GoogleFonts.roboto(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.3,
    ),
    robotoMedium: GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),
    robotoSmall: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.3,
    ),

    // Roboto Mono
    robotoMonoMedium: GoogleFonts.robotoMono(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.7,
    ),
  );

  // ---------- DARK INSTANCE ----------
  static final dark = AppTextStylesExtension(
    // Poppins
    heading1: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.02,
      height: 1.2,
      color: AppColorsExtension.dark.typography500,
    ),
    heading2: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.0,
      color: Colors.white,
    ),

    large: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.3,
      color: Colors.white,
    ),
    large400: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.01,
      height: 1.5,
      color: Colors.white70,
    ),
    large600: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.01,
      height: 1.5,
      color: Colors.white,
    ),
    large700: GoogleFonts.poppins(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.5,
      color: Colors.white,
    ),

    medium: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: Colors.white70,
    ),
    medium400: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.7,
      color: AppColorsExtension.dark.typography400,
    ),
    medium600: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.7,
      color: AppColorsExtension.dark.typography300,
    ),
    medium700: GoogleFonts.poppins(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      height: 1.7,
      color: AppColorsExtension.dark.baseWhite,
    ),

    small: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: Colors.white60,
    ),
    small500: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.7,
      color: Colors.white60,
    ),
    small600: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.7,
      color: Colors.white70,
    ),
    small700: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      height: 1.7,
      color: Colors.white,
    ),

    // Roboto
    robotoHeading: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.02,
      height: 1.0,
      color: Colors.white,
    ),
    robotoLarge: GoogleFonts.roboto(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.01,
      height: 1.3,
      color: Colors.white,
    ),
    robotoMedium: GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: Colors.white70,
    ),
    robotoSmall: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: Colors.white70,
    ),

    // Roboto Mono
    robotoMonoMedium: GoogleFonts.robotoMono(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.7,
      color: Colors.white70,
    ),
  );
}
