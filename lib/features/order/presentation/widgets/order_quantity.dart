import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/vContainer.dart';

class OrderQuantity extends StatelessWidget {
  const OrderQuantity({super.key, required this.quantity});

  final String quantity;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      shadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
      width: MediaQuery.of(context).size.width / 6,
      height: 40.h,
      color: Colors.white,
      child: IntrinsicHeight(
          child: Center(
              child:
                  Text(
                    textAlign: TextAlign.center,
                      quantity, style: const TextStyle(color: Colors.blue,fontSize: 16)))),
    );
  }
}
