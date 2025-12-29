import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,

    // اللون الأساسي للتطبيق
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: Colors.white,
      surface: AppColors.surface,
      background: AppColors.background,
      error: AppColors.error,
    ),

    scaffoldBackgroundColor: AppColors.background,

    // ===== AppBar =====
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.textPrimary),
      titleTextStyle: AppTextStyles.sectionTitle,
    ),

    // ===== النصوص الافتراضية =====
textTheme: const TextTheme(
  // Display - للعناوين الكبيرة جداً
  displayLarge: AppTextStyles.movieTitleLarge,  // حجم 30، وزن 900
  displayMedium: AppTextStyles.title,          // حجم 32، وزن 700 (احتياطي)
  displaySmall: AppTextStyles.headline,        // حجم 24، وزن 800
  
  // Headline - للعناوين الرئيسية
  headlineLarge: AppTextStyles.headline,       // حجم 24، وزن 800
  headlineMedium: AppTextStyles.subtitle,      // حجم 20، وزن 600
  headlineSmall: AppTextStyles.sectionTitle,   // حجم 18، وزن 700
  
  // Title - لعناوين الأقسام
  titleLarge: AppTextStyles.movieTitle,        // حجم 20، وزن 700
  titleMedium: AppTextStyles.sectionTitle,     // حجم 18، وزن 700
  titleSmall: AppTextStyles.movieInfoSemiBold, // حجم 14، وزن 600
  
  // Body - للنصوص الأساسية
  bodyLarge: AppTextStyles.bodyLarge,          // حجم 16، وزن 400
  bodyMedium: AppTextStyles.body,              // حجم 16، وزن 400
  bodySmall: AppTextStyles.reviewContent,      // حجم 14، وزن 400
  
  // Label - للتسميات والأزرار
  labelLarge: AppTextStyles.buttonLarge,       // حجم 18، وزن 700
  labelMedium: AppTextStyles.button,           // حجم 16، وزن 600
  labelSmall: AppTextStyles.buttonSmallSemiBold, // حجم 12، وزن 600
  
  // Override للأنواع الخاصة
).apply(
  displayColor: AppColors.textPrimary,
  bodyColor: AppColors.textPrimary,
),

    // ===== الأزرار الأساسية =====
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: AppTextStyles.buttonLarge, 
        minimumSize: const Size.fromHeight(56), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
        elevation: 0,
      ),
    ),

    // ===== TextButton (روابط مثل Forgot Password) =====
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTextStyles.buttonSmall, 
      ),
    ),

    // ===== Input Fields =====
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      hintStyle: AppTextStyles.inputPlaceholder, 
      labelStyle: AppTextStyles.label,
      floatingLabelStyle: AppTextStyles.labelSemiBold,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16, 
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.inputBorder,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.inputBorder,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
    ),

    // ===== Divider =====
    dividerTheme: const DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
    ),

    // ===== Icons =====
    iconTheme: const IconThemeData(
      color: AppColors.icon,
      size: 24, 
    ),
  );
}