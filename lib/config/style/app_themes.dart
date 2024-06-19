import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    primaryColor: AppColors.primaryColor,
    useMaterial3: true,
    fontFamily: 'Poppins',
    iconTheme: IconThemeData(color: AppColors.iconColor, size: 18.sp),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      iconSize: 12.sp,
    ),
  );
}
