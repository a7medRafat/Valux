import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';
import '../../../../config/colors/app_colors.dart';

class NameAndPrice extends StatelessWidget {
  const NameAndPrice({super.key, required this.name, required this.price});

  final String name;
  final dynamic price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: VContainer(
        padding: const EdgeInsets.only(left: 15),
        color: AppColors.vWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              name,
              style: AppFonts.productName.copyWith(fontSize: 13.sp),
            ),
            SizedBox(height: 5.h),
            Text('\$$price',
                style: AppFonts.bodyText3.copyWith(color: AppColors.caption)),
          ],
        ),
      ),
    );
  }
}
