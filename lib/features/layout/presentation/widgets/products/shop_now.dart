import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';

import '../../../../../config/colors/app_colors.dart';

class ShopNow extends StatelessWidget {
  const ShopNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Text(
            'SHOP NOW',
            style: AppFonts.regular2,
          ),
          SizedBox(height: 5.h),
          VContainer(
            color: AppColors.caption.withOpacity(0.7),
            width: 50.w,
            height: 2.h,
          ),
        ],
      ),
    );
  }
}
