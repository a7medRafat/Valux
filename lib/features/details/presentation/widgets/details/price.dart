import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
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
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            '\$$price',
            style: AppFonts.productPrice,
          ),
          SizedBox(width: 10.w),
          if (discount != 0)
            Text('$oldPrice\$',
                style: const TextStyle(decoration: TextDecoration.lineThrough)),
          SizedBox(width: 10.w),
          if (discount != 0)
            VContainer(
              borderRadius: BorderRadius.circular(20),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              color: AppColors.offColor,
              child: Text(
                '$discountValue% off',
                style: AppFonts.caption.copyWith(
                  color: AppColors.vWhite,
                  fontSize: 10.sp
                ),
              ),
            ),
        ],
      ),
    );
  }
}
