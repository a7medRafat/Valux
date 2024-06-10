import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';

class FavImg extends StatelessWidget {
  const FavImg({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      width: double.infinity,
      color: Colors.transparent,
      child: Image(
        height: 60.h,
        image: NetworkImage(img),
      ),
    );
  }
}
