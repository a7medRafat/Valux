import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/style/app_fonts.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Summary', style: AppFonts.bodyText2),
        SizedBox(height: 15.h),
        Text('#3287', style: AppFonts.bodyText5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('date:', style: AppFonts.bodyText5),
            SizedBox(width: 5.w),
            Text(
                style: AppFonts.bodyText5,
                DateFormat("dd-MM-yyyy").format(DateTime.now())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('total:', style: AppFonts.bodyText5),
            SizedBox(width: 5.w),
            Text('\$${sl<CartsCubit>().sum}', style: AppFonts.bodyText5),
          ],
        ),
      ],
    );
  }
}
