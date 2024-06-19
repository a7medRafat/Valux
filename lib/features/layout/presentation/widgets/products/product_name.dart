import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          style: AppFonts.productName.copyWith(fontSize: 13.sp),
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
