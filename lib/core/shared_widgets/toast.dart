import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:valux/config/colors/app_colors.dart';

class MyToast {
  static show({required String text, required BuildContext context}) {
    showToast(
      text,
      context: context,
      textStyle: TextStyle(fontSize: 13.sp, color: AppColors.scaffoldColor),
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideFromBottomFade,
      position: StyledToastPosition.top,
      animDuration: const Duration(seconds: 1),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}
