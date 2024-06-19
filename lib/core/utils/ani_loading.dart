import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnimationLoading extends StatelessWidget {
  const AnimationLoading({super.key, this.color, this.height, this.width});

  final Color? color;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: LoadingIndicator(
          indicatorType: Indicator.lineScaleParty,
          colors: [color ?? Colors.black],
          strokeWidth: 0.4,
          backgroundColor: Colors.transparent,
          pathBackgroundColor: Colors.black),
    );
  }
}
