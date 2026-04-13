import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: _lightColorScheme(),
      scaffoldBackgroundColor: AppColors.surface,
      textTheme: _textTheme(Brightness.light),
    );

    return base.copyWith(
      appBarTheme: _appBarTheme(base.colorScheme),
      cardTheme: _cardTheme(base.colorScheme),
      chipTheme: _chipTheme(base.colorScheme),
      dividerTheme: _dividerTheme(base.colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(base.colorScheme),
      filledButtonTheme: _filledButtonTheme(base.colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(base.colorScheme),
      inputDecorationTheme: _inputDecorationTheme(base.colorScheme),
      snackBarTheme: _snackBarTheme(base.colorScheme),
      bottomSheetTheme: _bottomSheetTheme(base.colorScheme),
      dialogTheme: _dialogTheme(base.colorScheme),
      listTileTheme: _listTileTheme(base.colorScheme),
      iconTheme: IconThemeData(color: base.colorScheme.onSurfaceVariant),
    );
  }

  static ThemeData dark() {
    final base = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: _darkColorScheme(),
      scaffoldBackgroundColor: AppColors.darkSurface,
      textTheme: _textTheme(Brightness.dark),
    );

    return base.copyWith(
      appBarTheme: _appBarTheme(base.colorScheme),
      cardTheme: _cardTheme(base.colorScheme),
      chipTheme: _chipTheme(base.colorScheme),
      dividerTheme: _dividerTheme(base.colorScheme),
      elevatedButtonTheme: _elevatedButtonTheme(base.colorScheme),
      filledButtonTheme: _filledButtonTheme(base.colorScheme),
      outlinedButtonTheme: _outlinedButtonTheme(base.colorScheme),
      inputDecorationTheme: _inputDecorationTheme(base.colorScheme),
      snackBarTheme: _snackBarTheme(base.colorScheme),
      bottomSheetTheme: _bottomSheetTheme(base.colorScheme),
      dialogTheme: _dialogTheme(base.colorScheme),
      listTileTheme: _listTileTheme(base.colorScheme),
      iconTheme: IconThemeData(color: base.colorScheme.onSurfaceVariant),
    );
  }

  static ColorScheme _lightColorScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.trustNavy,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFDCE5F2),
      onPrimaryContainer: AppColors.trustNavyDark,
      secondary: AppColors.skyBlue,
      onSecondary: Colors.white,
      secondaryContainer: AppColors.skyBlueSoft,
      onSecondaryContainer: AppColors.trustNavyDark,
      tertiary: AppColors.safeGreen,
      onTertiary: Colors.white,
      tertiaryContainer: AppColors.safeGreenSoft,
      onTertiaryContainer: AppColors.textPrimary,
      error: AppColors.emergencyRed,
      onError: Colors.white,
      errorContainer: AppColors.emergencyRedSoft,
      onErrorContainer: AppColors.textPrimary,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      surfaceContainerHighest: AppColors.surfaceElevated,
      onSurfaceVariant: AppColors.textSecondary,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
      shadow: AppColors.shadow,
      scrim: Colors.black,
      inverseSurface: AppColors.trustNavyDark,
      onInverseSurface: Colors.white,
      inversePrimary: AppColors.skyBlueSoft,
      surfaceTint: AppColors.trustNavy,
    );
  }

  static ColorScheme _darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.skyBlue,
      onPrimary: AppColors.trustNavyDark,
      primaryContainer: Color(0xFF173560),
      onPrimaryContainer: Colors.white,
      secondary: Color(0xFF72B4FF),
      onSecondary: AppColors.trustNavyDark,
      secondaryContainer: Color(0xFF1E3A5C),
      onSecondaryContainer: Colors.white,
      tertiary: AppColors.safeGreen,
      onTertiary: AppColors.darkSurface,
      tertiaryContainer: Color(0xFF123B27),
      onTertiaryContainer: Colors.white,
      error: Color(0xFFFF6A5E),
      onError: AppColors.darkSurface,
      errorContainer: Color(0xFF6A1A17),
      onErrorContainer: Colors.white,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      surfaceContainerHighest: AppColors.darkSurfaceElevated,
      onSurfaceVariant: AppColors.darkTextSecondary,
      outline: AppColors.darkOutline,
      outlineVariant: Color(0xFF203247),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: AppColors.surfaceElevated,
      onInverseSurface: AppColors.textPrimary,
      inversePrimary: AppColors.trustNavy,
      surfaceTint: AppColors.skyBlue,
    );
  }

  static TextTheme _textTheme(Brightness brightness) {
    final onSurface = brightness == Brightness.light
        ? AppColors.textPrimary
        : AppColors.darkTextPrimary;
    final secondary = brightness == Brightness.light
        ? AppColors.textSecondary
        : AppColors.darkTextSecondary;

    final base = Typography.material2021(platform: TargetPlatform.android)
        .black
        .apply(
          bodyColor: onSurface,
          displayColor: onSurface,
          fontFamily: null,
        );

    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.6,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.1,
        letterSpacing: -0.4,
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: -0.3,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.2,
        letterSpacing: -0.2,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.25,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.25,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        height: 1.3,
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontWeight: FontWeight.w400,
        height: 1.55,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontWeight: FontWeight.w400,
        height: 1.45,
        color: secondary,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      labelMedium: base.labelMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: 0.2,
      ),
    );
  }

  static AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      centerTitle: false,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: colorScheme.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    );
  }

  static CardThemeData _cardTheme(ColorScheme colorScheme) {
    return CardThemeData(
      color: colorScheme.surfaceContainerHighest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shadowColor: colorScheme.shadow,
      surfaceTintColor: colorScheme.surfaceTint.withValues(alpha: 0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
        side: BorderSide(color: colorScheme.outlineVariant),
      ),
    );
  }

  static ChipThemeData _chipTheme(ColorScheme colorScheme) {
    return ChipThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      selectedColor: colorScheme.primaryContainer,
      disabledColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.7),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      labelStyle: TextStyle(color: colorScheme.onSurface),
      secondaryLabelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      side: BorderSide(color: colorScheme.outlineVariant),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }

  static DividerThemeData _dividerTheme(ColorScheme colorScheme) {
    return DividerThemeData(
      color: colorScheme.outlineVariant,
      space: 1,
      thickness: 1,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ColorScheme colorScheme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static FilledButtonThemeData _filledButtonTheme(ColorScheme colorScheme) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ColorScheme colorScheme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorScheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xl,
          vertical: AppSpacing.md,
        ),
        side: BorderSide(color: colorScheme.outline),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ColorScheme colorScheme) {
    return InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colorScheme.secondary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: colorScheme.error, width: 1.5),
      ),
      labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
      hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
    );
  }

  static SnackBarThemeData _snackBarTheme(ColorScheme colorScheme) {
    return SnackBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      contentTextStyle: TextStyle(color: colorScheme.onInverseSurface),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }

  static BottomSheetThemeData _bottomSheetTheme(ColorScheme colorScheme) {
    return BottomSheetThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      modalBackgroundColor: colorScheme.surfaceContainerHighest,
      surfaceTintColor: Colors.transparent,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.xl),
        ),
      ),
    );
  }

  static DialogThemeData _dialogTheme(ColorScheme colorScheme) {
    return DialogThemeData(
      backgroundColor: colorScheme.surfaceContainerHighest,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.lg),
      ),
    );
  }

  static ListTileThemeData _listTileTheme(ColorScheme colorScheme) {
    return ListTileThemeData(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xs,
      ),
      iconColor: colorScheme.secondary,
      textColor: colorScheme.onSurface,
      tileColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
    );
  }
}


