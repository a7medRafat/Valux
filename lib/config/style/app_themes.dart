import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      fontFamily: 'Poppins',
      iconTheme: IconThemeData(color: AppColors.iconColor, size: 14),
      textTheme: TextTheme(
        /// titles ///
        titleLarge: (TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.titles,
        )),
        titleMedium: (TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.titles,
        )),
        titleSmall: TextStyle(
          color: AppColors.titles,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),

        /// body ///
        bodyLarge: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.body),
        bodyMedium: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.body),
        bodySmall: TextStyle(
          color: AppColors.bodySmall,
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        iconSize: 12.sp,
      ));
}
