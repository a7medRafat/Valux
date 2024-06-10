import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/vContainer.dart';
import '../../../../layout/presentation/widgets/products/product_img.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {super.key,
      required this.img,
      required this.quantity,
      required this.name});

  final String img;
  final String quantity;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: VContainer(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        height: 100.h,
        width: double.infinity,
        child: Row(
          children: [
            ProductImg(img: img),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    name,
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      const Text('quantity:'),
                      SizedBox(width: 8.h),
                      Text(quantity),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
