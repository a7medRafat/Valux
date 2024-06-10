import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';

class SearchImg extends StatelessWidget {
  const SearchImg({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Image(
      height: 60.h,
      width: 60.w,
      image: NetworkImage(img),
    );
  }
}
