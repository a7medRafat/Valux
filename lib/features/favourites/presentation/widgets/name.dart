import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../layout/cubit/home/home_cubit.dart';

class Name extends StatelessWidget {
  const Name({super.key, required this.name, required this.productId});

  final String name;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12.sp,color: AppColors.bodySmall)),
        ),
        // SizedBox(width: 10.w),
        // CircleAvatar(
        //   radius: 18,
        //   backgroundColor: AppColors.scaffoldColor,
        //   child: Center(
        //     child: IconButton(
        //         onPressed: () {
        //           sl<HomeCubit>().addDeleteFav(productId: productId);
        //         },
        //         icon: Icon(Icons.favorite, size: 16.sp)),
        //   ),
        // )
      ],
    );
  }
}
