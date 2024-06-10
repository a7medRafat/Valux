import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:intl/intl.dart';

import '../../../../../App/injuctoin_container.dart';

class Summary extends StatelessWidget {
   const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Summary'),
        SizedBox(height: 15.h),
        const Text('#3287'),
         Row(
          children: [
            const Text('date:'),
             SizedBox(width: 5.w),
            Text(DateFormat("dd-MM-yyyy").format(DateTime.now())),
          ],
        ),
        Row(
          children: [
            const Text('total:'),
             SizedBox(width: 5.w),
            Text('\$${sl<CartsCubit>().sum}'),
          ],
        ),
      ],
    );
  }
}
