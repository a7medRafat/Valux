import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';

import '../../../../../App/injuctoin_container.dart';

class ShoppingAddress extends StatelessWidget {
  const ShoppingAddress({super.key, required this.selected});

  final int selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Address', style: AppFonts.bodyText2),
        SizedBox(height: 15.h),
        Text(
            selected != -1
                ? sl<AddressCubit>().selectedAddress!.city!
                : sl<AddressCubit>().addressModel!.data!.data![0].city!,
            style: AppFonts.bodyText5),
        Text(
            selected != -1
                ? sl<AddressCubit>().selectedAddress!.region!
                : sl<AddressCubit>().addressModel!.data!.data![0].region!,
            style: AppFonts.bodyText5),
        VContainer(
          color: Colors.transparent,
          width: 100.w,
          child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              selected != -1
                  ? sl<AddressCubit>().selectedAddress!.details!
                  : sl<AddressCubit>().addressModel!.data!.data![0].details!,
              style: AppFonts.bodyText5),
        ),
      ],
    );
  }
}
