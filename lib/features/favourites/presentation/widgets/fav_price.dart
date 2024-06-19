import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
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
          Text('\$$price', style: AppFonts.productPrice),
          SizedBox(height: 6.h),
          Row(
            children: [
              if (discount != 0)
                Text('\$$oldPrice', style: AppFonts.productOldPrice),
              SizedBox(width: 10.w),
              if (discount != 0)
                Text('$discountValue% off', style: AppFonts.regular3),
            ],
          ),
        ],
      ),
    );
  }
}
