import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tokens/colors.dart';
import 'tokens/radii.dart';
import 'tokens/typography.dart';

abstract final class RelateyTheme {
  static ThemeData get light {
    // Apply Manrope font to all text styles
    final textTheme = GoogleFonts.manropeTextTheme(
      const TextTheme(
        displayLarge: RelateyTypography.displayLarge,
        displayMedium: RelateyTypography.displayMedium,
        displaySmall: RelateyTypography.displaySmall,
        headlineLarge: RelateyTypography.headlineLarge,
        headlineMedium: RelateyTypography.headlineMedium,
        headlineSmall: RelateyTypography.headlineSmall,
        titleLarge: RelateyTypography.titleLarge,
        titleMedium: RelateyTypography.titleMedium,
        titleSmall: RelateyTypography.titleSmall,
        bodyLarge: RelateyTypography.bodyLarge,
        bodyMedium: RelateyTypography.bodyMedium,
        bodySmall: RelateyTypography.bodySmall,
        labelLarge: RelateyTypography.labelLarge,
        labelMedium: RelateyTypography.labelMedium,
        labelSmall: RelateyTypography.labelSmall,
      ),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: RelateyColors.primary,
        onPrimary: RelateyColors.textOnPrimary,
        primaryContainer: RelateyColors.primarySurface,
        onPrimaryContainer: RelateyColors.primaryDark,
        secondary: RelateyColors.primaryLight,
        onSecondary: RelateyColors.textPrimary,
        surface: RelateyColors.surface,
        onSurface: RelateyColors.textPrimary,
        error: RelateyColors.error,
        onError: RelateyColors.textOnPrimary,
        outline: RelateyColors.border,
        outlineVariant: RelateyColors.divider,
      ),
      scaffoldBackgroundColor: RelateyColors.background,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: RelateyColors.background,
        foregroundColor: RelateyColors.textPrimary,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        titleTextStyle: RelateyTypography.titleLarge,
        iconTheme: IconThemeData(color: RelateyColors.textPrimary, size: 24),
      ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: RelateyColors.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.border)),
        enabledBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.border)),
        focusedBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.primary, width: 1.5)),
        errorBorder: OutlineInputBorder(borderRadius: RelateyRadii.borderRadiusMd, borderSide: const BorderSide(color: RelateyColors.error)),
        hintStyle: RelateyTypography.bodyMedium.copyWith(color: RelateyColors.textTertiary),
        labelStyle: RelateyTypography.bodyMedium,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: RelateyColors.primary,
          foregroundColor: RelateyColors.textOnPrimary,
          disabledBackgroundColor: RelateyColors.border,
          disabledForegroundColor: RelateyColors.textTertiary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusMd),
          textStyle: RelateyTypography.buttonLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: RelateyColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusMd),
          textStyle: RelateyTypography.buttonMedium,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: RelateyColors.primary,
          side: const BorderSide(color: RelateyColors.primary),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusMd),
          textStyle: RelateyTypography.buttonLarge,
        ),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        color: RelateyColors.surface,
        shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusLg),
        margin: EdgeInsets.zero,
      ),
      dividerTheme: const DividerThemeData(color: RelateyColors.divider, thickness: 1, space: 1),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: RelateyColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(RelateyRadii.xxl))),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: RelateyColors.textPrimary,
        contentTextStyle: RelateyTypography.bodyMedium.copyWith(color: RelateyColors.surface),
        shape: RoundedRectangleBorder(borderRadius: RelateyRadii.borderRadiusMd),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
