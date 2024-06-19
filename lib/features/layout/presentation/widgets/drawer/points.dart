import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';

class PointsAndCredits extends StatelessWidget {
  const PointsAndCredits(
      {super.key, required this.credit, required this.points});

  final String credit;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            text(context,'Credits'),
            SizedBox(width: 5.w),
            text(context,credit),
          ],
        ),
        SizedBox(width: 10.w),
        Row(
          children: [
            text(context,'Points'),
            SizedBox(width: 5.w),
            text(context,points,),
          ],
        ),
      ],
    );
  }

  Widget text(context , String text) =>
      Text(text, style: AppFonts.caption);
}
