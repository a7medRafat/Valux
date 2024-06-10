import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                name, style: TextStyle(fontSize: 14.sp)),
            Text(
              '\$$price',
              style: TextStyle(fontSize: 12.sp, color: AppColors.vGray),
            ),
          ],
        ),
      ),
    );
  }
}
