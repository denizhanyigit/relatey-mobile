import 'package:flutter/material.dart';

abstract final class RelateyColors {
  // Primary palette - teal-green brand color
  static const Color primary = Color(0xFF4D8077);
  static const Color primaryLight = Color(0xFF6A9A91);
  static const Color primaryDark = Color(0xFF3A615A);
  static const Color primarySurface = Color(0xFFEDF3F1);
  static const Color primarySubtle = Color(0x0D4D8077); // primary at 5%

  // Backgrounds
  static const Color background = Color(0xFFFAFAF9);
  static const Color backgroundDark = Color(0xFF161C1B);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF202625);
  static const Color surfaceVariant = Color(0xFFF5F5F3);

  // Header gradient
  static const Color headerGradientStart = Color(0xFFEEF2F1);
  static const Color headerGradientStartDark = Color(0xFF1C2423);

  // Text colors
  static const Color textPrimary = Color(0xFF121616);
  static const Color textHeading = Color(0xFF1C2E2A);
  static const Color textSecondary = Color(0xFF677E7A);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF9CA3AF);

  // Accent purple palette (for icons/decorative elements)
  static const Color accentPurple = Color(0xFF9D8DA8);
  static const Color accentPurpleSurface = Color(0xFFF3EFF6);
  static const Color accentPurpleSurfaceDark = Color(0xFF342E3B);
  static const Color accentPurpleDark = Color(0xFFBFAEC9);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFE57373);
  static const Color info = Color(0xFF64B5F6);

  // Borders and dividers
  static const Color border = Color(0xFFE5E5E3);
  static const Color borderSubtle = Color(0x0D000000); // 5% black
  static const Color divider = Color(0xFFF0F0EE);
  static const Color dividerSubtle = Color(0x14000000); // 8% black

  // Shadows and overlays
  static const Color shadow = Color(0x0A000000);
  static const Color shadowMedium = Color(0x14000000);
  static const Color shadowStrong = Color(0x1F000000); // 12% for nav
  static const Color shadowPrimary = Color(0x264D8077); // primary with 15% opacity
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  // Glass/blur effect colors
  static const Color glassWhite = Color(0xE6FFFFFF); // 90% white
  static const Color glassDark = Color(0xE6202625); // 90% dark surface
  static const Color glassBorder = Color(0x33FFFFFF); // 20% white

  // Decorative background orbs (for homepage)
  static const Color orbWarm = Color(0xFFE8E4E1);
  static const Color orbPrimary = Color(0x1A4D8077); // primary at 10%
}
