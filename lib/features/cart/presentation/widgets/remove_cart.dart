import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/colors/app_colors.dart';

class RemoveCart extends StatelessWidget {

  const RemoveCart({super.key, required this.function});
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: GestureDetector(
        onTap: function ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.close,
            color: AppColors.vGray,
            size: 15.sp,
          ),
        ),
      ),
    );
  }
}
