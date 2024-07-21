import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helper/utils/app_colors.dart';
import 'package:todo_app/core/helper/utils/app_text_styles.dart';

ThemeData getAppDarkTheme() {
  return ThemeData(
    //! brightness dark
    brightness: Brightness.dark,
    //! primary color
    primaryColor: AppColors.primaryColor,
    //! scaffoldBackgroundColor
    scaffoldBackgroundColor: AppColors.backgroundColor,
    //! appBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      elevation: 0.0,
      titleTextStyle: AppTextStyles.lato700style30,
    ),
    //! floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),

    //! text theme
    fontFamily: 'Lato',

    textTheme: _textTheme(),
    //! button theme
    elevatedButtonTheme: _elevatedButtonThemeData(),
    //! input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //? error message style
      errorStyle: AppTextStyles.lato400style15.copyWith(fontSize: 14.sp),
      //? borde
      border: _outlineInputBorder(AppColors.grey),
      //? enabled border
      enabledBorder: _outlineInputBorder(AppColors.grey),
      //? fouced border
      focusedBorder: _outlineInputBorder(AppColors.grey),
      //? hint
      hintStyle: AppTextStyles.lato400style16,
      //? fill color
      fillColor: AppColors.lightBlack,
      filled: true,
    ),
  );
}

//
ThemeData getAppLightTheme() {
  return ThemeData(
    //! brightness light
    brightness: Brightness.light,
    //! primary color
    primaryColor: AppColors.primaryColor,

    //! appBar theme
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      titleTextStyle: AppTextStyles.lato700style30
          .copyWith(color: AppColors.backgroundColor),
    ),
    //! floating action button theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),

    //! text theme
    fontFamily: 'Lato',

    textTheme: _textTheme(),
    //! button theme
    elevatedButtonTheme: _elevatedButtonThemeData(),
    //! input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      //? error message style
      errorStyle: AppTextStyles.lato400style15.copyWith(fontSize: 14.sp),
      //? border
      border: _outlineInputBorder(),
      //? enabled border
      enabledBorder: _outlineInputBorder(),
      //? fouced border
      focusedBorder: _outlineInputBorder(),
      //? hint
      hintStyle: AppTextStyles.lato400style16
          .copyWith(color: AppColors.backgroundColor),
      //? fill color
      fillColor: AppColors.white,
      filled: true,
    ),
  );
}

OutlineInputBorder _outlineInputBorder([Color? color]) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color ?? AppColors.backgroundColor),
    borderRadius: BorderRadius.circular(4),
  );
}

TextTheme _textTheme() {
  return TextTheme(
    displayLarge: AppTextStyles.lato700style40,
    displayMedium: AppTextStyles.lato700style30,
    displaySmall: AppTextStyles.lato400style18,
    bodyLarge: AppTextStyles.lato700style24,
    bodyMedium: AppTextStyles.lato400style24,
    bodySmall: AppTextStyles.lato400style15,
  );
}

ElevatedButtonThemeData _elevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      backgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
}
