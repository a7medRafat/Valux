import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';

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
          child: Text(
            name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.productName.copyWith(fontSize: 13.sp),
          ),
        ),
      ],
    );
  }
}
