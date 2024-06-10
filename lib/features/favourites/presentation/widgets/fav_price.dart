import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/colors/app_colors.dart';

class FavPrice extends StatelessWidget {
  const FavPrice(
      {super.key,
      required this.price,
      required this.oldPrice,
      required this.discountValue,
      required this.discount});

  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final dynamic discountValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$$price',
            style: TextStyle(color: AppColors.vBlue, fontSize: 15.sp),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              if (discount != 0)
                Text('$oldPrice\$',
                    style: TextStyle(
                        color: AppColors.bodySmall,
                        decoration: TextDecoration.lineThrough)),
              SizedBox(width: 10.w),
              if (discount != 0)
                Text('$discountValue% off',
                    style: TextStyle(fontSize: 10.sp, color: AppColors.vGray)),
            ],
          ),
        ],
      ),
    );
  }
}
