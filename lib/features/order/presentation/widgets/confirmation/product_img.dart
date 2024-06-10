import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImg extends StatelessWidget {
  const ProductImg({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: MediaQuery.of(context).size.width / 3,
      height: 50.h,
      errorBuilder: (context, exception, stackTrace) {
        return const Icon(Icons.error_outline);
      },
    );
  }
}
