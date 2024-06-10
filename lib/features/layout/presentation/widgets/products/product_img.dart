import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImg extends StatelessWidget {
  const ProductImg({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:
      Image.network(
        img,
        height: 100.sp,
        width: 100.sp,
        errorBuilder: (context, exception, stackTrace) {
          return const Text('Error');
        },
      ),
    );
  }
}
