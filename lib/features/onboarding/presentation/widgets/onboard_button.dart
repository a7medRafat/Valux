import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      color: Colors.grey.withOpacity(0.2),
      margin: EdgeInsets.symmetric(vertical: 20.h),
      borderRadius: BorderRadius.circular(10),
      child: widget,
    );
  }
}
